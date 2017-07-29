import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtBluetooth 5.3
Item {
    id: mainLayout
    anchors.fill: parent

    MouseArea {
        //id:
        anchors.fill: parent
        hoverEnabled: true
    }
    property string btAdr: myBluetooth.BtAddress
    onBtAdrChanged: {
        cbModel.append({"text":myBluetooth.BtAddress});
        console.log("Connect to new device"+myBluetooth.BtAddress)
    }
    property string rcvMsg: myBluetooth.RcvMsg
    onRcvMsgChanged: {
        txtConvMsg.append(rcvMsg)
    }

    Component.onCompleted: {
        myBluetooth.startServer();
    }

    Rectangle {
        id: recBorder
        x: 0
        y: 0
        width: 1024
        height: 600
        color: "#f9f9f8"
        z: -1
    }
    ColumnLayout {
        anchors.fill: parent
        /* Sending group*/
        GroupBox {
            id: rowBoxSend
            title: "Send message box"
            Layout.fillWidth: true

            RowLayout {
                id: rowLayoutSend
                anchors.fill: parent
                TextField {
                    id: txtSendMsg
                    placeholderText: "Type sending message"
                    Layout.fillWidth: true
                }
                Button {
                    id: pbSend
                    text: "Send"
                    onClicked: {
                        myBluetooth.write(txtSendMsg.text);
                        txtSendMsg.text = "";
                    }
                }
                Button {
                    id: pbBack
                    text: "Back"
                    onClicked: {
                        console.log("Back");
                        trainingPageLoader.source="MainMenu.qml";
                    }
                }
            }
        }
        /* Connect group*/
        GroupBox {
            id: rowBoxConnect
            title: "Connect BT box"
            Layout.fillWidth: true
            property string statusCon: "Disconnect"

            RowLayout {
                id: rowLayoutConnect
                anchors.fill: parent
                ComboBox{
                    id: cbBtDevice
                    model: ListModel {
                        id: cbModel
                    }
                    Layout.fillWidth: true
                }
                Button {
                    id: pbConnect
                    text: "Connect"
                    onClicked:{
                        myBluetooth.connectSocket(cbBtDevice.currentText);
                        rowBoxConnect.statusCon = "Connected";
                    }
                }
                Label {
                    id: lbStatus
                    text: rowBoxConnect.statusCon
                }
            }
        }
        /* Receiving group*/
        TextArea {
            id: txtConvMsg
            Layout.minimumHeight: 30
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    Loader
    {
        id:trainingPageLoader
        anchors.fill:parent
        focus: true
    }

}
