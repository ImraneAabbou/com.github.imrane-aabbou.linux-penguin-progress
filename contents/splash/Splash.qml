import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "black"
    anchors.fill: parent

    // Total frames is 128 (000 through 127)
    property int frame: 0
    property int totalFrames: 128

    Timer {
        interval: 33 // ~30 FPS
        repeat: true
        running: true
        onTriggered: {
            root.frame = (root.frame + 1) % root.totalFrames
        }
    }

    Image {
        id: animationHolder
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit

        // This handles padding: 0-9 becomes 00x, 10-99 becomes 0xx, 100+ stays xxx
        source: "images/animation-" +
        (root.frame < 10 ? "00" : (root.frame < 100 ? "0" : "")) +
        root.frame + ".png"
    }
}
