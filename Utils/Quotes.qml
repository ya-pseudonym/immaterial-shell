pragma Singleton

import Quickshell
import QtQuick

Singleton {
    property list<string> quotes: [
    "Ackshually, it's GNU/Linux...",
    "Remember to plug your trees in!",
    "When I was younger, I didn't even know how to walk. I was so self-conscious.",
    "Two turn tables and a microphone!",
    "I like apples and bananas.",
    "I feel maternal towards iShowSpeed.",
    "I was just a lonely girl.. in the eyes of my inner child."
    ]
    property int random: {
        Math.floor(Math.random() * quotes.length)
    }
    property string currentText: {
        return quotes[random]
    }
}