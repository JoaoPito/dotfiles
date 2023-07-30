import QtQuick 2.2
import QtQuick.Controls 1.3 as QQC

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

PlasmaComponents.ToolButton {
    id: root
    property int currentIndex: -1
    property int sessionFontSize

    visible: menu.items.length > 1
    font.family: config.Font || "Noto Sans"
    font.pointSize: sessionFontSize

    text: instantiator.objectAt(currentIndex).text || ""

    Component.onCompleted: {
        currentIndex = sessionModel.lastIndex
    }

    menu: QQC.Menu {
        id: menu

        Instantiator {
            id: instantiator
            model: sessionModel
            onObjectAdded: menu.insertItem(index, object)
            onObjectRemoved: menu.removeItem( object )

            delegate: QQC.MenuItem {
                text: model.name

                onTriggered: {
                    root.currentIndex = model.index
                }
            }
        }
    }
}
