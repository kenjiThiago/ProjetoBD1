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

--Tabela Habilidade_Curso
CREATE TABLE Habilidade_Curso (
    nome_curso     VARCHAR(100),
    habilidade     VARCHAR(50),

    PRIMARY KEY (nome_curso, habilidade),
    FOREIGN KEY (nome_curso)   REFERENCES Curso(nome)
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
    nome        VARCHAR(100),
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

-- Tabela de Relacionamento Se_inscreve (Aluno-Vaga)
CREATE TABLE Se_Inscreve (
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
('Desenvolvimento em Java',                 'Fundamentos do desenvolvimento de aplicações em Java.',        100,    'Intermediário',    '2024-11-01'),
('Python para Automação',                   'Automatize tarefas repetitivas com Python.',                   60,     'Iniciante',        '2024-11-15'),
('Introdução ao Power BI',                  'Aprenda a criar relatórios e dashboards interativos.',         50,     'Iniciante',        '2024-12-01'),
('Kubernetes na Prática',                   'Gerenciamento de contêineres com Kubernetes.',                 80,     'Avançado',         '2024-12-10'),
('Introdução ao Ruby on Rails',             'Desenvolvimento web usando Ruby on Rails.',                    90,     'Intermediário',    '2024-12-20'),
('JavaScript Avançado',                     'Aprofunde seus conhecimentos em JavaScript.',                  70,     'Avançado',         '2025-01-10'),
('Construção de APIs REST',                 'Crie APIs RESTful usando padrões modernos.',                   100,    'Intermediário',    '2025-01-20'),
('Angular Básico',                          'Introdução ao framework Angular para desenvolvimento web.',    80,     'Iniciante',        '2025-02-01'),
('React Native para Mobile',                'Desenvolva apps para Android e iOS com React Native.',         110,    'Intermediário',    '2025-02-10'),
('Big Data com Hadoop',                     'Introdução ao Big Data e Hadoop.',                             100,    'Avançado',         '2025-02-20'),
('Teste de Software na Prática',            'Aprenda sobre testes manuais e automatizados.',                60,     'Intermediário',    '2025-03-01'),
('Game Development com Unreal Engine',      'Criação de jogos avançados com Unreal Engine.',                130,    'Avançado',         '2025-03-15'),
('Introdução ao TypeScript',                'Aprimore JavaScript com TypeScript.',                          50,     'Iniciante',        '2025-04-01'),
('Gestão de Produtos Digitais',             'Metodologias e ferramentas para gestão de produtos.',          90,     'Intermediário',    '2025-04-10'),
('Noções de Docker',                        'Trabalhe com contêineres usando Docker.',                      70,     'Iniciante',        '2025-04-20'),
('Desenvolvimento Backend com Node.js',     'Criação de servidores robustos com Node.js.',                  120,    'Avançado',         '2025-05-01'),
('Django para Web',                         'Desenvolvimento web com Python e Django.',                     100,    'Intermediário',    '2025-05-10'),
('Flutter na Prática',                      'Criação de apps móveis com Flutter.',                          110,    'Intermediário',    '2025-05-20'),
('ElasticSearch Básico',                    'Armazenamento e busca de dados com ElasticSearch.',            80,     'Iniciante',        '2025-06-01'),
('Inteligência Artificial com TensorFlow',  'Criação de modelos de IA com TensorFlow.',                     90,     'Avançado',         '2025-06-10'),
('Introdução à Ciência de Dados',           'Entenda os conceitos básicos da ciência de dados.',            100,    'Iniciante',        '2025-06-20'),
('Marketing Digital para Empresas',         'Estratégias para marketing digital.',                          70,     'Iniciante',        '2025-07-01'),
('Excel Avançado',                          'Automatize planilhas e crie gráficos avançados.',              80,     'Avançado',         '2025-07-10'),
('PHP para Web',                            'Desenvolvimento web utilizando PHP.',                          90,     'Intermediário',    '2025-07-20'),
('MongoDB na Prática',                      'Armazenamento de dados em banco de dados NoSQL.',              70,     'Intermediário',    '2025-08-01'),
('Programação Funcional com Scala',         'Paradigma funcional usando Scala.',                            90,     'Avançado',         '2025-08-10'),
('Introdução ao C#',                        'Fundamentos da programação com C#.',                           70,     'Iniciante',        '2025-08-20'),
('Design Thinking para Inovação',           'Processos criativos para resolução de problemas.',             60,     'Iniciante',        '2025-09-01'),
('Internet das Coisas (IoT)',               'Conceitos e práticas de IoT.',                                 90,     'Intermediário',    '2025-09-10'),
('Automação com Shell Script',              'Automatize tarefas em sistemas Unix.',                         80,     'Avançado',         '2025-09-20'),
('Linguagem Go para Backend',               'Desenvolvimento backend utilizando Go.',                       100,    'Intermediário',    '2025-10-01'),
('Sistemas Operacionais na Prática',        'Entenda conceitos e funcionamento de sistemas operacionais.',  100,    'Intermediário',    '2025-10-15');

INSERT INTO Habilidade_Curso (nome_curso, habilidade) VALUES
('Desenvolvimento Web Completo',            'JavaScript'),
('Desenvolvimento Web Completo',            'HTML/CSS'),
('Desenvolvimento Web Completo',            'Node.js'),
('Desenvolvimento Web Completo',            'Selenium'),
('Introdução ao Desenvolvimento Mobile',    'Kotlin'),
('Data Science com Python',                 'Python'),
('Fundamentos de Inteligência Artificial',  'IA'),
('DevOps para Iniciantes',                  'Jira'),
('UX/UI Design na Prática',                 'UX/UI'),
('UX/UI Design na Prática',                 'HTML/CSS'),
('Segurança da Informação',                 'Segurança da Informação'),
('Banco de Dados com SQL',                  'SQL'),
('Engenharia de Software',                  'Gestão de Projetos'),
('Arquitetura de Software',                 'Arquitetura de Software'),
('Desenvolvimento de Jogos',                'C++'),
('Cloud Computing para Iniciantes',         'Amazon AWS'),
('Redes de Computadores',                   'Administração de Redes'),
('Machine Learning com R',                  'R'),
('Machine Learning com R',                  'Machine Learning'),
('Processamento de Dados com Apache Spark', 'Processamento de Dados'),
('Blockchain: Fundamentos e Aplicações',    'Blockchain'),
('Análise de Dados com Excel',              'Excel'),
('Automação de Testes',                     'Automação de Testes'),
('Programação para Iniciantes',             'Lógica de Programação'),
('Desenvolvimento em Java',                 'Java'),
('Python para Automação',                   'Python'),
('Introdução ao Power BI',                  'Power BI'),
('Kubernetes na Prática',                   'Kubernetes'),
('Introdução ao Ruby on Rails',             'Ruby on Rails'),
('JavaScript Avançado',                     'JavaScript'),
('Construção de APIs REST',                 'REST'),
('Angular Básico',                          'Angular'),
('React Native para Mobile',                'React Native'),
('Big Data com Hadoop',                     'Hadoop'),
('Teste de Software na Prática',            'Testes de Software'),
('Game Development com Unreal Engine',      'Unreal Engine'),
('Introdução ao TypeScript',                'TypeScript'),
('Gestão de Produtos Digitais',             'Gestão de Produtos'),
('Noções de Docker',                        'Docker'),
('Desenvolvimento Backend com Node.js',     'Node.js'),
('Django para Web',                         'Django'),
('Flutter na Prática',                      'Flutter'),
('ElasticSearch Básico',                    'ElasticSearch'),
('Inteligência Artificial com TensorFlow',  'TensorFlow'),
('Introdução à Ciência de Dados',           'Ciência de Dados'),
('Marketing Digital para Empresas',         'Marketing Digital'),
('Excel Avançado',                          'Excel'),
('PHP para Web',                            'PHP'),
('MongoDB na Prática',                      'MongoDB'),
('Programação Funcional com Scala',         'Scala'),
('Introdução ao C#',                        'C#'),
('Design Thinking para Inovação',           'Design Thinking'),
('Internet das Coisas (IoT)',               'IoT'),
('Automação com Shell Script',              'Shell Script'),
('Automação com Shell Script',              'PowerShell'),
('Linguagem Go para Backend',               'Go'),
('Sistemas Operacionais na Prática',        'Sistemas Operacionais'),
('Sistemas Operacionais na Prática',        'Bash');

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
('Desenvolvimento em Java', 'Desenvolvimento de Aplicações',    'Criando aplicações usando Java.',              3),

-- Módulos para Python para Automação
('Python para Automação',              'Introdução ao Python',                     'Fundamentos da linguagem Python.',                     1),
('Python para Automação',              'Automação de Tarefas com Python',          'Automatize tarefas repetitivas utilizando Python.',    2),
('Python para Automação',              'Manipulação de Arquivos',                  'Como ler, escrever e modificar arquivos com Python.',  3),

-- Módulos para Introdução ao Power BI
('Introdução ao Power BI',             'Fundamentos do Power BI',                  'Introdução às ferramentas e interface do Power BI.',  1),
('Introdução ao Power BI',             'Criação de Relatórios',                    'Aprenda a criar relatórios básicos no Power BI.',      2),
('Introdução ao Power BI',             'Dashboards Interativos',                  'Como criar dashboards dinâmicos e interativos.',       3),

-- Módulos para Kubernetes na Prática
('Kubernetes na Prática',              'Introdução ao Kubernetes',                 'Fundamentos do Kubernetes e arquitetura de contêineres.', 1),
('Kubernetes na Prática',              'Gerenciamento de Pods',                    'Como gerenciar Pods e Deployments no Kubernetes.',     2),
('Kubernetes na Prática',              'Escalabilidade e Monitoramento',           'Escalando aplicações e monitorando o Kubernetes.',     3),

-- Módulos para Introdução ao Ruby on Rails
('Introdução ao Ruby on Rails',        'Fundamentos do Ruby on Rails',             'Introdução ao framework Ruby on Rails e sua estrutura.', 1),
('Introdução ao Ruby on Rails',        'Modelos, Visões e Controladores',          'MVC no Ruby on Rails: Como organizar suas aplicações.', 2),
('Introdução ao Ruby on Rails',        'Construção de uma Aplicação Web',          'Desenvolvendo uma aplicação web completa com Rails.',  3),

-- Módulos para JavaScript Avançado
('JavaScript Avançado',                'Funções Avançadas e Closures',             'Conceitos avançados de funções e closures no JavaScript.', 1),
('JavaScript Avançado',                'Manipulação Assíncrona com Promises',      'Como trabalhar com Promises e funções assíncronas.',  2),
('JavaScript Avançado',                'Frameworks JavaScript',                    'Introdução aos principais frameworks JavaScript (React, Vue, etc.).', 3),

-- Módulos para Construção de APIs REST
('Construção de APIs REST',             'Introdução a APIs REST',                  'Conceitos fundamentais de APIs RESTful e HTTP.',                1),
('Construção de APIs REST',             'Autenticação e Autorização',              'Implementando autenticação e autorização em APIs REST.',        2),
('Construção de APIs REST',             'Desenvolvimento e Testes de APIs',        'Desenvolvendo e testando APIs RESTful com ferramentas modernas.', 3),
('Construção de APIs REST',             'Deploy e Escalabilidade',                 'Como realizar o deploy e escalar suas APIs.',                   4),

-- Módulos para Angular Básico
('Angular Básico',                      'Introdução ao Angular',                   'Fundamentos do framework Angular para aplicações web.',       1),
('Angular Básico',                      'Componentes e Templates',                 'Como criar e usar componentes e templates no Angular.',        2),
('Angular Básico',                      'Diretivas e Serviços',                    'Introdução a diretivas e serviços no Angular.',                3),

-- Módulos para React Native para Mobile
('React Native para Mobile',            'Introdução ao React Native',              'Fundamentos do React Native e criação de aplicações móveis.',  1),
('React Native para Mobile',            'Componentes e Navegação',                 'Trabalhando com componentes e navegação em React Native.',     2),
('React Native para Mobile',            'Acesso a APIs e Usando Armazenamento Local',     'Integrando APIs e usando armazenamento local em apps móveis.', 3),
('React Native para Mobile',            'Publicação no Google Play e App Store',   'Como publicar aplicativos móveis em lojas de apps.',           4),

-- Módulos para Big Data com Hadoop
('Big Data com Hadoop',                 'Introdução ao Big Data e Hadoop',         'Conceitos de Big Data e a arquitetura do Hadoop.',              1),
('Big Data com Hadoop',                 'Processamento de Dados com MapReduce',    'Como utilizar MapReduce para processar dados no Hadoop.',       2),
('Big Data com Hadoop',                 'Armazenamento e Análise de Dados',        'Trabalhando com HDFS e realizando análises de dados em larga escala.', 3),

-- Módulos para Teste de Software na Prática
('Teste de Software na Prática',        'Introdução aos Testes de Software',       'Fundamentos do teste de software e a importância dos testes.', 1),
('Teste de Software na Prática',        'Testes Manuais',                          'Como realizar testes manuais em diferentes tipos de software.', 2),
('Teste de Software na Prática',        'Testes Automatizados',                    'Introdução aos testes automatizados usando ferramentas populares.', 3),

-- Módulos para Game Development com Unreal Engine
('Game Development com Unreal Engine',     'Introdução ao Unreal Engine',            'Fundamentos da Unreal Engine e criação do seu primeiro jogo.', 1),
('Game Development com Unreal Engine',     'Criação de Personagens e Animações',    'Como criar e animar personagens dentro da Unreal Engine.',    2),
('Game Development com Unreal Engine',     'Programação de Jogo com Blueprints',     'Aprenda a programar jogos utilizando Blueprints na Unreal Engine.', 3),
('Game Development com Unreal Engine',     'Desenvolvimento de IA para Jogos',      'Como implementar inteligência artificial para jogos.',        4),
('Game Development com Unreal Engine',     'Otimizando e Publicando seu Jogo',       'Técnicas de otimização e publicação de jogos na Unreal Engine.', 5),

-- Módulos para Introdução ao TypeScript
('Introdução ao TypeScript',               'Fundamentos do TypeScript',              'Entendendo os tipos e a sintaxe básica do TypeScript.', 1),
('Introdução ao TypeScript',               'Tipos Avançados e Generics',             'Aprofundando-se em tipos avançados e generics no TypeScript.', 2),
('Introdução ao TypeScript',               'Integrando TypeScript com JavaScript',   'Como integrar TypeScript em projetos JavaScript existentes.', 3),

-- Módulos para Gestão de Produtos Digitais
('Gestão de Produtos Digitais',            'Introdução à Gestão de Produtos Digitais', 'Conceitos fundamentais de gestão de produtos no ambiente digital.', 1),
('Gestão de Produtos Digitais',            'Metodologias Ágeis em Gestão de Produtos',                     'Como utilizar metodologias ágeis como Scrum e Kanban na gestão de produtos.', 2),
('Gestão de Produtos Digitais',            'Ferramentas de Gestão de Produtos',      'Ferramentas essenciais para o gerenciamento de produtos digitais.', 3),

-- Módulos para Noções de Docker
('Noções de Docker',                       'Introdução ao Docker',                   'Fundamentos do Docker e como funciona o conceito de contêineres.', 1),
('Noções de Docker',                       'Criando e Gerenciando Contêineres',      'Como criar, gerenciar e rodar contêineres Docker.', 2),
('Noções de Docker',                       'Docker Compose e Orquestração',         'Como usar o Docker Compose para orquestrar contêineres.', 3),

-- Módulos para Desenvolvimento Backend com Node.js
('Desenvolvimento Backend com Node.js',    'Fundamentos do Node.js',                 'Introdução ao Node.js e como configurar o ambiente de desenvolvimento.', 1),
('Desenvolvimento Backend com Node.js',    'Criação de Servidores com Express.js',   'Como criar servidores robustos utilizando Express.js no Node.js.', 2),
('Desenvolvimento Backend com Node.js',    'Trabalhando com Banco de Dados',        'Como integrar bancos de dados, como MongoDB, com Node.js.', 3),
('Desenvolvimento Backend com Node.js',    'Autenticação e Segurança',              'Implementando autenticação e segurança em APIs com Node.js.', 4),
('Desenvolvimento Backend com Node.js',    'Deploy de Aplicações Backend',          'Como realizar o deploy de aplicações backend com Node.js.', 5),

-- Módulos para Django para Web
('Django para Web',                      'Introdução ao Django',                     'Fundamentos do framework Django e configuração inicial.', 1),
('Django para Web',                      'Trabalhando com Modelos',                  'Como criar e gerenciar modelos no Django.',                2),
('Django para Web',                      'Views e Templates',                        'Como criar views dinâmicas e utilizar templates no Django.', 3),
('Django para Web',                      'Formulários e Validação',                  'Criando e validando formulários com Django.',              4),
('Django para Web',                      'Deploy e Segurança',                       'Como fazer deploy de aplicativos Django e garantir a segurança.', 5),

-- Módulos para Flutter na Prática
('Flutter na Prática',                   'Introdução ao Flutter',                    'Fundamentos do Flutter e configuração de ambiente para apps móveis.', 1),
('Flutter na Prática',                   'Widgets e Layouts',                        'Como trabalhar com widgets e criar layouts no Flutter.',  2),
('Flutter na Prática',                   'Gerenciamento de Estado',                  'Como gerenciar o estado de um aplicativo Flutter.',       3),
('Flutter na Prática',                   'Acesso a APIs e Armazenamento Local',      'Integrando APIs e utilizando armazenamento local no Flutter.', 4),
('Flutter na Prática',                   'Publicação de Apps Flutter',               'Como publicar aplicativos Flutter nas lojas de apps.',    5),

-- Módulos para ElasticSearch Básico
('ElasticSearch Básico',                  'Introdução ao ElasticSearch',               'Fundamentos do ElasticSearch e sua configuração inicial.', 1),
('ElasticSearch Básico',                  'Índices e Documentos',                     'Como criar e gerenciar índices e documentos no ElasticSearch.', 2),
('ElasticSearch Básico',                  'Consultas e Busca',                        'Como realizar consultas e buscas no ElasticSearch.',       3),

-- Módulos para Inteligência Artificial com TensorFlow
('Inteligência Artificial com TensorFlow', 'Introdução ao TensorFlow',                 'Fundamentos do TensorFlow e configuração do ambiente de IA.', 1),
('Inteligência Artificial com TensorFlow', 'Redes Neurais com TensorFlow',             'Como criar e treinar redes neurais com TensorFlow.',        2),
('Inteligência Artificial com TensorFlow', 'Deep Learning e Transfer Learning',       'Técnicas avançadas de Deep Learning e Transfer Learning no TensorFlow.', 3),
('Inteligência Artificial com TensorFlow', 'Modelos de Produção com TensorFlow',       'Como levar modelos de IA para produção com TensorFlow.',    4),

-- Módulos para Introdução à Ciência de Dados
('Introdução à Ciência de Dados',         'Fundamentos da Ciência de Dados',          'Compreendendo os principais conceitos de Ciência de Dados.', 1),
('Introdução à Ciência de Dados',         'Exploração de Dados e Pré-processamento',  'Como explorar e preparar dados para análise e modelagem.', 2),
('Introdução à Ciência de Dados',         'Fundamentos de Machine Learning',           'Fundamentos de Machine Learning e como implementar modelos simples.', 3),
('Introdução à Ciência de Dados',         'Visualização de Dados',                    'Como utilizar ferramentas para visualizar dados de forma eficaz.', 4),

-- Módulos para Marketing Digital para Empresas
('Marketing Digital para Empresas',        'Introdução ao Marketing Digital',        'Fundamentos e estratégias iniciais de marketing digital para empresas.', 1),
('Marketing Digital para Empresas',        'SEO e SEM',                             'Estratégias de otimização para motores de busca (SEO) e marketing de busca (SEM).', 2),
('Marketing Digital para Empresas',        'Redes Sociais e Marketing de Conteúdo',  'Como utilizar redes sociais e criar conteúdo estratégico para engajamento.', 3),
('Marketing Digital para Empresas',        'E-mail Marketing e Automação',          'Como criar campanhas de e-mail marketing e automatizar processos de comunicação.', 4),

-- Módulos para Excel Avançado
('Excel Avançado',                         'Funções Avançadas no Excel',            'Explorando funções avançadas como PROCV, ÍNDICE, CORRESP, entre outras.', 1),
('Excel Avançado',                         'Gráficos e Visualização de Dados',      'Criando gráficos dinâmicos e visualizações para análise de dados complexos.', 2),
('Excel Avançado',                         'Macros e VBA',                          'Automatizando processos no Excel com Macros e VBA.', 3),
('Excel Avançado',                         'Análise de Dados com Power Query',      'Como usar Power Query para transformação e análise avançada de dados.', 4),

-- Módulos para PHP para Web
('PHP para Web',                           'Introdução ao PHP',                     'Fundamentos do PHP e configuração de ambiente para desenvolvimento web.', 1),
('PHP para Web',                           'Formulários e Banco de Dados',          'Como trabalhar com formulários e integrar bancos de dados no PHP.', 2),
('PHP para Web',                           'Manipulação de Sessões e Cookies',      'Trabalhando com sessões e cookies em aplicações web com PHP.', 3),
('PHP para Web',                           'Autenticação e Segurança com PHP',              'Como implementar sistemas de autenticação e segurança em PHP.', 4),

-- Módulos para MongoDB na Prática
('MongoDB na Prática',                     'Introdução ao MongoDB',                 'Fundamentos do MongoDB e como configurar o ambiente de banco NoSQL.', 1),
('MongoDB na Prática',                     'Modelagem de Dados no MongoDB',         'Como criar e gerenciar documentos e coleções no MongoDB.', 2),
('MongoDB na Prática',                     'Consultas e Agregações no MongoDB',     'Realizando consultas avançadas e operações de agregação no MongoDB.', 3),

-- Módulos para Programação Funcional com Scala
('Programação Funcional com Scala',        'Fundamentos da Programação Funcional',  'Introdução ao paradigma funcional e seus princípios em Scala.', 1),
('Programação Funcional com Scala',        'Imutabilidade e Funções de Alta Ordem', 'Compreendendo a imutabilidade e o uso de funções de alta ordem em Scala.', 2),
('Programação Funcional com Scala',        'Tratamento de Erros e Tipos',           'Como tratar erros e utilizar tipos robustos na programação funcional em Scala.', 3),
('Programação Funcional com Scala',        'Concorrência e Parallellism',           'Implementando concorrência e paralelismo na programação funcional com Scala.', 4),

-- Módulos para Introdução ao C#
('Introdução ao C#',                      'Fundamentos do C#',                        'Introdução à linguagem C# e conceitos básicos de programação.', 1),
('Introdução ao C#',                      'Estruturas de Controle com C#',                  'Como usar estruturas de controle (if, loops) em C#.', 2),
('Introdução ao C#',                      'Tipos de Dados e Variáveis',              'Trabalhando com tipos de dados e variáveis em C#.', 3),
('Introdução ao C#',                      'Orientação a Objetos em C#',                    'Introdução à programação orientada a objetos em C#.', 4),

-- Módulos para Design Thinking para Inovação
('Design Thinking para Inovação',         'Introdução ao Design Thinking',           'Compreendendo o conceito e processo de Design Thinking.', 1),
('Design Thinking para Inovação',         'Empatia e Definição do Problema',         'Como praticar empatia e definir problemas com Design Thinking.', 2),
('Design Thinking para Inovação',         'Ideação e Protótipos',                    'Gerando ideias e criando protótipos para soluções inovadoras.', 3),
('Design Thinking para Inovação',         'Testando e Implementando Soluções',       'Como testar e implementar soluções com Design Thinking.', 4),

-- Módulos para Internet das Coisas (IoT)
('Internet das Coisas (IoT)',             'Introdução à IoT',                        'Fundamentos e arquitetura básica da Internet das Coisas.', 1),
('Internet das Coisas (IoT)',             'Sensores e Dispositivos',                 'Trabalhando com sensores e dispositivos IoT.', 2),
('Internet das Coisas (IoT)',             'Conectividade e Redes',                  'Como conectar dispositivos IoT e configurar redes.', 3),
('Internet das Coisas (IoT)',             'Processamento e Análise de Dados',        'Analisando dados de dispositivos IoT e tomando decisões inteligentes.', 4),

-- Módulos para Automação com Shell Script
('Automação com Shell Script',            'Introdução ao Shell Script',              'Fundamentos do shell script e como escrever seus primeiros scripts.', 1),
('Automação com Shell Script',            'Manipulação de Arquivos e Diretórios',    'Como manipular arquivos e diretórios usando shell script.', 2),
('Automação com Shell Script',            'Automação de Tarefas Repetitivas',        'Como automatizar tarefas diárias em sistemas Unix com shell script.', 3),
('Automação com Shell Script',            'Depuração e Execução de Scripts',         'Técnicas para depurar e executar scripts de forma eficiente.', 4),

-- Módulos para Linguagem Go para Backend
('Linguagem Go para Backend',             'Introdução ao Go',                        'Fundamentos da linguagem Go e sua configuração para backend.', 1),
('Linguagem Go para Backend',             'Estruturas de Dados e Concorência',       'Como usar estruturas de dados e concorrência no Go.', 2),
('Linguagem Go para Backend',             'APIs e Web Servers com Go',               'Desenvolvendo APIs e servidores web com Go.', 3),
('Linguagem Go para Backend',             'Testes e Deploy de Aplicações Go',        'Como testar e fazer o deploy de suas aplicações Go.', 4),

-- Módulos para Sistemas Operacionais na Prática
('Sistemas Operacionais na Prática',     'Fundamentos dos Sistemas Operacionais',   'Compreendendo os conceitos fundamentais de sistemas operacionais.', 1),
('Sistemas Operacionais na Prática',     'Gerenciamento de Processos',              'Como gerenciar processos e entender a sua execução no sistema operacional.', 2),
('Sistemas Operacionais na Prática',     'Memória e Armazenamento',                 'Gerenciando memória e armazenamento em sistemas operacionais.', 3),
('Sistemas Operacionais na Prática',     'Sistemas de Arquivos e Segurança',        'Como trabalhar com sistemas de arquivos e garantir a segurança no sistema operacional.', 4);

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
('Metodologias Ágeis',  'Aula 2: Scrum',                            'Como funciona o Scrum na prática.',            35, 'texto', 2),

-- Aulas para Python para Automação
('Introdução ao Python', 'Aula 1: Introdução ao Python', 'Fundamentos da linguagem Python.', 40, 'video', 1),

('Automação de Tarefas com Python', 'Aula 1: Automação de Tarefas com Python', 'Automatize tarefas repetitivas utilizando Python.', 45, 'texto', 1),

('Manipulação de Arquivos', 'Aula 1: Manipulação de Arquivos', 'Como ler, escrever e modificar arquivos com Python.', 35, 'video', 1),

-- Aulas para Introdução ao Power BI
('Fundamentos do Power BI', 'Aula 1: Fundamentos do Power BI', 'Introdução às ferramentas e interface do Power BI.', 30, 'video', 1),

('Criação de Relatórios', 'Aula 2: Criação de Relatórios', 'Aprenda a criar relatórios básicos no Power BI.', 35, 'texto', 1),

('Dashboards Interativos', 'Aula 3: Dashboards Interativos', 'Como criar dashboards dinâmicos e interativos.', 40, 'video', 1),

-- Aulas para Kubernetes na Prática
('Introdução ao Kubernetes', 'Aula 1: Introdução ao Kubernetes', 'Fundamentos do Kubernetes e arquitetura de contêineres.', 45, 'video', 1),

('Gerenciamento de Pods', 'Aula 1: Gerenciamento de Pods', 'Como gerenciar Pods e Deployments no Kubernetes.', 50, 'texto', 1),

('Escalabilidade e Monitoramento', 'Aula 1: Escalabilidade e Monitoramento', 'Escalando aplicações e monitorando o Kubernetes.', 55, 'video', 1),

-- Aulas para Introdução ao Ruby on Rails
('Fundamentos do Ruby on Rails', 'Aula 1: Fundamentos do Ruby on Rails', 'Introdução ao framework Ruby on Rails e sua estrutura.', 40, 'video', 1),

('Modelos, Visões e Controladores', 'Aula 1: Modelos, Visões e Controladores', 'MVC no Ruby on Rails: Como organizar suas aplicações.', 45, 'texto', 1),

('Construção de uma Aplicação Web', 'Aula 1: Construção de uma Aplicação Web', 'Desenvolvendo uma aplicação web completa com Rails.', 50, 'video', 1),

-- Aulas para JavaScript Avançado
('Funções Avançadas e Closures', 'Aula 1: Funções Avançadas e Closures', 'Conceitos avançados de funções e closures no JavaScript.', 40, 'video', 1),

('Manipulação Assíncrona com Promises', 'Aula 1: Manipulação Assíncrona com Promises', 'Como trabalhar com Promises e funções assíncronas.', 45, 'texto', 1),

('Construção de uma Aplicação Web', 'Aula 1: Frameworks JavaScript', 'Introdução aos principais frameworks JavaScript (React, Vue, etc.).', 50, 'video', 1),

-- Aulas para Construção de APIs REST
('Introdução a APIs REST', 'Aula 1: Introdução a APIs REST', 'Conceitos fundamentais de APIs RESTful e HTTP.', 40, 'video', 1),

('Autenticação e Autorização', 'Aula 1: Autenticação e Autorização', 'Implementando autenticação e autorização em APIs REST.', 45, 'texto', 2),

('Desenvolvimento e Testes de APIs', 'Aula 1: Desenvolvimento e Testes de APIs', 'Desenvolvendo e testando APIs RESTful com ferramentas modernas.', 50, 'video', 3),

('Deploy e Escalabilidade', 'Aula 1: Deploy e Escalabilidade', 'Como realizar o deploy e escalar suas APIs.', 55, 'texto', 4),

-- Aulas para Angular Básico
('Introdução ao Angular', 'Aula 1: Introdução ao Angular', 'Fundamentos do framework Angular para aplicações web.', 40, 'video', 1),

('Componentes e Templates', 'Aula 1: Componentes e Templates', 'Como criar e usar componentes e templates no Angular.', 45, 'texto', 1),

('Diretivas e Serviços', 'Aula 1: Diretivas e Serviços', 'Introdução a diretivas e serviços no Angular.', 50, 'video', 1),

-- Aulas para React Native para Mobile
('Introdução ao React Native', 'Aula 1: Introdução ao React Native', 'Fundamentos do React Native e criação de aplicações móveis.', 40, 'video', 1),

('Componentes e Navegação', 'Aula 1: Componentes e Navegação', 'Trabalhando com componentes e navegação em React Native.', 45, 'texto', 1),

('Acesso a APIs e Usando Armazenamento Local', 'Aula 1: Acesso a APIs e Armazenamento Local', 'Integrando APIs e usando armazenamento local em apps móveis.', 50, 'video', 1),

('Publicação no Google Play e App Store', 'Aula 1: Publicação no Google Play e App Store', 'Como publicar aplicativos móveis em lojas de apps.', 55, 'texto', 1),

-- Aulas para Big Data com Hadoop
('Introdução ao Big Data e Hadoop', 'Aula 1: Introdução ao Big Data e Hadoop', 'Conceitos de Big Data e a arquitetura do Hadoop.', 45, 'video', 1),

('Processamento de Dados com MapReduce', 'Aula 1: Processamento de Dados com MapReduce', 'Como utilizar MapReduce para processar dados no Hadoop.', 50, 'texto', 1),

('Armazenamento e Análise de Dados', 'Aula 1: Armazenamento e Análise de Dados', 'Trabalhando com HDFS e realizando análises de dados em larga escala.', 55, 'video', 1),

-- Aulas para Teste de Software na Prática
('Introdução aos Testes de Software', 'Aula 1: Introdução aos Testes de Software', 'Fundamentos do teste de software e a importância dos testes.', 40, 'video', 1),
('Testes Manuais', 'Aula 2: Testes Manuais', 'Como realizar testes manuais em diferentes tipos de software.', 45, 'texto', 2),
('Testes Automatizados', 'Aula 3: Testes Automatizados', 'Introdução aos testes automatizados usando ferramentas populares.', 50, 'video', 3),

-- Aulas para Game Development com Unreal Engine
('Introdução ao Unreal Engine', 'Aula 1: Introdução ao Unreal Engine', 'Fundamentos da Unreal Engine e criação do seu primeiro jogo.', 45, 'video', 1),

('Criação de Personagens e Animações', 'Aula 1: Criação de Personagens e Animações', 'Como criar e animar personagens dentro da Unreal Engine.', 50, 'texto', 1),

('Programação de Jogo com Blueprints', 'Aula 1: Programação de Jogo com Blueprints', 'Aprenda a programar jogos utilizando Blueprints na Unreal Engine.', 55, 'video', 1),

('Desenvolvimento de IA para Jogos', 'Aula 1: Desenvolvimento de IA para Jogos', 'Como implementar inteligência artificial para jogos.', 60, 'texto', 1),

('Otimizando e Publicando seu Jogo', 'Aula 1: Otimizando e Publicando seu Jogo', 'Técnicas de otimização e publicação de jogos na Unreal Engine.', 65, 'video', 1),

-- Aulas para Introdução ao TypeScript
('Fundamentos do TypeScript', 'Aula 1: Fundamentos do TypeScript', 'Entendendo os tipos e a sintaxe básica do TypeScript.', 40, 'video', 1),

('Tipos Avançados e Generics', 'Aula 1: Tipos Avançados e Generics', 'Aprofundando-se em tipos avançados e generics no TypeScript.', 45, 'texto', 1),

('Integrando TypeScript com JavaScript', 'Aula 1: Integrando TypeScript com JavaScript', 'Como integrar TypeScript em projetos JavaScript existentes.', 50, 'video', 1),

-- Aulas para Gestão de Produtos Digitais
('Introdução à Gestão de Produtos Digitais', 'Aula 1: Introdução à Gestão de Produtos Digitais', 'Conceitos fundamentais de gestão de produtos no ambiente digital.', 40, 'video', 1),

('Metodologias Ágeis em Gestão de Produtos', 'Aula 1: Metodologias Ágeis', 'Como utilizar metodologias ágeis como Scrum e Kanban na gestão de produtos.', 45, 'texto', 1),

('Ferramentas de Gestão de Produtos', 'Aula 1: Ferramentas de Gestão de Produtos', 'Ferramentas essenciais para o gerenciamento de produtos digitais.', 50, 'video', 1),

-- Aulas para Noções de Docker
('Introdução ao Docker', 'Aula 1: Introdução ao Docker', 'Fundamentos do Docker e como funciona o conceito de contêineres.', 40, 'video', 1),

('Criando e Gerenciando Contêineres', 'Aula 1: Criando e Gerenciando Contêineres', 'Como criar, gerenciar e rodar contêineres Docker.', 45, 'texto', 1),

('Docker Compose e Orquestração', 'Aula 1: Docker Compose e Orquestração', 'Como usar o Docker Compose para orquestrar contêineres.', 50, 'video', 1),

-- Aulas para Desenvolvimento Backend com Node.js
('Fundamentos do Node.js', 'Aula 1: Fundamentos do Node.js', 'Introdução ao Node.js e como configurar o ambiente de desenvolvimento.', 45, 'video', 1),

('Criação de Servidores com Express.js', 'Aula 1: Criação de Servidores com Express.js', 'Como criar servidores robustos utilizando Express.js no Node.js.', 50, 'texto', 1),

('Trabalhando com Banco de Dados', 'Aula 1: Trabalhando com Banco de Dados', 'Como integrar bancos de dados, como MongoDB, com Node.js.', 55, 'video', 1),

('Autenticação e Segurança', 'Aula 1: Autenticação e Segurança', 'Implementando autenticação e segurança em APIs com Node.js.', 60, 'texto', 1),

('Deploy de Aplicações Backend', 'Aula 1: Deploy de Aplicações Backend', 'Como realizar o deploy de aplicações backend com Node.js.', 65, 'video', 1),

-- Aulas para Django para Web
('Introdução ao Django', 'Aula 1: Introdução ao Django', 'Fundamentos do framework Django e configuração inicial.', 40, 'video', 1),

('Trabalhando com Modelos', 'Aula 1: Trabalhando com Modelos', 'Como criar e gerenciar modelos no Django.', 45, 'texto', 1),

('Views e Templates', 'Aula 1: Views e Templates', 'Como criar views dinâmicas e utilizar templates no Django.', 50, 'video', 1),

('Formulários e Validação', 'Aula 1: Formulários e Validação', 'Criando e validando formulários com Django.', 55, 'texto', 1),

('Deploy e Segurança', 'Aula 1: Deploy e Segurança', 'Como fazer deploy de aplicativos Django e garantir a segurança.', 60, 'video', 1),

-- Aulas para Flutter na Prática
('Introdução ao Flutter', 'Aula 1: Introdução ao Flutter', 'Fundamentos do Flutter e configuração de ambiente para apps móveis.', 40, 'video', 1),

('Widgets e Layouts', 'Aula 1: Widgets e Layouts', 'Como trabalhar com widgets e criar layouts no Flutter.', 45, 'texto', 1),

('Gerenciamento de Estado', 'Aula 1: Gerenciamento de Estado', 'Como gerenciar o estado de um aplicativo Flutter.', 50, 'video', 1),

('Acesso a APIs e Armazenamento Local', 'Aula 1: Acesso a APIs e Armazenamento Local com Flutter', 'Integrando APIs e utilizando armazenamento local no Flutter.', 55, 'texto', 1),

('Publicação de Apps Flutter', 'Aula 1: Publicação de Apps Flutter', 'Como publicar aplicativos Flutter nas lojas de apps.', 60, 'video', 1),

-- Aulas para ElasticSearch Básico
('Introdução ao ElasticSearch', 'Aula 1: Introdução ao ElasticSearch', 'Fundamentos do ElasticSearch e sua configuração inicial.', 40, 'video', 1),

('Índices e Documentos', 'Aula 1: Índices e Documentos', 'Como criar e gerenciar índices e documentos no ElasticSearch.', 45, 'texto', 1),

('Consultas e Busca', 'Aula 1: Consultas e Busca', 'Como realizar consultas e buscas no ElasticSearch.', 50, 'video', 1),

-- Aulas para Inteligência Artificial com TensorFlow
('Introdução ao TensorFlow', 'Aula 1: Introdução ao TensorFlow', 'Fundamentos do TensorFlow e configuração do ambiente de IA.', 45, 'video', 1),

('Redes Neurais com TensorFlow', 'Aula 1: Redes Neurais com TensorFlow', 'Como criar e treinar redes neurais com TensorFlow.', 50, 'texto', 1),

('Deep Learning e Transfer Learning', 'Aula 1: Deep Learning e Transfer Learning', 'Técnicas avançadas de Deep Learning e Transfer Learning no TensorFlow.', 55, 'video', 1),

('Modelos de Produção com TensorFlow', 'Aula 1: Modelos de Produção com TensorFlow', 'Como levar modelos de IA para produção com TensorFlow.', 60, 'texto', 1),

-- Aulas para Introdução à Ciência de Dados
('Fundamentos da Ciência de Dados', 'Aula 1: Fundamentos da Ciência de Dados', 'Compreendendo os principais conceitos de Ciência de Dados.', 40, 'video', 1),

('Exploração de Dados e Pré-processamento', 'Aula 1: Exploração de Dados e Pré-processamento', 'Como explorar e preparar dados para análise e modelagem.', 45, 'texto', 1),

('Fundamentos de Machine Learning', 'Aula 1: Introdução ao Machine Learning', 'Fundamentos de Machine Learning e como implementar modelos simples.', 50, 'video', 1),

('Visualização de Dados', 'Aula 1: Visualização de Dados', 'Como utilizar ferramentas para visualizar dados de forma eficaz.', 55, 'texto', 1),

-- Aulas para Marketing Digital para Empresas
('Introdução ao Marketing Digital', 'Aula 1: Introdução ao Marketing Digital', 'Fundamentos e estratégias iniciais de marketing digital para empresas.', 40, 'video', 1),

('SEO e SEM', 'Aula 1: SEO e SEM', 'Estratégias de otimização para motores de busca (SEO) e marketing de busca (SEM).', 45, 'texto', 1),

('Redes Sociais e Marketing de Conteúdo', 'Aula 1: Redes Sociais e Marketing de Conteúdo', 'Como utilizar redes sociais e criar conteúdo estratégico para engajamento.', 50, 'video', 1),

('E-mail Marketing e Automação', 'Aula 1: E-mail Marketing e Automação', 'Como criar campanhas de e-mail marketing e automatizar processos de comunicação.', 55, 'texto', 1),

-- Aulas para Excel Avançado
('Funções Avançadas no Excel', 'Aula 1: Funções Avançadas no Excel', 'Explorando funções avançadas como PROCV, ÍNDICE, CORRESP, entre outras.', 40, 'video', 1),

('Gráficos e Visualização de Dados', 'Aula 1: Gráficos e Visualização de Dados', 'Criando gráficos dinâmicos e visualizações para análise de dados complexos.', 45, 'texto', 1),

('Macros e VBA', 'Aula 1: Macros e VBA', 'Automatizando processos no Excel com Macros e VBA.', 50, 'video', 1),

('Análise de Dados com Power Query', 'Aula 1: Análise de Dados com Power Query', 'Como usar Power Query para transformação e análise avançada de dados.', 55, 'texto', 1),

-- Aulas para PHP para Web
('Introdução ao PHP', 'Aula 1: Introdução ao PHP', 'Fundamentos do PHP e configuração de ambiente para desenvolvimento web.', 40, 'video', 1),

('Formulários e Banco de Dados', 'Aula 1: Formulários e Banco de Dados', 'Como trabalhar com formulários e integrar bancos de dados no PHP.', 45, 'texto', 1),

('Manipulação de Sessões e Cookies', 'Aula 1: Manipulação de Sessões e Cookies', 'Trabalhando com sessões e cookies em aplicações web com PHP.', 50, 'video', 1),

('Autenticação e Segurança com PHP', 'Aula 1: Autenticação e Segurança com PHP', 'Como implementar sistemas de autenticação e segurança em PHP.', 55, 'texto', 1),

-- Aulas para MongoDB na Prática
('Introdução ao MongoDB', 'Aula 1: Introdução ao MongoDB', 'Fundamentos do MongoDB e como configurar o ambiente de banco NoSQL.', 40, 'video', 1),

('Modelagem de Dados no MongoDB', 'Aula 1: Modelagem de Dados no MongoDB', 'Como criar e gerenciar documentos e coleções no MongoDB.', 45, 'texto', 1),

('Consultas e Agregações no MongoDB', 'Aula 1: Consultas e Agregações no MongoDB', 'Realizando consultas avançadas e operações de agregação no MongoDB.', 50, 'video', 1),

-- Aulas para Programação Funcional com Scala
('Fundamentos da Programação Funcional', 'Aula 1: Fundamentos da Programação Funcional', 'Introdução ao paradigma funcional e seus princípios em Scala.', 45, 'video', 1),

('Imutabilidade e Funções de Alta Ordem', 'Aula 1: Imutabilidade e Funções de Alta Ordem', 'Compreendendo a imutabilidade e o uso de funções de alta ordem em Scala.', 50, 'texto', 1),

('Tratamento de Erros e Tipos', 'Aula 1: Tratamento de Erros e Tipos', 'Como tratar erros e utilizar tipos robustos na programação funcional em Scala.', 55, 'video', 1),

('Concorrência e Parallellism', 'Aula 1: Concorrência e Paralelismo', 'Implementando concorrência e paralelismo na programação funcional com Scala.', 60, 'texto', 1),

-- Aulas para Introdução ao C#
('Fundamentos do C#', 'Aula 1: Fundamentos do C#', 'Introdução à linguagem C# e conceitos básicos de programação.', 40, 'video', 1),

('Estruturas de Controle com C#', 'Aula 1: Estruturas de Controle', 'Como usar estruturas de controle (if, loops) em C#.', 45, 'texto', 1),

('Tipos de Dados e Variáveis', 'Aula 1: Tipos de Dados e Variáveis', 'Trabalhando com tipos de dados e variáveis em C#.', 50, 'video', 1),

('Orientação a Objetos em C#', 'Aula 1: Orientação a Objetos em C#', 'Introdução à programação orientada a objetos em C#.', 55, 'texto', 1),

-- Aulas para Design Thinking para Inovação
('Introdução ao Design Thinking', 'Aula 1: Introdução ao Design Thinking', 'Compreendendo o conceito e processo de Design Thinking.', 40, 'video', 1),

('Empatia e Definição do Problema', 'Aula 1: Empatia e Definição do Problema', 'Como praticar empatia e definir problemas com Design Thinking.', 45, 'texto', 1),

('Ideação e Protótipos', 'Aula 1: Ideação e Protótipos', 'Gerando ideias e criando protótipos para soluções inovadoras.', 50, 'video', 1),

('Testando e Implementando Soluções', 'Aula 1: Testando e Implementando Soluções', 'Como testar e implementar soluções com Design Thinking.', 55, 'texto', 1),

-- Aulas para Internet das Coisas (IoT)
('Introdução à IoT', 'Aula 1: Introdução à IoT', 'Fundamentos e arquitetura básica da Internet das Coisas.', 40, 'video', 1),

('Sensores e Dispositivos', 'Aula 1: Sensores e Dispositivos', 'Trabalhando com sensores e dispositivos IoT.', 45, 'texto', 1),

('Conectividade e Redes', 'Aula 1: Conectividade e Redes', 'Como conectar dispositivos IoT e configurar redes.', 50, 'video', 1),

('Processamento e Análise de Dados', 'Aula 1: Processamento e Análise de Dados', 'Analisando dados de dispositivos IoT e tomando decisões inteligentes.', 55, 'texto', 1),

-- Aulas para Automação com Shell Script
('Introdução ao Shell Script', 'Aula 1: Introdução ao Shell Script', 'Fundamentos do shell script e como escrever seus primeiros scripts.', 40, 'video', 1),

('Manipulação de Arquivos e Diretórios', 'Aula 1: Manipulação de Arquivos e Diretórios', 'Como manipular arquivos e diretórios usando shell script.', 45, 'texto', 1),

('Automação de Tarefas Repetitivas', 'Aula 1: Automação de Tarefas Repetitivas', 'Como automatizar tarefas diárias em sistemas Unix com shell script.', 50, 'video', 1),

('Depuração e Execução de Scripts', 'Aula 1: Depuração e Execução de Scripts', 'Técnicas para depurar e executar scripts de forma eficiente.', 55, 'texto', 1),

-- Aulas para Linguagem Go para Backend
('Introdução ao Go', 'Aula 1: Introdução ao Go', 'Fundamentos da linguagem Go e sua configuração para backend.', 40, 'video', 1),

('Estruturas de Dados e Concorência', 'Aula 1: Estruturas de Dados e Concorência', 'Como usar estruturas de dados e concorrência no Go.', 45, 'texto', 1),

('APIs e Web Servers com Go', 'Aula 1: APIs e Web Servers com Go', 'Desenvolvendo APIs e servidores web com Go.', 50, 'video', 1),

('Testes e Deploy de Aplicações Go', 'Aula 1: Testes e Deploy de Aplicações Go', 'Como testar e fazer o deploy de suas aplicações Go.', 55, 'texto', 1),

-- Aulas para Sistemas Operacionais na Prática
('Fundamentos dos Sistemas Operacionais', 'Aula 1: Fundamentos dos Sistemas Operacionais', 'Compreendendo os conceitos fundamentais de sistemas operacionais.', 40, 'video', 1),

('Gerenciamento de Processos', 'Aula 1: Gerenciamento de Processos', 'Como gerenciar processos e entender a sua execução no sistema operacional.', 45, 'texto', 1),

('Memória e Armazenamento', 'Aula 1: Memória e Armazenamento', 'Gerenciando memória e armazenamento em sistemas operacionais.', 50, 'video', 1),

('Sistemas de Arquivos e Segurança', 'Aula 1: Sistemas de Arquivos e Segurança', 'Como trabalhar com sistemas de arquivos e garantir a segurança no sistema operacional.', 55, 'texto', 1);

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

INSERT INTO Vaga (id, nome, descricao, empresa) VALUES
(1,     'Desenvolvedor Front-end',                'Responsável pela criação e manutenção de interfaces de usuário.',                  'Tech Solutions'),
(2,     'Desenvolvedor Back-end',                 'Foco em desenvolvimento de APIs e integração de sistemas.',                        'Innovatech'),
(3,     'Cientista de Dados',                     'Análise de dados e construção de modelos preditivos.',                             'Data Insights'),
(4,     'Analista de Qualidade',                  'Garantir a qualidade dos produtos através de testes manuais e automatizados.',     'Quality First'),
(5,     'Designer de UI/UX',                      'Criação de interfaces intuitivas e experiências de usuário.',                      'Creative Labs'),
(6,     'Engenheiro de Software',                 'Desenvolvimento de software em equipe e implementação de melhorias.',              'Software Dynamics'),
(7,     'Especialista em DevOps',                 'Implementação de práticas DevOps e automação de processos.',                       'OpsGenie'),
(8,     'Gerente de Projetos',                    'Liderar equipes em projetos de desenvolvimento de software.',                      'Project Hub'),
(9,     'Analista de Segurança da Informação',    'Proteger os dados e sistemas da empresa.',                                         'SecureIT'),
(10,    'Instrutor de Cursos Online',             'Criar e ministrar cursos de tecnologia.',                                          'LearnTech'),
(11,    'Desenvolvedor Mobile',                   'Criação de aplicativos para Android e iOS.',                                       'Mobile Innovations'),
(12,    'Analista de Marketing Digital',          'Planejamento e execução de campanhas online.',                                     'Digital Reach'),
(13,    'Gerente de Produto',                     'Definir a visão e o roadmap do produto.',                                          'Product Visionaries'),
(14,    'Analista de Dados',                      'Coletar e interpretar dados para gerar insights.',                                 'Insight Analytics'),
(15,    'Consultor de TI',                        'Auxiliar empresas na implementação de soluções tecnológicas.',                     'Tech Advisors'),
(16,    'Especialista em Banco de Dados',         'Gerenciamento e otimização de bancos de dados.',                                   'Database Masters'),
(17,    'Desenvolvedor Full Stack',               'Atuação em todas as camadas de desenvolvimento.',                                  'Full Stack Agency'),
(18,    'Pesquisador em Inteligência Artificial', 'Desenvolver e testar algoritmos de IA.',                                           'AI Research Labs'),
(19,    'Coordenador de Suporte Técnico',         'Gerenciar a equipe de suporte e atendimento ao cliente.',                          'Support Solutions'),
(20,    'Analista de Sistemas',                   'Levantar requisitos e analisar sistemas existentes.',                             'Systems Analysis Inc.');

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
('rodrigomonteiro@hotmail.com',     'Desenvolvimento em Java'),
('marcossilva@gmail.com',           'Python para Automação'),
('lucianaalmeida@hotmail.com',      'Introdução ao Power BI'),
('carlossantos@gmail.com',          'Kubernetes na Prática'),
('patriciaoliveira@hotmail.com',    'Introdução ao Ruby on Rails'),
('robertopereira@gmail.com',        'JavaScript Avançado'),
('fernandacosta@hotmail.com',       'Construção de APIs REST'),
('anasouza@gmail.com',              'Angular Básico'),
('brunorocha@hotmail.com',          'React Native para Mobile'),
('deboranunes@gmail.com',           'Big Data com Hadoop'),
('felipecardoso@hotmail.com',       'Teste de Software na Prática'),
('gabrielamendes@gmail.com',        'Game Development com Unreal Engine'),
('joaofernandes@hotmail.com',       'Introdução ao TypeScript'),
('camilaribeiro@gmail.com',         'Gestão de Produtos Digitais'),
('renatocarvalho@hotmail.com',      'Noções de Docker'),
('isabelamartins@gmail.com',        'Desenvolvimento Backend com Node.js'),
('lucasmoreira@hotmail.com',        'Django para Web'),
('larissabatista@gmail.com',        'Flutter na Prática'),
('paulobarreto@hotmail.com',        'ElasticSearch Básico'),
('vanessasilva@gmail.com',          'Inteligência Artificial com TensorFlow'),
('rodrigomonteiro@hotmail.com',     'Introdução à Ciência de Dados'),
('marcossilva@gmail.com',           'Marketing Digital para Empresas'),
('lucianaalmeida@hotmail.com',      'Excel Avançado'),
('carlossantos@gmail.com',          'PHP para Web'),
('patriciaoliveira@hotmail.com',    'MongoDB na Prática'),
('robertopereira@gmail.com',        'Programação Funcional com Scala'),
('fernandacosta@hotmail.com',       'Introdução ao C#'),
('marcossilva@gmail.com',           'Design Thinking para Inovação'),
('lucianaalmeida@hotmail.com',      'Automação com Shell Script'),
('carlossantos@gmail.com',          'Internet das Coisas (IoT)'),
('patriciaoliveira@hotmail.com',    'Linguagem Go para Backend'),
('robertopereira@gmail.com',        'Sistemas Operacionais na Prática');

INSERT INTO Se_Inscreve (email_aluno, id_vaga) VALUES
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
