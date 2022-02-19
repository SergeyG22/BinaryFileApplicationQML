import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2

Window {
    id:window

    property int width_standart: 600
    property int height_standart: 420

    visible: true
    width: 600
    height: 420
    title: qsTr("BinaryFileApplicationQML")
    color: "#78e70c"

    ColumnLayout {
        id: columnLayout

        property int width_standart: 135
        property int height_standart: 188
        property int pos_x_standart: 422
        property int pos_y_standart: 135

        x: parent.width / (window.width_standart / pos_x_standart)
        y: parent.height / (window.height_standart / pos_y_standart)
        width: parent.width / (window.width_standart / columnLayout.width_standart)
        height: parent.height / (window.height_standart / columnLayout.height_standart)
        spacing: 10

        Button {
            id: topButtonFileDialog
            text: qsTr("Browse")
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.pixelSize: 0.1 * parent.height   //scale_factor * parent.height

            contentItem: Text {
                    text: topButtonFileDialog.text
                    font: topButtonFileDialog.font
                    opacity: enabled ? 1.0 : 0.3
                    color: topButtonFileDialog.hovered ? "#ffffff" : "#b9b9b9"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight

                }

                background: Rectangle {
                    color: "#32162d"
                    opacity: enabled ? 1 : 0.3
                    border.color: topButtonFileDialog.hovered ? "#ffffff" : "#b9b9b9"
                    border.width: 1
                    radius: 10
                }

                onClicked: {
                      topFileDialog.open();
                }
        }

        Button {
            id: bottomButtonFileDialog
            text: qsTr("Browse")
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.pixelSize: 0.1 * parent.height

            contentItem: Text {
                    text: bottomButtonFileDialog.text
                    font: bottomButtonFileDialog.font
                    opacity: enabled ? 1.0 : 0.3
                    color: bottomButtonFileDialog.hovered ? "#ffffff" : "#b9b9b9"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    color: "#32162d"
                    opacity: enabled ? 1 : 0.3
                    border.color: bottomButtonFileDialog.hovered ? "#ffffff" : "#b9b9b9"
                    border.width: 1
                    radius: 10
                }

                onClicked: {
                    bottomFileDialog.open()
                }

        }

        Button {
            id: searchButton
            text: qsTr("Search")
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.pixelSize: 0.1 * parent.height

            contentItem: Text {
                    text: searchButton.text
                    font: searchButton.font
                    opacity: enabled ? 1.0 : 0.3
                    color: searchButton.hovered ? "#ffffff" : "#b9b9b9"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    color: "#32162d"
                    opacity: enabled ? 1 : 0.3
                    border.color: searchButton.hovered ? "#ffffff" : "#b9b9b9"
                    border.width: 1
                    radius: 10
                }
                onClicked: {

                    if(listmodel.count > 0){
                        listmodel.clear();
                    }

                    var getBackend = backend.binaryFindOperation(topEditbox.text,bottomEditbox.text);
                    for (var index in getBackend) {
                          listmodel.append({"index": index,"name":getBackend[index] });
                        }
                }
        }

        Button {
            id: buttonClearOutputWindow
            text: qsTr("Clear")
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.pixelSize: 0.1 * parent.height

            contentItem: Text {
                    text: buttonClearOutputWindow.text
                    font: buttonClearOutputWindow.font
                    opacity: enabled ? 1.0 : 0.3
                    color: buttonClearOutputWindow.hovered ? "#ffffff" : "#b9b9b9"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    color: "#32162d"
                    opacity: enabled ? 1 : 0.3
                    border.color: buttonClearOutputWindow.hovered ? "#ffffff" : "#b9b9b9"
                    border.width: 1
                    radius: 10
                }

             onClicked: {
                 listmodel.clear();
             }

        }

    }

    ColumnLayout {
        id: columnLayout1

        property int width_standart: 110
        property int height_standart: 60
        property int pos_x_standart: 422
        property int pos_y_standart: 35

        x: parent.width / (window.width_standart / columnLayout1.pos_x_standart)
        y: parent.height / (window.height_standart / columnLayout1.pos_y_standart)
        width: parent.width / (window.width_standart / columnLayout1.width_standart)
        height: parent.height / (window.height_standart / columnLayout1.height_standart)

        Text {
            id: topLabel
            text: qsTr("Directory A")
            font.pixelSize: 3 * 0.1 * parent.height
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Text {
            id: bottomLabel
            text: qsTr("Directory B")
            font.pixelSize: 3 * 0.1 * parent.height
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    ColumnLayout {
        id: columnLayout2

        property int width_standart: 355
        property int height_standart: 70
        property int pos_x_standart: 29
        property int pos_y_standart: 25

        x: parent.width / (window.width_standart / columnLayout2.pos_x_standart)
        y: parent.height / (window.height_standart / columnLayout2.pos_y_standart)
        width: parent.width / (window.width_standart / columnLayout2.width_standart)
        height: parent.height / (window.height_standart / columnLayout2.height_standart)

        TextField {
            id: topEditbox
            font.pixelSize: 2 * 0.1 * parent.height
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "white"
            background: Rectangle {
                radius: 10
                color: topEditbox.hovered ? "#393b3a" : "#32162d"
            }
        }

        TextField {
            id: bottomEditbox
            font.pixelSize: 2 * 0.1 * parent.height
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "white"
            background: Rectangle {
                color: bottomEditbox.hovered ? "#393b3a" : "#32162d"
                radius: 10
            }
        }
    }

    Rectangle {
        id: outputWindow

        property int width_standart: 355
        property int height_standart: 240
        property int pos_x_standart: 30
        property int pos_y_standart: 110

        x: parent.width / (window.width_standart / outputWindow.pos_x_standart)
        y: parent.height / (window.height_standart / outputWindow.pos_y_standart)
        width: parent.width / (window.width_standart / outputWindow.width_standart)
        height:parent.height /(window.height_standart / outputWindow.height_standart)
        border.color: "black"
        color: "#32162d"

        ListModel {
            id: listmodel
        }

        Component {
            id: listDelegate
            Text {
                text: model.name
                font.pixelSize: 0.05 * window.height
                color: "#ffffff"
            }
        }

        ListView {
            anchors.fill: parent
            model:listmodel
            delegate: listDelegate
            clip:true
        }
    }

    FileDialog {
                id: topFileDialog
                title: "Open file dialog"
                folder: shortcuts.home
                selectFolder: true
                onAccepted: {
                    topEditbox.text = urlToPath(topFileDialog.folder)
                 }
            }

    FileDialog {
                id: bottomFileDialog
                title: "Open file dialog"
                folder: shortcuts.home
                selectFolder: true
                onAccepted: {
                    bottomEditbox.text = urlToPath(bottomFileDialog.folder);
                 }
            }
}



