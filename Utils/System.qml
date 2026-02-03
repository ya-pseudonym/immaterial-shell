pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick
Singleton {
    id: root
    property int bat
    property int cpu
    property int mem
    property string name
    property string time: Qt.formatDateTime(clock.date, "hh:mm AP")
    property string date: Qt.formatDateTime(clock.date, "ddd, MMM dd")
    Process {
        id: identityProc
        running: true
        command: ["whoami"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.name = this.text.replace("\n","")
            }
        }
    }

    Process {
        id: batProc
        running: true
        command: ["sh", "-c", "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}'"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.bat = parseInt(this.data);
                        }
                    }
    }
    Process {
        id: cpuProc
        running: true
        command: ["sh", "-c", "top -bn1 | grep 'Cpu(s)' | sed 's/.*, *\\([0-9.]*\\)%* id.*/\\1/' | awk '{print 100 - $1}'"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.cpu = parseInt(this.data);
            }
        }
    }
    Process {
        id: memProc
        running: true
        command: ["sh", "-c", "free | grep Mem | awk '{print int($3/$2 * 100)}'"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.mem = parseInt(this.data);
            }
        }
    }
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            batProc.running = true
            cpuProc.running = true
            memProc.running = true
        }
    }
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}