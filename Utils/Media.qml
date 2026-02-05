pragma Singleton

import Quickshell
import Quickshell.Services.Mpris
import QtQuick

Singleton {
    id: root
    property var media: Mpris.players.values[0]
    property string formattedPosition: media == null? formatTime(media.position) : "0"
    property string formattedLength: media == null? formatTime(media.length): "0"
    property real position: media == null? media.position: 0
    property real length: media == null? media.length: 0
    property string title: media.trackTitle
    property string artist: media.trackArtist
    property string cover: media.trackArtUrl

    function formatTime(value) {
        // scale up value
        value = value * 1000
        let seconds = Math.floor(value / 1000)
        let formattedSeconds = Math.floor(seconds % 60)
        let minutes = Math.floor((seconds % 3600) / 60)
        return minutes + ":" + (formattedSeconds < 10 ? "0" + formattedSeconds : formattedSeconds)
    }
    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            if (media == undefined) {
                root.title = ""
                root.artist = ""
                root.cover = ""
                root.progress = 0
            } else {
            root.formattedPosition = formatTime(media.position)
            root.formattedLength = formatTime(media.length)
            root.title = media.trackTitle
            root.artist = media.trackArtist
            root.position = media.position
            root.length = media.length
            root.cover = media.trackArtUrl
            }
        }
    }
}