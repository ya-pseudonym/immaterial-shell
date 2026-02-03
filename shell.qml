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
            console.log(Status.launcher ? "Hiding launcher" : "Showing launcher")
            if (Status.launchwindow == false) {
                
                Status.launchwindow = true
            }
            Status.launcher = !Status.launcher
        }
    }
}