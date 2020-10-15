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


import QtQuick 2.9

Chart {
    /*!
     * String array used as labels in charts.
     */
    property var labels
    /*!
     * Data array used as values in charts.
     */
    property var values
    /*!
     * Color of primitives used in BAR and RADAR charts.
     */
    property color color
    /*!
     * Color arrray of primitives used in PIE, DOUGHNUT and POLAR charts.
     */
    property var colors
    /*!
     * Color used to fill space under the line in LINE chart.
     * Default value is transparent.
     */
    property color fillColor: "#00ffffff"
    /*!
     * Color of line used in LINE chart.
     */
    property color strokeColor
    /*!
     *  Color of points used in LINE chart.
     */
    property color pointColor

    /*!
     * Converts chart data to suitable format for Bar and RADAR charts.
     */
    function prepareBarChartData() {
        return {
            labels: labels,
            datasets: [
                {
                    fillColor: color,
                    data: values
                }
            ]
        }
    }

    /*!
     * Converts chart data to suitable format for PIE, DOUGHNUT and POLAR charts.
     */
    function preparePieChartData() {
        if (labels.length !== values.length || labels.length !== colors.length) {
            console.exception("To use Pie chart labels/values/colors should have the same size")
            return
        }

        var datasets = []
        for (var i = 0 ; i < labels.length ; ++i) {
            datasets.push({
                              label: labels[i],
                              data: values,
                              color: colors[i]
                          })
        }

        return {
            labels: labels,
            datasets: datasets
        }
    }

    /*!
     * Converts chart data to suitable format for LINE chart.
     */
    function prepareLineChartData() {
        return {
            labels: labels,
            datasets: [
                {
                    data: values,
                    fillColor: fillColor,
                    strokeColor: strokeColor,
                    pointColor: pointColor
                }
            ]
        }
    }

    //chartAnimationEasing: Easing.OutCubic
    //chartAnimationDuration: 300

    chartOptions: ({
        scaleLineWidth: 2,
        barShowStroke: false,
        scaleFontSize: 20,
        scaleFontFamily: "sans-serif",
        barValueSpacing: 10,
        scaleFontColor: "#444444"
    })

    Component.onCompleted: {
        if (chartType === 'bar' || chartType === 'radar') {
            chartData = prepareBarChartData()
        } else if (chartType === 'pie' || chartType === 'doughnut'
                   || chartType === 'polarArea') {
            chartData = preparePieChartData()
        } else if (chartType === 'line') {
            chartData = prepareLineChartData()
        }
    }
}
