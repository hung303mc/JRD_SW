import QtQuick 2.4
import QtGraphicalEffects 1.0

Item {
    id: mainHandlerForm

    Column {
        id: column
        anchors.fill: parent

        Rectangle {
            id: trainingOption
            width: mainHandlerForm.width
            height: mainHandlerForm.height / 3
            color: "#ffffff"

            Image {
                id: imgTraining
                x: 263
                y: 57
                width: 100
                height: 100
                source: "Image/Active_Icon.png"
            }
            Text {
                id: txtTraining
                x: 385
                y: 57
                width: 201
                height: 100
                text: qsTr("TRAINING")
                font.pixelSize: 12
            }
            MouseArea {
                id: mouseTraining
                anchors.fill:parent
                hoverEnabled: true
                onEntered: {
                    parent.color="#ffe699"
                    glowArea1.spread = 1.0
                    glowArea1.radius = 3
                    glowArea1.samples = 17
                    glowArea1.transparentBorder = true
                    glowArea1.color = "red"
                    glowArea1.source = trainingOption
                }
                onExited: {
                    parent.color="white"
                }
                onPressed: mainPageLoader.source="TrainingHandler.qml"
            }
            Glow{
                id: glowArea1
                spread: 1.0
                radius: 8
                transparentBorder: true
                color: "red"
                source: trainingOption
            }

        }

        Rectangle {
            id: performanceOption
            width: mainHandlerForm.width
            height: mainHandlerForm.height / 3
            color: "#ffffff"

            Image {
                id: imgPerf
                x: 260
                y: 57
                width: 100
                height: 100
                source: "Image/achivement.png"
            }

            Text {
                id: txtPerf
                x: 381
                y: 57
                width: 203
                height: 100
                text: qsTr("ACHIEVEMENT")
                font.pixelSize: 12
            }

            MouseArea {
                id: mousePerf
                anchors.fill:parent
                hoverEnabled: true
                onEntered: {
                    parent.color="#bdd7ee"
                }
                onExited: {
                    parent.color="white"
                }
                onPressed: mainPageLoader.source="PerformanceHandler.qml"
            }
        }

        Rectangle {
            id: settingOption
            width: mainHandlerForm.width
            height: mainHandlerForm.height / 3
            color: "#ffffff"

            Image {
                id: imgSetting
                x: 268
                y: 57
                width: 100
                height: 100
                source: "Image/Setting.png"
            }

            Text {
                id: txtSetting
                x: 389
                y: 57
                width: 195
                height: 100
                text: qsTr("SETTING")
                font.pixelSize: 12
            }

            MouseArea {
                id: mouseSetting
                anchors.fill:parent
                hoverEnabled: true
                onEntered: {
                    parent.color="#c5e0b4"
                }
                onExited: {
                    parent.color="white"
                }
                onPressed: mainPageLoader.source="SettingHandler.qml"
            }
        }
    }
    Loader
    {
        id:mainPageLoader
        anchors.fill:parent
        focus: true
    }
}
