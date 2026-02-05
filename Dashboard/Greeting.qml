import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.Utils
import qs.Common
Rectangle {
    id: root
    function refresh(): void {
       random = Math.floor(Math.random * quotes.length)
    }
    height: 256 - Config.padding.normal
    width: 256 - Config.padding.normal
    Layout.alignment: Qt.AlignVCenter
    anchors.left: parent.left
    anchors.leftMargin: Config.padding.small
    color: Config.colors.containerMed
    radius: Config.radius.normal
    ColumnLayout {
        id: textHolder
        anchors.top: parent.top
        anchors.topMargin: Config.spacing.normal
        width: root.width
        spacing: Config.spacing.tiny
        Text {
            id: greeting
            font.family: Config.font.family
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 12
            color: Config.colors.primaryFix
            font.variableAxes: {
                "wght": 700
            }
            x: parent.width / 2 - width / 2
            text: `Hello, ${System.name}!`
        }
        Text {
            id: time
            anchors.horizontalCenter: parent.horizontalCenter
            color: Config.colors.primary
            font.family: Config.font.family
            font.pointSize: 10
            font.variableAxes: {
                "wght": 600,
                "wdth": 120,
            }
            text: `${System.time}`
        }
        Text {
            font.family: Config.font.family
            color: Config.colors.primary
            anchors.horizontalCenter: parent.horizontalCenter
            font.variableAxes: {
                "wdth": 120,
                "wght": 500
            }
            font.pointSize: 10
            text: System.date
        }
    }
    RowLayout {
        id: sys
        x: parent.width / 2 - width / 2
        anchors.verticalCenter: parent.verticalCenter
        anchors.topMargin: Config.padding.small
        ColumnLayout {
        CircularProgress {
            id: cpu
            value: System.cpu / 100
            lineWidth: 4
            implicitSize: 48
            Text {
                x: parent.width / 2 - width / 2
                y: parent.height / 2 - height / 2
                color: Config.colors.primary
                font.family: Config.font.family
                font.pointSize: 10
                font.variableAxes: {
                    "wght": 500
                }
                text: `${System.cpu}%`
            }
        }
        Text {
            font.family: Config.font.family
            color: Config.colors.primary
            font.variableAxes: {
                "wght": 700
            }
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 8
            text: 'CPU'
        }
        }
        ColumnLayout {
            CircularProgress {
            colPrimary: Config.colors.secondary
            colSecondary: Config.colors.secondaryContainer
            value: System.mem / 100
            lineWidth: 4
            implicitSize: 48
            Text {
                font.family: Config.font.family
                x: parent.width / 2 - width / 2
                y: parent.height / 2 - height / 2
                color: Config.colors.secondary
                font.pointSize: 10
                text: `${System.mem}%`
            }
        }
        Text {
            font.family: Config.font.family
            color: Config.colors.secondary
            font.variableAxes: {
                "wght": 700
            }
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 8
            text: 'MEM'
        }
        }
        ColumnLayout{
            CircularProgress {
                colPrimary: System.bat > 20 ? Config.colors.tertiary : Config.colors.error
                colSecondary: System.bat > 20 ? Config.colors.tertiaryContainer : Config.colors.errorContainer
                value: System.bat / 100
                lineWidth: 4
                implicitSize: 48
                Behavior on colPrimary{
                    ColorAnimation {
                        duration: 500
                    }
                }
                Behavior on colSecondary{
                    ColorAnimation {
                        duration: 500
                    }
                }
                Text {
                    font.family: Config.font.family
                    x: parent.width / 2 - width / 2
                    y: parent.height / 2 - height / 2
                    color: System.bat > 20? Config.colors.tertiary : Config.colors.error
                    Behavior on color {
                        ColorAnimation {
                            duration: 500
                        }
                    }
                    font.pointSize: 10
                    text: `${System.bat}%`
                }
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: Config.font.family
                font.pointSize: 8
                color: Config.colors.tertiary
                font.variableAxes: {
                    "wght": 700
                }
                text: 'BAT'
            }
        }
    }

    Text {
        id: quote
        anchors.top: sys.bottom
        width: parent.width
        anchors.topMargin: Config.padding.large
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap
        font.family: Config.font.family
        font.variableAxes: {
            "wght": 600
        }
        color: System.bat > 20? Config.colors.primaryFix : Config.colors.error
        text: Quotes.currentText
    }
    
}
