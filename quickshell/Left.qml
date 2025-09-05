import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

RowLayout {
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left

    layoutDirection: Qt.LeftToRight
    spacing: 0

    Rectangle {
        color: Theme.primary0

        height: 32
        Layout.preferredWidth: Hyprland.workspaces.values.find(ws => ws.id > 5) != null ? 52 : 32

        topLeftRadius: 10
        bottomLeftRadius: 10
        antialiasing: true

        WorkspaceTally {
            start: 1
            height: 16
            width: 16

            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 11
        }

        WorkspaceTally {
            start: 6
            height: 16
            width: 16

            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 4
        }
    }

    Rectangle {
        color: Theme.bg0
        height: 32
        Layout.preferredWidth: childrenRect.width + 16

        Text {
            color: ToplevelManager.activeToplevel?.activated ? Theme.primary1 : Theme.primary1.replace("#", "#cc")
            text: ToplevelManager.activeToplevel?.activated ? ToplevelManager.activeToplevel.appId : "「  %1  」".arg(["", "一", "二", "三", "四", "五", "六", "七", "八", "九", "零"][Hyprland.focusedWorkspace?.id])

            font.pointSize: 12
            font.family: ToplevelManager.activeToplevel?.activated ? "JetBrains Mono" : "Noto Sans CJK JP"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 8
        }
    }

    Text {
        color: Theme.plain
        text: ToplevelManager.activeToplevel?.title.replace(new RegExp("\\s+.\\s+" + ToplevelManager.activeToplevel.appId, "i"), '')
        visible: ToplevelManager.activeToplevel?.activated
        width: bar.width - bar.width / 3

        font.pointSize: 11
        font.family: "JetBrains Mono"
        leftPadding: 8
    }
}
