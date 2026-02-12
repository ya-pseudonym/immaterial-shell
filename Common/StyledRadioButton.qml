import Quickshell
import QtQuick
import QtQuick.Controls
import qs.Utils

RadioButton {
    id: root
    property real implicitSize: 18
    property real thickness: 2
    property int radius: 6
    property int textSize: 12
    property color colPrimary: Config.colors.primary
    property color colFixed: Config.colors.inverseSurface
    text: qsTr("Text")
    indicator: Rectangle {
        id: indicator
        implicitHeight: implicitSize
        implicitWidth: implicitSize
        radius: root.radius
        color: 'transparent'
        border.color: root.colFixed
        border.width: root.thickness
        Behavior on border.width {
            NumberAnimation {
                duration: 150
            }
        }
        Rectangle {
            anchors.centerIn: parent
            width: checked? implicitSize - thickness * 4 : 0
            height: checked? implicitSize - thickness * 4 : 0
            radius: root.radius / 2
            Behavior on width {
                NumberAnimation {
                duration: 125
                easing.bezierCurve: Config.easing.bouncy
            }
            }
            Behavior on height {
                NumberAnimation {
                    duration: 125
                    easing.bezierCurve: Config.easing.bouncy
                }
            }
            opacity: checked ? 1 : 0
            Behavior on opacity {
                NumberAnimation {
                    duration: 50
                }
            }
            color: root.colPrimary
        }
    }
    contentItem: Text {
        id: text
        text: root.text
        color: root.colFixed
        font.family: Config.font.family
        font.pixelSize: root.textSize
        verticalAlignment: Text.AlignVCenter
        leftPadding: indicator.width
    }
}
