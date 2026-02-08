import Quickshell
import Quickshell.Io
import QtQuick
import qs.Utils

Rectangle {
    id: root
    implicitHeight: 32
    implicitWidth: 128
    radius: Config.radius.normal
    color: 'transparent'
    MouseArea {
        height: 32
        width: 512
        hoverEnabled: true
        onEntered: {
            if (Status.dashwindow == false) {
                Quotes.randomize();
            }
            Status.dashwindow = true;
            Status.dashboard = true;
        }
    }
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
        anchors.centerIn: parent
        text: Qt.formatDateTime(clock.date, "hh:mm AP")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: Config.colors.secondary
    }
}
