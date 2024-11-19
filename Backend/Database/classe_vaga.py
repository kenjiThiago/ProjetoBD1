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
    
    def get_vagas_inscritas_por_aluno(self, email_aluno: str, vaga_nome: str = "", empresa_nome: str = ""):
        query = f"""
        SELECT 
            a.nome AS aluno_nome,
            v.nome AS vaga_nome,
            e.nome AS empresa_nome,
            e.localizacao,
            (
                SELECT COUNT(*) 
                FROM se_inscreve si_sub 
                WHERE si_sub.id_vaga = v.id
            ) AS numero_inscritos, -- Contagem de todos os inscritos na vaga
            STRING_AGG(hv.habilidade, ', ') AS requisitos
        FROM 
            se_inscreve si
        INNER JOIN 
            aluno a ON si.email_aluno = a.email
        INNER JOIN 
            vaga v ON si.id_vaga = v.id
        LEFT JOIN 
            empresa e ON v.empresa = e.nome
        LEFT JOIN 
            habilidade_vaga hv ON v.id = hv.id_vaga
        WHERE 
            si.email_aluno = '{email_aluno}'
        """
        
        if vaga_nome:
            query += f" AND LOWER(v.nome) LIKE '%{vaga_nome.lower()}%'"
        
        if empresa_nome:
            query += f" AND LOWER(e.nome) LIKE '%{empresa_nome.lower()}%'"
        
        query += """
        GROUP BY 
            a.nome, v.nome, e.nome, e.localizacao, v.id
        """
        
        return self.db.execute_select_all(query)



