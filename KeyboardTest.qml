import QtQuick 2.7

Item{
    id:keytest


    Rectangle {
    width: 800; height: 640
    color: "grey"

    Rectangle {
        id: square
        width: 20; height: 20
        x: 100; y: 100
        color: "green"
            focus: true



    Keys.onLeftPressed: square.x -= 8
    Keys.onRightPressed: square.x += 8
    Keys.onUpPressed: square.y -= 8
    Keys.onDownPressed: square.y += 8
    Keys.onPressed: {
        switch(event.key) {
            case Qt.Key_Plus:
                square.scale += 0.2
                break;
            case Qt.Key_Minus:
                square.scale -= 0.2
                break;
        }
    }
    }

}
}
