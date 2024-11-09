from Database.conector import DatabaseManager

class Empresa():
    def __init__(self, db_provider = DatabaseManager()) -> None:
        self.db = db_provider
    
    def get_empresas(self):
        query = "SELECT * FROM empresa"
        return self.db.execute_select_all(query)
    
    def get_numero_empresas(self) -> int:
        query = "SELECT COUNT(*) FROM empresa"
        result = self.db.execute_select_one(query)
        return result['count']