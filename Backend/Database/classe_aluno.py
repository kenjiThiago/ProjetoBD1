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
