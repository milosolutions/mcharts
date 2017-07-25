TEMPLATE = app

QT += qml quick
CONFIG += c++11

# include MiloCharts
include(../mcharts.pri)

SOURCES += main.cpp \
    dataprovider.cpp

RESOURCES += qml.qrc

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    dataprovider.h
