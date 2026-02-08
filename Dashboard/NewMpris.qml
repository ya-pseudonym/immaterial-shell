import Quickshell
import Quickshell.Services.Mpris
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import qs.Utils
import qs.Common

ClippingRectangle {
    id: root
    function setAlpha(color: color, desiredAlpha: real) {
        return Qt.rgba(color.r, color.g, color.b, desiredAlpha);
    }
    height: 256 - Config.padding.normal
    width: 256 - Config.padding.small
    color: Config.colors.containerMed
    anchors.rightMargin: Config.padding.small
    radius: Config.radius.normal
    Item {
        height: root.height
        width: root.width
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: Media.cover
            layer.enabled: true
            layer.effect: MultiEffect {
                blurEnabled: true
                blur: 1
                brightness: -0.1
                saturation: 0.2
            }
        }
    }
    Item {
        height: parent.height
        width: parent.width
        CircularProgress {
            id: cover
            implicitSize: 128 + 8
            lineWidth: 6
            value: Media.position / Media.length
            gapAngle: 360 / 28
            anchors.top: parent.top
            anchors.topMargin: Config.spacing.tiny
            anchors.horizontalCenter: parent.horizontalCenter
            animationDuration: 1000
            property bool spin: Media.media.isPlaying
            ClippingRectangle {
                id: clip
                implicitHeight: Media.media.isPlaying ? 128 - 16 : 112 - 16
                implicitWidth: Media.media.isPlaying ? 128 - 16 : 112 - 16
                anchors.centerIn: parent
                Behavior on implicitHeight {
                    NumberAnimation {
                        duration: 350
                        easing.bezierCurve: [0.38, 1.6, 0.22, 1, 1, 1]
                    }
                }
                Behavior on implicitWidth {
                    NumberAnimation {
                        duration: 350
                        easing.bezierCurve: [0.38, 1.6, 0.22, 1, 1, 1]
                    }
                }
                radius: Config.radius.full
                color: Config.colors.containerHigh
                ClippingRectangle {
                    anchors.fill: parent
                    color: 'transparent'
                    Image {
                        anchors.fill: parent
                        source: Media.cover
                        fillMode: Image.PreserveAspectCrop
                        sourceSize.width: 128
                        sourceSize.height: 128
                        layer.enabled: true
                        layer.effect: MultiEffect {
                            brightness: Media.media.isPlaying ? 0 : -0.1
                            saturation: Media.media.isPlaying ? 0 : -0.2
                            Behavior on brightness {
                                NumberAnimation {
                                    duration: 100
                                }
                            }
                            Behavior on saturation {
                                NumberAnimation {
                                    duration: 100
                                }
                            }
                        }
                    }
                }
            }
        }
        ClippingRectangle {
            id: data
            implicitHeight: 56
            implicitWidth: root.width - Config.spacing.small
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: cover.bottom
            anchors.topMargin: Config.spacing.tiny
            topLeftRadius: Config.radius.large
            topRightRadius: Config.radius.large
            color: root.setAlpha(Config.colors.containerHighest, 0.7)
            Text {
                id: artist
                y: Config.spacing.tiny
                x: parent.width / 2 - width / 2
                font.family: Config.font.family
                font.pointSize: 10
                font.variableAxes: {
                    "wght": 800
                }
                color: Config.colors.primaryFix
                text: Media.artist
            }
            Text {
                id: title
                x: parent.width / 2 - width / 2
                anchors.top: artist.bottom
                font.family: Config.font.family
                font.variableAxes: {
                    "wght": 700
                }
                color: Config.colors.primary
                text: Media.media == undefined ? "There's nothing playing right now." : Media.title
            }

            Text {
                id: duration
                x: parent.width / 2 - width / 2
                anchors.top: title.bottom
                font.family: Config.font.family
                font.variableAxes: {
                    "wght": 600
                }
                color: Config.colors.secondary
                property string pos: Media.formattedPosition
                property string len: Media.formattedLength
                text: Media.media.isPlaying ? `${pos}/${len}` : `${pos}/${len} (paused)`
            }
        }
        Rectangle {
            anchors.top: data.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Config.spacing.tiny
            anchors.horizontalCenter: parent.horizontalCenter
            Layout.alignment: Qt.AlignHCenter
            width: root.width - Config.spacing.small
            color: root.setAlpha(Config.colors.containerHighest, 0.7)
            bottomLeftRadius: Config.radius.large
            bottomRightRadius: Config.radius.large
            Row {
                height: parent.height
                width: parent.width - Config.spacing.small
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                Rectangle {
                    id: previous
                    width: 64
                    radius: Config.radius.normal
                    color: Config.colors.secondary
                    anchors {
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                        leftMargin: Config.spacing.tiny
                        topMargin: Config.spacing.tiny
                        bottomMargin: Config.spacing.tiny
                    }
                    Text {
                        x: parent.width / 2 - width / 2
                        anchors.verticalCenter: parent.verticalCenter
                        color: Config.colors.onSecondary
                        font.pointSize: 18
                        text: '󰒮'
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            Media.media.previous();
                        }
                    }
                }
                Rectangle {
                    id: togglePlaying
                    radius: Config.radius.normal
                    color: Config.colors.primary
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        left: previous.right
                        right: next.left
                        leftMargin: Config.spacing.tiny
                        rightMargin: Config.spacing.tiny
                        topMargin: Config.spacing.tiny
                        bottomMargin: Config.spacing.tiny
                    }
                    Text {
                        text: ''
                        font.pointSize: 12
                        x: parent.width / 2 - width / 2
                        anchors.verticalCenter: parent.verticalCenter
                        color: Config.colors.primaryContainer
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            Media.media.togglePlaying();
                        }
                    }
                }
                Rectangle {
                    id: next
                    width: 64
                    radius: Config.radius.normal
                    color: Config.colors.secondary
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                        topMargin: Config.spacing.tiny
                        bottomMargin: Config.spacing.tiny
                        rightMargin: Config.spacing.tiny
                    }
                    Text {
                        x: parent.width / 2 - width / 2
                        anchors.verticalCenter: parent.verticalCenter
                        color: Config.colors.onSecondary
                        font.pointSize: 18
                        text: '󰒭'
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            Media.media.next();
                        }
                    }
                }
            }
        }
    }
}
