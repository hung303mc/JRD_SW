/*
 * STRENGTH TRAINING
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
                color: "#fecda9"
                z: 1
                Image{
                    source: "Image/TrainingH_strength.png"

                    anchors.horizontalCenter:parent.horizontalCenter
                    anchors.top: parent.verticalCenter
                    verticalAlignment: Image.AlignTop

                    }
            }

            // Lower layer
            Rectangle{
                width: parent.width
                height: parent.height*2/3
                color: "#feb986"

                Text {
                    text: "<b>STRENGTH</b> TRAINING"
                    font.pixelSize: 50
                    font.family: "Tamoha"
                    color: "#d01818"

                    anchors.horizontalCenter:parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    y: parent.height*10/100 // 10% distance


                }

                Image{
                    width:  492*60/100  // 60% of original
                    height: 152*60/100
                    source: "Image/Training_btn_Strength.png"

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
            Rectangle{
                width: parent.width
                height: parent.height*1/3
                color: "#fecda9"
                Image{
                    source: "Image/TrainingH_strength.png"

                    anchors.horizontalCenter:parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Image.AlignHCenter

                    }
            }
            Rectangle{
                width: parent.width
                height: parent.height*2/3
                color: "#feb986"

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
                    text: "8000"
                    font.pixelSize: 50
                    font.family: "Tamoha"
                    color: "#d01818"

                    anchors.horizontalCenter:parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    y: parent.height*10/100 // 10% distance
                }

                // CONGRATULATION
                Text {
                    text: ""//validateFunc()
                    font.pixelSize: 50
                    font.family: "Tamoha"
                    color: "#d01818"

                    anchors.horizontalCenter:parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    y: parent.height*30/100 // 30% distance
                }

                SpriteSequence {
                        id: test
                        width: 492 *60/100
                        height: 152 *60/100
                        interpolate: true

                        anchors.horizontalCenter:parent.horizontalCenter
                        y: parent.height*50/100 // 50% distance

                    Sprite {
                        name: "left"
                        source: "Image/EndPage_btn_Strength.png"
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

    // BACKGROUND
    Rectangle {
        anchors.fill: parent
        id: bgr_img
        visible: visibleTrainingPage
        color: "#ffd8ba"

        // NUMBER OF PRACTICE
        Rectangle{
            width: 128*70*2/100
            height:128*70/100
            LinearGradient {
                anchors.fill: parent
                start: Qt.point(parent.width, 0)
                end: Qt.point(0, 0)
                gradient: Gradient {
                          GradientStop { position: 1.0; color: "#ffd8ba" }
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
                source: "Image/TrainingH_strength.png"
                width: 128 *70/100
                height: 128*70/100
                verticalAlignment: Image.AlignVCenter
            }
            Text {
                id: txtNumberofPractice
                width: 128 *70/100
                height: 128*70/100
                font.pointSize: 30
                color: "#cf1818"
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

            state: "state1Off"

            MouseArea {
                id: mousekeyboard1
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandUp.png";
                    parent.color="#ffbb92"; // hover color is light blue

                    training_02.position=1;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state1On"
                    PropertyChanges { target: keyboard1; color: "#ff735c"}
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

            state : "state2Off"

            MouseArea {
                id: mousekeyboard2
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandUp.png";
                    parent.color="#ffbb92";
                    training_02.position=1;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state2On"    //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard2; color: "#ff735c"}
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

            state : "state3Off"

            MouseArea {
                id: mousekeyboard3
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandUp.png";
                    parent.color="#ffbb92";
                    training_02.position=1;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state3On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard3; color: "#ff735c"}
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

            state: "state4Off"

            MouseArea {
                id: mousekeyboard4
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandNeutral.png";
                    parent.color="#ffbb92";
                    //training_02=0;
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state4On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard4; color: "#ff735c"}
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

            state: "state5Off"

            MouseArea {
                id: mousekeyboard5
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandNeutral.png";
                    parent.color="#ffbb92";
                    //training_02=0;
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state5On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard5; color: "#ff735c"}
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

            state: "state6Off"

            MouseArea {
                id: mousekeyboard6
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandDown.png";
                    parent.color="#ffbb92";
                    training_02.position=2;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state6On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard6; color: "#ff735c"}
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

            state:"state7Off"

            MouseArea {
                id: mousekeyboard7
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandDown.png";
                    parent.color="#ffbb92";
                    training_02.position=2;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state7On" //reserved for keyboard2 - 7
                    PropertyChanges { target: keyboard7; color: "#ff735c"}
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

            MouseArea {
                id: mousekeyboard8
                anchors.fill:parent
                hoverEnabled: true
                onEntered:
                {
                    imgHand.source="Image/Training_HandDown.png";
                    parent.color="#ffbb92";
                    training_02.position=2;
                    check_status();
                }
                onExited: parent.color="white"
            }

            //State
            states: [
                State {
                    name: "state8On"
                    PropertyChanges { target: keyboard8; color: "#ff735c"}
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
            visible: true
            source: "Image/Training_HandNeutral.png"

            y: parent.height/3
            anchors.right: parent.right
            anchors.rightMargin: parent.width/6
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
                    backButton.source = "Image/back_button_onclick.png";
                    console.log("Back");
                    trainingPageLoader.source="TrainingMenu.qml";
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


    property int numberOfPractice: 1   // number of practice - defined by doctor
    property int intervalTiming:5       // interval to reach the target
    property int timeInit: 5            // default value of timing

    property int scoreValue: 0

    Timer {
    interval: 200; running: visibleTrainingPage; repeat: true

    onTriggered:
    {
        // number of Practice is defined by doctor
        if(numberOfPractice >= 0)
        {
            // using odd and even number to generate target
            // even: target 1 is generated
            // odd: target 8 is generated
            txtNumberofPractice.text = numberOfPractice.toString()
            if((numberOfPractice&1) == 0)
            {
                //get the latest position if it different with target 1
                if(intervalTiming == 0){
                    /* check which keyboard is selected */
                    if(mousekeyboard2.containsMouse == true)
                    {
                        keyboard2.state = "state2Selected"
                        txtStatus.text = "state 2 is selected"
                    }
                    if(mousekeyboard3.containsMouse == true)
                    {
                        keyboard3.state = "state3Selected"
                        txtStatus.text = "state 3 is selected"
                    }
                    if(mousekeyboard4.containsMouse == true)
                    {
                        keyboard4.state = "state4Selected"
                        txtStatus.text = "state 4 is selected"
                    }
                    if(mousekeyboard5.containsMouse == true)
                    {
                        keyboard5.state = "state5Selected"
                        txtStatus.text = "state 5 is selected"
                    }
                    if(mousekeyboard6.containsMouse == true)
                    {
                        keyboard6.state = "state6Selected"
                        txtStatus.text = "state 6 is selected"
                    }
                    if(mousekeyboard7.containsMouse == true)
                    {
                        keyboard7.state = "state7Selected"
                        txtStatus.text = "state 7 is selected"
                    }
                    if(mousekeyboard7.containsMouse == true)
                    {
                        keyboard8.state = "state8Selected"
                        txtStatus.text = "state 8 is selected"
                    }

                    scoreValiadate(); // calculate score
                    txtintervalTiming.text = "TimeOutKeyboard1"
                    keyboard1.state = "state1Off"
                    numberOfPractice = numberOfPractice -1
                    intervalTiming = timeInit
                }
                else{
                    txtintervalTiming.text = intervalTiming.toString()
                    intervalTiming = intervalTiming -1
                    keyboard1.state = "state1On"
                    if(mousekeyboard1.containsMouse == true)
                    {
                        keyboard1.state = "state1Selected"
                    }
                }
            }

            // using odd and even number to generate target
            // even: target 1 is generated
            // odd: target 8 is generated
            else
            {
                    if(intervalTiming == 0)
                    {
                        /* check which keyboard is selected */
                        if(mousekeyboard1.containsMouse == true)
                        {
                            keyboard1.state = "state1Selected"
                            txtStatus.text = "state 1 is selected"
                        }
                        if(mousekeyboard2.containsMouse == true)
                        {
                            keyboard2.state = "state2Selected"
                            txtStatus.text = "state 2 is selected"
                        }
                        if(mousekeyboard3.containsMouse == true)
                        {
                            keyboard3.state = "state3Selected"
                            txtStatus.text = "state 3 is selected"
                        }
                        if(mousekeyboard4.containsMouse == true)
                        {
                            keyboard4.state = "state4Selected"
                            txtStatus.text = "state 4 is selected"
                        }
                        if(mousekeyboard5.containsMouse == true)
                        {
                            keyboard5.state = "state5Selected"
                            txtStatus.text = "state 5 is selected"
                        }
                        if(mousekeyboard6.containsMouse == true)
                        {
                            keyboard6.state = "state6Selected"
                            txtStatus.text = "state 6 is selected"
                        }
                        if(mousekeyboard7.containsMouse == true)
                        {
                            keyboard7.state = "state7Selected"
                            txtStatus.text = "state 7 is selected"
                        }

                        txtintervalTiming.text = "TimeOutKeyboard8"
                        keyboard8.state = "state8Off"
                        numberOfPractice = numberOfPractice -1
                        intervalTiming = timeInit
                    }
                    else
                    {
                        txtintervalTiming.text = intervalTiming.toString()
                        intervalTiming = intervalTiming -1
                        keyboard8.state = "state8On"
                        if(mousekeyboard8.containsMouse == true)
                        {
                            keyboard8.state = "state8Selected"
                        }
                    }
            }

        }
        // stop timer when number of Practice is over
        else
        {
            txtintervalTiming.text = "TimeOut"
            Timer.running = false
            visibleTrainingPage = false
            visibleEndPage = true

        }
    }
    }
    Text {id: txtintervalTiming; x:30;y:0}
    Text {id: txtStatus; x:30; y:20}

    /* Score */
    function scoreValiadate()
    {
        scoreValue = scoreValue*100;

    }


    function validateFunc()
    {
        Text =  "HELLO"
        return Text
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














