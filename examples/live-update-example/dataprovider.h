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

#ifndef DATAPROVIDER_H
#define DATAPROVIDER_H

#include <QObject>
#include <QTimer>
#include <QJsonArray>

class DataProvider : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QList<qreal> values READ values NOTIFY countChanged)
    Q_PROPERTY(QList<int> labels READ labels NOTIFY countChanged)

public:
    explicit DataProvider(QObject *parent = nullptr);

    Q_INVOKABLE QStringList getColors() const;

    QList<qreal> values() const;
    QList<int> labels() const;

signals:
    void valuesChanged(const QList<qreal> &values) const;
    void labelsChanged(const QList<int> &labels) const;
    void countChanged() const;

private slots:
    void addValue();

private:
    void updateLabels();

    QList<qreal> m_values;// = { 1.5, 2.2, 1.1, 2.7, 2.1, 1.0, 0.5, 2.5, 1.5,
                          //    2.5, 0.5, 2.3, 0.8, 1.5 };
    QList<int> m_labels;
    QTimer m_timer;
};

#endif // DATAPROVIDER_H
