import QtQuick 2.2
import QtGraphicalEffects 1.0

FocusScope {
    id: sceneBackground

    Image {
        id: sceneImageBackground
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: config.background || config.Background
        smooth: true
    }

    RecursiveBlur {
        anchors.fill: sceneImageBackground
        source: sceneImageBackground
        radius: config.Blur == "true" ? config.RecursiveBlurRadius : 0
        loops: config.Blur == "true" ? config.RecursiveBlurLoops : 0
    }
}
