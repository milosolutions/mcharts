import QtQuick 2.15

QtObject {
  /*!
   * To get a Mixed chart, specify type here. Otherwise, leave it to be
   * Invalid, and MChart.type will be used instead.
   */
  property int type: MChart.Type.Invalid

  /*!
   * Name of the dataset. This text will be shown in chart's legend.
   */
  property string name

  /*!
   * List of values to display. The number of values should match MChart's
   * number of labels.
   */
  property var values

  /*!
   * Color used to fill all values in this dataset. If you need to color each
   * value separately, use fillColors property instead.
   */
  property color fillColor

  /*!
   * Color used to paint all lines in this dataset. If you need to color each
   * line separately, use lineColors property instead.
   */
  property color lineColor

  /*!
   * Color used to paint all points in this dataset. If you need to color each
   * point separately, use pointColors property instead.
   */
  property color pointColor

  /*!
   * Colors used to fill values in this dataset. Each value is painted with
   * next color from the list. If you need to color each value with the same
   * color, use fillColor property instead.
   */
  property var fillColors

  /*!
   * Colors used to paint lines in this dataset. Each line is painted with
   * next color from the list. If you need to color each line with the same
   * color, use lineColor property instead.
   */
  property var lineColors

  /*!
   * Colors used to paint points in this dataset. Each point is painted with
   * next color from the list. If you need to color each value with the same
   * color, use pointColor property instead.
   */
  property var pointColors

  /*!
   * Suggested minimal value to display on chart's scale. MChart can override
   * this based on other datasets.
   */
  property real suggestedMin: 0

  /*!
   * Suggested maximum value to display on chart's scale. MChart can override
   * this based on other datasets.
   */
  property real suggestedMax: 1

  /*!
   * Emitted whenever any property in MDataset gets modified.
   */
  signal updated()

  /*!
   * Returns either a single HTML color or a list of them, depending on which
   * is set.
   */
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

  /*!
   * Returns single fill color or a list, depending on which value is set.
   */
  function getFillColor() {
    return getColor(fillColor, fillColors)
  }

  /*!
   * Returns single line color or a list, depending on which value is set.
   */
  function getLineColor() {
    return getColor(lineColor, lineColors)
  }

  /*!
   * Returns single point color or a list, depending on which value is set.
   */
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

      if (typeof current === "object") {
        min = Math.min(min, current.x)
        max = Math.max(max, current.x)
        min = Math.min(min, current.y)
        max = Math.max(max, current.y)
      } else {
        min = Math.min(min, current)
        max = Math.max(max, current)
      }
    }

    suggestedMin = min
    suggestedMax = max

    updated()
  }

  onTypeChanged: updated()
  onNameChanged: updated()
  onFillColorChanged: updated()
  onLineColorChanged: updated()
  onPointColorChanged: updated()
  onFillColorsChanged: updated()
  onLineColorsChanged: updated()
  onPointColorsChanged: updated()
  onSuggestedMinChanged: updated()
  onSuggestedMaxChanged: updated()
}
