import Quickshell
import Quickshell.Io
import Quickshell.Widgets
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
        implicitHeight: 32
        implicitWidth: 1024
        color: 'transparent'

        Rectangle {
            id: back
            width: parent.width
            height: 28
            y: 4
            color: Config.colors.bg
            radius: Config.radius.large

            RowLayout {
                anchors.left: back.left
                anchors.leftMargin: Config.padding.small
                spacing:Config.spacing.normal
                height: back.height
                Hyprland{
                    id: hypr
                }
            }
            RowLayout {
                anchors.horizontalCenter: back.horizontalCenter
                height: back.height
                Window{}
            }
            RowLayout {
                anchors.right: back.right
                anchors.rightMargin: Config.padding.small
                height: back.height
                Music{}
                Clock {
                    id: clock
                }
                Battery{
                    id: bat
                }
            }

        }
        PopupWindow {
            id: dashboard
            visible: Status.dashwindow
            anchor.window: barWindow
            anchor.rect.x: barWindow.width / 2 - width / 2
            anchor.rect.y: 36
            color: 'transparent'
            implicitHeight: 256
	    implicitWidth: 512
	    ClippingRectangle{
		    anchors.fill: parent
		    radius: Config.radius.large
		    color: 'transparent'
                Dashboard{
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: dash
	    		}
   		}
        }
        IpcHandler {
            target: "dashboard"
            function set(): void {
                console.log(Status.dashboard ? "Hiding dash" : "Showing dash")
                if (Status.dashwindow == false) {
                    Status.dashwindow = true;
                }
                if (Status.dashboard == false) {
                    Quotes.random = (Math.floor(Math.random() * Quotes.quotes.length))
                }
                Status.dashboard = !Status.dashboard
            }
        }
    }
    
}
