from Database.conector import DatabaseManager

class Vaga():
    def __init__(self, db_provider = DatabaseManager()) -> None:
        self.db = db_provider

    def get_vagas(self, id: int = None, nome: str = "", empresa: str = ""):
        
        query = "SELECT * FROM vaga"
        filtros = []
        
        if id is not None:
            filtros.append(f"id = {id}")
        if nome:
            filtros.append(f"LOWER(nome) LIKE '%{nome.lower()}%'")
        if empresa:
            filtros.append(f"LOWER(empresa) LIKE '%{empresa.lower()}%'")
        
        if filtros:
            query += " WHERE " + " AND ".join(filtros)
        
        return self.db.execute_select_all(query)
    
    def get_numero_vagas(self) -> int:
        query = "SELECT COUNT(*) FROM vaga"
        result = self.db.execute_select_one(query)
        return result['count']