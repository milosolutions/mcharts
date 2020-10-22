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
#include "utils/helpers.h"

#include <QJsonObject>
#include <QRandomGenerator>

/*!
 * \brief Class provides test data set for MiloCharts Demo project.
 * \class DataProvider
 */

DataProvider::DataProvider(QObject *parent) :
    QObject(parent)
{
    updateLabels();

    CHECK(connect(&m_timer, &QTimer::timeout,
                  this, &DataProvider::addValue));

    m_timer.setSingleShot(false);
    m_timer.setInterval(1000);
    m_timer.start();
}

/*!
 * \brief DataProvider::getColors - returns chart colors.
 * \return
 */
QStringList DataProvider::getColors() const
{
    return {
        "#aa54bc9b",
        "#aaf58d35",
        "#aaf14946",
        "#aa8562a4",
        "#aa348faa",
        "#aadddddd",
        "#aac451e2"
    };
}

QList<qreal> DataProvider::values() const
{
    return m_values;
}

QList<int> DataProvider::labels() const
{
    return m_labels;
}

void DataProvider::addValue()
{
    m_values.append(qreal(QRandomGenerator::global()->bounded(5.0)));
    updateLabels();
    emit valuesChanged(m_values);
    //qDebug() << "Update!" << m_values.size() << m_labels.size();
    emit countChanged();
}

void DataProvider::updateLabels()
{
    bool changed = false;
    while (m_values.size() != m_labels.size()) {
        m_labels.append(m_labels.size() + 1);
            changed = true;
    }

    if (changed) {
        emit labelsChanged(m_labels);
    }
}
