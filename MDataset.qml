import QtQuick 2.15

QtObject {
  property string name
  property var values
  property color fillColor
  property color lineColor
  property color pointColor
  property var fillColors
  property var lineColors
  property var pointColors

  property real suggestedMin: 0
  property real suggestedMax: 1

  function getColor(single, list) {
    if (list !== undefined && list.length > 0) {
      let htmlColors = []
      for (let i = 0 ; i < list.length ; ++i) {
        htmlColors.push(qmlHelpers.htmlColor(list[i]))
      }

      return htmlColors
    } else {
      return qmlHelpers.htmlColor(single)
    }
  }

  function getFillColor() {
    return getColor(fillColor, fillColors)
  }

  function getLineColor() {
    return getColor(lineColor, lineColors)
  }

  function getPointColor() {
    return getColor(pointColor, pointColors)
  }

  onValuesChanged: {
    if (values === undefined) {
      suggestedMax = 1
      suggestedMin = 0
      return;
    }

    let min = 0
    let max = 0
    for (let i = 0; i < values.length; ++i) {
      let current = values[i]
      min = Math.min(min, current)
      max = Math.max(max, current)
    }

    suggestedMin = min
    suggestedMax = max
  }
}
