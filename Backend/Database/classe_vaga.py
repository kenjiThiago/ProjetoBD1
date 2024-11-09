from Database.conector import DatabaseManager

class Vaga():
    def __init__(self, db_provider = DatabaseManager()) -> None:
        self.db = db_provider
    
    def get_vagas(self):
        query = "SELECT * FROM vaga"
        return self.db.execute_select_all(query)
    
    def get_numero_vagas(self) -> int:
        query = "SELECT COUNT(*) FROM vaga"
        result = self.db.execute_select_one(query)
        return result['count']