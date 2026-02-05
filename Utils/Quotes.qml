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
    "I was just a lonely girl.. in the eyes of my inner child.",
    "Ladies, if you saw me jackin' off in a ferrari would you be jealous?",
    "Hey, I'll use my trusty frying pan as a <i>drying pan!</i>",
    "Who the hell is the moose man?",
    "Mustard should be a video game button",
    "Guys, what one is your favorite?",
    "No, Skrillex, MacBook is not an instrument"
    ]
    property int random: {
        Math.floor(Math.random() * quotes.length)
    }
    property string currentText: {
        return quotes[random]
    }
}