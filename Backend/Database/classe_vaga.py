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
            e.nome AS empresa_nome,  -- Nome da empresa adicionado
            COUNT(DISTINCT si.email_aluno) AS numero_inscritos,
            STRING_AGG(DISTINCT hv.habilidade, ', ') AS requisitos
        FROM 
            vaga v
        LEFT JOIN 
            empresa e ON v.empresa = e.nome  -- Aqui, já estamos fazendo o join correto
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
            filtros.append(f"LOWER(e.nome) LIKE '%{empresa.lower()}%'")  
        
        if filtros:
            query += " WHERE " + " AND ".join(filtros)
        
        query += """
        GROUP BY 
            v.id, v.nome, v.descricao, e.localizacao, e.nome  
        ORDER BY 
            v.nome ASC  
        """
        
        return self.db.execute_select_all(query)


    def get_numero_vagas(self) -> int:
        query = "SELECT COUNT(*) FROM vaga"
        result = self.db.execute_select_one(query)
        return result['count']
    
    def get_vagas_inscritas_por_aluno(self, email_aluno: str, vaga_nome: str = "", empresa_nome: str = "", vaga_id=None):
        aluno_query = f"""
        SELECT nome AS aluno_nome
        FROM aluno
        WHERE email = '{email_aluno}'
        """
        aluno_nome = self.db.execute_select_one(aluno_query)['aluno_nome']

        vagas_query = f"""
        SELECT 
            v.id AS vaga_id, 
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
            vaga v ON si.id_vaga = v.id
        LEFT JOIN 
            empresa e ON v.empresa = e.nome
        LEFT JOIN 
            habilidade_vaga hv ON v.id = hv.id_vaga
        WHERE 
            si.email_aluno = '{email_aluno}'
        """
        
        if vaga_nome:
            vagas_query += f" AND LOWER(v.nome) LIKE '%{vaga_nome.lower()}%'"
        
        if empresa_nome:
            vagas_query += f" AND LOWER(e.nome) LIKE '%{empresa_nome.lower()}%'"
        
        vagas_query += """
        GROUP BY 
            v.id, v.nome, e.nome, e.localizacao
        """
        
        vagas_inscritas = self.db.execute_select_all(vagas_query)

        return {"aluno_nome": aluno_nome, "vagas_inscritas": vagas_inscritas}




