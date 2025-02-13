import mysql.connector

dbconfig = {'host': 'ich-edit.edu.itcareerhub.de',
            'user': 'ich1',
            'password': 'ich1_password_ilovedbs',
            'database': 'ich_edit'}
connection = mysql.connector.connect(**dbconfig)
print(connection)