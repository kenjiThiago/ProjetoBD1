CREATE TYPE TIPOAULA AS ENUM ('video', 'texto');

-- Tabela Aluno
CREATE TABLE Aluno (
    email           VARCHAR(100)    PRIMARY KEY,
    nome            VARCHAR(100)    NOT NULL,
    data_nascimento DATE,
    status_plano    VARCHAR(50)
);

-- Tabela Professor
CREATE TABLE Professor (
    email           VARCHAR(100)    PRIMARY KEY,
    nome            VARCHAR(100)    NOT NULL,
    especializacao  VARCHAR(100)
);

-- Tabela Curso
CREATE TABLE Curso (
    nome            VARCHAR(100)    PRIMARY KEY,
    descricao       TEXT,
    duracao         INT,
    nivel           VARCHAR(50),
    data_lancamento DATE
);

-- Tabela Modulo
CREATE TABLE Modulo (
    nome_curso          VARCHAR(100)    NOT NULL,
    nome                VARCHAR(100)    PRIMARY KEY,
    descricao           TEXT,
    ordem_dentro_curso  INT,

    FOREIGN KEY (nome_curso)    REFERENCES Curso(nome)
);

-- Tabela Aula
CREATE TABLE Aula (
    nome_modulo         VARCHAR(100)    NOT NULL,
    nome                VARCHAR(100)    PRIMARY KEY,
    descricao           TEXT,
    duracao             INT,
    tipo                TIPOAULA,
    ordem_dentro_modulo INT,

    FOREIGN KEY (nome_modulo)   REFERENCES Modulo(nome)
);

-- Tabela Empresa
CREATE TABLE Empresa (
    nome        VARCHAR(100)    PRIMARY KEY,
    localizacao VARCHAR(100),
    setor       VARCHAR(50)
);

-- Tabela Vaga
CREATE TABLE Vaga (
    id          INT         PRIMARY KEY,
    descricao   TEXT,
    empresa     VARCHAR(100),

    FOREIGN KEY (empresa)   REFERENCES Empresa(nome)
);

-- Tabela de Relacionamento Estudam (Aluno-Curso)
CREATE TABLE Estuda (
    email_aluno     VARCHAR(100),
    nome_curso      VARCHAR(100),
    data_conclusao  DATE,
    nota            DECIMAL(5, 2),

    PRIMARY KEY (email_aluno, nome_curso),
    FOREIGN KEY (email_aluno)   REFERENCES Aluno(email),
    FOREIGN KEY (nome_curso)    REFERENCES Curso(nome)
);

-- Tabela de Relacionamento Ministram (Professor-Curso)
CREATE TABLE Ministra (
    email_professor VARCHAR(100),
    nome_curso      VARCHAR(100),

    PRIMARY KEY (email_professor, nome_curso),
    FOREIGN KEY (email_professor)   REFERENCES Professor(email),
    FOREIGN KEY (nome_curso)        REFERENCES Curso(nome)
);

-- Tabela de Relacionamento Se_qualificam (Aluno-Vaga)
CREATE TABLE Se_Qualifica (
    email_aluno VARCHAR(100),
    id_vaga     INT,

    PRIMARY KEY (email_aluno, id_vaga),
    FOREIGN KEY (email_aluno)   REFERENCES Aluno(email),
    FOREIGN KEY (id_vaga)       REFERENCES Vaga(id)
);

--Tabela Habilidade_Vaga
CREATE TABLE Habilidade_Vaga (
    id_vaga     INT,
    habilidade  VARCHAR(50),

    PRIMARY KEY (id_vaga, habilidade),
    FOREIGN KEY (id_vaga)   REFERENCES Vaga(id)
);

INSERT INTO Aluno (email, nome, data_nascimento, status_plano) VALUES
('joaosilva@gmail.com',         'João Silva',           '2000-03-15', 'ativo'),
('mariaoliveira@hotmail.com',   'Maria Oliveira',       '1999-08-22', 'inativo'),
('pedrocosta@gmail.com',        'Pedro Costa',          '2001-11-05', 'ativo'),
('anasantos@gmail.com',         'Ana Santos',           '2000-01-12', 'ativo'),
('lucaspereira@hotmail.com',    'Lucas Pereira',        '1998-09-30', 'inativo'),
('beatrizrodrigues@gmail.com',  'Beatriz Rodrigues',    '1997-07-20', 'ativo'),
('rafaelalmeida@gmail.com',     'Rafael Almeida',       '2002-02-27', 'ativo'),
('fernandalima@hotmail.com',    'Fernanda Lima',        '1996-10-10', 'inativo'),
('gabrielferreira@gmail.com',   'Gabriel Ferreira',     '2000-06-18', 'ativo'),
('julianasousa@gmail.com',      'Juliana Sousa',        '2001-03-03', 'ativo'),
('andremoreira@hotmail.com',    'André Moreira',        '1999-12-22', 'inativo'),
('carolinafernandes@gmail.com', 'Carolina Fernandes',   '1998-08-15', 'ativo'),
('tiagocardoso@hotmail.com',    'Tiago Cardoso',        '2002-04-14', 'inativo'),
('amandasouza@gmail.com',       'Amanda Souza',         '1997-11-29', 'ativo'),
('brunomarques@hotmail.com',    'Bruno Marques',        '1995-01-19', 'inativo'),
('larissarocha@gmail.com',      'Larissa Rocha',        '2001-05-09', 'ativo'),
('carlosnascimento@gmail.com',  'Carlos Nascimento',    '1996-09-25', 'ativo'),
('patriciadias@hotmail.com',    'Patrícia Dias',        '1999-07-07', 'inativo'),
('renatomartins@gmail.com',     'Renato Martins',       '2002-12-31', 'ativo'),
('vanessacampos@gmail.com',     'Vanessa Campos',       '2000-02-11', 'ativo');

INSERT INTO Professor (nome, email, especializacao) VALUES
('Marcos Silva',        'marcossilva@gmail.com',        'Desenvolvimento Web'),
('Luciana Almeida',     'lucianaalmeida@hotmail.com',   'Desenvolvimento Mobile'),
('Carlos Santos',       'carlossantos@gmail.com',       'Data Science'),
('Patrícia Oliveira',   'patriciaoliveira@hotmail.com', 'Inteligência Artificial'),
('Roberto Pereira',     'robertopereira@gmail.com',     'DevOps'),
('Fernanda Costa',      'fernandacosta@hotmail.com',    'UX/UI Design'),
('Ana Souza',           'anasouza@gmail.com',           'Cybersecurity'),
('Bruno Rocha',         'brunorocha@hotmail.com',       'Banco de Dados'),
('Débora Nunes',        'deboranunes@gmail.com',        'Engenharia de Software'),
('Felipe Cardoso',      'felipecardoso@hotmail.com',    'Arquitetura de Software'),
('Gabriela Mendes',     'gabrielamendes@gmail.com',     'Desenvolvimento de Jogos'),
('João Fernandes',      'joaofernandes@hotmail.com',    'Cloud Computing'),
('Camila Ribeiro',      'camilaribeiro@gmail.com',      'Redes de Computadores'),
('Renato Carvalho',     'renatocarvalho@hotmail.com',   'Machine Learning'),
('Isabela Martins',     'isabelamartins@gmail.com',     'Processamento de Dados'),
('Lucas Moreira',       'lucasmoreira@hotmail.com',     'Segurança de Redes'),
('Larissa Batista',     'larissabatista@gmail.com',     'Big Data'),
('Paulo Barreto',       'paulobarreto@hotmail.com',     'Blockchain'),
('Vanessa Silva',       'vanessasilva@gmail.com',       'Computação em Nuvem'),
('Rodrigo Monteiro',    'rodrigomonteiro@hotmail.com',  'Análise de Dados');

INSERT INTO Curso (nome, descricao, duracao, nivel, data_lancamento) VALUES
('Desenvolvimento Web Completo',            'Aprenda a criar sites e aplicações web do zero.',              120,    'Avançado',         '2024-01-15'),
('Introdução ao Desenvolvimento Mobile',    'Curso básico de desenvolvimento para Android e iOS.',          80,     'Iniciante',        '2024-02-01'),
('Data Science com Python',                 'Análise de dados e machine learning utilizando Python.',       100,    'Intermediário',    '2024-02-20'),
('Fundamentos de Inteligência Artificial',  'Entenda os princípios e técnicas de IA.',                      60,     'Intermediário',    '2024-03-05'),
('DevOps para Iniciantes',                  'Introdução às práticas de DevOps e automação de processos.',   90,     'Iniciante',        '2024-03-15'),
('UX/UI Design na Prática',                 'Criação de interfaces intuitivas e experiências de usuário.',  70,     'Intermediário',    '2024-04-10'),
('Segurança da Informação',                 'Curso sobre princípios de segurança em TI.',                   80,     'Avançado',         '2024-04-25'),
('Banco de Dados com SQL',                  'Aprenda a modelar e gerenciar bancos de dados relacionais.',   90,     'Iniciante',        '2024-05-10'),
('Engenharia de Software',                  'Metodologias ágeis e gestão de projetos de software.',         110,    'Intermediário',    '2024-05-20'),
('Arquitetura de Software',                 'Entenda como estruturar software de maneira eficaz.',          100,    'Avançado',         '2024-06-01'),
('Desenvolvimento de Jogos',                'Criação de jogos 2D e 3D com Unity.',                          130,    'Avançado',         '2024-06-15'),
('Cloud Computing para Iniciantes',         'Conceitos básicos sobre computação em nuvem.',                 70,     'Iniciante',        '2024-07-01'),
('Redes de Computadores',                   'Aprenda sobre configuração e gestão de redes.',                80,     'Intermediário',    '2024-07-15'),
('Machine Learning com R',                  'Introdução ao machine learning usando a linguagem R.',         90,     'Intermediário',    '2024-08-01'),
('Processamento de Dados com Apache Spark', 'Aprenda a processar grandes volumes de dados.',                110,    'Avançado',         '2024-08-15'),
('Blockchain: Fundamentos e Aplicações',    'Entenda como funciona a tecnologia blockchain.',               80,     'Intermediário',    '2024-09-01'),
('Análise de Dados com Excel',              'Ferramentas de análise de dados usando Excel.',                70,     'Iniciante',        '2024-09-15'),
('Automação de Testes',                     'Técnicas e ferramentas para automação de testes de software.', 90,     'Avançado',         '2024-10-01'),
('Programação para Iniciantes',             'Aprenda os conceitos básicos de programação.',                 80,     'Iniciante',        '2024-10-15'),
('Desenvolvimento em Java',                 'Fundamentos do desenvolvimento de aplicações em Java.',        100,    'Intermediário',    '2024-11-01');

INSERT INTO Modulo (nome_curso, nome, descricao, ordem_dentro_curso) VALUES
-- Módulos para Desenvolvimento Web Completo
('Desenvolvimento Web Completo',    'Introdução ao Desenvolvimento Web',    'Fundamentos da criação de websites.',                      1),
('Desenvolvimento Web Completo',    'HTML e CSS',                           'Criação de páginas web com HTML e CSS.',                   2),
('Desenvolvimento Web Completo',    'JavaScript Básico',                    'Introdução ao JavaScript para interação com o usuário.',   3),

-- Módulos para Introdução ao Desenvolvimento Mobile
('Introdução ao Desenvolvimento Mobile',    'Introdução ao Desenvolvimento Mobile', 'Fundamentos do desenvolvimento para dispositivos móveis.', 1),
('Introdução ao Desenvolvimento Mobile',    'Android Basics',                       'Criação de aplicativos para Android.',                     2),
('Introdução ao Desenvolvimento Mobile',    'iOS Basics',                           'Criação de aplicativos para iOS.',                         3),

-- Módulos para Data Science com Python
('Data Science com Python', 'Introdução à Ciência de Dados',        'Conceitos básicos de ciência de dados.',                   1),
('Data Science com Python', 'Manipulação de Dados com Pandas',      'Como usar a biblioteca Pandas para manipulação de dados.', 2),
('Data Science com Python', 'Visualização de Dados com Matplotlib', 'Criando gráficos e visualizações com Matplotlib.',         3),

-- Módulos para Fundamentos de Inteligência Artificial
('Fundamentos de Inteligência Artificial',  'Introdução à IA',          'Conceitos básicos sobre inteligência artificial.', 1),
('Fundamentos de Inteligência Artificial',  'Aprendizado de Máquina',   'Técnicas de aprendizado de máquina.',              2),
('Fundamentos de Inteligência Artificial',  'Redes Neurais',            'Introdução às redes neurais.',                     3),

-- Módulos para DevOps para Iniciantes
('DevOps para Iniciantes',  'Fundamentos de DevOps',        'Entenda os princípios de DevOps.',                 1),
('DevOps para Iniciantes',  'Automação de Infraestrutura',  'Automatizando a configuração de infraestrutura.',  2),
('DevOps para Iniciantes',  'Monitoramento e Log',          'Introdução ao monitoramento e logging.',           3),

-- Módulos para UX/UI Design na Prática
('UX/UI Design na Prática', 'Princípios de Design',     'Conceitos fundamentais de design de interface.',       1),
('UX/UI Design na Prática', 'Ferramentas de Design',    'Ferramentas usadas para design de interfaces.',        2),
('UX/UI Design na Prática', 'Testes de Usabilidade',    'Métodos de teste de usabilidade com usuários.',        3),

-- Módulos para Segurança da Informação
('Segurança da Informação', 'Introdução à Segurança',   'Fundamentos da segurança da informação.',          1),
('Segurança da Informação', 'Tipos de Ataques',         'Conheça os tipos de ataques cibernéticos.',        2),
('Segurança da Informação', 'Práticas de Segurança',    'Práticas recomendadas para manter a segurança.',   3),

-- Módulos para Banco de Dados com SQL
('Banco de Dados com SQL',  'Introdução a SQL',         'Conceitos básicos de SQL.',                            1),
('Banco de Dados com SQL',  'Consultas e Filtros',      'Como realizar consultas e aplicar filtros.',           2),
('Banco de Dados com SQL',  'Joins e Relacionamentos',  'Entendendo joins e relacionamentos entre tabelas.',    3),

-- Módulos para Engenharia de Software
('Engenharia de Software',  'Ciclo de Vida do Software',    'Fases do desenvolvimento de software.',            1),
('Engenharia de Software',  'Metodologias Ágeis',           'Introdução às metodologias ágeis.',                2),
('Engenharia de Software',  'Gestão de Projetos',           'Fundamentos de gestão de projetos de software.',   3),

-- Módulos para Arquitetura de Software
('Arquitetura de Software', 'Conceitos de Arquitetura',     'Entendendo a arquitetura de software.',        1),
('Arquitetura de Software', 'Padrões de Arquitetura',       'Estudo de padrões comuns de arquitetura.',     2),
('Arquitetura de Software', 'Documentação de Arquitetura',  'Como documentar a arquitetura de software.',   3),

-- Módulos para Desenvolvimento de Jogos
('Desenvolvimento de Jogos',    'Introdução ao Desenvolvimento de Jogos',   'Fundamentos do desenvolvimento de jogos.',                     1),
('Desenvolvimento de Jogos',    'Criação de Jogos 2D',                      'Desenvolvimento de jogos 2D usando ferramentas populares.',    2),
('Desenvolvimento de Jogos',    'Criação de Jogos 3D',                      'Desenvolvimento de jogos 3D com Unity.',                       3),

-- Módulos para Cloud Computing para Iniciantes
('Cloud Computing para Iniciantes', 'Introdução à Nuvem',   'Conceitos básicos de computação em nuvem.',    1),
('Cloud Computing para Iniciantes', 'Serviços de Nuvem',    'Estudo dos principais serviços de nuvem.',     2),
('Cloud Computing para Iniciantes', 'Arquitetura de Nuvem', 'Princípios de arquitetura em nuvem.',          3),

-- Módulos para Redes de Computadores
('Redes de Computadores',   'Fundamentos de Redes', 'Conceitos básicos de redes de computadores.',      1),
('Redes de Computadores',   'Protocolos de Rede',   'Estudo dos principais protocolos de rede.',        2),
('Redes de Computadores',   'Segurança em Redes',   'Práticas de segurança em redes de computadores.',  3),

-- Módulos para Machine Learning com R
('Machine Learning com R',  'Introdução ao Machine Learning',   'Conceitos básicos de machine learning.',               1),
('Machine Learning com R',  'Modelos de Machine Learning',      'Estudo de diferentes modelos de machine learning.',    2),
('Machine Learning com R',  'Avaliação de Modelos',             'Métodos para avaliar a performance de modelos.',       3),

-- Módulos para Processamento de Dados com Apache Spark
('Processamento de Dados com Apache Spark', 'Introdução ao Apache Spark',   'Fundamentos do Apache Spark.',                     1),
('Processamento de Dados com Apache Spark', 'Processamento em Lote',        'Processamento de dados em lote com Spark.',        2),
('Processamento de Dados com Apache Spark', 'Processamento em Tempo Real',  'Processamento de dados em tempo real com Spark.',  3),

-- Módulos para Blockchain: Fundamentos e Aplicações
('Blockchain: Fundamentos e Aplicações',    'Introdução ao Blockchain',         'Conceitos básicos de blockchain.',                             1),
('Blockchain: Fundamentos e Aplicações',    'Aplicações de Blockchain',         'Casos de uso de blockchain no mundo real.',                    2),
('Blockchain: Fundamentos e Aplicações',    'Desenvolvimento em Blockchain',    'Fundamentos para desenvolver em plataformas de blockchain.',   3),

-- Módulos para Análise de Dados com Excel
('Análise de Dados com Excel',  'Introdução ao Excel',      'Fundamentos do uso do Excel para análise de dados.',   1),
('Análise de Dados com Excel',  'Fórmulas e Funções',       'Uso de fórmulas e funções no Excel.',                  2),
('Análise de Dados com Excel',  'Gráficos e Visualizações', 'Criando gráficos e visualizações no Excel.',           3),

-- Módulos para Automação de Testes
('Automação de Testes', 'Introdução à Automação de Testes', 'Conceitos básicos sobre automação de testes.',             1),
('Automação de Testes', 'Ferramentas de Automação',         'Ferramentas populares para automação de testes.',          2),
('Automação de Testes', 'Práticas de Testes Automatizados', 'Melhores práticas para implementar testes automatizados.', 3),

-- Módulos para Programação para Iniciantes
('Programação para Iniciantes', 'Introdução à Programação', 'Conceitos básicos de programação.',            1),
('Programação para Iniciantes', 'Estruturas de Controle',   'Entendendo estruturas de controle de fluxo.',  2),
('Programação para Iniciantes', 'Funções e Métodos',        'Como criar e usar funções e métodos.',         3),

-- Módulos para Desenvolvimento em Java
('Desenvolvimento em Java', 'Introdução ao Java',               'Fundamentos da programação em Java.',          1),
('Desenvolvimento em Java', 'Orientação a Objetos',             'Princípios de orientação a objetos em Java.',  2),
('Desenvolvimento em Java', 'Desenvolvimento de Aplicações',    'Criando aplicações usando Java.',              3);

INSERT INTO Aula (nome_modulo, nome, descricao, duracao, tipo, ordem_dentro_modulo) VALUES
-- Aulas para Módulos de Desenvolvimento Web Completo
('Introdução ao Desenvolvimento Web',   'Aula 1: O que é Desenvolvimento Web?', 'Introdução ao conceito de desenvolvimento web e suas áreas.',  30, 'video', 1),
('Introdução ao Desenvolvimento Web',   'Aula 2: Ferramentas Necessárias',      'Apresentação das ferramentas que serão utilizadas.',           25, 'texto', 2),

('HTML e CSS',  'Aula 1: Estrutura Básica do HTML', 'Aprenda sobre a estrutura básica de um documento HTML.',   40, 'video', 1),
('HTML e CSS',  'Aula 2: Estilizando com CSS',      'Introdução ao CSS e como aplicá-lo ao HTML.',              35, 'texto', 2),

('JavaScript Básico',   'Aula 1: Introdução ao JavaScript', 'Conceitos fundamentais do JavaScript.',        50, 'video', 1),
('JavaScript Básico',   'Aula 2: Manipulando o DOM',        'Como interagir com o DOM usando JavaScript.',  45, 'texto', 2),

-- Aulas para Módulos de Introdução ao Desenvolvimento Mobile
('Introdução ao Desenvolvimento Mobile',    'Aula 1: O que é Desenvolvimento Mobile?',  'Fundamentos do desenvolvimento para dispositivos móveis.',         30, 'video', 1),
('Introdução ao Desenvolvimento Mobile',    'Aula 2: Principais Plataformas',           'Comparação entre as principais plataformas de desenvolvimento.',   25, 'texto', 2),

('Android Basics',  'Aula 1: Configuração do Ambiente', 'Como configurar o ambiente de desenvolvimento para Android.',  40, 'video', 1),
('Android Basics',  'Aula 2: Primeira Aplicação',       'Desenvolvendo sua primeira aplicação Android.',                35, 'texto', 2),

('iOS Basics',  'Aula 1: Introdução ao Xcode',              'Fundamentos do uso do Xcode para desenvolvimento iOS.',    50, 'video', 1),
('iOS Basics',  'Aula 2: Criando uma Aplicação Simples',    'Passo a passo para criar uma aplicação simples em iOS.',   45, 'texto', 2),

-- Aulas para Módulos de Data Science com Python
('Introdução à Ciência de Dados',   'Aula 1: O que é Ciência de Dados?',        'Conceitos básicos sobre ciência de dados e suas aplicações.',  30, 'video', 1),
('Introdução à Ciência de Dados',   'Aula 2: Ferramentas de Ciência de Dados',  'Principais ferramentas utilizadas na ciência de dados.',       25, 'texto', 2),

('Manipulação de Dados com Pandas', 'Aula 1: Introdução ao Pandas', 'Fundamentos da biblioteca Pandas.',    40, 'video', 1),
('Manipulação de Dados com Pandas', 'Aula 2: Limpeza de Dados',     'Como limpar dados utilizando Pandas.', 35, 'texto', 2),

('Visualização de Dados com Matplotlib',    'Aula 1: Criando Gráficos Simples', 'Aprenda a criar gráficos simples com Matplotlib.', 50, 'video', 1),
('Visualização de Dados com Matplotlib',    'Aula 2: Gráficos Avançados',       'Explorando gráficos avançados e personalização.',  45, 'texto', 2),

-- Aulas para Módulos de Fundamentos de Inteligência Artificial
('Introdução à IA', 'Aula 1: História da IA',   'Breve história da inteligência artificial.',   30, 'video', 1),
('Introdução à IA', 'Aula 2: Aplicações da IA', 'Casos de uso da inteligência artificial.',     25, 'texto', 2),

('Aprendizado de Máquina',  'Aula 1: O que é Aprendizado de Máquina?',  'Conceitos básicos do aprendizado de máquina.',                 40, 'video', 1),
('Aprendizado de Máquina',  'Aula 2: Tipos de Algoritmos',              'Entendendo os diferentes tipos de algoritmos de aprendizado.', 35, 'texto', 2),

('Redes Neurais',   'Aula 1: Introdução às Redes Neurais',      'Conceitos fundamentais sobre redes neurais.',              50, 'video', 1),
('Redes Neurais',   'Aula 2: Como Funcionam as Redes Neurais',  'Explorando o funcionamento interno das redes neurais.',    45, 'texto', 2),

-- Aulas para Módulos de DevOps para Iniciantes
('Fundamentos de DevOps',   'Aula 1: O que é DevOps?',  'Conceitos e princípios de DevOps.',    30, 'video', 1),
('Fundamentos de DevOps',   'Aula 2: Cultura DevOps',   'A importância da cultura no DevOps.',  25, 'texto', 2),

('Automação de Infraestrutura', 'Aula 1: Ferramentas de Automação', 'Principais ferramentas para automação de infraestrutura.', 40, 'video', 1),
('Automação de Infraestrutura', 'Aula 2: Implantação Contínua',     'Conceitos de implantação contínua.',                       35, 'texto', 2),

('Monitoramento e Log', 'Aula 1: Introdução ao Monitoramento',  'Fundamentos do monitoramento em DevOps.',      50, 'video', 1),
('Monitoramento e Log', 'Aula 2: Ferramentas de Monitoramento', 'Ferramentas populares para monitoramento.',    45, 'texto', 2),

-- Aulas para Módulos de UX/UI Design na Prática
('Princípios de Design',    'Aula 1: Teoria das Cores', 'Introdução à teoria das cores no design.',             30, 'video', 1),
('Princípios de Design',    'Aula 2: Tipografia',       'Fundamentos de tipografia no design de interfaces.',   25, 'texto', 2),

('Ferramentas de Design',   'Aula 1: Introdução ao Figma',  'Como usar o Figma para design de interfaces.', 40, 'video', 1),
('Ferramentas de Design',   'Aula 2: Prototipagem',         'Criando protótipos no Figma.',                 35, 'texto', 2),

('Testes de Usabilidade',   'Aula 1: O que é Teste de Usabilidade?',    'Conceitos e importância dos testes de usabilidade.',   50, 'video', 1),
('Testes de Usabilidade',   'Aula 2: Métodos de Teste',                 'Explorando métodos de testes de usabilidade.',         45, 'texto', 2),

-- Aulas para Módulos de Segurança da Informação
('Introdução à Segurança',  'Aula 1: Importância da Segurança da Informação',   'Por que a segurança da informação é essencial?',       30, 'video', 1),
('Introdução à Segurança',  'Aula 2: Princípios da Segurança',                  'Princípios fundamentais de segurança da informação.',  25, 'texto', 2),

('Tipos de Ataques',    'Aula 1: Phishing', 'O que é phishing e como se proteger.',     40, 'video',    1),
('Tipos de Ataques',    'Aula 2: Malware',  'Tipos de malware e suas consequências.',   35, 'texto',    2),

('Práticas de Segurança',   'Aula 1: Criptografia', 'Conceitos básicos sobre criptografia.',                50, 'video', 1),
('Práticas de Segurança',   'Aula 2: Autenticação', 'Métodos de autenticação em segurança da informação.',  45, 'texto', 2),

-- Aulas para Módulos de Banco de Dados com SQL
('Introdução a SQL',    'Aula 1: O que é SQL?',         'Conceitos básicos sobre SQL.', 30, 'video', 1),
('Introdução a SQL',    'Aula 2: Instalando o MySQL',   'Como instalar o MySQL.',       25, 'texto', 2),

('Consultas e Filtros', 'Aula 1: SELECT e WHERE',   'Como usar SELECT e WHERE em consultas SQL.',   40, 'video', 1),
('Consultas e Filtros', 'Aula 2: ORDER BY e LIMIT', 'Organizando resultados com ORDER BY e LIMIT.', 35, 'texto', 2),

('Joins e Relacionamentos', 'Aula 1: INNER JOIN',   'Entendendo INNER JOIN em SQL.',            50, 'video', 1),
('Joins e Relacionamentos', 'Aula 2: OUTER JOIN',   'Diferença entre INNER JOIN e OUTER JOIN.', 45, 'texto', 2),

-- Aulas para Módulos de Engenharia de Software
('Ciclo de Vida do Software',   'Aula 1: O que é o Ciclo de Vida do Software?', 'Fundamentos do ciclo de vida do software.',                    30, 'video', 1),
('Ciclo de Vida do Software',   'Aula 2: Modelos de Desenvolvimento',           'Comparação entre os principais modelos de desenvolvimento.',   25, 'texto', 2),

('Metodologias Ágeis',  'Aula 1: O que são Metodologias Ágeis?',    'Conceitos básicos sobre metodologias ágeis.',  40, 'video', 1),
('Metodologias Ágeis',  'Aula 2: Scrum',                            'Como funciona o Scrum na prática.',            35, 'texto', 2);

INSERT INTO Empresa (nome, localizacao, setor) VALUES
('Tech Solutions',          'São Paulo, SP',        'Tecnologia da Informação'),
('Innovatech',              'Rio de Janeiro, RJ',   'Desenvolvimento de Software'),
('Data Insights',           'Belo Horizonte, MG',   'Análise de Dados'),
('Quality First',           'Curitiba, PR',         'Teste de Software'),
('Creative Labs',           'Porto Alegre, RS',     'Design e Criação'),
('Software Dynamics',       'Brasília, DF',         'Desenvolvimento de Software'),
('OpsGenie',                'Florianópolis, SC',    'DevOps e Infraestrutura'),
('Project Hub',             'Campinas, SP',         'Gestão de Projetos'),
('SecureIT',                'Salvador, BA',         'Segurança da Informação'),
('LearnTech',               'Fortaleza, CE',        'Educação Online'),
('Mobile Innovations',      'Natal, RN',            'Desenvolvimento Mobile'),
('Digital Reach',           'Recife, PE',           'Marketing Digital'),
('Product Visionaries',     'Goiânia, GO',          'Gestão de Produtos'),
('Insight Analytics',       'Manaus, AM',           'Análise de Dados'),
('Tech Advisors',           'Vitória, ES',          'Consultoria de TI'),
('Database Masters',        'Joinville, SC',        'Banco de Dados'),
('Full Stack Agency',       'Santos, SP',           'Desenvolvimento Web'),
('AI Research Labs',        'Belo Horizonte, MG',   'Inteligência Artificial'),
('Support Solutions',       'Caxias do Sul, RS',    'Suporte Técnico'),
('Systems Analysis Inc.',   'São José, SC',         'Análise de Sistemas');

INSERT INTO Vaga (id, descricao, empresa) VALUES
(1,     'Desenvolvedor Front-end - Responsável pela criação e manutenção de interfaces de usuário.',            'Tech Solutions'),
(2,     'Desenvolvedor Back-end - Foco em desenvolvimento de APIs e integração de sistemas.',                   'Innovatech'),
(3,     'Cientista de Dados - Análise de dados e construção de modelos preditivos.',                            'Data Insights'),
(4,     'Analista de Qualidade - Garantir a qualidade dos produtos através de testes manuais e automatizados.', 'Quality First'),
(5,     'Designer de UI/UX - Criação de interfaces intuitivas e experiências de usuário.',                      'Creative Labs'),
(6,     'Engenheiro de Software - Desenvolvimento de software em equipe e implementação de melhorias.',         'Software Dynamics'),
(7,     'Especialista em DevOps - Implementação de práticas DevOps e automação de processos.',                  'OpsGenie'),
(8,     'Gerente de Projetos - Liderar equipes em projetos de desenvolvimento de software.',                    'Project Hub'),
(9,     'Analista de Segurança da Informação - Proteger os dados e sistemas da empresa.',                       'SecureIT'),
(10,    'Instrutor de Cursos Online - Criar e ministrar cursos de tecnologia.',                                 'LearnTech'),
(11,    'Desenvolvedor Mobile - Criação de aplicativos para Android e iOS.',                                    'Mobile Innovations'),
(12,    'Analista de Marketing Digital - Planejamento e execução de campanhas online.',                         'Digital Reach'),
(13,    'Gerente de Produto - Definir a visão e o roadmap do produto.',                                         'Product Visionaries'),
(14,    'Analista de Dados - Coletar e interpretar dados para gerar insights.',                                 'Insight Analytics'),
(15,    'Consultor de TI - Auxiliar empresas na implementação de soluções tecnológicas.',                       'Tech Advisors'),
(16,    'Especialista em Banco de Dados - Gerenciamento e otimização de bancos de dados.',                      'Database Masters'),
(17,    'Desenvolvedor Full Stack - Atuação em todas as camadas de desenvolvimento.',                           'Full Stack Agency'),
(18,    'Pesquisador em Inteligência Artificial - Desenvolver e testar algoritmos de IA.',                      'AI Research Labs'),
(19,    'Coordenador de Suporte Técnico - Gerenciar a equipe de suporte e atendimento ao cliente.',             'Support Solutions'),
(20,    'Analista de Sistemas - Levantar requisitos e analisar sistemas existentes.',                           'Systems Analysis Inc.');

INSERT INTO Estuda (email_aluno, nome_curso, data_conclusao, nota) VALUES
('joaosilva@gmail.com',         'Desenvolvimento Web Completo',             '2024-07-15', 9.50),
('mariaoliveira@hotmail.com',   'Introdução ao Desenvolvimento Mobile',     '2024-08-20', 8.75),
('pedrocosta@gmail.com',        'Data Science com Python',                  '2024-09-10', 9.00),
('anasantos@gmail.com',         'Fundamentos de Inteligência Artificial',   '2024-06-30', 7.50),
('lucaspereira@hotmail.com',    'DevOps para Iniciantes',                   '2024-10-01', 8.00),
('beatrizrodrigues@gmail.com',  'UX/UI Design na Prática',                  '2024-07-25', 9.20),
('rafaelalmeida@gmail.com',     'Segurança da Informação',                  '2024-09-15', 9.80),
('fernandalima@hotmail.com',    'Banco de Dados com SQL',                   '2024-08-05', 7.90),
('gabrielferreira@gmail.com',   'Engenharia de Software',                   '2024-10-10', 8.50),
('julianasousa@gmail.com',      'Arquitetura de Software',                  '2024-06-20', 8.90),
('andremoreira@hotmail.com',    'Desenvolvimento de Jogos',                 '2024-09-22', 9.30),
('carolinafernandes@gmail.com', 'Cloud Computing para Iniciantes',          '2024-08-12', 7.80),
('tiagocardoso@hotmail.com',    'Redes de Computadores',                    '2024-07-30', 9.10),
('amandasouza@gmail.com',       'Machine Learning com R',                   '2024-10-15', 8.70),
('brunomarques@hotmail.com',    'Processamento de Dados com Apache Spark',  '2024-09-05', 9.00),
('larissarocha@gmail.com',      'Blockchain: Fundamentos e Aplicações',     '2024-08-22', 8.60),
('carlosnascimento@gmail.com',  'Análise de Dados com Excel',               '2024-10-02', 9.40),
('patriciadias@hotmail.com',    'Automação de Testes',                      '2024-07-18', 7.50),
('renatomartins@gmail.com',     'Programação para Iniciantes',              '2024-09-30', 8.30),
('vanessacampos@gmail.com',     'Desenvolvimento em Java',                  '2024-08-28', 9.20);

INSERT INTO Ministra (email_professor, nome_curso) VALUES
('marcossilva@gmail.com',           'Desenvolvimento Web Completo'),
('lucianaalmeida@hotmail.com',      'Introdução ao Desenvolvimento Mobile'),
('carlossantos@gmail.com',          'Data Science com Python'),
('patriciaoliveira@hotmail.com',    'Fundamentos de Inteligência Artificial'),
('robertopereira@gmail.com',        'DevOps para Iniciantes'),
('fernandacosta@hotmail.com',       'UX/UI Design na Prática'),
('anasouza@gmail.com',              'Segurança da Informação'),
('brunorocha@hotmail.com',          'Banco de Dados com SQL'),
('deboranunes@gmail.com',           'Engenharia de Software'),
('felipecardoso@hotmail.com',       'Arquitetura de Software'),
('gabrielamendes@gmail.com',        'Desenvolvimento de Jogos'),
('joaofernandes@hotmail.com',       'Cloud Computing para Iniciantes'),
('camilaribeiro@gmail.com',         'Redes de Computadores'),
('renatocarvalho@hotmail.com',      'Machine Learning com R'),
('isabelamartins@gmail.com',        'Processamento de Dados com Apache Spark'),
('lucasmoreira@hotmail.com',        'Blockchain: Fundamentos e Aplicações'),
('larissabatista@gmail.com',        'Análise de Dados com Excel'),
('paulobarreto@hotmail.com',        'Automação de Testes'),
('vanessasilva@gmail.com',          'Programação para Iniciantes'),
('rodrigomonteiro@hotmail.com',     'Desenvolvimento em Java');

INSERT INTO Se_Qualifica (email_aluno, id_vaga) VALUES
('joaosilva@gmail.com',         1),
('mariaoliveira@hotmail.com',   3),
('pedrocosta@gmail.com',        2),
('anasantos@gmail.com',         3),
('lucaspereira@hotmail.com',    4),
('beatrizrodrigues@gmail.com',  5),
('rafaelalmeida@gmail.com',     10),
('fernandalima@hotmail.com',    6),
('gabrielferreira@gmail.com',   8),
('julianasousa@gmail.com',      1),
('andremoreira@hotmail.com',    11),
('carolinafernandes@gmail.com', 7),
('tiagocardoso@hotmail.com',    3),
('amandasouza@gmail.com',       4),
('brunomarques@hotmail.com',    14),
('larissarocha@gmail.com',      9),
('carlosnascimento@gmail.com',  19),
('patriciadias@hotmail.com',    20),
('renatomartins@gmail.com',     15),
('vanessacampos@gmail.com',     18);

INSERT INTO Habilidade_Vaga (id_vaga, habilidade) VALUES
(1,     'JavaScript'),
(2,     'Node.js'),
(3,     'Python'),
(4,     'Selenium'),
(5,     'HTML/CSS'),
(6,     'Java'),
(7,     'Bash'),
(8,     'Jira'),
(9,     'Python'),
(10,    'HTML/CSS'),
(11,    'Kotlin'),
(12,    'SQL'),
(13,    'Jira'),
(14,    'Python'),
(15,    'PowerShell'),
(16,    'SQL'),
(17,    'JavaScript'),
(18,    'Python'),
(19,    'Python'),
(20,    'SQL');
