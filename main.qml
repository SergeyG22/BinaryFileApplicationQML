import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.5

Window {
    id:window
    visible: true
    width: 600
    height: 420
    title: qsTr("BinaryFileApplicationQML")
    color: "#78e70c"

    ColumnLayout {
        id: columnLayout
        x: parent.width / (600 / 422)           //parent.width / (width_window / layout_pos_x)
        y: parent.height / (420 / 135)          //parent.height / (height_window / layout_pos_y)
        width: parent.width / (600 /135)        //parent.width / (width_window / layout_width)
        height: parent.height /(420 / 188)      //parent.height / (height_window / layout_height)
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

        }




    }

    ColumnLayout {
        id: columnLayout1
        x: parent.width / (600 / 422)            //parent.width / (width_window / layout_pos_x)
        y: parent.height / (420 / 35)            //parent.height / (height_window / layout_pos_y)
        width: parent.width / (600 / 110)        //parent.width / (width_window / layout_width)
        height: parent.height / (420 / 60)       //parent.height / (height_window / layout_height)

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
        x: parent.width / (600 / 29)
        y: parent.height / (420 / 25)
        width: parent.width / (600 / 355)
        height:parent.height /(420 / 70)

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
        x: parent.width / (600 / 30)
        y: parent.height / (420 / 110)
        width: parent.width / (600 / 355)
        height:parent.height /(420 / 240)
        border.color: "black"
        color: "#32162d"

        ListModel {
            id: namemodel

            ListElement {
                name: "file1.bin [EQUIALENT] file4.bin"
            }
            ListElement {
                name: "file1.bin [EQUIALENT] file6.bin"
            }
            ListElement {
                name: "file1.bin [EQUIALENT] file4.bin"
            }
            ListElement {
                name: "file1.bin [EQUIALENT] file6.bin"
            }
            ListElement {
                name: "file1.bin [EQUIALENT] file4.bin"
            }
            ListElement {
                name: "file1.bin [EQUIALENT] file6.bin"
            }

            ListElement {
                name: "file1.bin [EQUIALENT] file4.bin"
            }
            ListElement {
                name: "file1.bin [EQUIALENT] file6.bin"
            }
            ListElement {
                name: "file1.bin [EQUIALENT] file4.bin"
            }
            ListElement {
                name: "file1.bin [EQUIALENT] file6.bin"
            }

        }

        Component {
            id: nameDelegate
            Text {
                text: model.name
                font.pixelSize: 0.05 * window.height
                color: "#ffffff"
            }
        }

        ListView {
            anchors.fill: parent
            model:namemodel
            delegate: nameDelegate
            clip:true
        }


    }


}



