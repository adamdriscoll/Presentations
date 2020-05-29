using System;
using System.Collections.Generic;
using System.Globalization;
using System.Management.Automation.Host;

namespace guips {
    public class Host : PSHost
    {
        public Host(HostUserInterface ui)        
        {
            UI = ui;
        }

        public override CultureInfo CurrentCulture => CultureInfo.CurrentCulture;

        public override CultureInfo CurrentUICulture => CultureInfo.CurrentUICulture;

        public override Guid InstanceId => Guid.NewGuid();

        public override string Name => "GUI PS Host";

        public override PSHostUserInterface UI { get; }

        public override Version Version => new Version(1, 0);

        public override void EnterNestedPrompt()
        {
            throw new NotImplementedException();
        }

        public override void ExitNestedPrompt()
        {
            throw new NotImplementedException();
        }

        public override void NotifyBeginApplication()
        {
            throw new NotImplementedException();
        }

        public override void NotifyEndApplication()
        {
            throw new NotImplementedException();
        }

        public override void SetShouldExit(int exitCode)
        {
            throw new NotImplementedException();
        }
    }
}