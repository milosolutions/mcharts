#pragma once

#include <QObject>

class QColor;

class QmlHelpers : public QObject
{
    Q_OBJECT

public:
    explicit QmlHelpers(QObject *parent = nullptr);

    Q_INVOKABLE static QString htmlColor(const QColor &color);
};

