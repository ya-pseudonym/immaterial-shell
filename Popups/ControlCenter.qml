import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import qs.Utils
import qs.Common
import qs.ControlCenter

PanelWindow {
    id: root
    anchors.top: true
    height: 256
    width: 512 + 48
    exclusiveZone: 0
    WlrLayershell.layer: Wlrlayer.Overlay
    visible: Status.controlCenterWin
    color: 'transparent'
    function isStatus() {
        if (Status.dashboard == true) {
            return false;
        } else {
        if (Status.controlCenter == true) {
            return true;
        } else {
            return false;
        }
        }
    }
    Corner {
        id: topCorner
        radius: 128
        orientation: 1
        height: isStatus() ? 24 : 0
        color: Config.colors.bg
        width: 24
        anchors.top: root.top
        anchors.right: control.left
        Behavior on height {
            NumberAnimation {
                duration: 700
                easing.bezierCurve: [0.38, 1, 0.22, 1, 1, 1]
            }
        }
    }
    Rectangle {
        id: control
        anchors.top: parent.top
        width: 512
        height: isStatus() ? 256 : 0
        x: parent.width / 2 - width / 2
        implicitHeight: 512
        color: Config.colors.bg
        bottomLeftRadius: Config.radius.xl
        bottomRightRadius: Config.radius.xl
        Behavior on height {
            NumberAnimation {
                duration: 350
                easing.bezierCurve: [0.38, 1, 0.22, 1, 1, 1]
                onRunningChanged: {
                    if (!running && Status.dashboard == true) {
                        Status.controlCenterWin = false;
                    }
                    if (!running && Status.controlCenter == false) {
                        Status.controlCenterWin = false;
                    }
                }
            }
        }
        Column {
            width: parent.width
            height: parent.height
            opacity: Status.controlCenter? 1 : 0
            Behavior on opacity {
                NumberAnimation {
                    duration: 250
                }
            }
            Bars {}
            PowerMenu {
                id: power
                x: parent.width / 2 - width / 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: Config.padding.normal
            }
        }
    }
    Corner {
        id: bottomCorner
        radius: 128
        orientation: 0
        width: 24
        height: root.isStatus() ? 24 : 0
        Behavior on height {
            NumberAnimation {
                duration: 700
                easing.bezierCurve: [0.38, 1, 0.22, 1, 1, 1]
            }
        }
        color: Config.colors.bg
        anchors.top: root.top
        anchors.left: control.right
    }
}
