import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    anchors.fill: parent
    property bool status_exersice1: true
    property bool status_exersice2: true
    property bool status_exersice3: true
    property bool status_color1: false
    property bool status_color2: false
    property bool status_color3: false
    property bool mouse_active1: false
    property bool mouse_active2: false
    property bool mouse_active3: false

    function check_state(){
        if(mainHandlerForm.train_exer1){
            status_exersice1=true;
            status_color1=true;
            mouse_active1=true
            //trainingHandlerForm.state="activeState1"
        }
        if(mainHandlerForm.train_exer2){
            status_exersice2=true;
            status_color2=true;
            mouse_active2=true
            status_exersice1=true;
            status_color1=true;
            //trainingHandlerForm.state="activeState2";

        }
        if(mainHandlerForm.train_exer3){
            status_exersice2=false;
            status_color2=true;

            status_exersice1=true;
            status_color1=true;

            status_exersice3=true;
            status_color3=true;
            mouse_active3=true;
            //trainingHandlerForm.state="activeState3"
        }
        else{
            trainingPageLoader.source="ResultMenu.qml"
        }
    }



    /**********************************
      ****** TRAINING MENU *********
     **********************************/
    Rectangle{
        anchors.fill: parent

        // BACKGROUND
        Image{
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Image/TrainingH_background.jpg"
        }

    Column {
        anchors.fill: parent
        // header margin
        Rectangle{
            width: parent.width
            height: parent.height/7
            color: "transparent"

            Rectangle
            {
                width:10
                height: parent.height

                anchors.left: parent.left
                anchors.leftMargin: parent.width*15/100
                color: "steelblue"
            }
        }

        /**********************************
          ******** SPEED TRAINING ******
        ***********************************/
        Rectangle {
            Component.onCompleted:{
                check_state();
            }

            id: exerciseOption2
            width: parent.width
            height: parent.height* 2/ 7
            color: "transparent"

            Rectangle
            {
                id: colRec1
                width:10
                height: parent.height

                anchors.left: parent.left
                anchors.leftMargin: parent.width*15/100
                color: "steelblue"
            }
            Image {
                id: imgPractice2
                source: "Image/TrainingH_lock.png"
                height: 128
                width: 128

                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: colRec1.horizontalCenter

            }

            ColorOverlay {
                id:colOverlay2
                anchors.fill: imgPractice2
                source: imgPractice2
                visible: status_exersice2
                color: "transparent"  // make image like it lays under red glass
                SequentialAnimation on color{
                    running:status_color2
                    ColorAnimation { to: "yellow"; duration: 500 }
                    ColorAnimation { to: "blue"; duration: 500 }
                    PropertyAction { target: imgPractice2; property: "source"; value: "/Image/TrainingH_speed.png" }
                    ColorAnimation { to: "transparent"; duration: 1000 }
                    PropertyAction { target: txtExe2; property: "text"; value: "BÀI TẬP TỐC ĐỘ"}
//                    PropertyAction { target: exerciseOption2; property: "color"; value:status_exersice2?"#ffe699":"white"}
                    }

            }

            /* TRAINING INFORMATION - FAST */
            Rectangle{
                width: parent.width
                height: parent.height
                color: "transparent"
                anchors.left: imgPractice2.right
                anchors.leftMargin: parent.width/15

                Text {
                    id: txtExe2
                    text: ""
                    font.pixelSize: 32
                    font.family: "Tamoha"
                    color: "#07335a"
                    anchors.left: parent.left
                    anchors.top:parent.top
                    anchors.topMargin: parent.height/5
                }
                Row{
                    anchors.left:parent.left
                    anchors.top: txtExe2.bottom
                    anchors.topMargin: parent.height/15


                    // STAR
                    Image{
                        width:  79*70/100   // 70% of original
                        height: 77*70/100
                        source: "Image/TrainingH_star.png"
                        visible: false
                    }
                    Image{
                        width:  79*70/100   // 70% of original
                        height: 77*70/100
                        source: "Image/TrainingH_star.png"
                        visible: false
                    }
                    Image{
                        width:  79*70/100   // 70% of original
                        height: 77*70/100
                        source: "Image/TrainingH_star.png"
                        visible: false
                    }
                }
            }

            MouseArea {
                enabled: mouse_active2
                id: mouseExe2
                anchors.fill: parent
                hoverEnabled: true
                onPressed: trainingPageLoader.source="Training_03.qml"
            }

        }

        /**********************************
          ****** STRENGTH TRAINING ******
        ***********************************/
        Rectangle {
            Component.onCompleted:{
                check_state();
            }
            id: exerciseOption1
            width: parent.width
            height: parent.height* 2/ 7
            color: "transparent"

            Rectangle
            {
                id: colRec2
                width:10
                height: parent.height

                anchors.left: parent.left
                anchors.leftMargin: parent.width*15/100
                color: "steelblue"
            }

            Image {
                id: imgPractice1
                source: "Image/TrainingH_lock.png"
                height: 128
                width: 128

                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: colRec2.horizontalCenter

            }

            ColorOverlay {
                id:colOverlay1
                anchors.fill: imgPractice1
                source: imgPractice1
                visible:status_exersice1
                color: "transparent"  // make image like it lays under red glass
                SequentialAnimation on color{
                    running:status_color1
                    ColorAnimation { to: "red"; duration: 500 }
                    PropertyAction { target: imgPractice1; property: "source"; value: "Image/TrainingH_strength.png" }
                    ColorAnimation { to: "transparent"; duration: 1000 }
                    PropertyAction { target: txtExe1; property: "text"; value: "BÀI TẬP SỨC MẠNH"}
//                    PropertyAction { target: exerciseOption1; property: "color"; value:status_exersice1?"#ffe699":"white"}
                }

            }

            /* TRAINING INFORMATION - STRENGTH */
            Rectangle{
                width: parent.width
                height: parent.height
                color: "transparent"
                anchors.left: imgPractice1.right
                anchors.leftMargin: parent.width/15

                Text {
                    id: txtExe1
                    text: ""
                    font.pixelSize: 32
                    font.family: "Tamoha"
                    color: "#07335a"
                    anchors.left: parent.left
                    anchors.top:parent.top
                    anchors.topMargin: parent.height/5
                }
                Row{
                    anchors.left:parent.left
                    anchors.top: txtExe1.bottom
                    anchors.topMargin: parent.height/15


                    // STAR
                    Image{
                        width:  79*70/100   // 70% of original
                        height: 77*70/100
                        source: "Image/TrainingH_star.png"
                        visible: visibleStar1_Pr2
                    }
                    Image{
                        width:  79*70/100   // 70% of original
                        height: 77*70/100
                        source: "Image/TrainingH_star.png"
                        visible: visibleStar2_Pr2
                    }
                    Image{
                        width:  79*70/100   // 70% of original
                        height: 77*70/100
                        source: "Image/TrainingH_star.png"
                        visible: visibleStar3_Pr2
                    }
                }
            }

            MouseArea {
                enabled: mouse_active1
                id: mouseExe1
                anchors.fill: parent
                hoverEnabled: true
                onPressed: trainingPageLoader.source="Training_02.qml"
            }
        }

        /**********************************
          ******** WARMUP TRAINING ******
        ***********************************/
        Rectangle {
            Component.onCompleted:{
                check_state();
            }
            id: exerciseOption3
            width: parent.width
            height: parent.height* 2/ 7
            color: "transparent"


            Rectangle
            {
                id: colRec3
                width:10
                height: parent.height

                anchors.left: parent.left
                anchors.leftMargin: parent.width*15/100
                color: "steelblue"
            }

            Image {
                id: imgPractice3
                source: "Image/TrainingH_lock.png"
                height: 128
                width: 128

                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: colRec3.horizontalCenter
            }

            ColorOverlay {
                id:colOverlay3
                anchors.fill: imgPractice3
                source: imgPractice3
                visible: true
                color: "transparent"  // make image like it lays under red glass
                SequentialAnimation on color{
                    running:true
                    ColorAnimation { to: "yellow"; duration: 500 }
                    PropertyAction { target: imgPractice3; property: "source"; value: "/Image/TrainingH_gist.png" }
                    ColorAnimation { to: "transparent"; duration: 1000 }
                    PropertyAction { target: txtExe3; property: "text"; value: "BÀI TẬP KHỞI ĐỘNG"}
                    PropertyAction { target: exerciseOption3; property: "color"; value: "white"}
//                    PropertyAction { target: exerciseOption3; property: "opacity"; value: 0.5}
                    }
            }

            /* TRAINING INFORMATION - WARMUP */
            Rectangle{
                width: parent.width
                height: parent.height
                color: "transparent"
                anchors.left: imgPractice3.right
                anchors.leftMargin: parent.width/15

                Text {
                    id: txtExe3
                    text: ""
                    font.pixelSize: 32
                    font.family: "Tamoha"
                    color: "#07335a"
                    anchors.left: parent.left
                    anchors.top:parent.top
                    anchors.topMargin: parent.height/5
                }

                // STAR
                Row{
                    anchors.left:parent.left
                    anchors.top: txtExe3.bottom
                    anchors.topMargin: parent.height/15

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
            }

            MouseArea {
                enabled: true
                id: mouseExe3
                anchors.fill: parent
                hoverEnabled: true
                onPressed: trainingPageLoader.source="Training_01.qml"
            }
        }



         /*
          * STATE MANAGEMENT
          */

        states: [
            State {
                name: "lockedAll"
                PropertyChanges{target:exerciseOption2;color:"white"}
                PropertyChanges{target:exerciseOption3;color:"white"}
                PropertyChanges{target:exerciseOption2;color:"white"}


            },
            State{
                name: "activeState1"
                PropertyChanges{target:exerciseOption2;color:"white"}
                PropertyChanges{target:exerciseOption3;color:"white"}

            },
            State{
                name: "activeState2"
                PropertyChanges{target:exerciseOption3;color:"white"}
                PropertyChanges{target:exerciseOption1;color:"white"}
            },
            State{
                name: "activeState3"
                PropertyChanges{target:exerciseOption3;color:"white"}
                PropertyChanges{target:exerciseOption1;color:"white"}
            },
            State{
                name: "activeAll"
            }
        ]
    }

    }

    /*
     * BACK BUTTON
     */
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
                trainingPageLoader.source="MainMenu.qml";
            }
        }
    }

    Loader
    {
        id:trainingPageLoader
        anchors.fill:parent
        focus: true
    }
}
