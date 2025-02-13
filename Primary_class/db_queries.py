from db_connection import DBConnector

class QueryHandler(DBConnector):
    def __init__(self, dbconfig):
        super().__init__(dbconfig)

    def get_all_roles(self):
        cursor = self.get_cursor()
        cursor.execute("select * from Role")
        records = cursor.fetchall()
        return records

    def get_role_id_by_name(self, name_role: str):
        cursor = self.get_cursor()
        cursor.execute("select id from Role where name = %s", (name_role,))
        records = cursor.fetchone()
        if records:
            return records
        return None