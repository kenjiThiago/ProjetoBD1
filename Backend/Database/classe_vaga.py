from Database.conector import DatabaseManager

class Vaga():
    def __init__(self, db_provider=DatabaseManager()) -> None:
        self.db = db_provider

    def get_vagas(self, id: int = None, nome: str = "", empresa: str = ""):
        query = """
        SELECT 
            v.id,
            v.nome AS vaga_nome,
            v.descricao,
            e.localizacao,
            COUNT(DISTINCT si.email_aluno) AS numero_inscritos,
            STRING_AGG(DISTINCT hv.habilidade, ', ') AS requisitos
        FROM 
            vaga v
        LEFT JOIN 
            empresa e ON v.empresa = e.nome
        LEFT JOIN 
            se_inscreve si ON v.id = si.id_vaga
        LEFT JOIN 
            habilidade_vaga hv ON v.id = hv.id_vaga
        """
        
        filtros = []
        
        if id is not None:
            filtros.append(f"v.id = {id}")
        if nome:
            filtros.append(f"LOWER(v.nome) LIKE '%{nome.lower()}%'")
        if empresa:
            filtros.append(f"LOWER(v.empresa) LIKE '%{empresa.lower()}%'")
        
        if filtros:
            query += " WHERE " + " AND ".join(filtros)
        
        query += """
        GROUP BY 
            v.id, v.nome, v.descricao, e.localizacao
        """
        
        return self.db.execute_select_all(query)

    def get_numero_vagas(self) -> int:
        query = "SELECT COUNT(*) FROM vaga"
        result = self.db.execute_select_one(query)
        return result['count']
