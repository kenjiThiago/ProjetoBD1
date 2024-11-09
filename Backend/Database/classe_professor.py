from Database.conector import DatabaseManager

class Professor():
    def __init__(self, db_provider = DatabaseManager()) -> None:
        self.db = db_provider
    
    def get_professores(self):
        query = "SELECT * FROM professor"
        return self.db.execute_select_all(query)
    