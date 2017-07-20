import QtQuick 2.4
import QtQuick.Layouts 1.2

Item {
    id: mainHandlerForm
    anchors.fill: parent

    property bool train_exer1: false
    property bool train_exer2: false
    property bool train_exer3: false
//    property alias t1:mainHandlerForm.train_exer1
//    property alias t2:mainHandlerForm.train_exer2
//    property alias t3:mainHandlerForm.train_exer3

    ColumnLayout {
        id: column
        spacing: 2

        Rectangle {
            id: trainingOption
            Layout.preferredWidth: mainHandlerForm.width
            Layout.preferredHeight: mainHandlerForm.height / 3
            color: "#8cf2dc" // default color is light mint

            Row{
                anchors.centerIn: parent
                spacing: mainHandlerForm.width/15
                Image {
                    id: imgTraining

                    width: 100
                    height: 100
                    source: "Image/MainH_training_128.png"

                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Image.AlignLeft
                    verticalAlignment: Image.AlignVCenter

                    }
                Text {
                    id: txtTraining
                    width: 200
                    height: 100
                    text: qsTr("TRAINING")
                    font.pixelSize: 30
                    color: "#07335a"    // default color is blue

                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment : Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter

                }
            }


            MouseArea {
                id: mouseTraining
                anchors.fill:parent
                hoverEnabled: true

                /* hover color */
                onEntered: {
                    parent.color="#66c8bb"     // hover color is dark mint
                    txtTraining.color = "white"
                }
                /* background color */
                onExited: {
                    parent.color="#8cf2dc"      // default color is light mint
                    txtTraining.color = "#07335a"
                }
                onPressed: {
                    mainHandlerForm.train_exer1=true;
                    mainHandlerForm.train_exer2=true;
                    mainHandlerForm.train_exer3=true;
                    mainPageLoader.source="TrainingHandler.qml"
                }
            }

        }

        Rectangle {
            id: resultOption
            Layout.preferredWidth: mainHandlerForm.width
            Layout.preferredHeight: mainHandlerForm.height / 3
            color: "#8cf2dc"

            Row{
                anchors.centerIn: parent
                spacing: mainHandlerForm.width/15
                Image {
                    id: imgResult

                    width: 100
                    height: 100
                    fillMode:Image.PreserveAspectFit
                    source: "Image/MainH_result_128.png"

                    anchors.verticalCenter: parent.verticalCenter

                    horizontalAlignment: Image.AlignLeft
                    verticalAlignment: Image.AlignVCenter
                }

                Text {
                    id: txtResult

                    width: 200
                    height: 100
                    text: qsTr("RESULT")
                    font.pixelSize: 30
                    color: "#07335a"

                    anchors.verticalCenter: parent.verticalCenter

                    horizontalAlignment : Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter

                }
            }

            MouseArea {
                id: mouseResult
                anchors.fill:parent
                hoverEnabled: true
                onEntered: {
                    parent.color="#66c8bb"
                    txtResult.color = "white"
                }
                onExited: {
                    parent.color="#8cf2dc"
                    txtResult.color = "#07335a"
                }
                onPressed: mainPageLoader.source="ResultPage.qml"
            }
        }

        Rectangle {
            id: settingOption
            Layout.preferredWidth: mainHandlerForm.width
            Layout.preferredHeight: mainHandlerForm.height / 3
            color: "#8cf2dc"

            Row{
                anchors.centerIn: parent
                spacing: mainHandlerForm.width/15
                Image {
                    id: imgSetting

                    width: 100
                    height: 100
                    source: "Image/MainH_system_128.png"

                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Image.AlignLeft
                    verticalAlignment: Image.AlignVCenter
                }

                Text {
                    id: txtSetting
                    width: 200
                    height: 100
                    text: qsTr("SETTING")
                    font.pixelSize: 30
                    color: "#07335a"

                    anchors.verticalCenter: parent.verticalCenter

                    horizontalAlignment : Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter

                }
            }

            MouseArea {
                id: mouseSetting
                anchors.fill:parent
                hoverEnabled: true
                onEntered: {
                    parent.color="#66c8bb"
                    txtSetting.color = "white"
                }
                onExited: {
                    parent.color="#8cf2dc"
                    txtSetting.color = "#07335a"
                }
                onPressed: mainPageLoader.source="SettingPage_BT.qml"
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
