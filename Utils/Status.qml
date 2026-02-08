pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property bool dashwindow: false
    property bool dashboard: false
    property bool launchwindow: false
    property bool launcher: false
    property bool settings: false
    property bool controlCenter: false
    property bool controlCenterWin: false
    IpcHandler {
        target: 'root'
        function controlcenter(): void {
            console.log(Status.controlCenter ? "Closing control center" : "Opening control center");
            if (Status.controlCenterWin == false) {
                Status.controlCenterWin = true;
            }
            Status.controlCenter = !Status.controlCenter;
        }
    }
}
