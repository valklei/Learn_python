
import pymysql
from pymysql.cursors import DictCursor
from db_queries import QueryHandler

dbconfig = {
            'host': 'ich-edit.edu.itcareerhub.de',
            'user': 'ich1',wewe
            'password': 'ich1_password_ilovedbs',
            'database': '160924_social_blogs',
            'charset': 'utf8mb4',
        'cursorclass': DictCursor
        }

def main(dbconfig, table_name: str, action: str, **params):
    query_handler = QueryHandler(dbconfig)
    dict_actions = {
        ("Role","get_all_roles"): query_handler.get_all_roles,
        ("Role", "get_role_id_by_name"): query_handler.get_role_id_by_name
    }
    try:
        key = (table_name.capitalize(), action.lower())
        if dict_actions.get(key):
           result = dict_actions.get(key)(**params)
           return result
        return "Действие или таблицы не существует!"
    except pymysql.Error as e:
        print( "SQLError", e )
    except Exception as e:
        print("Error", e)
res_all_roles = main(dbconfig, "Role", "get_all_roles")
res_id_roles = main(dbconfig, "Role", "get_role_id_by_name", name_role="admin")
res_id_roles1 = main(dbconfig, "Role", "get_role_id_by_name1", name_role="admin")

print(res_all_roles)
print(res_id_roles)
print(res_id_roles1)