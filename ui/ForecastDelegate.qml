import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft
import org.kde.lottie 1.0

WeatherDelegate {
    id: root

    property alias model: forecastRepeater.model

    spacing: proportionalGridUnit * 10
    Repeater {
        id: forecastRepeater
        delegate: GridLayout {
            columns: 2
            rowSpacing: proportionalGridUnit * 5
            columnSpacing: proportionalGridUnit * 5
            Layout.fillWidth: true
            Layout.fillHeight: true

            LottieAnimation {
                Layout.alignment: Qt.AlignCenter
                Layout.preferredHeight: proportionalGridUnit * 30
                Layout.preferredWidth: Layout.preferredHeight

                source: Qt.resolvedUrl(getWeatherImagery(modelData.weathercode))
                loops: Animation.Infinite
                fillMode: Image.PreserveAspectFit
                running: true
            }
            Label {
                font.weight: Font.Bold
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
                Layout.preferredHeight: proportionalGridUnit * 30
                font.pixelSize: height * 0.90
                text: modelData.date
            }

            Label {
                font.weight: Font.Bold
                Layout.fillWidth: true
                Layout.preferredHeight: proportionalGridUnit * 30
                rightPadding: -font.pixelSize * 0.1
                font.pixelSize: height * 0.90
                horizontalAlignment: Text.AlignHCenter
                text: modelData.max + "°"
            }

            Label {
                font.styleName: "Thin"
                Layout.fillWidth: true
                Layout.preferredHeight: proportionalGridUnit * 30
                rightPadding: -font.pixelSize * 0.1
                font.pixelSize: height * 0.90
                horizontalAlignment: Text.AlignHCenter
               text: modelData.min + "°"
            }
        }
    }
}
