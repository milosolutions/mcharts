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

  property int type: MChart.Type.Invalid

  onTypeChanged: {
    switch (type) {
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
    case MChart.Type.Bubble:
      chartType = 'bubble'
      break
    case MChart.Type.Scatter:
      chartType = 'scatter'
      break
    case MChart.Type.Area:
      chartType = 'area'
      console.log("Area charts are not supported")
      break
    case MChart.Type.Mixed:
      chartType = 'mixed'
      console.log("Mixed charts are not supported")
      break
    case MChart.Type.Invalid:
    default:
      console.log("Chart type is unsupported")
      chartType = ''
      break
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
      if (labelsCount !== valuesCount) {
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
                      pointBackgroundColor: data[i].getPointColor()
                    })
    }

    chartData = {
      labels: labels,
      datasets: datasets
    }

    options.min = Math.floor(min)
    options.max = Math.ceil(max)

    //console.log("Type", chartType, "min", options.min, "max", options.max)
  }

  chartOptions: options.options

  renderStrategy: Canvas.Threaded

  Component.onCompleted: prepareChartData()
}
