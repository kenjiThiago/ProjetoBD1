"Camada que gerencia o Database"
from typing import Any
import psycopg2
from psycopg2.extras import DictCursor
from flask import Flask, jsonify

class DatabaseManager:
    "Classe de Gerenciamento do database"

    def __init__(self) -> None:
        self.conn = psycopg2.connect(
            dbname="trabalhobd",
            user="postgres",
            password="1234",
            host="127.0.0.1",
            port=5432,
        )
        self.cursor = self.conn.cursor(cursor_factory=DictCursor)

    def execute_statement(self, statement: str) -> None:
        "Usado para Inserções, Deleções, Alter Tables"
        self.cursor.execute(statement)
        self.conn.commit()

    def execute_select_all(self, query: str) -> list[dict[str, Any]]:
        "Usado para SELECTS no geral"
        self.cursor.execute(query)
        return [dict(item) for item in self.cursor.fetchall()]

    def execute_select_one(self, query: str) -> dict | None:
        "Usado para SELECT com apenas uma linha de resposta"
        self.cursor.execute(query)
        query_result = self.cursor.fetchone()

        if not query_result:
            return None

        return dict(query_result)