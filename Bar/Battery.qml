import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Utils
Item {
    function getIcon(percentStr) {
        let val = parseInt(percentStr);

        if (val >= 75) return " "
        if (val >= 50) return " "
        if (val >= 25) return " "
        if (val >= 15) return " "
        return " "
    }
    id: root
    implicitHeight: 20
    implicitWidth: 64
    Text {
        id: batIcon
        font.family: Config.font.family
        font.pointSize: 8
        font.variableAxes: {
            "wght": 500
        }
        height: parent.height
        width: parent.width
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        padding: Config.padding.normal
        color: Config.colors.tertiary
        text: `${getIcon(System.bat)}`
    }
    Text {
        id: batText
        font.family: Config.font.family
        font.pointSize: 8
        color: Config.colors.tertiaryFix
        height: parent.height
        width: parent.width
        padding: Config.padding.normal
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        font.variableAxes: {
            "wght": 500
        }
        text: `${System.bat}%`
    }
}