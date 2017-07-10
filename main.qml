import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Scene3D 2.0
import HmiVisualizer.Widgets 1.0
import HmiVisualizer.Data 1.0

Window {

    visible: true
    width: 250
    height: 500
    title: qsTr("Engineering HMI")
    color: "White"
    x: 100
    y: 100

    ListView {

        anchors.fill: parent
        model: _menuData
        delegate: Button {
            buttonText: menuItem
            width: parent.width
            onButtonClicked: {
                switch (menuItem) {
                case "Chart2D" :
                    _hmiObject.source = "Widgets/Chart2D.qml"
                    _playerController.visible = true;
                    break;
                case "3DWorld Visualizer" : _hmiObject.source = "Widgets/Widget3DDisplay.qml"
                    break;
                }
            }
        }
    }

    Window {

        id: _playerController
        width: 800
        height: 200
        x: 500
        y: 650
        visible: false
        title: "Player Controller"
        color: "LightGray"
        Column {

            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            spacing: 10

            TimeLineWidget {

                width: parent.width

            }

            PlayerController {

                playing: LCMStream.playing
                anchors.horizontalCenter: parent.horizontalCenter
                onPlayClicked : {

                    if (LCMStream.playing){

                        LCMStream.pause()
                    }
                    else {

                        if(LCMStream.dataIsReady === true) LCMStream.play()

                    }
                }
            }
        }
    }

    ListModel {

        id: _menuData
        ListElement { menuItem: "Chart2D" }
        ListElement { menuItem: "3DWorld Visualizer" }
        ListElement { menuItem: "Camera Output" }
    }

    Loader {
        id: _hmiObject
    }

}
