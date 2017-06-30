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

import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

import "Chart.js" as Charts

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
