import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.Utils

Slider {
    id: root

    property int gap: 6
    property real implicitSize: 128
    property real thickness: 12
    property color colPrimary: Config.colors.primary
    property color colFixed: Config.colors.inverseSurface
    property color colSecondary: Config.colors.containerHighest
    property real realValue: value  // Real value that's populated when clicked or modified
    property real radius: 4
    property var easing: Config.easing.standard

    wheelEnabled: true

    onValueChanged: {
        realValue = value
    }
    background: Item {
        implicitWidth: horizontal ? implicitSize : thickness
        implicitHeight: vertical ? implicitSize : thickness
        // Primary filled portion
        Rectangle {
            width: horizontal ? (value * parent.width) - gap : parent.width - gap
            height: vertical ? (value * parent.height) - gap : parent.height - gap

            color: colPrimary
            x: vertical ? parent.width / 2 - width / 2 : 0
            y: vertical ? parent.height - (value * parent.height) + gap: parent.height / 2 - height / 2
            radius: root.radius

            Behavior on width {
                NumberAnimation {
                    duration: 25
                    easing.bezierCurve: root.easing
                }
            }

            Behavior on height {
                NumberAnimation {
                    duration: 25
                    easing.bezierCurve: root.easing
                }
            }

            Behavior on y {
                NumberAnimation {
                    duration: 25
                    easing.bezierCurve: root.easing
                }
            }
        }
        // Secondary unfilled portion
        Rectangle {
            width: horizontal ? parent.width - (value * parent.width) - gap : parent.width - gap
            height: vertical ? parent.height - (value * parent.height) - gap : parent.height - gap

            x: horizontal ? (value * parent.width) + implicitHandleWidth + gap : parent.width / 2 - width / 2
            y: horizontal ? parent.height / 2 - height / 2 : 0
            color: colSecondary
            radius: root.radius

            Behavior on x {
                NumberAnimation {
                    duration: 50
                    easing.bezierCurve: root.easing
                }
            }

            Behavior on width {
                NumberAnimation {
                    duration: 50
                    easing.bezierCurve: root.easing
                }
            }

            Behavior on height {
                NumberAnimation {
                    duration: 50
                    easing.bezierCurve: root.easing
                }
            }

            Behavior on y {
                NumberAnimation {
                    duration: 50
                    easing.bezierCurve: root.easing
                }
            }
        }

    }
    handle: Rectangle {
        id: handle

        implicitWidth: horizontal ? thickness / 4 : thickness * 2
        implicitHeight: vertical ? thickness / 4 : thickness * 2
        radius: Config.radius.full
        color: root.colFixed
        x: horizontal ? (value * parent.width) : parent.width / 2 - width / 2
        y: vertical ? parent.height - (value * parent.height) : parent.height / 2 - height / 2

        Behavior on x {
            NumberAnimation {
                duration: 150
                easing.bezierCurve: Config.easing.bouncy
            }
        }
        Behavior on y {
            NumberAnimation {
                duration: 150
                easing.bezierCurve: Config.easing.bouncy
            }
        }
    }

}
