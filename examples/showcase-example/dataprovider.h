/*******************************************************************************
Copyright (C) 2017 Milo Solutions
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

#include <QJsonArray>

class DataProvider : public QObject
{
    Q_OBJECT

public:
    explicit DataProvider(QObject *parent = nullptr);

    Q_INVOKABLE QList<qreal> getValues() const;
    Q_INVOKABLE QList<qreal> getValues2() const;
    Q_INVOKABLE QJsonArray getPointValues() const;
    Q_INVOKABLE QJsonArray getPointValues2() const;
    Q_INVOKABLE QJsonArray getBubbleValues() const;
    Q_INVOKABLE QJsonArray getBubbleValues2() const;
    Q_INVOKABLE QStringList getLabels() const;
    Q_INVOKABLE QStringList getColors() const;
    Q_INVOKABLE QStringList getColors2() const;
};

#endif // DATAPROVIDER_H
