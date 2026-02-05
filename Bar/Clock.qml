import Quickshell
import Quickshell.Io
import QtQuick
import qs.Utils
Rectangle {
    id: root
    implicitHeight: 20
    implicitWidth: 64
    radius: Config.radius.normal
    color: 'transparent'
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
    Text {
        font.pointSize: 8
        font.family: Config.font.family
        font.variableAxes: {
            "wght": 500
        }
        height: root.height
        width: root.width
        text: Qt.formatDateTime(clock.date, "hh:mm AP")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: Config.colors.secondary
    }
}