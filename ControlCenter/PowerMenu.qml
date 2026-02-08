import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.Utils
import qs.Common

Rectangle {
    id: root
    width: control.width - Config.padding.xl
    radius: Config.radius.large
    height: 64
    color: Config.colors.containerMed
    opacity: Status.controlCenter ? 1 : 0
    Behavior on opacity {
        NumberAnimation {
            duration: 200
            easing.bezierCurve: [0.38, 1, 0.22, 1, 1, 1]
        }
    }
    RowLayout {
        anchors.fill: parent
        anchors.margins: Config.padding.normal
        spacing: Config.spacing.normal
        Rectangle {
            height: 48
            Layout.fillWidth: true
            anchors.verticalCenter: parent.verticalCenter
            radius: Config.radius.normal
            color: Config.colors.containerHighest
            Text {
                font.family: "JetBrains Mono Nerd Font Propo"
                color: Config.colors.primary
                font.pointSize: 18
                text: '󰐥'
                anchors.centerIn: parent
            }
        }
        Rectangle {
            height: 48
            Layout.fillWidth: true
            anchors.verticalCenter: parent.verticalCenter
            radius: Config.radius.normal
            color: Config.colors.containerHighest
            Text {
                font.family: "JetBrains Mono Nerd Font Propo"
                color: Config.colors.secondary
                font.pointSize: 18
                text: '󰜉'
                anchors.centerIn: parent
            }
        }
        Rectangle {
            height: 48
            Layout.fillWidth: true
            anchors.verticalCenter: parent.verticalCenter
            radius: Config.radius.normal
            color: Config.colors.containerHighest
            Text {
                font.family: "JetBrains Mono Nerd Font Propo"
                color: Config.colors.tertiary
                font.pointSize: 18
                text: '󰍃'
                anchors.centerIn: parent
            }
        }
    }
}
