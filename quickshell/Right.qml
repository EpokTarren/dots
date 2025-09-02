import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower
import Quickshell.Io

RowLayout {
    id: sysinfo
    anchors.verticalCenter: parent.verticalCenter
    anchors.right: parent.right
    layoutDirection: Qt.LeftToRight
    spacing: 0

    Rectangle {
        color: Theme.bg0.replace("#", "#80")
        height: 32
        Layout.preferredWidth: childrenRect.width + 16
        visible: Media.text

        Text {
            anchors.centerIn: parent
            width: Math.min(implicitWidth, bar.width / 2)
            elide: Text.ElideRight

            text: Media.text
            color: Theme.comp0
            font.pointSize: 11
            font.family: "JetBrains Mono"
        }
    }

    Tray {}

    Rectangle {
        color: Theme.bg0
        height: 32
        width: 36
        visible: UPower.displayDevice.isLaptopBattery && !UPower.onBattery && UPower.displayDevice.percentage > 0.99

        Text {
            anchors.centerIn: parent
            color: Theme.comp0
            font.pointSize: 12
            text: ""
        }
    }

    Rectangle {
        color: Theme.bg0
        height: 32
        width: 36
        visible: UPower.displayDevice.isLaptopBattery && (UPower.displayDevice.percentage <= 0.99 || UPower.onBattery)

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2

            color: UPower.onBattery ? Theme.comp0 : Theme.comp0.replace("#", "#cc")
            font.pointSize: 10
            text: ["", "", "", "", ""][Math.floor(UPower.displayDevice.percentage * 4.45)]
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 4
            visible: !UPower.onBattery

            color: Theme.comp0
            font.pointSize: 8
            text: ""
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 3
            font.weight: 600
            font.family: "JetBrains Mono"

            color: Theme.comp0
            font.pointSize: 8
            text: Math.floor(UPower.displayDevice.percentage * 100) + "%"
        }
    }

    Rectangle {
        color: Theme.bg0
        height: 32
        Layout.preferredWidth: childrenRect.width + 8.5

        Text {
            color: Theme.comp0
            text: (Audio.micMuted ? "" : " ") + (Audio.muted ? "󰝟" : Audio.volume == 0 ? "" : Audio.volume < 0.5 ? "" : "")

            font.pointSize: 12
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 2
        }
    }

    SystemClock {
        id: clock
    }
    Rectangle {
        color: Theme.comp0
        height: 32
        Layout.preferredWidth: childrenRect.width + 14

        topRightRadius: 10
        bottomRightRadius: 10
        antialiasing: true

        Text {
            color: Theme.bg0
            text: Qt.formatDateTime(clock.date, "「hh:mm」")
            font.pointSize: 12
            font.weight: 600
            font.family: "JetBrains Mono"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 8.5
        }
    }
}
