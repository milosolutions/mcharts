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
    PolarArea,
    Bubble,
    Scatter,
    Area,
    Mixed
  }

  function typeToString(type) {
    switch (type) {
    case MChart.Type.Bar:
      return 'bar'
    case MChart.Type.Pie:
      return 'pie'
    case MChart.Type.Line:
      return 'line'
    case MChart.Type.Radar:
      return 'radar'
    case MChart.Type.Doughnut:
      return 'doughnut'
    case MChart.Type.PolarArea:
      return 'polarArea'
    case MChart.Type.Bubble:
      return 'bubble'
    case MChart.Type.Scatter:
      return 'scatter'
    case MChart.Type.Area:
      console.log("Area charts are not supported")
      return 'area'
    case MChart.Type.Mixed:
      console.log("Mixed should be specified elsewhere, see examples")
      return 'mixed'
    case MChart.Type.Invalid:
    default:
      return ''
    }
  }

  property int type: MChart.Type.Invalid

  onTypeChanged: {
    chartType = typeToString(type)

    if (chartType === '') {
      console.log("Chart type is unsupported")
    }

    prepareChartData()
  }

  property list<MDataset> data
  property MChartOptions options: MChartOptions {
    isLinear: type === MChart.Type.Bar || type === MChart.Type.Line
              || type === MChart.Type.Scatter || type === MChart.Type.Bubble
    hasScale: type !== MChart.Type.Pie && type !== MChart.Type.Doughnut
  }
  property var labels: []

  property bool silent: false

  /*!
     * Converts chart data to suitable format for Bar and RADAR charts.
     */
  function prepareChartData() {
    let labelsCount = labels.length
    let datasets = []
    let min = 0
    let max = 0
    for (let i = 0 ; i < data.length ; ++i) {
      let valuesCount = data[i].values.length
      if (labelsCount !== valuesCount && !silent) {
        console.error("Number of labels", labelsCount,
                      "does not match number of values", valuesCount)
      }

      min = Math.min(min, data[i].suggestedMin)
      max = Math.max(max, data[i].suggestedMax)

      datasets.push({
                      label: data[i].name,
                      data: data[i].values,
                      backgroundColor: data[i].getFillColor(),
                      borderColor: data[i].getLineColor(),
                      pointBackgroundColor: data[i].getPointColor(),
                      type: typeToString(data[i].type)
                    })
    }

    chartData = {
      labels: labels,
      datasets: datasets
    }

    options.min = Math.floor(min)
    options.max = Math.ceil(max)

    requestPaint()

    //console.log("Type", chartType, "min", options.min, "max", options.max)
  }

  chartOptions: options.options

  renderStrategy: Canvas.Threaded

  onDataChanged: {
    for (let i = 0; i < data.length; ++i) {
      // Sever any existing connection
      data[i].updated.disconnect(prepareChartData)
      // Establish new connection
      data[i].updated.connect(prepareChartData)
    }
  }

  Component.onCompleted: prepareChartData()
}
