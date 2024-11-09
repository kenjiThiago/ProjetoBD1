from Database.conector import DatabaseManager

class Aluno():
    def __init__(self, db_provider = DatabaseManager()) -> None:
        self.db = db_provider
    
    def get_alunos(self):
        query = "SELECT * FROM aluno"
        return self.db.execute_select_all(query)
    
    def get_numero_alunos(self) -> int:
        query = "SELECT COUNT(*) FROM aluno"
        result = self.db.execute_select_one(query)
        return result['count']
    
    def get_ativos(self):
        query = "SELECT COUNT(*) as count FROM aluno WHERE status_plano = 'ativo'"
        result = self.db.execute_select_one(query)
        return result['count']
    
    def get_inativos(self):
        query = "SELECT COUNT(*) as count FROM aluno WHERE status_plano = 'inativo'"
        result = self.db.execute_select_one(query)
        return result['count']