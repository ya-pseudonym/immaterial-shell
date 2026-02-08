import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.Utils
import qs.Dashboard
import qs.Common

Rectangle {
    id: dash
    x: parent.width / 2 - width / 2
    function isStatus() {
        if (Status.dashboard == true) {
            return true;
        } else {
            return false;
        }
    }
    implicitHeight: 256
    implicitWidth: 512
    y: isStatus() ? 0 : -height
    color: Config.colors.bg
    bottomLeftRadius: Config.radius.large
    bottomRightRadius: Config.radius.large
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            Status.dashwindow = true;
            Status.dashboard = true;
        }
        onExited: {
            Status.dashboard = false;
        }
    }
    Behavior on y {
        NumberAnimation {
            duration: 350
            easing.bezierCurve: [0.38, 1, 0.22, 1, 1, 1]
            onRunningChanged: {
                if (!running && Status.dashboard == false) {
                    Status.dashwindow = false;
                }
            }
        }
    }
    RowLayout {
        id: holder
        anchors.fill: parent

        Greeting {
            id: greeter
        }
        NewMpris {
            id: mpris
        }
    }
}
