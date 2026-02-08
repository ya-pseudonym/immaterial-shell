import Quickshell
import QtQuick
import Quickshell.Io
import qs.Popups
import qs.Utils
import qs.Common

ShellRoot {
    id: root
    Bar {}

    Launcher {
        id: launcher
    }
    IpcHandler {
        target: 'launcher'
        function set(): void {
            console.log(Status.launcher ? "Closing launcher" : "Opening launcher");
            if (Status.launchwindow == false) {
                Status.launchwindow = true;
            }
            Status.launcher = !Status.launcher;
        }
    }
    Settings {
        id: settings
    }
    Visualizer {}
    IpcHandler {
        target: 'settings'
        function set(): void {
            console.log(Status.settings ? "Closing settings" : "Opening settings");
            Status.settings = !Status.settings;
        }
    }
    ControlCenter {
        id: cc
    }
}
