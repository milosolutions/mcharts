#include "qmlhelpers.h"

#include <QByteArray>
#include <QColor>

QmlHelpers::QmlHelpers(QObject *parent) : QObject(parent)
{
}

QString QmlHelpers::htmlColor(const QColor &color)
{
    if (color.alpha() == 255) {
        return color.name();
    }

    // name() returns color without alpha channel, so if it's other than
    // opaque, we need to inject the alpha value into the name.
    //const QString name = color.name() + QByteArray::number(color.alpha(), 16);
    QString name = color.name();
    name.insert(1, QByteArray::number(color.alpha(), 16));
    return name;
}
