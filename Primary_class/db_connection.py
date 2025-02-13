# 1) Реализовать класс DBConnector для установки подключения к MySQL и корректного закрытия соединения.
#
# 2) Создать класс QueryHandler с методами для выполнения запросов к таблицам (User, News, Role, Comments) без избыточной диспетчеризации.
#
# 3) Реализовать функцию run_query, принимающую название таблицы и действие, которая посредством словаря выбирает нужный метод из QueryHandler, выполняет запрос
#
# 4) Обеспечить модульность, масштабируемость и простоту расширения кода для добавления новых операций.


import pymysql


# dbconfig = {'host': 'ich-edit.edu.itcareerhub.de',
#             'user': 'ich1',
#             'password': 'ich1_password_ilovedbs',
#             'database': 'ich_edit'}

# dbconfig = {
#             'host': 'ich-edit.edu.itcareerhub.de',
#             'user': 'ich1',
#             'password': 'ich1_password_ilovedbs',
#             'database': '160924_social_blogs',
#             'charset': 'utf8mb4',
#         'cursorclass': DictCursor
#         }

class DBConnector:

    def __init__(self, dbconfig: dict):
        self._dbconfig = dbconfig
        self._connection = self._set_connection()
        self._cursor = self._set_cursor()

    def _set_connection(self):
        connecion = pymysql.connect(**self._dbconfig)
        return connecion

    def _set_cursor(self):
        cursor = self._connection.cursor()
        return cursor

    def get_connection(self):
        return self._connection

    def get_cursor(self):
        return self._cursor

    def close(self):
        if self._connection.open:
            self._cursor.close()
            self._connection.close()