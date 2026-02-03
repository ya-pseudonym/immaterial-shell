import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.Utils
Rectangle {
    anchors.centerIn: parent
    id: root
    height: 20
    width: workspaces.width + Config.padding.large
    color: Config.colors.containerMed
    radius: Config.radius.normal
    Behavior on width {
        NumberAnimation {
            duration: 200
            easing.bezierCurve: [0.38, 1.21, 0.22, 1, 1, 1]   
        }
    }
    RowLayout {
        id: workspaces
        height: root.height
        anchors.horizontalCenter: root.horizontalCenter
        Repeater {
            id: ws
            model: Hyprland.workspaces

            Rectangle {
                id: holder
                implicitWidth: rect.isActive? 36 : 12
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
                            height: 12
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
                            duration: 350
                            easing.bezierCurve: [0.38, 1.21, 0.22, 1, 1, 1]
                        }
                        ColorAnimation {
                            properties: 'color'
                            duration: 500
                            easing.bezierCurve: [0.38, 1.21, 0.22, 1, 1, 1]
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
            }
            }

    }
    }
}