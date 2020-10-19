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

//import "mcharts"

Chart {
  id: root

  enum Type {
    Invalid,
    Bar,
    Pie,
    Line,
    Radar,
    Doughnut,
    PolarArea
  }

  property int type: MChart.Type.Invalid

  onTypeChanged: {
    switch (type) {
    case MChart.Type.Invalid:
      console.log("Chart type is unsupported")
      chartType = ''
      break
    case MChart.Type.Bar:
      chartType = 'bar'
      break
    case MChart.Type.Pie:
      chartType = 'pie'
      break
    case MChart.Type.Line:
      chartType = 'line'
      break
    case MChart.Type.Radar:
      chartType = 'radar'
      break
    case MChart.Type.Doughnut:
      chartType = 'doughnut'
      break
    case MChart.Type.PolarArea:
      chartType = 'polarArea'
      break
    }

    prepareChartData()
  }

  property list<MDataset> data

  function labels() {
    let result = [];
    for (let i = 0 ; i < data.length ; ++i) {
      result.push(data[i].name)
    }
    return result
  }

  /*!
     * Converts chart data to suitable format for Bar and RADAR charts.
     */
  function prepareChartData() {
    var datasets = []
    for (let i = 0 ; i < data.length ; ++i) {
      datasets.push({
                      label: data[i].name,
                      data: data[i].values,
                      backgroundColor: qmlHelpers.htmlColor(data[i].fillColor)
                    })
    }

    chartData = {
      labels: labels(),
      datasets: datasets
    }
  }

  chartOptions: ({
                   scaleLineWidth: 2,
                   barShowStroke: false,
                   scaleFontSize: 20,
                   scaleFontFamily: "sans-serif",
                   barValueSpacing: 10,
                   scaleFontColor: "#444444"
                 })

  Component.onCompleted: prepareChartData()
}
