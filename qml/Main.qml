/*
 * Copyright (C) 2022  ASLF
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * nfctest is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

import Example 1.0

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'nfctest.aslf'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('NFC Test')
        }

        ColumnLayout {
            spacing: units.gu(2)
            anchors {
                margins: units.gu(2)
                top: header.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            Item {
                Layout.fillHeight: true
            }

            TextField {
                id: textField
                text: "This is a test!"
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                text: i18n.tr('Send text!')
                onClicked: Service.startService(textField.text)
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                text: i18n.tr('Receive text!')
                onClicked: Reader.listenService()
            }

            Label {
                id: receivedText
                text: "Nothing here yet..."
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }

    Connections {
        target: Reader
        onBytesReceived: {
            receivedText.text = bytes
            console.log(bytes)
        }
    }
}
