from Database.conector import DatabaseManager

class Empresa():
    def __init__(self, db_provider = DatabaseManager()) -> None:
        self.db = db_provider
    
    def get_empresas(self, nome: str = "", setor: str = "", localizacao: str = ""):
        
        query = "SELECT * FROM empresa"
        filtros = []
        
        if nome:
            filtros.append(f"LOWER(nome) LIKE '%{nome.lower()}%'")

        if setor:
            filtros.append(f"LOWER(setor) LIKE '%{setor.lower()}%'")

        if localizacao:
            filtros.append(f"LOWER(localizacao) LIKE '%{localizacao.lower()}%'")
        
        if filtros:
            query += " WHERE " + " AND ".join(filtros)
        
        return self.db.execute_select_all(query)
    
    def get_numero_empresas(self) -> int:
        query = "SELECT COUNT(*) FROM empresa"
        result = self.db.execute_select_one(query)
        return result['count']