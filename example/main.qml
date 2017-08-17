/*******************************************************************************
Copyright (C) 2017 Milo Solutions
Contact: https://www.milosolutions.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*******************************************************************************/


import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

import "qrc:Chart.js" as Charts

Window {
    visible: true
    width: Screen.width
    height: Screen.height

    GridLayout {
          anchors.fill: parent
          columns: Screen.width > Screen.height ? 3 : 2

          MChart {
              id: chartBar1

              Layout.fillWidth: true
              Layout.fillHeight: true

              chartType: Charts.ChartType.BAR

              labels: dataProvider.getLabels()
              values: dataProvider.getValues()
              color: "#72c4e8"
          }

          MChart {
              id: chartBar2

              Layout.fillWidth: true
              Layout.fillHeight: true

              chartType: Charts.ChartType.PIE

              labels: dataProvider.getLabels()
              values: dataProvider.getValues()
              colors: dataProvider.getColors()
          }

          MChart {
              id: chartBar3

              Layout.fillWidth: true
              Layout.fillHeight: true

              chartType: Charts.ChartType.LINE

              labels: dataProvider.getLabels()
              values: dataProvider.getValues()
              strokeColor: "#72c4e8"
              pointColor: "#ffffff"

          }

          MChart {
              id: chartBar4

              Layout.fillWidth: true
              Layout.fillHeight: true

              chartType: Charts.ChartType.RADAR

              labels: dataProvider.getLabels()
              values: dataProvider.getValues()
              color: "#8072c4e8"
          }

          MChart {
              id: chartBar5

              Layout.fillWidth: true
              Layout.fillHeight: true

              chartType: Charts.ChartType.DOUGHNUT

              labels: dataProvider.getLabels()
              values: dataProvider.getValues()
              colors: dataProvider.getColors()
          }

          MChart {
              id: chartBar6

              Layout.fillWidth: true
              Layout.fillHeight: true

              chartType: Charts.ChartType.POLAR

              labels: dataProvider.getLabels()
              values: dataProvider.getValues()
              colors: dataProvider.getColors()
          }
      }
}
