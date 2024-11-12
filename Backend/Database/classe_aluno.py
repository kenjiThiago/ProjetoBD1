from Database.conector import DatabaseManager

class Aluno():
    def __init__(self, db_provider = DatabaseManager()) -> None:
        self.db = db_provider
    
    def get_alunos(self, nome: str = "", status_plano: str = "", email: str = ""):
        
        query = "SELECT * FROM aluno"
        filtros = []

        if nome:
            filtros.append(f"LOWER(nome) LIKE '%{nome.lower()}%'")
        
        if status_plano:
            filtros.append(f"LOWER(status_plano) = '{status_plano.lower()}'")

        if email:
            filtros.append(f"LOWER(email) LIKE '%{email.lower()}%'")
        
        if filtros:
            query += " WHERE " + " AND ".join(filtros)

        return self.db.execute_select_all(query)

    def count_ativos(self) -> int:
        query = "SELECT COUNT(*) as count FROM aluno WHERE status_plano = 'ativo'"
        result = self.db.execute_select_one(query)
        return result['count']  
    
    def count_inativos(self) -> int:
        query = "SELECT COUNT(*) as count FROM aluno WHERE status_plano = 'inativo'"
        result = self.db.execute_select_one(query)
        return result['count']  