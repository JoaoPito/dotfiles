import QtQuick 2.2
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents

Item {
    id: root
    property alias text: label.text
    property alias iconSource: icon.source
    property alias containsMouse: mouseArea.containsMouse
    property alias font: label.font
    signal clicked

    activeFocusOnTab: true
    opacity: ( containsMouse || activeFocus ) ? 1 : 0.6
    property int iconSize

    implicitWidth: Math.max(icon.implicitWidth + PlasmaCore.Units.largeSpacing * 3, label.contentWidth)
    implicitHeight: Math.max(icon.implicitHeight + PlasmaCore.Units.largeSpacing * 2, label.contentHeight)

    PlasmaCore.IconItem {
        id: icon

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        width: config.PowerIconSize ? config.PowerIconSize : PlasmaCore.Units.gridUnit * 2
        height: config.PowerIconSize ? config.PowerIconSize : PlasmaCore.Units.gridUnit * 2

        colorGroup: PlasmaCore.ColorScope.colorGroup
        active: mouseArea.containsMouse || root.activeFocus
    }

    PlasmaComponents.Label {
        id: label
        font.family: config.Font || "Noto Sans"
        font.pointSize: parseInt(config.FontPointSize, 10) || PlasmaCore.Theme.defaultFont.pointSize
        renderType: Text.QtRendering

        anchors {
            top: icon.bottom
            topMargin: PlasmaCore.Units.smallSpacing
            left: parent.left
            right: parent.right
        }

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.WordWrap
        font.underline: root.activeFocus
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        onClicked: root.clicked()
        anchors.fill: root
    }

    Keys.onEnterPressed: clicked()
    Keys.onReturnPressed: clicked()
    Keys.onSpacePressed: clicked()

    Accessible.onPressAction: clicked()
    Accessible.role: Accessible.Button
    Accessible.name: label.text
}
