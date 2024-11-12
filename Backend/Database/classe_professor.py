from Database.conector import DatabaseManager

class Professor():
    def __init__(self, db_provider = DatabaseManager()) -> None:
        self.db = db_provider
    
    def get_professores(self, nome: str = "", especializacao: str = "", email: str = ""):
        
        query = "SELECT * FROM professor"
        filtros = []
        
        if nome:
            filtros.append(f"LOWER(nome) LIKE '%{nome.lower()}%'")
        
        if especializacao:
            filtros.append(f"LOWER(especializacao) LIKE '%{especializacao.lower()}%'")
        
        if email:
            filtros.append(f"LOWER(email) LIKE '%{email.lower()}%'")
        
        if filtros:
            query += " WHERE " + " AND ".join(filtros)
        
        return self.db.execute_select_all(query)

    def get_professores(self):
        query = "SELECT * FROM professor"
        return self.db.execute_select_all(query)