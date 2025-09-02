import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower
import Quickshell.Hyprland

PanelWindow {
    id: bar
    color: "transparent"

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: 8
        left: 8
        right: 8
    }

    implicitHeight: 32

    Rectangle {
        color: Theme.bg0.replace("#", "#cc")
        anchors.fill: parent
        anchors.leftMargin: 32
        anchors.rightMargin: 32
    }

    Left {}
    Right {}
}
