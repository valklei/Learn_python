

# В базе данных ich_edit три таблицы. Users с полями (id, name, age),
# Products с полями (pid, prod, quantity) и Sales с полями (sid, id, pid).
# Программа должна запросить у пользователя название таблицы и вывести все ее строки или сообщение,
# что такой таблицы нет.

import mysql.connector
import mysql
from mysql.connector import Error


try:
    dbconfig = {
        'host': 'ich-edit.edu.itcareerhub.de',
        'user': 'ich1',
        'password': 'ich1_password_ilovedbs',
        'database': 'ich_edit'

    }

    connector = mysql.connector.connect(**dbconfig)
    cursor = connector.cursor()

    tables = ["Users", "Products", "Sales"]
    table_name = input("Enter table name (Users, Products or Sales): ").strip().capitalize()


    def info_from_tables(cursor, table):
        query = "SELECT * FROM %s" % table

        cursor.execute(query)
        results = cursor.fetchall()

        return results

    if table_name not in tables:
        print("Table not found")
    else:
        print(f"Data from {table_name}:")
        res = info_from_tables(cursor, table_name)
        column_names = [description[0] for description in cursor.description]
        print(f"{column_names}")
        for row in res:
            print(row)


except Error as e:
    print("Wrong connection", e)
finally:
    if "connector" in locals() :
        cursor.close()
        connector.close()