import QtQuick 2.15

QtObject {
  property bool hasScale: true
  property bool isLinear: true
  readonly property string _scalesString: isLinear? '"scales"' : '"scale"'

  property var min: 0
  property var max: 1

  property int scaleLineWidth: 1
  property font scaleFont
  scaleFont {
    pixelSize: 14
    family: "sans-serif"
  }

  property color scaleFontColor: "#0a0a0a"

  property font legendFont
  legendFont {
    pixelSize: 16
    family: "sans-serif"
  }
  property color legendFontColor: "#505050"

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

  property int animationDuration: 500
  property string animationEasing: 'easeOutQuart'

  // Objects
  property var legend: {
    "labels": {
      fontSize: legendFont.pointSize,
      fontFamily: legendFont.family,
      fontColor: qmlHelpers.htmlColor(legendFontColor)
    }
  }

  // general animation time
  property var animationOptions: {
    "duration": animationDuration,
    "easing": animationEasing,
    "onProgress": null,
    "onComplete": null
  }

  // duration of animations when hovering an item
  property var hoverOptions: {
    "animationDuration": animationDuration
  }

  // animation duration after a resize
  property int responsiveAnimationDuration: 0

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

  property var options: JSON.parse(_optionsString)

  //on_OptionsStringChanged: console.log("Opts:", _optionsString)
}
