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

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "dataprovider.h"

#include "utils/helpers.h"
#include "utils/qmlhelpers.h"

/*!
  Main routine. Remember to update the application name and initialise logger
  class, if present.
  */
int main(int argc, char *argv[]) {
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    app.setApplicationName("charts-showcase-example");

    QQmlApplicationEngine engine;

    auto qmlHelpers = new QmlHelpers(&engine);
    engine.rootContext()->setContextProperty("qmlHelpers", qmlHelpers);

    auto dataProvider = new DataProvider(&engine);
    engine.rootContext()->setContextProperty("dataProvider", dataProvider);

    engine.addImportPath("qrc:/mcharts");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    CHECK(QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                           &app, [url](QObject *obj, const QUrl &objUrl) {
              if (!obj && url == objUrl)
              QCoreApplication::exit(-1);
          }, Qt::QueuedConnection));
    engine.load(url);

    return app.exec();
}
