import QtQuick 2.15

QtObject {
  property bool hasScale: true
  property bool isLinear: true
  readonly property string _scalesString: isLinear? '"scales"' : '"scale"'

  property int scaleLineWidth: 1
  property font scaleFont: {
    pixelSize: 30
    family: "sans-serif"
  }
  property color scaleFontColor: "#000000"

  property font legendFont: {
    pixelSize: 30
    family: "sans-serif"
  }
  property color legendFontColor: "#ff1111"

  property var radialScales: {
    "angleLines": {
      display: false
    },
    "ticks": {
      suggestedMin: 0,
      suggestedMax: 5
    }
  }

  property var linearScales: {
    "xAxes": [{
                "ticks": {
                  min: 0,
                  max: 7
                }
              }],
    "yAxes": [{
                "ticks": {
                  min: 0,
                  max: 7
                }
              }],
  }

  // Objects
  property var legend: {
    "labels": {
      fontSize: legendFont.pointSize,
      fontFamily: legendFont.family,
      fontColor: qmlHelpers.htmlColor(legendFontColor)
    }
  }

  property string _optionsString:
      "{" +
      (hasScale? (_scalesString + ": "
                 + JSON.stringify((isLinear? linearScales : radialScales)) + ",")
              : "")
      + '"legend": ' + JSON.stringify(legend)
      + "}"

  property var options: JSON.parse(_optionsString)

  on_OptionsStringChanged: console.log("Opts:", _optionsString)
}
