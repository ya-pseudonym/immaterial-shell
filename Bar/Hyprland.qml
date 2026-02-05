import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.Utils
Rectangle {
    id: root
    height: 20
    width: workspaces.width + Config.padding.large
    color: 'transparent'
    radius: Config.radius.normal
    Behavior on width {
        NumberAnimation {
            duration: 250
            easing.bezierCurve: [0.38, 1.21, 0.22, 1, 1, 1]   
        }
    }
    RowLayout {
        anchors.left: parent.left
        anchors.leftMargin: Config.padding.small
        id: workspaces
        height: root.height
        spacing: Config.spacing.small
        Repeater {
            id: ws
            model: Hyprland.workspaces
            
            Rectangle {
                id: holder
                implicitWidth: rect.isActive? 36 : 16
                color: 'transparent'
                height: 12
                states: [
                    State {
                        name: 'active'
                        when: rect.isActive
                        PropertyChanges {
                            target: rect
                            color: Config.colors.primary
                            width: 32
                        }
			PropertyChanges {
				target: workspaceNumber
				color: Config.colors.containerHighest
			}
                    },
                    State {
                        name: 'inactive'
                        when: !rect.isActive
                        PropertyChanges {
                            target: rect
                            width: 12
                            color: Config.colors.containerHighest
                        }
                    }
                ]
                transitions: [
                    Transition{
                        from: 'inactive'; to: 'active'
                        NumberAnimation {
                            properties: 'width'
                            duration: 250
                            easing.bezierCurve: [0.38, 1.75, 0.22, 1, 1, 1]
                        }
                        ColorAnimation {
                            properties: 'color'
                            duration: 250
                        }
                        }
                ]
            Rectangle {
                id: rect
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                height: 12
                color: Config.colors.containerHighest
                radius: Config.radius.normal
		Text {
            visible: false
			id: workspaceNumber
            width: parent.width
            height: parent.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
			font.family: Config.font.family
			font.pointSize: 7
			font.variableAxes: {
				"wght": 800
			}
			color: Config.colors.containerLow
			text: index + 1
		}
            }
            }

    }
    }
}
