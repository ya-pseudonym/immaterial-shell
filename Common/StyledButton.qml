import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material.impl
import qs.Utils

Button {
    id: root
    property color colPrimary: Config.colors.primaryFix
    property color colSecondary: Config.colors.primaryContainer
    property color colDown:    Config.colors.primaryFixDim
    property color colText:    Config.colors.onPrimary
    property color colFixed:   Config.colors.inverseSurface
    property int radius: 8
    property bool activated: false
    property real implicitSize: 64
    property string buttonText: "Text"
    height: implicitSize / 2
    width: implicitSize
    padding: 8
    Behavior on padding {
        NumberAnimation {
            duration: 75
            easing.bezierCurve: Config.easing.standard
        }
    }
    onClicked: {
        activated = !activated
    }
    MouseArea {
        anchors.fill: parent
        z: -1
        hoverEnabled: true
        onPositionChanged: {
            ripple.x = mouse.x - ripple.radius
            ripple.y = mouse.y - ripple.radius2
        }
    }
    states: [
        State {
            name: ''
            when: root.activated == false
            PropertyChanges {
                target: background
                color: hovered? root.colDown : colPrimary
            }
        },
        State {
            name: 'activated'
            when: root.activated
            PropertyChanges {
                target: background
                color: root.colSecondary
            }
            PropertyChanges {
                target: text
                color: root.colFixed
            }
        }
    ]
    background: ClippingRectangle {
        id: background
        anchors.fill: parent
        color: hovered? root.colDown : colPrimary
        radius: root.radius
        Behavior on color {
            ColorAnimation {
                duration: 150
                easing.bezierCurve: Config.easing.standard
            }
        }
    }
    contentItem: Text {
        id: text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        width: parent.width
        height: parent.height
        text: root.buttonText
        font: Config.font.family
        color: root.colText
        Behavior on color {
            ColorAnimation {
                duration: 150
                easing.bezierCurve: Config.easing.standard
            }
        }
    }
}
