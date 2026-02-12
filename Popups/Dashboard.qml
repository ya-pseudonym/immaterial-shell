import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.Utils
import qs.Dashboard
import qs.Common

ClippingRectangle {
    id: dash
    x: parent.width / 2 - width / 2
    anchors.top: parent.top
    implicitHeight: Status.dashboard ? 256 : 0
    implicitWidth: 512
    color: Config.colors.bg
    bottomLeftRadius: Config.radius.xl
    bottomRightRadius: Config.radius.xl
    function shouldShow() {

    }
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
    Behavior on implicitHeight {
        NumberAnimation {
            duration: 350
            easing.bezierCurve: [0.22, 1, 0.85, 1, 1, 1]
            onRunningChanged: {
                if (!running && Status.dashboard == false) {
                    Status.dashwindow = false;
                }
            }
        }
    }
    RowLayout {
        id: holder
        opacity: Status.dashboard ? 1 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 175
            }
        }
        spacing: Config.spacing.normal
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Config.padding.small
        Layout.fillWidth: true
        Greeting {
            id: greeter
        }
        NewMpris {
            id: mpris
        }
    }
}
