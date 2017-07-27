/*
 * GIST TRAINING
 */

import QtQuick 2.4
import QtGraphicalEffects 1.0

Item {
    id: training_01
    anchors.fill: parent

    property int position:0
    property int pre_position:0
    property int count : 0
    property int set_goal:10
    property alias count_forward: training_01.count

    property bool visibleStartPage: true
    property bool visibleTrainingPage: false
    property bool visibleEndPage: false

    // rectPos: 1->8
    property int rectPos: 1
    property int btPos: myBluetooth.BtPosition
    onBtPosChanged: {
        rectPos = (btPos / 125) + 1;
        console.log("Bluetooth position = " + rectPos)
    }

    property bool visibleStar1_Pr1: false
    property bool visibleStar2_Pr1: false
    property bool visibleStar3_Pr1: false

    //prevent mouse controll impact with previous page
    MouseArea {
        anchors.fill:parent
        hoverEnabled: true
    }

    /**********************
     ***** START PAGE *****
     **********************/

    Rectangle{
        anchors.fill: parent
        visible: visibleStartPage
        Column{
            anchors.fill: parent

            // Upper layer
            Rectangle{
                width: parent.width
                height: parent.height*1/3
                color: "#fff9ad"
                z: 1
                Image{
                    source: "Image/TrainingH_gist.png"

                    anchors.horizontalCenter:parent.horizontalCenter
                    anchors.top: parent.verticalCenter
                    verticalAlignment: Image.AlignTop

                    }
            }
            // Lower layer
            Rectangle{
                width: parent.width
                height: parent.height*2/3
                color: "#faf398"

                Text {
                    text: "<b>GIST</b> TRAINING"
                    font.pixelSize: 50
                    font.family: "Tamoha"
                    color: "#eab809"

                    anchors.horizontalCenter:parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    y: parent.height*10/100 // 10% distance


                }

                Image{
                    width:  492*60/100  // 60% of original
                    height: 152*60/100
                    source: "Image/Training_btn_Gist.png"

                    anchors.horizontalCenter:parent.horizontalCenter
                    verticalAlignment: Image.AlignBottom
                    y: parent.height*30/100 // 30% distance


                    MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        visibleStartPage = false
                        visibleTrainingPage = true
                    }
                    }
                }
            }
        }

    }

    /**********************
     ****** END PAGE ******
     **********************/

    Rectangle{
        anchors.fill: parent
        visible: visibleEndPage
        Column{
            anchors.fill: parent

            // Upper layer
            Rectangle{
                width: parent.width
                height: parent.height*1/3
                color: "#fff9ad"
                Image{
                    source: "Image/TrainingH_gist.png"

                    anchors.horizontalCenter:parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Image.AlignHCenter

                    }
            }

            // Lower layer
            Rectangle{
                width: parent.width
                height: parent.height*2/3
                color: "#faf398"

                Row{
                    anchors.horizontalCenter:parent.horizontalCenter
                    anchors.verticalCenter: parent.top

                    // STAR
                    Image{
                        width:  79*70/100   // 70% of original
                        height: 77*70/100
                        source: "Image/TrainingH_star.png"
                        visible: visibleStar1_Pr1
                    }
                    Image{
                        width:  79*70/100   // 70% of original
                        height: 77*70/100
                        source: "Image/TrainingH_star.png"
                        visible: visibleStar2_Pr1
                    }
                    Image{
                        width:  79*70/100   // 70% of original
                        height: 77*70/100
                        source: "Image/TrainingH_star.png"
                        visible: visibleStar3_Pr1
                    }
                }

                // SCORE
                Text {
                    text: scoreValue.toLocaleString();
                    font.pixelSize: 50
                    font.family: "Tamoha"
                    color: "#eab809"

                    anchors.horizontalCenter:parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    y: parent.height*10/100 // 10% distance
                }

                // CONGRATULATION
                Text {
                    id: txtResult
                    font.pixelSize: 50
                    font.family: "Tamoha"
                    color: "#eab809"

                    anchors.horizontalCenter:parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    y: parent.height*30/100 // 30% distance
                }

                SpriteSequence {
                        width: 492 *60/100
                        height: 152 *60/100
                        interpolate: true

                        anchors.horizontalCenter:parent.horizontalCenter
                        y: parent.height*50/100 // 50% distance

                    Sprite {
                        name: "left"
                        source: "Image/EndPage_btn_Gist.png"
                        frameCount: 2
                        frameDuration: 500
                    }
                }

                //SpriteSequence doesn't support mouse area. Using "invisible" rectange
                Rectangle
                {
                    width: 492
                    height: 152
                    z:1
                    opacity: 0.0
                    anchors.horizontalCenter:parent.horizontalCenter
                    y: parent.height*50/100 // 50% distance

                    MouseArea{
                    anchors.fill: parent
                    onPressed: trainingPageLoader.source="TrainingMenu.qml";
                    }

                }

            }
        }

    }

    /******************************************
      ************** TRAINING ****************
      ****************************************/

    Rectangle {
        anchors.fill: parent
        visible: visibleTrainingPage
        color: "#ffffbb"

        /* NUMBER OF PRACTICE */
        Rectangle{
            width: 128*70*2/100
            height:128*70/100
            LinearGradient {
                anchors.fill: parent
                start: Qt.point(parent.width, 0)
                end: Qt.point(0, 0)
                gradient: Gradient {
                          GradientStop { position: 1.0; color: "#ffffbb" }
                          GradientStop { position: 0.0; color: "white" }
                      }
            }
            anchors.right: parent.right
            anchors.rightMargin: parent.width/6
            anchors.top: parent.top
            anchors.topMargin: parent.height/30

            Row{
            spacing: parent.width/4
            Image{
                source: "Image/TrainingH_gist.png"
                width: 128 *70/100
                height: 128*70/100
                verticalAlignment: Image.AlignVCenter
            }
            Text {
                id: txtNumberofPractice
                width: 128 *70/100
                height: 128*70/100
                font.pointSize: 30
                color: "#eeca2b"
                text: numberOfPractice.toLocaleString();
                font.family: "Tamoha"
                font.bold: true
                verticalAlignment: Text.AlignVCenter

            }
            }
        }

        // KEY BOARD 1
        Rectangle {
            id: keyboard1
            x: parent.width*4/16
            y: parent.height*3/36
            width: parent.width*1/4.5
            height: parent.height*1/12
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state:(1 == rectPos)? "state1On" : "state1Off"

            MouseArea {
                id: mousekeyboard1
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    parent.color="#ffe064"; // hover color is light yellow
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state1On"
                    PropertyChanges { target: keyboard1; color: "#ffe064"}
                },
                State {
                    name: "state1Off"
                    PropertyChanges { target: keyboard1; color: "white"}
                },
                State {
                    name: "state1Selected"
                }
            ]
        }

        // KEY BOARD 2
        Rectangle{
            id: keyboard2
            x: parent.width*3/16
            y: parent.height*7/36
            width: parent.width*1/4.5
            height: parent.height*1/12
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state:(2 == rectPos)? "state2On" : "state2Off"

            MouseArea {
                id: mousekeyboard2
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    parent.color="#ffe064";
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state2On"    //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard2; color: "#ffe064"}
                },
                State {
                    name: "state2Off"
                    PropertyChanges { target: keyboard2; color: "white"}
                },
                State {
                    name: "state2Selected"
                }
            ]
        }

        // KEY BOARD 3
        Rectangle{
            id: keyboard3
            x: parent.width*2/16
            y: parent.height*11/36
            width: parent.width*1/4.5
            height: parent.height*1/12
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state:(3 == rectPos)? "state3On" : "state3Off"

            MouseArea {
                id: mousekeyboard3
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    parent.color="#ffe064";
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state3On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard3; color: "#ffe064"}
                },
                State {
                    name: "state3Off"
                    PropertyChanges { target: keyboard3; color: "white"}
                },
                State {
                    name: "state3Selected"
                }
            ]
        }

        // KEY BOARD 4
        Rectangle{
            id: keyboard4
            x: parent.width*1/16
            y: parent.height*15/36
            width: parent.width*1/4.5
            height: parent.height*1/12
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state:(4 == rectPos)? "state4On" : "state4Off"

            MouseArea {
                id: mousekeyboard4
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    parent.color="#ffe064";
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state4On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard4; color: "#ffe064"}
                },
                State {
                    name: "state4Off"
                    PropertyChanges { target: keyboard4; color: "white"}
                },
                State {
                    name: "state4Selected"
                }
            ]
        }

        // KEY BOARD 5
        Rectangle{
            id: keyboard5
            x: parent.width*1/16
            y: parent.height*19/36
            width: parent.width*1/4.5
            height: parent.height*1/12
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state:(5 == rectPos)? "state5On" : "state5Off"

            MouseArea {
                id: mousekeyboard5
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    parent.color="#ffe064";
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state5On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard5; color: "#ffe064"}
                },
                State {
                    name: "state5Off"
                    PropertyChanges { target: keyboard5; color: "white"}
                },
                State {
                    name: "state5Selected"
                }
            ]
        }

        // KEY BOARD 6
        Rectangle{
            id: keyboard6
            x: parent.width*2/16
            y: parent.height*23/36
            width: parent.width*1/4.5
            height: parent.height*1/12
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state:(6 == rectPos)? "state6On" : "state6Off"

            MouseArea {
                id: mousekeyboard6
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    parent.color="#ffe064";
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state6On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard6; color: "#ffe064"}
                },
                State {
                    name: "state6Off"
                    PropertyChanges { target: keyboard6; color: "white"}
                },
                State {
                    name: "state6Selected"
                }
            ]
        }

        // KEY BOARD 7
        Rectangle{
            id: keyboard7
            x: parent.width*3/16
            y: parent.height*27/36
            width: parent.width*1/4.5
            height: parent.height*1/12
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state:(7 == rectPos)? "state7On" : "state7Off"

            MouseArea {
                id: mousekeyboard7
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    parent.color="#ffe064";
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state7On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard7; color: "#ffe064"}
                },
                State {
                    name: "state7Off"
                    PropertyChanges { target: keyboard7; color: "white"}
                },
                State {
                    name: "state7Selected"
                }
            ]
        }

        // KEY BOARD 8
        Rectangle{
            id: keyboard8
            x: parent.width*4/16
            y: parent.height*31/36
            width: parent.width*1/4.5
            height: parent.height*1/12
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state:(8 == rectPos)? "state8On" : "state8Off"

            MouseArea {
                id: mousekeyboard8
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    parent.color="#ffe064";
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state8On"
                    PropertyChanges { target: keyboard8; color: "#ffe064"}
                },
                State {
                    name: "state8Off"
                    PropertyChanges { target: keyboard8; color: "white"}
                },
                State {
                    name: "state8Selected"
                }
            ]
        }

        SpriteSequence {
                width: 344
                height: 350
                interpolate: true

                y: parent.height/3
                anchors.right: parent.right
                anchors.rightMargin: parent.width/6

            Sprite {
                name: "left"
                source: "Image/Training_Animate_Robot.png"
                frameWidth: 344
                frameHeight: 350
                frameCount: 1
                frameDuration: 500
                frameDurationVariation: 400
                to: { "middle" : 1 }
            }
            Sprite {
                name: "middle"
                source: "Image/Training_Animate_Robot.png"
                frameWidth: 344
                frameHeight: 350
                frameCount: 1
                frameX: 344
                frameDuration: 1000
                frameDurationVariation: 400
                to: { "left" : 0, "right" : 2 }
            }
            Sprite {
                name: "right"
                source: "Image/Training_Animate_Robot.png"
                frameWidth: 344
                frameHeight: 350
                frameCount: 1
                frameX: 688
                frameDuration: 1000
                frameDurationVariation: 400
                to: { "middle" : 2, "left" : 0 }
            }
        }

        // BACK BUTTON
        Image {
            id: backButton
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
                    backButton.source = "Image/back_button_onenter.png";
                }
                onExited: {
                    backButton.source = "Image/back_button.png";
                }
                onPressed:
                {
                    visibleTrainingPage = false
                    calculateScore();
                    visibleEndPage = true

                    backButton.source = "Image/back_button_onclick.png";
                    console.log("Back");
                    console.log(scoreValue.toLocaleString());
                }
            }
        }

    }
    Loader
    {
        id:trainingPageLoader
        anchors.fill:parent
        focus: true
    }

    /**************************************
     *Generate Target base on Timer Trigger
     **************************************/


    property int numberOfPractice: 3   // number of practice - defined by doctor
    property bool timeOutFlag: false    // interval to reach the target
    property int timeInit: 5            // default value of timing
    property int keyDirection: 1        // direction of keyboard. 1 is direction from top to bottom; else is from bottom to top
    property int orderNumber: -3        // order of number; default is -3 mean at the first time, position moves from center to top (3 steps)

    /* SCORE VALUE */
    property int scoreValue: 0
    property int maxscoreValue: 0
    property int counterNumber: 0


//    Timer {
//    interval: 100; running: visibleTrainingPage; repeat: true


//    onTriggered:
//    {
//        // number of Practice is defined by doctor
//        if(numberOfPractice >= 0)
//        {
//            txtNumberofPractice.text = numberOfPractice.toString()
//            // direction from top to bottom
//            if(keyDirection == 1)
//            {
//                if(orderNumber == -3)
//                {
//                    keyboard4.state = "state4On"
//                    keyboard5.state = "state5On"
//                }
//                if(orderNumber == -2)
//                {
//                    keyboard4.state = "state4Off"
//                    keyboard5.state = "state5Off"

//                    keyboard3.state = "state3On"
//                }
//                if(orderNumber == -1)
//                {
//                    keyboard3.state = "state3Off"
//                    keyboard2.state = "state2On"
//                }
//                if(orderNumber == 0)
//                {
//                    keyboard2.state = "state2Off"
//                    keyboard1.state = "state1On"
//                }
//                if(orderNumber == 1)
//                {
//                    keyboard1.state = "state1Off"
//                    keyboard2.state = "state2On"
//                }
//                if(orderNumber == 2)
//                {
//                    keyboard2.state = "state2Off"
//                    keyboard3.state = "state3On"
//                }
//                if(orderNumber == 3)
//                {
//                    keyboard3.state = "state3Off"
//                    keyboard4.state = "state4On"
//                }
//                if(orderNumber == 4)
//                {
//                    keyboard4.state = "state4Off"
//                    keyboard5.state = "state5On"
//                }
//                if(orderNumber == 5)
//                {
//                    keyboard5.state = "state5Off"
//                    keyboard6.state = "state6On"
//                }
//                if(orderNumber == 6)
//                {
//                    keyboard6.state = "state6Off"
//                    keyboard7.state = "state7On"
//                }
//                if(orderNumber == 7)
//                {
//                    keyboard7.state = "state7Off"
//                    keyboard8.state = "state8On"
//                    keyDirection = -1
//                }
//                orderNumber = orderNumber + 1
//                scoreValue = scoreValue + 1
//                counterNumber = counterNumber+1

//            }

//            // direction from bottom to top
//            else
//            {
//                if(orderNumber == 8)
//                {
//                    keyboard8.state = "state8On"
//                }
//                if(orderNumber == 7)
//                {
//                    keyboard8.state = "state8Off"
//                    keyboard7.state = "state7On"
//                }
//                if(orderNumber == 6)
//                {
//                    keyboard7.state = "state7Off"
//                    keyboard6.state = "state6On"
//                }
//                if(orderNumber == 5)
//                {
//                    keyboard6.state = "state6Off"
//                    keyboard5.state = "state5On"
//                }
//                if(orderNumber == 4)
//                {
//                    keyboard5.state = "state5Off"
//                    keyboard4.state = "state4On"
//                }
//                if(orderNumber == 3)
//                {
//                    keyboard4.state = "state4Off"
//                    keyboard3.state = "state3On"
//                }
//                if(orderNumber == 2)
//                {
//                    keyboard3.state = "state3Off"
//                    keyboard2.state = "state2On"
//                }
//                if(orderNumber == 1)
//                {
//                    keyboard2.state = "state2Off"
//                    keyboard1.state = "state1On"
//                    keyDirection = 1
//                    numberOfPractice = numberOfPractice -1
//                }

//                orderNumber = orderNumber - 1
//                scoreValue = scoreValue + 1
//                counterNumber = counterNumber+1
//            }


//        }
//        // stop timer when number of Practice is over
//        else
//        {
//            console.log("counterNumber is ", counterNumber);
//            Timer.running = false
//            visibleTrainingPage = false
//            calculateScore();
//            visibleEndPage = true
//        }
//    }
//    }

    Text{id:txtcounterNumber; x:30; y:30}

    /* SCORE CALCULATION */
    function calculateScore()
    {
        scoreValue = scoreValue*100;
        validateText();
    }

    function validateText()
    {
        maxscoreValue = 67*100;
        if((scoreValue <= maxscoreValue) & (scoreValue >= (maxscoreValue*2/3)))
        {
            console.log("scoreValue is ", scoreValue, "maxscoreValue is", maxscoreValue);
            txtResult.text = "EXCELLENCE JOB! TOP SCORE";
            visibleStar1_Pr1 = true;
            visibleStar2_Pr1 = true;
            visibleStar3_Pr1 = true;
        }
        else if((scoreValue < (maxscoreValue*2/3)) & (scoreValue >= (maxscoreValue*1/3)))
        {
            console.log("scoreValue is ", scoreValue, "maxscoreValue is", maxscoreValue);
            txtResult.text = "GREAT JOB! HIGH SCORE";
            visibleStar1_Pr1 = true;
            visibleStar2_Pr1 = true;
            visibleStar3_Pr1 = false;
        }
        else
        {
            console.log("scoreValue is ", scoreValue, "maxscoreValue is", maxscoreValue);
            txtResult.text = "GOOD JOB";
            visibleStar1_Pr1 = true;
            visibleStar2_Pr1 = false;
            visibleStar3_Pr1 = false;
        }
    }


    function check_status()
    {
        if(position===1)
        {

            if(pre_position===1)
            {
                console.log("up");
            }
            else if(pre_position===2)
            {
                console.log("down");
                count=count+1
            }
            else{}
        }
        if(position===2)
        {
            if(pre_position===1)
            {
                console.log("up");
            }
            else if(pre_position===2)
            {
                console.log("down");
            }
            else{}
        }

        pre_position=position;
    }
}














