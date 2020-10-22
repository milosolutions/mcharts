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

  MChart {
    id: chart

    anchors.fill: parent

    type: MChart.Type.Line
    labels: dataProvider.labels
    silent: true

    data: [
      MDataset {
        name: "Live update set"
        values: dataProvider.values
        fillColor: dataProvider.getColors()[0]
        lineColor: dataProvider.getColors()[1]
        pointColor: dataProvider.getColors()[2]
      },

      MDataset {
        name: "Set 2"
        values: [1.1, 2, 0.75, 3, 4]
        fillColor: dataProvider.getColors()[5]
        lineColor: dataProvider.getColors()[4]
        pointColor: dataProvider.getColors()[3]
      }
    ]
  }
}
