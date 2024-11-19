from Database.conector import DatabaseManager

class Curso():
    def __init__(self, db_provider = DatabaseManager()) -> None:
        self.db = db_provider
    
    def get_cursos(self, nome: str = "", duracao: int = None, nivel: str = ""):
        query = """
        SELECT 
            c.nome,
            c.descricao,
            c.duracao,
            c.nivel,
            TO_CHAR(c.data_lancamento, 'DD/MM/YYYY') AS data_lancamento,
            COUNT(e.email_aluno) AS numero_alunos_concluidos
        FROM 
            curso c
        LEFT JOIN 
            estuda e ON c.nome = e.nome_curso AND e.data_conclusao IS NOT NULL
        """
        
        filtros = []

        if nome:
            filtros.append(f"LOWER(c.nome) LIKE '%{nome.lower()}%'")
        
        if duracao is not None:
            filtros.append(f"c.duracao = {duracao}")
        
        if nivel:
            filtros.append(f"LOWER(c.nivel) = '{nivel.lower()}'")
        
        if filtros:
            query += " WHERE " + " AND ".join(filtros)

        query += """
        GROUP BY 
            c.nome, c.descricao, c.duracao, c.nivel, c.data_lancamento
        """
    
        return self.db.execute_select_all(query)


    def get_numero_cursos(self) -> int:
        query = "SELECT COUNT(*) FROM curso"
        result = self.db.execute_select_one(query)
        return result['count']
