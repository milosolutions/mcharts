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
}
