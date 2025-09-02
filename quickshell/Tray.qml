import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets

Rectangle {
    color: Theme.bg0
    height: 32
    Layout.preferredWidth: childrenRect.width + 16

    QsMenuOpener {
        id: menu
    }
    PopupWindow {
        anchor.window: bar
        anchor.rect.x: bar.width - 100
        anchor.rect.y: bar.height + 8
        implicitWidth: 128
        implicitHeight: childrenRect.height
        visible: !!menu.menu
        color: Theme.bg0

        ListView {
            anchors.centerIn: parent
            implicitWidth: parent.width
            implicitHeight: childrenRect.height

            verticalLayoutDirection: ListView.TopToBottom
            orientation: ListView.Vertical

            model: menu.children.values
            delegate: Text {
                required property var model
                text: model.text
                font.pointSize: 12
                font.family: "JetBrains Mono"
                color: Theme.plain
            }
        }
    }

    ListView {
        anchors.centerIn: parent
        width: childrenRect.width
        height: 32
        layoutDirection: Qt.LeftToRight
        orientation: ListView.Horizontal

        model: SystemTray.items.values
        delegate: IconImage {
            required property var model

            anchors.verticalCenter: parent.verticalCenter
            source: model.icon
            implicitSize: 24

            MouseArea {
                anchors.fill: parent

                enabled: true
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                cursorShape: Qt.PointingHandCursor

                onClicked: event => {
                    if (!model.hasMenu)
                        return;
                    else if (menu.menu != model.menu)
                        menu.menu = model.menu;
                    else
                        menu.menu = null;
                    console.log(model.hasMenu, model.menu, menu.menu);

                    event.accepted = true;
                }
            }
        }
    }
}
