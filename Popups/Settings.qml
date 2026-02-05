import Quickshell
import QtQuick
import qs.Utils
import qs.Common
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Widgets
Scope {
    id: root
    LazyLoader {
        active: Status.settings
        PanelWindow {
            implicitHeight: 256
            implicitWidth: 512
            color: 'transparent'
            ClippingRectangle {
                anchors.fill: parent
                color: Config.colors.bg
                radius: Config.radius.large
            }
        }
    }
}