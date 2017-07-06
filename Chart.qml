//#### The MIT License (MIT)
//
//**Copyright (c) 2014 Julien Wintz**
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of
//this software and associated documentation files (the "Software"), to deal in
//the Software without restriction, including without limitation the rights to
//use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//the Software, and to permit persons to whom the Software is furnished to do so,
//subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//> EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//> MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//> NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//> LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//> WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//> OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION

import QtQuick 2.0

import "Chart.js" as Charts
import QtQuick.Window 2.2

Canvas {

  id: canvas;

  property   var chart;
  property   var chartData;
  property   int chartType: 0;
  property  bool chartAnimated: true;
  property alias chartAnimationEasing: chartAnimator.easing.type;
  property alias chartAnimationDuration: chartAnimator.duration;
  property   int chartAnimationProgress: 0;
  property   var chartOptions: ({})

  onPaint: {
      var ctx = canvas.getContext("2d");
      /* Reset the canvas context to allow resize events to properly redraw
         the surface with an updated window size */
      ctx.reset()

      switch(chartType) {
      case Charts.ChartType.BAR:
          chart = new Charts.Chart(canvas, ctx).Bar(chartData, chartOptions);
          break;
      case Charts.ChartType.DOUGHNUT:
          chart = new Charts.Chart(canvas, ctx).Doughnut(chartData, chartOptions);
          break;
      case Charts.ChartType.LINE:
          chart = new Charts.Chart(canvas, ctx).Line(chartData, chartOptions);
          break;
      case Charts.ChartType.PIE:
          chart = new Charts.Chart(canvas, ctx).Pie(chartData, chartOptions);
          break;
      case Charts.ChartType.POLAR:
          chart = new Charts.Chart(canvas, ctx).PolarArea(chartData, chartOptions);
          break;
      case Charts.ChartType.RADAR:
          chart = new Charts.Chart(canvas, ctx).Radar(chartData, chartOptions);
          break;
      default:
          console.log('Chart type should be specified.');
      }

      chart.init();

      if (chartAnimated)
          chartAnimator.start();
      else
          chartAnimationProgress = 100;

      chart.draw(chartAnimationProgress/100);
  }

  onHeightChanged: {
    requestPaint();
  }

  onWidthChanged: {
    requestPaint();
  }

  onChartAnimationProgressChanged: {
      requestPaint();
  }

  onChartDataChanged: {
      requestPaint();
  }

  function repaint() {
      chartAnimationProgress = 0;
      chartAnimator.start();
  }

  PropertyAnimation {
             id: chartAnimator;
         target: canvas;
       property: "chartAnimationProgress";
             to: 100;
       duration: 500;
    easing.type: Easing.InOutElastic;
  }
}
