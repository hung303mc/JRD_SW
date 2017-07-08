import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id:appWindow
    visible: true
    width: 1024
    height: 600
    title: qsTr("JRD Software")

    MainHandler{
        anchors.fill: parent
    }
}
