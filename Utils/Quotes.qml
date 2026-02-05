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
    "Hey, I'll use my trusty frying pan as a <i>drying pan!</i>",
    "Who the hell is the moose man?",
    "Mustard should be a video game button",
    "Guys, what one is your favorite?",
    "No, Skrillex, MacBook is not an instrument",
    "We see the vlone bro",
    "Wow.. you got the rarest quote. You should go get a lottery ticket.",
    "<i>Gulp...</i> He's right behind me, isn't he.",
    "We're so Barack.",
    "@Grok make him Studio Ghibli",
    "This is what you would look like if you were black or chinese.",
    "Pooh Shiesty interconnection matrix theory. Google it.",
    `Nineteen dollar ${System.name} card. Who wants it?`
    ]
    property list<string> lowQuotes: [
        `Heeeelp!! Help me!!! Heelp me!!`,
        `"oniichan please put it in.. i need more juice" -end_4`,
        `My ${System.bat}th reason why`,
        `Dude I only have ${System.bat}% left I'm gonna fucking die PLUG ME IN`,
        `chatgpt why my system telling me my battery low :(`
    ]
    property list<string> criticalQuotes: [
        "I trusted you.",
        "I'm gonna pull your life support when you're in a coma. How's that sound?",
        "You're literally more of a deadbeat than LowTierGod. That's a really hard standard to meet.",
        "It's Joever."
    ]
    property list<string> maxQuotes: [
        "You digging in me...",
        "Waiter! My steak is too juicy and my lobster is too buttery!",
        "Yo... W batteries?",
        "I'm batterymaxxing rn."
    ]
    property string currentText
    function randomize(): void {
        if (System.bat == 100 ) {
            currentText = maxQuotes[Math.floor(Math.random() * maxQuotes.length)]
        }
        else if (System.bat == 67) {
            currentText = "Haha. Six-seven. Get it? Because six-seven? Because... six-seven. Haha. I'm laughing right now. Are you? Please tell me you're laughing. Please"
        }
        else if (System.bat > 20) {
        currentText = quotes[Math.floor(Math.random() * quotes.length)]
        }
        else if (System.bat < 20 && System.bat > 10) {
            currentText = lowQuotes[Math.floor(Math.random() * lowQuotes.length)]
        }
        else {
            currentText = criticalQuotes[Math.floor(Math.random() * criticalQuotes.length)]
        }
    }
}