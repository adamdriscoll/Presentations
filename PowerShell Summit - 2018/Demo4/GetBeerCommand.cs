using System;
using System.Collections;
using System.Reflection;
using System.Management.Automation;
using System.Runtime.Loader;

namespace Demo4
{
    [Cmdlet(VerbsCommon.Get, "Beer")]
    public class GetBeerCommand : PSCmdlet
    {
        static GetBeerCommand() {
            AssemblyLoadContext.Default.Resolving += OnAssemblyResolve;
        }

        private static Assembly OnAssemblyResolve(AssemblyLoadContext assemblyLoadContext, AssemblyName assemblyName)
        {
            return null;
        }

        protected override void ProcessRecord() {

            var psVersionTable = GetVariableValue("PSVersionTable") as Hashtable;

            // Need to verify that PSVersion is Version rather than SemanticVersion
            if (psVersionTable["PSVersion"] is Version && (Version)psVersionTable["PSVersion"] < new Version(5,1))
            {
                WriteObject("Original West Coast IPA");
                return;
            }

            // We are running Windows PowerShell 5.1
            if ((string)GetVariableValue("PSEdition") == "Desktop") {
                WriteObject("Original West Coast IPA");
                return;
            } 

            // PowerShell Core on Liunux
            if ((bool)GetVariableValue("IsLinux")) {
                WriteObject("PBR");
            } 

            // PowerShell Core on Windows
            if ((bool)GetVariableValue("IsWindows")) {
                WriteObject("Organic Pineapple Walnut West Coast IPA");
            } 

            // PowerShell Core on MacOS
            if ((bool)GetVariableValue("IsMacOs")) {
                WriteObject("Coconut Water");
            } 
        }
    }
}
