/*
 * GIST TRAINING
 */

import QtQuick 2.4
import QtGraphicalEffects 1.0

Item {
    id: training_02
    anchors.fill: parent

    property int position:0
    property int pre_position:0
    property int count : 0
    property int set_goal:10
    property alias count_forward: training_02.count

    property bool visibleStartPage: true
    property bool visibleTrainingPage: false
    property bool visibleEndPage: false

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

                // STAR
                Image{
                    width:  79*70/100   // 70% of original
                    height: 77*70/100
                    source: "Image/TrainingH_star.png"

                    anchors.horizontalCenter:parent.horizontalCenter
                    anchors.verticalCenter: parent.top
                    verticalAlignment: Image.AlignBottom
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
                    text: ""
                    font.pixelSize: 50
                    font.family: "Tamoha"
                    color: "#d01818"

                    anchors.horizontalCenter:parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    y: parent.height*30/100 // 30% distance
                }

                // BUTTON to TRAINING HANDLER
//                Image{
//                    id:imgTest
//                    width:  492*60/100  //original * 60%
//                    height: 152*60/100
//                    source: "Image/Training_btn_Strength_02.png"


//                    anchors.horizontalCenter:parent.horizontalCenter
//                    verticalAlignment: Image.AlignBottom
//                    y: parent.height*50/100 // 50% distance

//                    MouseArea{
//                    anchors.fill: parent
//                    onPressed: trainingPageLoader.source="TrainingHandler.qml";
//                    }
//                }

                SpriteSequence {
                        id: test
                        width: 492 *60/100
                        height: 152 *60/100
                        //interpolate: true

                        anchors.horizontalCenter:parent.horizontalCenter
                        //verticalAlignment: Image.AlignBottom
                        y: parent.height*50/100 // 50% distance



                Sprite {
                    name: "left"
                    source: "Image/Training_btn_Gist_03.png"
                    frameCount: 2
                    frameDuration: 600


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
                    onPressed: trainingPageLoader.source="TrainingHandler.qml";
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
        id: bgr_img
        visible: visibleTrainingPage
//        source: "Image/starscream.png"

        Text {
            id: txtScore
            font.pointSize: 30
            x:parent.width*3/5
            y:height/2
            color: "blue"
            text: scoreValue.toLocaleString();
            font.family: "Segoe Script"
            font.bold: true
        }
        Text {
            id: txtNumberofPractice
            font.pointSize: 30
            x:parent.width*4/5 +width
            y:height/2
            color: "yellow"
            text: set_goal.toLocaleString();
            font.family: "Segoe Script"
            font.bold: true
        }

        Rectangle {
            id: keyboard1
            x: parent.width*4/16
            y: parent.height*1/32
            width: parent.width*1/4
            height: parent.height*1/16
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state: "state1Off"

            MouseArea {
                id: mousekeyboard1
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandUp.png";
                    parent.color="#bdd7ee"; // hover color is light blue

                    training_02.position=1;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state1On"
                    PropertyChanges { target: keyboard1; color: "blue"}
                },
                State {
                    name: "state1Off"
                    PropertyChanges { target: keyboard1; color: "white"}
                },
                State {
                    name: "state1Selected"
                }
            ]

            /* blinking when target is selected */
            transitions: [
                Transition {
                    from: "state1On"
                    to: "state1Selected"
                    SequentialAnimation{
                        loops: 3
                        ColorAnimation {
                            from: "white"
                            to: "red"
                            duration: 200
                        }
                        ColorAnimation {
                            from: "red"
                            to: "white"
                            duration: 200
                        }
                    }
                }
            ]
        }

        Rectangle{
            id: keyboard2
            x: parent.width*3/16
            y: parent.height*5/32
            width: parent.width*1/4
            height: parent.height*1/16
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state : "state2Off"

            MouseArea {
                id: mousekeyboard2
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandUp.png";
                    parent.color="#bdd7ee";
                    training_02.position=1;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state2On"    //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard2; color: "blue"}
                },
                State {
                    name: "state2Off"
                    PropertyChanges { target: keyboard2; color: "white"}
                },
                State {
                    name: "state2Selected"
                }
            ]

            /* blinking when target is selected */
            transitions: [
                Transition {
                    from: "state2Off"
                    to: "state2Selected"
                    SequentialAnimation{
                        loops: 3
                        ColorAnimation {
                            from: "white"
                            to: "red"
                            duration: 200
                        }
                        ColorAnimation {
                            from: "red"
                            to: "white"
                            duration: 200
                        }
                    }
                }
            ]
        }

        Rectangle{
            id: keyboard3
            x: parent.width*2/16
            y: parent.height*9/32
            width: parent.width*1/4
            height: parent.height*1/16
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state : "state3Off"

            MouseArea {
                id: mousekeyboard3
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandUp.png";
                    parent.color="#bdd7ee";
                    training_02.position=1;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state3On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard3; color: "blue"}
                },
                State {
                    name: "state3Off"
                    PropertyChanges { target: keyboard3; color: "white"}
                },
                State {
                    name: "state3Selected"
                }
            ]

            /* blinking when target is selected */
            transitions: [
                Transition {
                    from: "state3Off"
                    to: "state3Selected"
                    SequentialAnimation{
                        loops: 3
                        ColorAnimation {
                            from: "white"
                            to: "red"
                            duration: 200
                        }
                        ColorAnimation {
                            from: "red"
                            to: "white"
                            duration: 200
                        }
                    }
                }
            ]
        }

        Rectangle{
            id: keyboard4
            x: parent.width*1/16
            y: parent.height*13/32
            width: parent.width*1/4
            height: parent.height*1/16
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state: "state4Off"

            MouseArea {
                id: mousekeyboard4
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandNeutral.png";
                    parent.color="#bdd7ee";
                    //training_02=0;
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state4On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard4; color: "blue"}
                },
                State {
                    name: "state4Off"
                    PropertyChanges { target: keyboard4; color: "white"}
                },
                State {
                    name: "state4Selected"
                }
            ]

            /* blinking when target is selected */
            transitions: [
                Transition {
                    from: "state4Off"
                    to: "state4Selected"
                    SequentialAnimation{
                        loops: 3
                        ColorAnimation {
                            from: "white"
                            to: "red"
                            duration: 200
                        }
                        ColorAnimation {
                            from: "red"
                            to: "white"
                            duration: 200
                        }
                    }
                }
            ]
        }

        Rectangle{
            id: keyboard5
            x: parent.width*1/16
            y: parent.height*17/32
            width: parent.width*1/4
            height: parent.height*1/16
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state: "state5Off"

            MouseArea {
                id: mousekeyboard5
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandNeutral.png";
                    parent.color="#bdd7ee";
                    //training_02=0;
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state5On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard5; color: "blue"}
                },
                State {
                    name: "state5Off"
                    PropertyChanges { target: keyboard5; color: "white"}
                },
                State {
                    name: "state5Selected"
                }
            ]

            /* blinking when target is selected */
            transitions: [
                Transition {
                    from: "state5Off"
                    to: "state5Selected"
                    SequentialAnimation{
                        loops: 3
                        ColorAnimation {
                            from: "white"
                            to: "red"
                            duration: 200
                        }
                        ColorAnimation {
                            from: "red"
                            to: "white"
                            duration: 200
                        }
                    }
                }
            ]
        }

        Rectangle{
            id: keyboard6
            x: parent.width*2/16
            y: parent.height*21/32
            width: parent.width*1/4
            height: parent.height*1/16
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state: "state6Off"

            MouseArea {
                id: mousekeyboard6
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandDown.png";
                    parent.color="#bdd7ee";
                    training_02.position=2;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state6On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard6; color: "blue"}
                },
                State {
                    name: "state6Off"
                    PropertyChanges { target: keyboard6; color: "white"}
                },
                State {
                    name: "state6Selected"
                }
            ]

            /* blinking when target is selected */
            transitions: [
                Transition {
                    from: "state6Off"
                    to: "state6Selected"
                    SequentialAnimation{
                        loops: 3
                        ColorAnimation {
                            from: "white"
                            to: "red"
                            duration: 200
                        }
                        ColorAnimation {
                            from: "red"
                            to: "white"
                            duration: 200
                        }
                    }
                }
            ]
        }

        Rectangle{
            id: keyboard7
            x: parent.width*3/16
            y: parent.height*25/32
            width: parent.width*1/4
            height: parent.height*1/16
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            state:"state7Off"

            MouseArea {
                id: mousekeyboard7
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandDown.png";
                    parent.color="#bdd7ee";
                    training_02.position=2;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state7On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard7; color: "blue"}
                },
                State {
                    name: "state7Off"
                    PropertyChanges { target: keyboard7; color: "white"}
                },
                State {
                    name: "state7Selected"
                }
            ]

            /* blinking when target is selected */
            transitions: [
                Transition {
                    from: "state7Off"
                    to: "state7Selected"
                    SequentialAnimation{
                        loops: 3
                        ColorAnimation {
                            from: "white"
                            to: "red"
                            duration: 200
                        }
                        ColorAnimation {
                            from: "red"
                            to: "white"
                            duration: 200
                        }
                    }
                }
            ]
        }

        Rectangle{
            id: keyboard8
            x: parent.width*4/16
            y: parent.height*29/32
            width: parent.width*1/4
            height: parent.height*1/16
            color: "#ffffff"
            radius: 10
            border.width: 3
            opacity: 1
            transformOrigin: Item.Center

            MouseArea {
                id: mousekeyboard8
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandDown.png";
                    parent.color="#bdd7ee";
                    training_02.position=2;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state8On"
                    PropertyChanges { target: keyboard8; color: "blue"}
                },
                State {
                    name: "state8Off"
                    PropertyChanges { target: keyboard8; color: "white"}
                },
                State {
                    name: "state8Selected"
                }
            ]

            /* blinking when target is selected */
            transitions: [
                Transition {
                    from: "state8On"
                    to: "state8Selected"
                    SequentialAnimation{
                        loops: 3
                        ColorAnimation {
                            from: "white"
                            to: "red"
                            duration: 200
                        }
                        ColorAnimation {
                            from: "red"
                            to: "white"
                            duration: 200
                        }
                    }
                }
            ]
        }

        Image {
            id: imgHand
            x: parent.width- width
            y: parent.height/3
            visible: true
            source: "Image/Training_HandNeutral.png"
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
                    trainingPageLoader.source="TrainingHandler.qml";
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

    property int scoreValue: 0
//    property variant keyboard1Status: ["state1On", "state1Off", "state1Off", "state1Off", "state1Off", "state1Off", "state1Off", "state1Off"]
//    property variant keyboard2Status: ["state2Off", "state2On", "state2Off", "state2Off", "state2Off", "state2Off", "state2Off", "state2Off"]
//    property variant keyboard3Status: ["state3Off", "state3Off", "state3On", "state3Off", "state3Off", "state3Off", "state3Off", "state3Off"]
//    property variant keyboard4Status: ["state4Off", "state4Off", "state4Off", "state4On", "state4Off", "state4Off", "state4Off", "state4Off"]
//    property variant keyboard5Status: ["state5Off", "state5Off", "state5Off", "state5Off", "state5On", "state5Off", "state5Off", "state5Off"]
//    property variant keyboard6Status: ["state6Off", "state6Off", "state6Off", "state6Off", "state6Off", "state6On", "state6Off", "state6Off"]
//    property variant keyboard7Status: ["state7Off", "state7Off", "state7Off", "state7Off", "state7Off", "state7Off", "state7On", "state7Off"]
//    property variant keyboard8Status: ["state8Off", "state8Off", "state8Off", "state8Off", "state8Off", "state8Off", "state8Off", "state8On"]

    Timer {
    interval: 100; running: visibleTrainingPage; repeat: true


    onTriggered:
    {
        // number of Practice is defined by doctor
        if(numberOfPractice >= 0)
        {
            txtNumberofPractice.text = numberOfPractice.toString()
            // direction from top to bottom
            if(keyDirection == 1)
            {
                if(orderNumber == -3)
                {
                    keyboard4.state = "state4On"
                    keyboard5.state = "state5On"
                }
                if(orderNumber == -2)
                {
                    keyboard4.state = "state4Off"
                    keyboard5.state = "state5Off"

                    keyboard3.state = "state3On"
                }
                if(orderNumber == -1)
                {
                    keyboard3.state = "state3Off"
                    keyboard2.state = "state2On"
                }
                if(orderNumber == 0)
                {
                    keyboard2.state = "state2Off"
                    keyboard1.state = "state1On"
                }
                if(orderNumber == 1)
                {
                    keyboard1.state = "state1Off"
                    keyboard2.state = "state2On"
                }
                if(orderNumber == 2)
                {
                    keyboard2.state = "state2Off"
                    keyboard3.state = "state3On"
                }
                if(orderNumber == 3)
                {
                    keyboard3.state = "state3Off"
                    keyboard4.state = "state4On"
                }
                if(orderNumber == 4)
                {
                    keyboard4.state = "state4Off"
                    keyboard5.state = "state5On"
                }
                if(orderNumber == 5)
                {
                    keyboard5.state = "state5Off"
                    keyboard6.state = "state6On"
                }
                if(orderNumber == 6)
                {
                    keyboard6.state = "state6Off"
                    keyboard7.state = "state7On"
                }
                if(orderNumber == 7)
                {
                    keyboard7.state = "state7Off"
                    keyboard8.state = "state8On"
                    keyDirection = -1
                }
                orderNumber = orderNumber + 1
                scoreValue = scoreValue + 1

            }

            // direction from bottom to top
            else
            {
                if(orderNumber == 8)
                {
                    keyboard8.state = "state8On"
                }
                if(orderNumber == 7)
                {
                    keyboard8.state = "state8Off"
                    keyboard7.state = "state7On"
                }
                if(orderNumber == 6)
                {
                    keyboard7.state = "state7Off"
                    keyboard6.state = "state6On"
                }
                if(orderNumber == 5)
                {
                    keyboard6.state = "state6Off"
                    keyboard5.state = "state5On"
                }
                if(orderNumber == 4)
                {
                    keyboard5.state = "state5Off"
                    keyboard4.state = "state4On"
                }
                if(orderNumber == 3)
                {
                    keyboard4.state = "state4Off"
                    keyboard3.state = "state3On"
                }
                if(orderNumber == 2)
                {
                    keyboard3.state = "state3Off"
                    keyboard2.state = "state2On"
                }
                if(orderNumber == 1)
                {
                    keyboard2.state = "state2Off"
                    keyboard1.state = "state1On"
                    keyDirection = 1
                    numberOfPractice = numberOfPractice -1
                }

                orderNumber = orderNumber - 1
                scoreValue = scoreValue + 1
            }


        }
        // stop timer when number of Practice is over
        else
        {   
            txtintervalTiming.text = "TimeOut"
            Timer.running = false
            visibleTrainingPage = false
            calculateScore();
            visibleEndPage = true
        }
    }
    }
    Text {id: txtintervalTiming; x:30;y:0}
    Text {id: txtStatus; x:30; y:20}

    /* Score */
    function calculateScore()
    {
        scoreValue = scoreValue*100;

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














