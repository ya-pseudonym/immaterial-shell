import Quickshell
import QtQuick
import qs.Utils
import qs.Common
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Controls
import Quickshell.Widgets
Column {
    spacing: Config.spacing.large
    RowLayout {
        id: buttons
        anchors.centerIn: parent
        spacing: Config.spacing.large

        StyledRadioButton{}
        StyledRadioButton{
            implicitSize: 18
        }
        StyledRadioButton{}
    }
    RowLayout {
        height: 48
        id: buttons2
        anchors.top: buttons.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        StyledButton{
            anchors.verticalCenter: parent.verticalCenter
        }
        StyledButton{
            anchors.verticalCenter: parent.verticalCenter
            buttonText: "Longer text"
        }
        StyledButton {
            anchors.verticalCenter: parent.verticalCenter
            buttonText: "Very long text"
        }
    }
}
