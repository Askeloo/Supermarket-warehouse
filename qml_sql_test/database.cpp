#include "database.h"
#include <QMessageBox>

DataBase::DataBase(QObject *parent) : QObject(parent)
{

}

DataBase::~DataBase()
{

}



/* Метод для открытия базы данных
 * */
bool DataBase::openDataBase()
{
    static QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");

    db.setConnectOptions();
    QString serverName = "DESKTOP-OP1LROT";
    QString dbName = "Supermarket_warehouse";

    QString connectionString =  QString("DRIVER={ODBC Driver 17 for SQL Server};Server=%1;Database=%2;Trusted_Connection=Yes;").arg(serverName).arg(dbName);

    db.setDatabaseName(connectionString);

    if(db.open()){
        return true;
    } else {
        return false;
    }
}


/* Метод для вставки записи в базу данных
 * */
bool DataBase::inserIntoTable(const QVariantList &data)
{
    /* Запрос SQL формируется из QVariantList,
     * в который передаются данные для вставки в таблицу.
     * */
    QSqlQuery query;
    /* В начале SQL запрос формируется с ключами,
     * которые потом связываются методом bindValue
     * для подстановки данных из QVariantList
     * */
    query.prepare("INSERT INTO Warehouse ( product_id, warehouse_info_id, amount ) "
                  "VALUES (:FName, :SName, :Nik)");
    query.bindValue(":FName",       data[0].toInt());
    query.bindValue(":SName",       data[1].toInt());
    query.bindValue(":Nik",         data[2].toInt());

    // После чего выполняется запросом методом exec()
    if(!query.exec()){
        emit sendInfo(query.lastError().text());
        return false;
    } else {
        return true;
    }
}

/* Второй метод для вставки записи в базу данных
 * */
bool DataBase::inserIntoTable(const QString &fname, const QString &sname, const QString &nik)
{
    QVariantList data;
    data.append(fname);
    data.append(sname);
    data.append(nik);

    if(inserIntoTable(data))
        return true;
    else
        return false;
}

/* Метод для удаления записи из таблицы
 * */
bool DataBase::removeRecord(const int id)
{
    // Удаление строки из базы данных будет производитсья с помощью SQL-запроса
    QSqlQuery query;

    // Удаление производим по id записи, который передается в качестве аргумента функции
    query.prepare("DELETE FROM Warehouse WHERE product_id= :ID ;");
    query.bindValue(":ID", id);

    // Выполняем удаление
    if(!query.exec()){
        qDebug() << "error delete row " << "Warehouse";
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}
