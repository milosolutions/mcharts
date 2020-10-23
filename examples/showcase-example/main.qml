/*******************************************************************************
Copyright (C) 2020 Milo Solutions
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

import QtQuick 2.15
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

import "mcharts"

Window {
  visible: true
  width: 1000
  height: 800

  GridLayout {
    anchors.fill: parent
    columns: 3

    MChart {
      id: chart1

      Layout.fillWidth: true
      Layout.fillHeight: true

      type: MChart.Type.Bar
      labels: dataProvider.getLabels()

      options.title: qsTr("A title")

      data: [
        // Each bar in different color
        MDataset {
          name: "Set 1"
          values: [1, 2, 2.1, 0.1, 0.7, 1.1, 1.4]
          fillColors: dataProvider.getColors()
          lineColors: dataProvider.getColors()
          pointColors: dataProvider.getColors()
        },

        // Each bar in the same color
        MDataset {
          name: "Set 2"
          values: dataProvider.getValues2()
          fillColor: dataProvider.getColors()[3]
          lineColor: dataProvider.getColors()[4]
          pointColor: dataProvider.getColors()[5]
        }
      ]
    }

    MChart {
      id: chart2

      Layout.fillWidth: true
      Layout.fillHeight: true

      type: MChart.Type.Pie
      labels: dataProvider.getLabels()

      data: [
        MDataset {
          name: "Set 1"
          values: dataProvider.getValues()
          fillColors: dataProvider.getColors()
          lineColors: dataProvider.getColors()
          pointColors: dataProvider.getColors()
        },

        MDataset {
          name: "Set 2"
          values: dataProvider.getValues2()
          fillColors: dataProvider.getColors2()
          lineColors: dataProvider.getColors2()
          pointColors: dataProvider.getColors2()
        }
      ]
    }

    MChart {
      id: chart3

      Layout.fillWidth: true
      Layout.fillHeight: true

      type: MChart.Type.Line
      labels: dataProvider.getLabels()

      data: [
        MDataset {
          name: "Set 3"
          values: dataProvider.getValues()
          fillColor: dataProvider.getColors()[2]
          lineColor: dataProvider.getColors()[1]
          pointColor: dataProvider.getColors()[0]
        },

        MDataset {
          name: "Set 4"
          values: dataProvider.getValues2()
          fillColor: dataProvider.getColors()[5]
          lineColor: dataProvider.getColors()[4]
          pointColor: dataProvider.getColors()[3]
        }
      ]
    }

    MChart {
      id: chart4

      Layout.fillWidth: true
      Layout.fillHeight: true

      type: MChart.Type.Radar
      labels: dataProvider.getLabels()

      data: [
        MDataset {
          name: "Set 1"
          values: dataProvider.getValues()
          fillColor: dataProvider.getColors()[0]
          lineColor: dataProvider.getColors()[1]
          pointColors: dataProvider.getColors()
        }
      ]
    }

    MChart {
      id: chart5

      Layout.fillWidth: true
      Layout.fillHeight: true

      type: MChart.Type.Doughnut
      labels: dataProvider.getLabels()

      data: [
        MDataset {
          name: "Set 1"
          values: dataProvider.getValues()
          fillColors: dataProvider.getColors2()
          lineColor: dataProvider.getColors()[1]
          pointColor: dataProvider.getColors()[2]
        },

        MDataset {
          name: "Set 2"
          values: dataProvider.getValues2()
          fillColors: dataProvider.getColors()
          lineColor: dataProvider.getColors()[4]
          pointColor: dataProvider.getColors()[5]
        }
      ]
    }

    MChart {
      id: chart6

      Layout.fillWidth: true
      Layout.fillHeight: true

      type: MChart.Type.PolarArea
      labels: dataProvider.getLabels()

      data: [
        MDataset {
          name: "Set 1"
          values: dataProvider.getValues()
          fillColors: dataProvider.getColors()
          lineColor: dataProvider.getColors()[1]
          pointColor: dataProvider.getColors()[2]
        }
      ]
    }

    MChart {
      id: chart7

      Layout.fillWidth: true
      Layout.fillHeight: true

      type: MChart.Type.Bubble
      labels: dataProvider.getLabels()

      data: [
        MDataset {
          name: "Set 1"
          values: dataProvider.getBubbleValues()
          fillColors: dataProvider.getColors()
          lineColors: dataProvider.getColors()
          pointColors: dataProvider.getColors()
        },

        MDataset {
          name: "Set 2"
          values: dataProvider.getBubbleValues2()
          fillColors: dataProvider.getColors2()
          lineColors: dataProvider.getColors2()
          pointColors: dataProvider.getColors2()
        }
      ]
    }

    MChart {
      id: chart8

      Layout.fillWidth: true
      Layout.fillHeight: true

      type: MChart.Type.Scatter
      labels: dataProvider.getLabels()

      data: [
        MDataset {
          name: "Set 1"
          values: dataProvider.getPointValues()
          fillColors: dataProvider.getColors()
          lineColors: dataProvider.getColors()
          pointColors: dataProvider.getColors()
          suggestedMin: 0
          suggestedMax: 4
        },

        MDataset {
          name: "Set 2"
          values: dataProvider.getPointValues2()

          fillColors: dataProvider.getColors2()
          lineColors: dataProvider.getColors2()
          pointColors: dataProvider.getColors2()
          suggestedMin: 0
          suggestedMax: 4
        }
      ]
    }

//    MChart {
//      id: chart9

//      Layout.fillWidth: true
//      Layout.fillHeight: true

//      type: MChart.Type.Area
//      labels: dataProvider.getLabels()

//      data: [
//        MDataset {
//          name: "Set 1"
//          values: dataProvider.getValues()
//          fillColors: dataProvider.getColors()
//          lineColors: dataProvider.getColors()
//          pointColors: dataProvider.getColors()
//        },

//        MDataset {
//          name: "Set 2"
//          values: dataProvider.getValues2()
//          fillColors: dataProvider.getColors2()
//          lineColors: dataProvider.getColors2()
//          pointColors: dataProvider.getColors2()
//        }
//      ]
//    }

    // Mixed chart
    MChart {
      id: chart10

      Layout.fillWidth: true
      Layout.fillHeight: true

      type: MChart.Type.Bar
      labels: dataProvider.getLabels()

      data: [
        MDataset {
          name: "Set 1"
          values: dataProvider.getValues()
          fillColors: dataProvider.getColors()
          lineColors: dataProvider.getColors()
          pointColors: dataProvider.getColors()
        },

        MDataset {
          type: MChart.Type.Line
          name: "Set 2"
          values: dataProvider.getValues2()
          fillColor: dataProvider.getColors2()[3]
          lineColor: dataProvider.getColors2()[4]
          pointColors: dataProvider.getColors2()
        }
      ]
    }
  }
}
