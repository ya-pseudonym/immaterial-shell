import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.Bar
import qs.Popups
import qs.Utils
import qs.Common

Scope {
    id: root

    PanelWindow {
        id: barWindow
        anchors {
            top: true
        }
        WlrLayershell.namespace: 'ag-dash'
        implicitHeight: 32
        implicitWidth: screen.width
        color: 'transparent'
        Corner {
            radius: 16
            orientation: 1
            width: 128
            color: Config.colors.bg
            height: back.height
            anchors.top: back.top
            anchors.right: back.left
        }
        Rectangle {
            id: back
            implicitWidth: 1024
            height: 32
            y: 0
            x: parent.width / 2 - width / 2
            color: Qt.alpha(Config.colors.bg, 0.75)
            bottomLeftRadius: Config.radius.large
            bottomRightRadius: Config.radius.large

            RowLayout {
                anchors.left: back.left
                anchors.leftMargin: Config.padding.small
                anchors.verticalCenter: back.verticalCenter
                spacing: Config.spacing.small
                height: back.height
                Hyprland {
                    id: hypr
                }
                Window {}
            }

            RowLayout {
                anchors.horizontalCenter: back.horizontalCenter
                height: back.height
                Clock {
                    id: clock
                }
            }
            RowLayout {
                anchors.right: back.right
                anchors.verticalCenter: back.verticalCenter
                anchors.rightMargin: Config.padding.small
                height: back.height
                Music {}
                SystemCircles {}
            }
        }
        Corner {
            radius: 16
            orientation: 0
            width: 128
            color: Config.colors.bg
            height: back.height
            anchors.top: back.top
            anchors.left: back.right
        }
        PopupWindow {
            id: dashboard
            visible: Status.dashwindow
            anchor.window: barWindow
            anchor.rect.x: back.x + back.width / 2 - width / 2
            anchor.rect.y: back.height
            color: 'transparent'
            implicitHeight: 256
            implicitWidth: 512 + 128
            Corner {
                radius: 128
                orientation: 1
                width: 32
                color: Config.colors.bg
                height: Status.dashboard ? 32 : 0
                anchors.top: dashboard.top
                anchors.right: dash.left
                Behavior on height {
                    NumberAnimation {
                        duration: 500
                        easing.bezierCurve: [0.38, 1.15, 0.22, 1, 1, 1]
                    }
                }
            }
            Dashboard {
                id: dash
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Corner {
                radius: 128
                orientation: 0
                width: 32
                color: Config.colors.bg
                height: Status.dashboard ? 32 : 0
                anchors.top: dashboard.top
                anchors.left: dash.right
                Behavior on height {
                    NumberAnimation {
                        duration: 500
                        easing.bezierCurve: [0.38, 1.15, 0.22, 1, 1, 1]
                    }
                }
            }
        }
        IpcHandler {
            target: "dashboard"
            function set(): void {
                console.log(Status.dashboard ? "Hiding dash" : "Showing dash");
                if (Status.dashwindow == false) {
                    Status.dashwindow = true;
                }
                if (Status.dashboard == false) {
                    Quotes.randomize();
                }
                Status.dashboard = !Status.dashboard;
            }
        }
    }
}
