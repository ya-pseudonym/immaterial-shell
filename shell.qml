import Quickshell
import QtQuick
import Quickshell.Io
import qs.Popups
import qs.Utils
ShellRoot {
    id: root
    Bar{}

    Launcher{
        id: launcher
    }
    IpcHandler {
        target: 'launcher'
        function set(): void {
            console.log(Status.launcher ? "Closing launcher" : "Opening launcher")
            if (Status.launchwindow == false) {
                
                Status.launchwindow = true
            }
            Status.launcher = !Status.launcher
        }
    }
    Settings {
        id: settings
    }
    IpcHandler {
        target: 'settings'
        function set(): void {
            console.log(Status.settings ? "Closing settings" : "Opening settings")
            Status.settings = !Status.settings
        }
    }
}