using System;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.Threading.Tasks;
using guips;
using Microsoft.PowerShell;
using Terminal.Gui;

namespace gui_ps
{
    class Program
    {
        private static Runspace runspace;

        private static void RunCommand(string command)
        {
            Task.Run(() => {
                HostUserInterface.output.Clear();
                using(var ps = PowerShell.Create())
                {
                    ps.Runspace = runspace;
                    ps.AddScript(command);
                    ps.AddCommand("Out-Default");

                    ps.Streams.Error.DataAdded += (sender, args) => {
                        ErrorRecord err = ((PSDataCollection<ErrorRecord>)sender)[args.Index];
                        Application.MainLoop.Invoke(() => {
                            MessageBox.ErrorQuery(20, 10, "Error", err.ToString(), "Ok");    
                        });
                    };

                    try 
                    {
                        ps.Invoke();
                    }
                    catch (Exception ex)
                    {
                        Application.MainLoop.Invoke(() => {
                            MessageBox.ErrorQuery(20, 10, "Error", ex.Message, "Ok");    
                        });
                    }
                }
            });
        }

        static void Main(string[] args)
        {
            var ui = new HostUserInterface();

            var init = InitialSessionState.CreateDefault2();
            init.ExecutionPolicy = ExecutionPolicy.Unrestricted;

            runspace = RunspaceFactory.CreateRunspace(new Host(ui), init);
            runspace.Open();

            Application.Init ();
            var top = Application.Top;

            // Creates the top-level window to show
                var win = new Window ("GUI PS>") {
                X = 0,
                Y = 1, // Leave one row for the toplevel menu

                // By using Dim.Fill(), it will automatically resize without manual intervention
                Width = Dim.Fill (),
                Height = Dim.Fill ()
            };

            // Creates a menubar, the item "New" has a help menu.
            var menu = new MenuBar (new MenuBarItem [] {
                new MenuBarItem ("_File", new MenuItem [] {
                    new MenuItem ("_Quit", "", () => {  top.Running = false;  })
                })
            });
            top.Add (menu);

            var login = new Label ("Command: ") { X = 3, Y = 0 };
            var loginText = new TextField ("") {
                        X = Pos.Right (login),
                        Y = 0,
                        Width = 100,
                        Height = 4
                };

            var output = new ListView(HostUserInterface.output) {
                X =  Pos.Right(login),      
                Y = Pos.Bottom(login) + 2,
                Width = 100
            };
            Application.MainLoop.AddTimeout(TimeSpan.FromMilliseconds(100), loop => true);

            var button = new Button("Run") {
                X = Pos.Right(loginText),
                Y = 0,
                Clicked = () => { RunCommand(loginText.Text.ToString()); loginText.Text = ""; output.ChildNeedsDisplay(); }
            };

            var progressBar = new ProgressBar {
                X = Pos.Right(login),      
                Y = 1,
                Width = 100
            };

            ui.Progress += (sender, e) => {
                Application.MainLoop.Invoke (() => {
                    progressBar.Fraction = e; 
                });
            };

            win.Add(login, loginText, button, output, progressBar);
            
            top.Add (win);

            Application.Run ();
        }
    }
}
