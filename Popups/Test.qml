import Quickshell
import QtQuick
import qs.Utils
import qs.Common
import qs.Tests
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Widgets
Scope {
    id: root
    LazyLoader {
        active: Status.settings
        FloatingWindow {
            implicitHeight: 256
            implicitWidth: 512
            color: 'transparent'
            ClippingRectangle {
                anchors.fill: parent
                color: Config.colors.bg
                radius: Config.radius.large
                ButtonGroup {id: buttonGroup}
                RowLayout {
                    x: 8
                    y: 8
                    spacing: Config.spacing.normal
                    StyledRadioButton {
                        text: "Sliders"
                        font.family: Config.font.family
                        ButtonGroup.group: buttonGroup
                        checked: true
                    }
                    StyledRadioButton {
                        text: "Buttons"
                        font.family: Config.font.family
                        ButtonGroup.group: buttonGroup
                    }
                }
                Component {
                    id: sliderTest
                    SliderTest {}
                }
                Component {
                    id: buttonTest
                    ButtonTest{}
                }
                Loader {
                    anchors.centerIn: parent
                    sourceComponent: buttonGroup.checkedButton.text === "Sliders" ? sliderTest : buttonTest
                }
                }
            }
        }
}
