CREATE TYPE tipoAula AS ENUM ('video', 'texto');

DROP TABLE Aluno CASCADE;
DROP TABLE Professor CASCADE;
DROP TABLE Curso CASCADE;
DROP TABLE Modulo CASCADE;
DROP TABLE Aula CASCADE;
DROP TABLE Vaga CASCADE;
DROP TABLE Empresa CASCADE;
DROP TABLE Estudam CASCADE;
DROP TABLE Ministram CASCADE;
DROP TABLE Se_qualificam CASCADE;
DROP TABLE Oferecem CASCADE;

-- Tabela Aluno
CREATE TABLE Aluno (
	email VARCHAR(100) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    status_plano VARCHAR(50)
);

-- Tabela Professor
CREATE TABLE Professor (
    nome VARCHAR(100) PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    especializacao VARCHAR(100),
    feedback_dos_alunos TEXT
);

-- Tabela Curso
CREATE TABLE Curso (
    nome VARCHAR(100) PRIMARY KEY,
    descricao TEXT,
    duracao INT,
    nivel VARCHAR(50),
    data_lancamento DATE
);

-- Tabela Modulo
CREATE TABLE Modulo (
    nome_curso VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT,
    ordem_dentro_curso INT,
    FOREIGN KEY (nome_curso) REFERENCES Curso(nome)
);

-- Tabela Aula
CREATE TABLE Aula (
    nome_modulo VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT,
    duracao INT,
    tipo tipoAula,
    ordem_dentro_modulo INT,
    FOREIGN KEY (nome_modulo) REFERENCES Modulo(nome)
);

-- Tabela Vaga
CREATE TABLE Vaga (
    id_vaga INT PRIMARY KEY,
    descricao TEXT,
    habilidades_necessarias TEXT,
    certificacoes_necessarias TEXT
);

-- Tabela Empresa
CREATE TABLE Empresa (
    nome VARCHAR(100) PRIMARY KEY,
    localizacao VARCHAR(100),
    setor VARCHAR(50)
);

-- Tabela de Relacionamento Estudam (Aluno-Curso)
CREATE TABLE Estudam (
    email_aluno VARCHAR(100),
    nome_curso VARCHAR(100),
    data_conclusao DATE,
    nota DECIMAL(5, 2),
    PRIMARY KEY (email_aluno, nome_curso),
    FOREIGN KEY (email_aluno) REFERENCES Aluno(email),
    FOREIGN KEY (nome_curso) REFERENCES Curso(nome)
);

-- Tabela de Relacionamento Ministram (Professor-Curso)
CREATE TABLE Ministram (
    nome_professor VARCHAR(100),
    nome_curso VARCHAR(100),
    PRIMARY KEY (nome_professor, nome_curso),
    FOREIGN KEY (nome_professor) REFERENCES Professor(nome),
    FOREIGN KEY (nome_curso) REFERENCES Curso(nome)
);

-- Tabela de Relacionamento Se_qualificam (Aluno-Vaga)
CREATE TABLE Se_qualificam (
    email_aluno VARCHAR(100),
    id_vaga INT,
    PRIMARY KEY (email_aluno, id_vaga),
    FOREIGN KEY (email_aluno) REFERENCES Aluno(email),
    FOREIGN KEY (id_vaga) REFERENCES Vaga(id_vaga)
);

-- Tabela de Relacionamento Oferecem (Empresa-Vaga)
CREATE TABLE Oferecem (
    nome_empresa VARCHAR(100),
    id_vaga INT,
    PRIMARY KEY (nome_empresa, id_vaga),
    FOREIGN KEY (nome_empresa) REFERENCES Empresa(nome),
    FOREIGN KEY (id_vaga) REFERENCES Vaga(id_vaga)
);
