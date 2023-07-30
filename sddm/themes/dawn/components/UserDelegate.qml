import QtQuick 2.4
import QtGraphicalEffects 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: wrapper

    property bool isCurrent: true
    readonly property var m: model
    property string name
    property string userName
    property string avatarPath
    property string iconSource
    property bool constrainText: true

    signal clicked()
    property real faceSize: PlasmaCore.Units.gridUnit * 7
    opacity: isCurrent ? 1.0 : 0.25

    Behavior on opacity {
        OpacityAnimator {
            duration: PlasmaCore.Units.longDuration
        }
    }

    Item {
        id: imageSource
        width: faceSize
        height: faceSize

        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: PlasmaCore.Units.gridUnit * 1.5
        }

        Rectangle {
            id: outline
            anchors.fill: parent
            anchors.margins: -(config.AvatarOutlineWidth) || -2
            color: "transparent"
            border.width: config.AvatarOutlineWidth || 3
            border.color: config.AvatarOutlineColor || "#b6a8b5"
            radius: 100
            visible: config.AvatarOutline == "true" ? true : false
        }

        // user image
        Image {
            id: face
            source: wrapper.avatarPath
            sourceSize: Qt.size(faceSize, faceSize)
            smooth: true
            fillMode: Image.PreserveAspectCrop
            anchors.fill: parent
            visible: false
        }

        Image {
            id: mask
            source: config.UsePngInsteadOfMask == "true" ? "" : "artwork/mask.svgz"
            sourceSize: Qt.size(faceSize, faceSize)
            smooth: true
        }

        OpacityMask {
            anchors.fill: face
            source: face
            maskSource: mask
            cached: true
        }

        // fallback generic user image
        PlasmaCore.IconItem {
            id: faceIcon
            source: iconSource
            visible: (face.status == Image.Error || face.status == Image.Null)
            anchors.fill: parent
            anchors.margins: PlasmaCore.Units.gridUnit * 0.5 // because mockup says so...
            colorGroup: PlasmaCore.ColorScope.colorGroup
        }
    }

    PlasmaComponents.Label {
        id: usernameDelegate

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: imageSource.bottom
        }

        font {
            family: config.Font || "Noto Sans"
            capitalization: Font.Capitalize
            underline: wrapper.activeFocus
            pointSize: parseInt(config.FontPointSize * 1.2, 10) ||
                PlasmaCore.Theme.defaultFont.pointSize * 1.2
        }

        text: wrapper.name
        wrapMode: Text.WordWrap
        renderType: Text.QtRendering
        horizontalAlignment: Text.AlignHCenter
        width: constrainText ? parent.width : implicitWidth
        maximumLineCount: wrapper.constrainText ? 2 : 1
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: wrapper.clicked();
    }

    Accessible.name: name
    Accessible.role: Accessible.Button

    function accessiblePressAction() {
        wrapper.clicked()
    }
}
