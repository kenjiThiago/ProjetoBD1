from Database.conector import DatabaseManager

class Curso():
    def __init__(self, db_provider = DatabaseManager()) -> None:
        self.db = db_provider
    
    def get_cursos(self):
        query = "SELECT * FROM curso"
        return self.db.execute_select_all(query)
    
    def get_numero_cursos(self) -> int:
        query = "SELECT COUNT(*) FROM curso"
        result = self.db.execute_select_one(query)
        return result['count']