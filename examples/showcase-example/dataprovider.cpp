/*******************************************************************************
Copyright (C) 2020 Milo Solutions
Contact: https://www.milosolutions.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*******************************************************************************/


#include "dataprovider.h"
#include <QJsonObject>

/*!
 * \brief Class provides test data set for MiloCharts Demo project.
 * \class DataProvider
 */

DataProvider::DataProvider(QObject *parent) :
    QObject(parent)
{
}

/*!
 * \brief DataProvider::getValues - returns chart values.
 * \return
 */
QList<qreal> DataProvider::getValues() const
{
    return { 1.5, 2.2, 1.1, 2.7, 2.1, 1.0, 0.5 };
}

QList<qreal> DataProvider::getValues2() const
{
    return { 2.5, 1.5, 2.5, 0.5, 2.3, 0.8, 1.5 };
}

QJsonArray DataProvider::getPointValues() const
{
    QJsonArray result;

    const auto xValues = getValues();
    const auto yValues = getValues2();

    for (int i = 0; i < xValues.size(); ++i) {
        QJsonObject object;
        object.insert("x", xValues.at(i));
        object.insert("y", yValues.at(i));
        result.append(object);
    }

    return result;
}

QJsonArray DataProvider::getPointValues2() const
{
    QJsonArray result;

    const auto xValues = getValues2();
    const auto yValues = getValues();

    for (int i = 0; i < xValues.size(); ++i) {
        QJsonObject object;
        object.insert("x", xValues.at(i));
        object.insert("y", yValues.at(i));
        result.append(object);
    }

    return result;
}

QJsonArray DataProvider::getBubbleValues() const
{
    QJsonArray result;

    const auto xValues = getValues();
    const auto yValues = getValues2();

    for (int i = 0; i < xValues.size(); ++i) {
        QJsonObject object;
        object.insert("x", xValues.at(i));
        object.insert("y", yValues.at(i));
        object.insert("r", 5.0 / (i + 1));
        result.append(object);
    }

    return result;
}

QJsonArray DataProvider::getBubbleValues2() const
{
    QJsonArray result;

    const auto xValues = getValues2();
    const auto yValues = getValues();

    for (int i = 0; i < xValues.size(); ++i) {
        QJsonObject object;
        object.insert("x", xValues.at(i));
        object.insert("y", yValues.at(i));
        object.insert("r", 10.0 / (i + 1));
        result.append(object);
    }

    return result;
}

/*!
 * \brief DataProvider::getLabels - returns chart labels.
 * \return
 */
QStringList DataProvider::getLabels() const
{
    return { "8:00", "10:00", "12:00", "14:00", "16:00", "18:00", "20:00" };
}

/*!
 * \brief DataProvider::getColors - returns chart colors.
 * \return
 */
QStringList DataProvider::getColors() const
{
    return { "#aa54bc9b",
        "#aaf58d35",
        "#aaf14946",
        "#aa8562a4",
        "#aa348faa",
        "#aadddddd",
        "#aac451e2"
    };
}

QStringList DataProvider::getColors2() const
{
    QStringList colors = getColors();
    std::reverse(colors.begin(), colors.end());
    return colors;
}
