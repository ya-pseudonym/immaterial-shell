import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Utils
import qs.Common

RowLayout {
    id: root
    implicitHeight: 20
    // CircularProgress {
    //     anchors.verticalCenter: parent.verticalCenter
    //     implicitSize: 18
    //     value: System.cpu / 100
    // }
    // CircularProgress {
    //     colPrimary: Config.colors.secondary
    //     colSecondary: Config.colors.secondaryContainer
    //     implicitSize: 18
    //     value: System.mem / 100
    // }
    CircularProgress {
        anchors.verticalCenter: parent.verticalCenter
        colPrimary: value > .2 ? Config.colors.tertiary : Config.colors.error
        colSecondary: value > .2 ? Config.colors.tertiaryContainer : Config.colors.errorContainer
        implicitSize: 18
        value: System.bat / 100
        Behavior on colPrimary {
            ColorAnimation {
                duration: 100
            }
        }
        Behavior on colSecondary {
            ColorAnimation {
                duration: 100
            }
        }
    }
}
