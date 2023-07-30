import "components"

import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls.Styles 1.4

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

SessionManagementScreen {
    property bool showUsernamePrompt: !showUserList
    property int usernameFontSize
    property string usernameFontColor
    property string lastUserName
    property bool passwordFieldOutlined: config.PasswordFieldOutlined == "true"
    property bool passwordRevealIcon: config.PasswordRevealIcon == "true"

    signal loginRequest(string username, string password)

    onShowUsernamePromptChanged: {
        if (!showUsernamePrompt) {
            lastUserName = ""
        }
    }

    function startLogin() {
        var username = showUsernamePrompt ? userNameInput.text : userList.selectedUser
        var password = passwordBox.text

        // looks nicer, and works around a Qt bug that can trigger if the app is closed with a TextField focussed
        loginRequest(username, password);
    }

    PlasmaComponents.TextField {
        id: userNameInput
        Layout.fillWidth: true
        Layout.minimumHeight: 21
        implicitHeight: root.height / 28
        font.family: config.Font || "Noto Sans"
        font.pointSize: usernameFontSize
        opacity: 0.5
        text: lastUserName
        visible: showUsernamePrompt
        focus: showUsernamePrompt && !lastUserName
        placeholderText: i18nd("plasma_lookandfeel_org.kde.lookandfeel", "Username")

        style: TextFieldStyle {
            textColor: "black"
            background: Rectangle {
                radius: 20
            }
        }
    }

    PlasmaComponents.TextField {
        id: passwordBox

        font {
            family: config.Font || "Noto Sans"
            pointSize: usernameFontSize * 0.9
        }

        Layout.fillWidth: true
        opacity: passwordFieldOutlined ? 0.75 : 0.5

        placeholderText: config.PasswordFieldPlaceholderText == "Password" ? i18nd("plasma_lookandfeel_org.kde.lookandfeel", "Password") : config.PasswordFieldPlaceholderText

        focus: !showUsernamePrompt || lastUserName
        echoMode: TextInput.Password
        revealPasswordButtonShown: passwordRevealIcon
        onAccepted: startLogin()

        style: TextFieldStyle {
            textColor: passwordFieldOutlined ? "white" : "black"
            placeholderTextColor: passwordFieldOutlined ? "white" : "black"
            passwordCharacter: config.PasswordFieldCharacter == "" ? "●" : config.PasswordFieldCharacter
            background: Rectangle {
                radius: 10
                border.color: "white"
                border.width: config.AvatarOutlineWidth || 1
                color: passwordFieldOutlined ? "transparent" : "white"
            }
        }

        Keys.onEscapePressed: {
            mainStack.currentItem.forceActiveFocus();
        }

        Keys.onPressed: {
            if (event.key == Qt.Key_Left && !text) {
                userList.decrementCurrentIndex();
                event.accepted = true
            }
            if (event.key == Qt.Key_Right && !text) {
                userList.incrementCurrentIndex();
                event.accepted = true
            }
        }

        Connections {
            target: sddm

            function onLoginFailed() {
                passwordBox.selectAll()
                passwordBox.forceActiveFocus()
            }
        }
    }
}
