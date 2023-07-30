import QtQuick 2.2
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.1

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents

Item {
    id: root

    // any message to be displayed to the user, visible above the text fields
    property alias notificationMessage: notificationsLabel.text

    // a list of items (typically ActionButtons) to be shown in a row beneath the prompts
    property alias actionItems: actionItemsLayout.children

    /*
     * a model with a list of users to show in the view
     * the following roles should exist:
     *  - name
     *  - iconSource
     *
     * the following are also handled:
     *  - vtNumber
     *  - displayNumber
     *  - session
     *  - isTty
     */
    property alias userListModel: userListView.model

    property alias userListCurrentIndex: userListView.currentIndex
    property var userListCurrentModelData: userListView.currentItem === null ? [] : userListView.currentItem.m
    property bool showUserList: true
    property alias userList: userListView
    default property alias _children: innerLayout.children

    UserList {
        id: userListView
        visible: showUserList && y > 0

        anchors {
            bottom: parent.verticalCenter
            left: parent.left
            right: parent.right
        }
    }

    // ui is constrained to 16 grid units wide, or the screen
    // hence this shows the prompts in ~16 grid units high, then the action buttons
    // but collapses the space between the prompts and actions if there's no room
    ColumnLayout {
        id: prompts
        anchors.top: parent.verticalCenter
        anchors.topMargin: PlasmaCore.Units.gridUnit * 0.5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        ColumnLayout {
            Layout.minimumHeight: implicitHeight
            Layout.maximumHeight: PlasmaCore.Units.gridUnit * 4
            Layout.maximumWidth: PlasmaCore.Units.gridUnit * 16
            Layout.alignment: Qt.AlignHCenter

            ColumnLayout {
                id: innerLayout
                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true
            }
        }

        PlasmaComponents.Label {
            id: notificationsLabel
            Layout.maximumWidth: PlasmaCore.Units.gridUnit * 16
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.WordWrap
            font.italic: true
        }

        // deliberately not rowlayout, as not trying to resize child items
        Row {
            id: actionItemsLayout
            spacing: PlasmaCore.Units.smallSpacing
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
