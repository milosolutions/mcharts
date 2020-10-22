import QtQuick 2.15

QtObject {
  /*!
   * When `true`, chart will draw its scales.
   */
  property bool hasScale: true

  /*!
   * When `true`, chart will use linear scale options.
   */
  property bool isLinear: true

  /*!
   * Internal property used to construct chart options object.
   */
  readonly property string _scalesString: isLinear? '"scales"' : '"scale"'

  /*!
   * Minimum scale value.
   */
  property var min: 0

  /*!
   * Maximum scale value.
   */
  property var max: 1

  /*!
   * Width of the main scale line.
   */
  property int scaleLineWidth: 1

  /*!
   * Font to draw scale values with.
   */
  property font scaleFont
  scaleFont {
    pixelSize: 14
    family: "sans-serif"
  }

  /*!
   * Color of scale font.
   */
  property color scaleFontColor: "#0a0a0a"

  /*!
   * Font to draw legend with.
   */
  property font legendFont
  legendFont {
    pixelSize: 16
    family: "sans-serif"
  }

  /*!
   * Color of legend font.
   */
  property color legendFontColor: "#505050"

  /*!
   * Scales object used to define scales in radial charts.
   */
  property var radialScales: {
    "angleLines": {
      display: true
    },
    "ticks": {
      suggestedMin: min,
      suggestedMax: max,
      fontSize: scaleFont.pointSize,
      fontFamily: scaleFont.family,
      fontColor: qmlHelpers.htmlColor(scaleFontColor)
    }
  }

  /*!
   * Scales object used to define scales in linear charts.
   */
  property var linearScales: {
    "xAxes": [{
                "ticks": {
                  fontSize: scaleFont.pointSize,
                  fontFamily: scaleFont.family,
                  fontColor: qmlHelpers.htmlColor(scaleFontColor)
                },
                "gridLines": {
                  lineWidth: scaleLineWidth
                }
              }],
    "yAxes": [{
                "ticks": {
                  min: min,
                  max: max,
                  fontSize: scaleFont.pointSize,
                  fontFamily: scaleFont.family,
                  fontColor: qmlHelpers.htmlColor(scaleFontColor)
                },
                "gridLines": {
                  lineWidth: scaleLineWidth
                }
              }],
  }

  /*!
   * Duration of all chart animations.
   */
  property int animationDuration: 500

  /*!
   * Easing used to all chart animations.
   */
  property string animationEasing: 'easeOutQuart'

  // Objects
  /*!
   * Legend object definitions.
   */
  property var legend: {
    "labels": {
      fontSize: legendFont.pointSize,
      fontFamily: legendFont.family,
      fontColor: qmlHelpers.htmlColor(legendFontColor)
    }
  }

  /*!
   * General animation settings object.
   */
  property var animationOptions: {
    "duration": animationDuration,
    "easing": animationEasing,
    "onProgress": null,
    "onComplete": null
  }

  /*!
   * Hover options object.
   */
  property var hoverOptions: {
    "animationDuration": animationDuration
  }

  /*!
   * How long it should take to redraw the chart when size is changed.
   */
  property int responsiveAnimationDuration: 0

  /*!
   * Internal property used to construct the chart options object.
   */
  property string _optionsString:
      "{" +
      (hasScale? (_scalesString + ": "
                  + JSON.stringify((isLinear? linearScales : radialScales)) + ",")
               : "")
      + '"legend": ' + JSON.stringify(legend) + ","
      + '"animation": ' + JSON.stringify(animationOptions) + ","
      + '"hover": ' + JSON.stringify(hoverOptions) + ","
      + '"responsiveAnimationDuration": ' + responsiveAnimationDuration
      + "}"

  /*!
   * Chart options object, costructed from all properties of MChartOptions
   * component.
   */
  property var options: JSON.parse(_optionsString)

  //on_OptionsStringChanged: console.log("Opts:", _optionsString)
}
