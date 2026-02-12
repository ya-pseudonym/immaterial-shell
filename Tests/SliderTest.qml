import Quickshell
import QtQuick
import qs.Utils
import qs.Common
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Controls
import Quickshell.Widgets

RowLayout {
    id: sliders
    anchors.centerIn: parent
    spacing: Config.spacing.large
    Column {
        spacing: Config.spacing.normal
        Text {
            font.family: Config.font.family
            color: Config.colors.primary
            anchors.horizontalCenter: horz.horizontalCenter
            text: Math.floor(horz.value * 100)
        }
        StyledSlider{
            id: horz
            value: 1
        }
        StyledSlider {
            id: horz2
            thickness: 12
            radius: 4
            value: (horz.value * 0.75)
        }
        StyledSlider {
            id: horz3
            thickness: 8
            radius: 2
            value: (horz2.value * 0.75)
        }
        StyledSlider {
            thickness: 6
            radius: 2
            value: horz3.value * 0.75
        }
        }
        Column {
        Text {
            font.family: Config.font.family
            color: Config.colors.primary
            anchors.horizontalCenter: vert.horizontalCenter
            text: Math.floor(vert.value * 100)
        }
        StyledSlider{
            id: vert
            orientation: Qt.Vertical
        }
    }
}
