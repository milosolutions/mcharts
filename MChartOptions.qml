import QtQuick 2.15

// TODO: separate parts (title, tooltips, legend etc.) into other objects

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
   * Minimum scale value.
   */
  property var min: 0

  /*!
   * Maximum scale value.
   */
  property var max: 1

  // TITLE

  /*!
   * When set to `true`, chart tile will be shown. By default, title is shown
   * only when it is not empty.
   */
  property bool titleDisplay: title.length > 0

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
    "display": titleDisplay,
    "text": title,
    "fontSize": titleFont.pointSize,
    "fontFamily": titleFont.family,
    "fontColor": qmlHelpers.htmlColor(titleFontColor)
  }

  // SCALE(S)

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
   * Internal property used to construct chart options object.
   */
  readonly property string _scalesString: isLinear? '"scales"' : '"scale"'

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

  // LEGEND

  /*!
   * When set to `true`, chart legend will be shown. By default, title is shown.
   */
  property bool legendDisplay: true

  /*!
   * When set to `true`, chart legend will be reversed.
   */
  property bool legendReverse: false

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
   * Legend object definitions.
   */
  property var legendObject: {
    "display": legendDisplay,
    "reverse": legendReverse,
    "labels": {
      fontSize: legendFont.pointSize,
      fontFamily: legendFont.family,
      fontColor: qmlHelpers.htmlColor(legendFontColor)
    }
  }

  // ANIMATIONS

  /*!
   * Duration of all chart animations.
   */
  property int animationDuration: 500

  /*!
   * Easing used to all chart animations.
   */
  property string animationEasing: 'easeOutQuart'

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

  // LAYOUTS (padding)

  /*!
   * Global padding: setting this value will set this padding for all sides
   * (top, bottom, left and right).
   */
  property int padding: 0

  /*!
   * Padding value applied from the top.
   */
  property int topPadding: 0

  /*!
   * Padding value applied from the left.
   */
  property int leftPadding: 0

  /*!
   * Padding value applied from the bottom.
   */
  property int bottomPadding: 0

  /*!
   * Padding value applied from the right.
   */
  property int rightPadding: 0

  /*!
   * Internal property, determined which padding option style to use.
   */
  property bool _isSpecificPadding: padding === 0
                                    && (topPadding !== 0 || leftPadding !== 0
                                     || bottomPadding !== 0 || rightPadding !== 0)

  /*!
   * Internal property, used to specify global padding.
   */
  property var _paddingGlobalObject: {
    "padding": padding
  }

  /*!
   * Internal property, used to specify specific padding.
   */
  property var _paddingSpecificObject: {
    "padding": {
      left: leftPadding,
      right: rightPadding,
      top: topPadding,
      bottom: bottomPadding
    }
  }

  /*!
   * Padding object used passed to options property.
   */
  property var paddingObject: _isSpecificPadding? _paddingSpecificObject
                                                : _paddingGlobalObject

  // TOOLTIPS
  // https://www.chartjs.org/docs/latest/configuration/tooltip.html

  property bool tooltipsDisplay: true
  property color tooltipsBackgrdounColor: "#000000"
  property font tooltipsTitleFont
  tooltipsTitleFont: {
    pixelSize: 14
    family: "sans-serif"
  }
  property color tooltipsTitleFontColor: "#ffffff"

  property var tooltipsObject: {
    "enabled": tooltipsDisplay,
    "backgroundColor": qmlHelpers.htmlColor(tooltipsBackgrdounColor),
    "titleFontFamily": tooltipsTitleFont.family,
    "titleFontSize": tooltipsTitleFont.pointSize,
    "titleFontColor": qmlHelpers.htmlColor(tooltipsTitleFontColor)
  }

  // RESULTING OPTIONS:

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
      + '"layout": ' + JSON.stringify(paddingObject) + ","
      + '"hover": ' + JSON.stringify(hoverOptionsObject) + ","
      + '"tooltips": ' + JSON.stringify(tooltipsObject) + ","
      + '"responsiveAnimationDuration": ' + responsiveAnimationDuration
      + "}"

  /*!
   * Chart options object, costructed from all properties of MChartOptions
   * component.
   */
  property var options: JSON.parse(_optionsString)

  //on_OptionsStringChanged: console.log("Opts:", _optionsString)
}
