#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "database.h"
#include "listmodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Подключаемся к базе данных
    DataBase database;
    database.openDataBase();

    // Объявляем и инициализируем модель данных
    ListModel *model = new ListModel();

    // Обеспечиваем доступ к модели и классу для работы с базой данных из QML
    engine.rootContext()->setContextProperty("myModel", model);
    engine.rootContext()->setContextProperty("database", &database);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
