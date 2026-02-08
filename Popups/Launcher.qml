import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Wayland
import Quickshell.Widgets
import "root:Utils/fuzzy.js" as FuzzySort
import "root:Utils"

Scope {
    id: root
    function isActive() {
        if (Status.launcher == false) {
            return false;
        } else {
            return true;
        }
    }
    LazyLoader {
        active: Status.launchwindow

        PanelWindow {
            color: 'transparent'
            implicitWidth: screen.width
            implicitHeight: screen.height
            focusable: true
            Rectangle {
                id: search
                width: 256
                height: 48
                x: parent.width / 2 - width / 2
                y: screen.height / 2 - height / 2 - height
                opacity: root.isActive() ? 1 : 0
                topLeftRadius: Config.radius.large
                topRightRadius: Config.radius.large
                Behavior on opacity {
                    NumberAnimation {
                        duration: 25
                        onRunningChanged: {
                            if (!running && Status.launcher == false) {
                                Status.launchwindow = false;
                            }
                        }
                    }
                }
                color: Config.colors.bg
                Rectangle {
                    x: parent.width / 2 - width / 2
                    y: parent.height / 2 - height / 2
                    width: parent.width - Config.padding.normal
                    height: parent.height - Config.padding.normal
                    radius: Config.radius.normal
                    color: Config.colors.containerMed
                }
                TextInput {
                    id: entry
                    focus: true
                    cursorDelegate: Rectangle {
                        width: 0
                    }
                    anchors.verticalCenter: parent.verticalCenter
                    x: parent.width / 2 - width / 2
                    font.family: Config.font.family
                    font.pointSize: 10
                    color: Config.colors.primary
                    font.variableAxes: {
                        "wght": 600
                    }
                    property bool searchEmpty: text.length === 0
                    property string content: entry.text
                    onTextChanged: appView.forceLayout()
                    property var current: appView.currentIndex

                    Keys.onReturnPressed: {
                        const list = appView.model;
                        list[appView.currentIndex].execute();
                        Status.launcher = false;
                    }
                    Keys.onDownPressed: {
                        appView.incrementCurrentIndex();
                        current = appView.currentIndex;
                    }
                    Keys.onUpPressed: {
                        appView.decrementCurrentIndex();
                        current = appView.currentIndex;
                    }
                    Keys.onEscapePressed: {
                        Status.launcher = false;
                    }
                }
                Text {
                    font.family: Config.font.family
                    font.pointSize: 10
                    visible: entry.searchEmpty
                    anchors.centerIn: parent
                    color: Config.colors.primary
                    font.variableAxes: {
                        "wght": 550
                    }
                    text: 'Search for something...'
                }
            }
            ClippingRectangle {
                id: entries
                anchors.horizontalCenter: search.horizontalCenter
                anchors.top: search.bottom
                color: Config.colors.bg
                height: 128
                width: 256
                bottomLeftRadius: Config.radius.large
                bottomRightRadius: Config.radius.large
                opacity: root.isActive() ? 1 : 0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 100
                    }
                }
                ListView {
                    id: appView
                    anchors.centerIn: parent
                    height: parent.height - Config.padding.normal
                    width: parent.width - Config.padding.normal
                    model: FuzzySort.go(entry.text, DesktopEntries.applications.values, {
                        all: true,
                        keys: ["name", "genericName"]
                    }).map(a => a.obj)
                    spacing: Config.spacing.tiny
                    function launchModelData(): void {
                        if (currentItem && currentItem.modelData) {
                            currentItem.modelData.execute();
                            Status.launcher = false;
                        }
                    }

                    delegate: Rectangle {
                        id: delegated
                        width: parent.width
                        height: 36
                        property bool isSelected: ListView.isCurrentItem
                        color: Config.colors.containerLow
                        radius: Config.radius.normal
                        states: [
                            State {
                                name: "selected"
                                when: delegated.isSelected

                                PropertyChanges {
                                    target: delegated
                                    color: Config.colors.containerHighest
                                }
                                PropertyChanges {
                                    target: name
                                    color: Config.colors.primaryFix
                                    weight: 900
                                    textWidth: 120
                                }
                            }
                        ]
                        transitions: [
                            Transition {
                                from: ""
                                to: "selected"
                                reversible: true
                                ColorAnimation {
                                    properties: "color"
                                    duration: 300
                                    easing.type: Easing.OutQuad
                                }
                                NumberAnimation {
                                    properties: "weight, textWidth"
                                    duration: 300
                                    easing.type: Easing.OutQuad
                                }
                            }
                        ]
                        IconImage {
                            anchors.left: parent.left
                            anchors.leftMargin: Config.padding.normal
                            source: iconPath(modelData.icon)
                        }
                        Text {
                            id: name
                            x: parent.width / 2 - width / 2
                            anchors.verticalCenter: parent.verticalCenter
                            color: Config.colors.primary
                            text: modelData.name
                            property int textWidth: 100
                            property int weight: 500
                            font.family: Config.font.family
                            font.variableAxes: {
                                "wdth": textWidth,
                                "wght": weight
                            }
                        }
                    }
                }
            }
        }
    }
}
