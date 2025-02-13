import mysql.connector

dbconfig = {  # для mysql порт по умолчанию 3306
    'host': 'ich-edit.edu.itcareerhub.de',
    'user': 'ich1',
    'password': 'ich1_password_ilovedbs',
    'database': 'ich_edit'
}

connector = mysql.connector.connect(**dbconfig)
# print(connector)
cursor = connector.cursor()
cursor.execute("SELECT * FROM Users")
users_data = cursor.fetchall()  # [(1, Alice, 25), ...]

for user in users_data:
    print(user)  # user ==> (1, Alice, 25)

cursor.close()
connector.close()


