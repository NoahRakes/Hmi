#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtCore/QDir>
#include <QQmlEngine>
#include <Qt3DQuickExtras/qt3dquickwindow.h>


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
