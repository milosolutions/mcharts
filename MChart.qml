/*******************************************************************************
  Copyright (C) 2016 Milo Solutions
  Contact: https://www.milosolutions.com

  This file is part of Milo Code Database, which is a collection of useful code
  snippets often reused within Milo Solutions. As such, this code is present in
  many projects done by Milo Solutions and does not constitute a copyright
  infridgement.

  You are entitled to do anything you please with this code, just as with the
  rest of code you bought. Files not containing this notice were written
  specifically for this project and have not been shared with any other party
  within or without Milo.
*******************************************************************************/

import QtQuick 2.0

import "Chart.js" as Charts

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

        var chartData = []
        for (var i = 0 ; i < labels.length ; ++i) {
            chartData.push({
                               label: labels[i],
                               value: values[i],
                               color: colors[i]
                           })
        }
        return chartData
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

    chartAnimationEasing: Easing.OutCubic
    chartAnimationDuration: 300

    chartOptions: ({
        scaleLineWidth: 2,
        barShowStroke: false,
        scaleFontSize: 20,
        scaleFontFamily: "sans-serif",
        barValueSpacing: 10,
        scaleFontColor: "#444444"
    })

    Component.onCompleted: {
        if (chartType === Charts.ChartType.BAR
                || chartType === Charts.ChartType.RADAR) {
            chartData = prepareBarChartData()
        } else if (chartType === Charts.ChartType.PIE
                   || chartType === Charts.ChartType.DOUGHNUT
                   || chartType === Charts.ChartType.POLAR) {
            chartData = preparePieChartData()
        } else if (chartType === Charts.ChartType.LINE) {
            chartData = prepareLineChartData()
        }
    }
}
