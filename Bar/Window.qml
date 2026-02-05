import Quickshell
import QtQuick
import Quickshell.Hyprland
import Quickshell.Wayland
import Quickshell.Widgets
import qs.Utils
Item {
    id: root
    height: 20
    width: windowName.width
    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(root.QsWindow?.window.screen)
    property bool focusing: HyprlandData.activeWorkspace?.monitor === monitor?.name
    readonly property Toplevel activeWindow: ToplevelManager.activeToplevel
    property var biggest: HyprlandData.biggestWindowForWorkspace(HyprlandData.monitors[root.monitor?.id]?.activeWorkspace.id)
    property string windowName: activeWindow.title
    Text {
        id: windowName
        anchors.centerIn: parent
        font.family: Config.font.family
        font.variableAxes: {
            "wght": 400
        }
        opacity: root.focusing && root.activeWindow?.activated && root.biggest? 1 : 0.5
        Behavior on opacity {
            NumberAnimation {
                duration: 250
            }
        }
        color: Config.colors.primaryFix
        font.pointSize: 9
        text: root.focusing && root.activeWindow?.activated && root.biggest ?
        root.activeWindow?.appId :
        (root.biggest?.class) ?? "desktop"
    }
}