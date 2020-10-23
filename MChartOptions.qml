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
   * When set to `true`, chart tile will be shown. By default, title is shown
   * only when it is not empty.
   */
  property bool displayTitle: title.length > 0

  /*!
   * Title of the chart, displayed on top
   */
  property string title

  /*!
   * Font used to draw the chart title
   */
  property font titleFont
  titleFont {
    pixelSize: 18
    family: "sans-serif"
  }

  /*!
   * Color used to draw the chart title
   */
  property color titleFontColor: "#0000bf"

  /*!
   * Chart title settings object, constructed from displayTitle, title,
   * titleFont, titleFontColor properties.
   */
  property var titleObject: {
    "display": displayTitle,
    "text": title,
    "fontSize": titleFont.pointSize,
    "fontFamily": titleFont.family,
    "fontColor": qmlHelpers.htmlColor(titleFontColor)
  }

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
  property var radialScalesObject: {
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
  property var linearScalesObject: {
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
  property var legendObject: {
    "labels": {
      fontSize: legendFont.pointSize,
      fontFamily: legendFont.family,
      fontColor: qmlHelpers.htmlColor(legendFontColor)
    }
  }

  /*!
   * General animation settings object.
   */
  property var animationOptionsObject: {
    "duration": animationDuration,
    "easing": animationEasing,
    "onProgress": null,
    "onComplete": null
  }

  /*!
   * Hover options object.
   */
  property var hoverOptionsObject: {
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
                  + JSON.stringify((isLinear? linearScalesObject : radialScalesObject)) + ",")
               : "")
      + '"title": ' + JSON.stringify(titleObject) + ","
      + '"legend": ' + JSON.stringify(legendObject) + ","
      + '"animation": ' + JSON.stringify(animationOptionsObject) + ","
      + '"hover": ' + JSON.stringify(hoverOptionsObject) + ","
      + '"responsiveAnimationDuration": ' + responsiveAnimationDuration
      + "}"

  /*!
   * Chart options object, costructed from all properties of MChartOptions
   * component.
   */
  property var options: JSON.parse(_optionsString)

  //on_OptionsStringChanged: console.log("Opts:", _optionsString)
}
