import Quickshell
import qs.Utils
import qs.Common
import QtQuick
import QtQuick.Effects
import qs.Utils
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
RowLayout {
    opacity: Media.title? 1 : 0
    height: 20
    Behavior on opacity {
        NumberAnimation {
            duration: 500
        }
    }
    Text {
        font.family: Config.font.family
        color: Config.colors.primary
        text: Media.title? Media.media.isPlaying? Media.title : `${Media.title} (paused)` : "Nothing playing..."
        font.variableAxes: {
            "wght": 500
        }
        font.pointSize: 8
        anchors.verticalCenter: parent.verticalCenter
    }
    CircularProgress {
        implicitSize: 20
        value: Media.position? (Media.position / Media.length ) % 1 : 0
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Media.media.togglePlaying()
            }
        }
    Image {
        id: musicNote
        anchors.centerIn: parent
        height: 14
        width: 14
        source: 'root:Images/music_note.svg'
        smooth: true
        visible: false
    }
    ColorOverlay {
        anchors.fill: musicNote
        source: musicNote
        color: Config.colors.primary
    }
}
}