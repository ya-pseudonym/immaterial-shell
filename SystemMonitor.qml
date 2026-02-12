import Quickshell
import QtQuick
import qs.Common
import qs.Utils
import QtQuick.Layouts

CircularProgress {
    x: 128
    y: 128
    implicitSize: 256
    lineWidth: 24
    value: System.bat / 100
    animationDuration: 2500
    colPrimary: Config.colors.primaryFix
    gapAngle: 0
    CircularProgress {
        anchors.centerIn: parent
        implicitSize: parent.implicitSize - 64
        animationDuration: 2500
        lineWidth: parent.lineWidth - 8
        value: System.mem / 100
        gapAngle: 0
        colPrimary: Config.colors.secondaryFix
        colSecondary: Config.colors.secondaryContainer
        CircularProgress {
            anchors.centerIn: parent
            animationDuration: 2500
            implicitSize: parent.implicitSize - 42
            lineWidth: parent.lineWidth - 4
            value: System.cpu / 100
            gapAngle: 0
            colPrimary: Config.colors.tertiaryFix
            colSecondary: Config.colors.tertiaryContainer
        }
    }
}