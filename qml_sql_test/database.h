#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>


// Первая колонка содержит Autoincrement ID

class DataBase : public QObject
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();
    /* Методы для непосредственной работы с классом
     * Подключение к базе данных и вставка записей в таблицу
     * */
    bool openDataBase();        // Открытие базы данных


private:
    /* Внутренние методы для работы с базой данных
     * */
    void closeDataBase();       // Закрытие базы данных
    bool createTable();         // Создание базы таблицы в базе данных

signals:
    void sendInfo(QString text);

public slots:
    bool inserIntoTable(const QVariantList &data);      // Добавление записей в таблицу
    bool inserIntoTable(const QString &fname, const QString &sname, const QString &nik);
    bool removeRecord(const int id); // Удаление записи из таблицы по её id
};

#endif // DATABASE_H
