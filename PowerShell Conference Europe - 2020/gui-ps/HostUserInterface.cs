using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Management.Automation;
using System.Management.Automation.Host;
using System.Security;
using System.Threading.Tasks;
using Terminal.Gui;

namespace guips {
    public class HostUserInterface : PSHostUserInterface
    {
        public static List<string> output = new List<string> ();

        public static ProgressRecord ProgressRecord;

        public override PSHostRawUserInterface RawUI => null;// new HostRawUserInterface();

        public override Dictionary<string, PSObject> Prompt(string caption, string message, Collection<FieldDescription> descriptions)
        {
            throw new NotImplementedException();
        }

        public override int PromptForChoice(string caption, string message, Collection<ChoiceDescription> choices, int defaultChoice)
        {
            throw new NotImplementedException();
        }

        public override PSCredential PromptForCredential(string caption, string message, string userName, string targetName)
        {
            throw new NotImplementedException();
        }

        public override PSCredential PromptForCredential(string caption, string message, string userName, string targetName, PSCredentialTypes allowedCredentialTypes, PSCredentialUIOptions options)
        {
            throw new NotImplementedException();
        }

        public override string ReadLine()
        {
            throw new NotImplementedException();
        }

        public override SecureString ReadLineAsSecureString()
        {
            throw new NotImplementedException();
        }

        public override void Write(ConsoleColor foregroundColor, ConsoleColor backgroundColor, string value)
        {
            output.Add(value);
        }

        public override void Write(string value)
        {
            output.Add(value);
        }

        public override void WriteDebugLine(string message)
        {
            
        }

        public override void WriteErrorLine(string value)
        {
            output.Add(value);
        }

        public override void WriteLine(string value)
        {
            output.Add(value);
        }

        public event EventHandler<float> Progress;

        public override void WriteProgress(long sourceId, ProgressRecord record)
        {
            if (Progress != null)
                Progress(this, (float)record.PercentComplete / 100f);
        }

        public override void WriteVerboseLine(string message)
        {
            
        }

        public override void WriteWarningLine(string message)
        {
            
        }
    }
}