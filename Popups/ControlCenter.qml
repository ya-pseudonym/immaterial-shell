import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import qs.Utils
import qs.Common
import qs.ControlCenter

PanelWindow {
    id: root
    anchors.right: true
    anchors.top: true
    anchors.bottom: true
    width: 512
    exclusiveZone: 0
    WlrLayershell.layer: Wlrlayer.Overlay
    visible: Status.controlCenterWin
    color: 'transparent'
    function isStatus() {
        if (Status.controlCenter == true) {
            return true;
        } else {
            return false;
        }
    }
    Corner {
        id: topCorner
        radius: 128
        orientation: 3
        width: isStatus() ? 32 : 0
        color: Config.colors.bg
        height: 32
        anchors.bottom: control.top
        anchors.right: control.right
        Behavior on width {
            NumberAnimation {
                duration: 700
                easing.bezierCurve: [0.38, 1, 0.22, 1, 1, 1]
            }
        }
    }
    Rectangle {
        id: control
        anchors.right: parent.right
        width: isStatus() ? 512 : 0
        y: parent.height / 2 - height / 2
        implicitHeight: 796
        color: Config.colors.bg
        topLeftRadius: Config.radius.xl
        bottomLeftRadius: Config.radius.xl
        Behavior on width {
            NumberAnimation {
                duration: 350
                easing.bezierCurve: [0.38, 1, 0.22, 1, 1, 1]
                onRunningChanged: {
                    if (!running && Status.controlCenter == false) {
                        Status.controlCenterWin = false;
                    }
                }
            }
        }
        PowerMenu {
            id: power
            x: 8
            y: 8
        }
    }
    Corner {
        id: bottomCorner
        radius: 128
        orientation: 1
        height: 32
        width: root.isStatus() ? 32 : 0
        Behavior on width {
            NumberAnimation {
                duration: 700
                easing.bezierCurve: [0.38, 1, 0.22, 1, 1, 1]
            }
        }
        color: Config.colors.bg
        anchors.top: control.bottom
        anchors.right: control.right
    }
}
