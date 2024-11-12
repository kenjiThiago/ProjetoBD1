from Database.conector import DatabaseManager

class Curso():
    def __init__(self, db_provider = DatabaseManager()) -> None:
        self.db = db_provider
    
    def get_cursos(self, nome: str = "", duracao: int = None, nivel: str = ""):
        
        query = "SELECT * FROM curso"
        filtros = []

        if nome:
            filtros.append(f"LOWER(nome) LIKE '%{nome.lower()}%'")
        
        if duracao is not None:
            filtros.append(f"duracao = {duracao}")
        
        if nivel:
            filtros.append(f"LOWER(nivel) = '{nivel.lower()}'")
        
        if filtros:
            query += " WHERE " + " AND ".join(filtros)

        return self.db.execute_select_all(query)
