import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: trainingHandlerForm
    width: 800
    height: 640

    Column {
        id: column

        Rectangle {
            id: exerciseOption3
            width: trainingHandlerForm.width
            height: trainingHandlerForm.height / 3

            Image {
                id: imgPractice3
                x: 101
                y: 27
                width: 140
                height: 160
                z: 1
                source: "Image/Locked_Practice.png"
            }

            Text {
                id: txtExe3
                x: 264
                y: 37
                width: 223
                height: 140
                text: ""
                font.pixelSize: 12
            }

            MouseArea {
                id: mouseExe3
                anchors.fill: parent
                hoverEnabled: true
            }
        }

        Rectangle {
            id: exerciseOption2
            width: trainingHandlerForm.width
            height: trainingHandlerForm.height / 3

            Text {
                id: txtExe2
                x: 262
                y: 37
                width: 226
                height: 140
                text: ""
                font.pixelSize: 12
            }

            MouseArea {
                id: mouseExe2
                anchors.fill: parent
                hoverEnabled: true
            }

            Image {
                id: imgPractice2
                x: 104
                y: 27
                width: 140
                height: 160
                source: "Image/Locked_Practice.png"
            }
        }

        Rectangle {
            id: exerciseOption1
            width: trainingHandlerForm.width
            height: trainingHandlerForm.height / 3

            Image {
                id: imgPractice1
                x: 103
                y: 27
                width: 140
                height: 160
                source: "Image/Locked_Practice.png"
            }

            ColorOverlay {
                id:colOverlay1
                anchors.fill: imgPractice1
                source: imgPractice1
                color: "transparent"  // make image like it lays under red glass
                SequentialAnimation on color{
                    ColorAnimation { to: "yellow"; duration: 500 }
                    ColorAnimation { to: "blue"; duration: 500 }
                    PropertyAction { target: imgPractice1; property: "source"; value: "Image/Practice1.png" }
                    ColorAnimation { to: "transparent"; duration: 1000 }
                    PropertyAction { target: txtExe1; property: "text"; value: "BÀI TẬP SỨC MẠNH"}
                    PropertyAction { target: exerciseOption1; property: "color"; value: "#ffe699"}
                }

            }

            Text {
                id: txtExe1
                x: 261
                y: 37
                width: trainingHandlerForm.width / 3
                height: trainingHandlerForm.height / 2
                text: ""
                font.pixelSize: 32
                anchors.verticalCenter: parent.verticalCenter
            }

            MouseArea {
                id: mouseExe1
                anchors.fill: parent
                hoverEnabled: true
                onPressed: trainingPageLoader.source="RehabGame.qml"
            }
        }
        states: [
            State {
                name: "unlockedState"
                PropertyChanges { target: myRect; color: "red" }
            },
            State{
                name: "activeState1"
            },
            State{
                name: "activeState2"
            },
            State{
                name: "activeState3"
            },
            State{
                name: "activeAll"
            }
        ]
    }
    Loader
    {
        id:trainingPageLoader
        anchors.fill:parent
    }

}
