TEMPLATE = app

QT = core gui qml quick
CONFIG += c++17

# include MiloCharts
include(../../mcharts.pri)

SOURCES += main.cpp \
    dataprovider.cpp \
    ../utils/qmlhelpers.cpp

RESOURCES += qml.qrc

INCLUDEPATH = ../

HEADERS += \
    dataprovider.h \
    ../utils/helpers.h \
    ../utils/qmlhelpers.h
