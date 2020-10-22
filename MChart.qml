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

/*!
 * MChart is a wrapper for Chart element, providing more useful and convenient
 * API.
 *
 * Each chart needs to have:
 * \li `type`
 * \li `labels`
 * \li one MDataset with `values`
 *
 * MChart adds some basic error reporting (`Chart.js` comes with **NO ERROR**
 * **HANDLING** - most errors are SILENTLY ignored!), to turn it off set
 * `silent` property to `true`.
 *
 * `Chart.js` requires the number of labels and values to be matching!
 *
 * Example static chart:
\verbatim
MChart {
  id: chart

  anchors.fill: parent

  type: MChart.Type.Bar
  labels: [1, 2, 3, 4, 5]

      data: [
        // Each bar in different color
        MDataset {
          name: "Set of values"
          values: [1, 2, 2.1, 0.1, 0.7]
          fillColor: "#ff0000"
          lineColor: "#00ff00"
          pointColor: "#0000ff"
        }
      ]
    }
\endverbatim
 */
Chart {
  id: root

  /*!
   * Chart type. Detailed documentation of each of them can be found here:
   * https://www.chartjs.org/docs/latest/charts/
   *
   * \warning Area charts are not supported. Also, for Mixed type - see usage
   * in showcase-example. The trick is to use multiple chart types instead of
   * selecting `Mixed` type.
   */
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

  /*!
   * Helper method which translates Type enum into string understood by
   * Chart.js backend.
   */
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

  /*!
   * Holds chart type selected by user.
   */
  property int type: MChart.Type.Invalid

  onTypeChanged: {
    chartType = typeToString(type)

    if (chartType === '') {
      console.log("Chart type is unsupported")
    }

    prepareChartData()
  }

  /*!
   * Data points for the chart. Each MDataset represents a separate set of
   * data to display. For example, in a Line chart, each MDataset will draw
   * a different line on the chart.
   */
  property list<MDataset> data

  /*!
   * Used to define general options for the whole chart:
   * \li colors
   * \li fonts
   * \li scale ranges
   * \li and so on
   */
  property MChartOptions options: MChartOptions {
    isLinear: type === MChart.Type.Bar || type === MChart.Type.Line
              || type === MChart.Type.Scatter || type === MChart.Type.Bubble
    hasScale: type !== MChart.Type.Pie && type !== MChart.Type.Doughnut
  }

  /*!
   * Labels - these are values which populate x axis.
   */
  property var labels: []

  /*!
   * When set to `true`, MChart error reporting will be silenced.
   */
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
