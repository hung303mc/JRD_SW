import QtQuick 2.4
import QtQuick.Controls 1.4

Item {

    anchors.fill: parent

    MouseArea {
        //id:
        anchors.fill: parent
        hoverEnabled: true
    }
    Image {
        id: back
        source: "Image/back_button.png"
        width: parent.width/15
        height: parent.height/12
        x: parent.width- width
        y: parent.y
        visible: true
        MouseArea{
            id:mouse_back_bt
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                back.source = "Image/back_button_onenter.png";
            }
            onExited: {
               back.source = "Image/back_button.png";
            }
            onPressed:
            {
                back.source = "Image/back_button_onclick.png";
                console.log("Back");
                trainingPageLoader.source="MainHandler.qml";
            }
        }
    }

    Rectangle {
        id: recBorder
        x: 41
        y: 74
        width: parent.width/2
        height: parent.height/2
        color: "#f9f9f8"
        radius: 30
        border.width: 3
        z: -1
    }

    Rectangle {
        id: recBorderTitle
        x: 300
        y: 8
        width: 200
        height: 139
        color: "#ffffff"
        radius: 30
        border.width: 1

        Text {
            id: txtTitle
            x: 12
            y: 25
            width: 176
            height: 89
            text: qsTr("SETTING")
            fontSizeMode: Text.HorizontalFit
            elide: Text.ElideMiddle
            styleColor: "#0b0b0b"
            z: 1
            renderType: Text.NativeRendering
            textFormat: Text.PlainText
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.letterSpacing: 1
            font.wordSpacing: 10
            style: Text.Sunken
            font.weight: Font.DemiBold
            font.pixelSize: 26
            font.bold: true
            font.family: "Courier"
        }
    }

    Text {
        id: txtSetting1
        x: 70
        y: 171
        width: 180
        height: 50
        text: "BA?I TÂ?P S??C MA?NH"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 20
    }

    Text {
        id: txtSetting2
        x: 70
        y: 227
        width: 180
        height: 50
        text: qsTr("BA?I TÂ?P TÔ?C ‰Ô?")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 20
    }

    Text {
        id: txtSetting3
        x: 70
        y: 283
        width: 180
        height: 50
        text: qsTr("BA?I TÂ?P ‰Ô? BÊ?N")
        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    Slider {
        x: 300
        y: 185
        width: 200
        height: 22
        maximumValue: 5
        stepSize: 1
        activeFocusOnPress: false
        tickmarksEnabled: true
        value: 0
    }

    Slider {
        x: 300
        y: 241
        width: 200
        height: 22
        value: 0
        stepSize: 1
        activeFocusOnPress: false
        tickmarksEnabled: true
        maximumValue: 5
    }

    Slider {
        x: 300
        y: 297
        width: 200
        height: 22
        value: 0
        stepSize: 1
        activeFocusOnPress: false
        tickmarksEnabled: true
        maximumValue: 5
        updateValueWhileDragging: true
    }
    Loader
    {
        id:trainingPageLoader
        anchors.fill:parent
        focus: true
    }

}
