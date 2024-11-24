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
('vanessacampos@gmail.com',     'Vanessa Campos',       '2000-02-11', 'ativo'),
('pietra93@da.org', 'Evelyn das Neves', '1999-11-30', 'ativo'),
('jdas-neves@almeida.com', 'Manuela Fernandes', '1993-04-22', 'inativo'),
('rafaela96@ribeiro.br', 'Catarina da Cruz', '1993-01-07', 'ativo'),
('ana-beatriz33@bol.com.br', 'Emilly Peixoto', '1981-03-22', 'ativo'),
('vitor64@sales.com', 'Heitor Silveira', '2001-02-20', 'inativo'),
('da-conceicaoantonio@yahoo.com.br', 'Ana Rodrigues', '1998-01-25', 'ativo'),
('smoura@da.net', 'Benício Oliveira', '2010-02-09', 'ativo'),
('rebeca44@araujo.br', 'Miguel Souza', '1993-03-14', 'ativo'),
('enzorocha@yahoo.com.br', 'Enzo Gabriel Costela', '1998-02-08', 'inativo'),
('amandacaldeira@da.org', 'Gustavo Araújo', '1995-05-29', 'ativo'),
('benicio81@uol.com.br', 'Anthony Oliveira', '2009-03-29', 'inativo'),
('da-cruzenzo-gabriel@almeida.br', 'Pietro Carvalho', '1999-09-13', 'ativo'),
('xda-paz@sales.br', 'Nathan Martins', '2003-10-24', 'ativo'),
('samuelda-mata@aragao.org', 'Bianca Fernandes', '1972-10-06', 'inativo'),
('martinsisaac@gmail.com', 'Stephany Nascimento', '1988-11-06', 'ativo'),
('ana-beatriz24@ig.com.br', 'Maria Luiza Cavalcanti', '1982-06-10', 'ativo'),
('luiz-felipe65@ig.com.br', 'Bryan Rodrigues', '1993-04-19', 'ativo'),
('cda-rocha@jesus.com', 'Gabriela Lima', '2004-10-02', 'inativo'),
('fmonteiro@farias.br', 'Murilo Cardoso', '1995-10-10', 'ativo'),
('juanalmeida@uol.com.br', 'Vitor Hugo Farias', '1989-02-16', 'ativo'),
('alvesdavi-luiz@sales.br', 'Mirella Dias', '1974-05-24', 'ativo'),
('luiz-henrique42@ig.com.br', 'Gustavo Henrique Monteiro', '1986-04-16', 'ativo'),
('goncalvesmaria-alice@nogueira.org', 'Felipe Campos', '1970-05-31', 'ativo'),
('evelyn57@uol.com.br', 'Joaquim Pires', '1986-02-07', 'ativo'),
('amanda91@yahoo.com.br', 'Augusto Santos', '1976-11-13', 'ativo'),
('levicostela@viana.br', 'Eduarda Caldeira', '1996-05-26', 'ativo'),
('umonteiro@gmail.com', 'Isabella Ramos', '1984-01-18', 'ativo'),
('maria-claracardoso@rodrigues.br', 'Mariane da Rocha', '1981-11-22', 'ativo'),
('mariana02@uol.com.br', 'Bernardo da Mata', '1989-11-12', 'ativo'),
('ypeixoto@ramos.com', 'Isabelly Pinto', '1992-03-04', 'ativo'),
('pgoncalves@das.br', 'Ana Clara Barbosa', '1984-05-01', 'ativo'),
('yfarias@gmail.com', 'Natália Araújo', '1992-07-11', 'ativo'),
('emanuel06@yahoo.com.br', 'Julia da Costa', '2004-01-18', 'ativo'),
('heitor51@cunha.net', 'Antônio da Costa', '1998-05-27', 'ativo'),
('faraujo@da.org', 'Olivia Castro', '2008-02-10', 'ativo'),
('barbarada-cruz@uol.com.br', 'Sophia Aragão', '1970-01-02', 'ativo'),
('diasnoah@moreira.br', 'Evelyn Cavalcanti', '1981-12-05', 'inativo'),
('gramos@ig.com.br', 'Enrico Duarte', '1985-02-19', 'ativo'),
('livia49@yahoo.com.br', 'Lorenzo Azevedo', '2010-07-04', 'ativo'),
('luiza30@yahoo.com.br', 'Yasmin Nascimento', '2000-01-19', 'ativo'),
('gsilveira@yahoo.com.br', 'Pietro Moraes', '1996-01-30', 'ativo'),
('fariasmaria-sophia@gmail.com', 'Levi Aragão', '1992-09-09', 'ativo'),
('da-mataana@yahoo.com.br', 'Kaique Nogueira', '1999-11-30', 'ativo'),
('pedro-henrique90@uol.com.br', 'Laís Pires', '1999-04-10', 'inativo'),
('ribeirokevin@yahoo.com.br', 'Mariana Caldeira', '1999-02-20', 'ativo'),
('beniciocampos@rodrigues.br', 'Emilly Rocha', '1978-05-24', 'ativo'),
('davi-luiz23@yahoo.com.br', 'Pedro Henrique Silva', '1973-12-12', 'inativo'),
('azevedoisaac@yahoo.com.br', 'Lucas Campos', '1976-12-23', 'inativo'),
('egomes@araujo.com', 'Amanda Moreira', '2011-08-12', 'ativo'),
('natalia49@bol.com.br', 'Yuri Souza', '2008-01-08', 'ativo'),
('duarteamanda@da.org', 'Vitor Hugo Almeida', '1991-01-10', 'inativo'),
('esales@santos.com', 'Calebe Cunha', '1976-02-11', 'ativo'),
('davisilveira@yahoo.com.br', 'Luiza Santos', '2000-10-14', 'ativo'),
('raquelaragao@teixeira.com', 'Pietro Gonçalves', '1989-06-20', 'ativo'),
('joao-guilhermefreitas@yahoo.com.br', 'Arthur Lopes', '1987-09-21', 'ativo'),
('qfernandes@ig.com.br', 'Otávio da Paz', '1977-12-27', 'ativo'),
('bruno29@ig.com.br', 'João Lucas Mendes', '1991-04-26', 'ativo'),
('ydas-neves@hotmail.com', 'Clarice da Luz', '2006-05-13', 'ativo'),
('rocharebeca@vieira.com', 'Samuel Lopes', '1995-01-24', 'ativo'),
('miguelda-mota@jesus.br', 'Luiz Otávio Gonçalves', '1981-06-24', 'ativo'),
('da-luzbianca@gmail.com', 'Guilherme Moura', '1970-12-03', 'ativo'),
('isabelfogaca@yahoo.com.br', 'Larissa Peixoto', '1992-02-04', 'ativo'),
('lunafernandes@almeida.net', 'Rodrigo Duarte', '1986-07-21', 'ativo'),
('marina44@rocha.br', 'Nathan da Cunha', '1995-03-28', 'ativo'),
('stellafreitas@costa.br', 'Alexandre Carvalho', '1985-04-28', 'inativo'),
('lorenapinto@moura.com', 'Evelyn Cardoso', '2001-01-31', 'ativo'),
('maria-fernandarocha@novaes.br', 'Francisco Peixoto', '1981-07-11', 'inativo'),
('pietraramos@da.com', 'Maria Alice Cardoso', '2011-06-01', 'ativo'),
('da-matalara@bol.com.br', 'Calebe Novaes', '1991-02-19', 'ativo'),
('camposcecilia@uol.com.br', 'Letícia Ribeiro', '1986-06-22', 'ativo'),
('camilafreitas@bol.com.br', 'Agatha Nunes', '1991-07-15', 'ativo'),
('vitor-hugopeixoto@da.br', 'Vinicius Cavalcanti', '1979-08-23', 'ativo'),
('heitor51@pinto.net', 'Alana Cardoso', '1984-05-01', 'ativo'),
('luizaoliveira@da.com', 'Cauê Caldeira', '1998-08-27', 'ativo'),
('melissacorreia@gmail.com', 'Alice Gomes', '2002-04-21', 'ativo'),
('imoraes@hotmail.com', 'Vicente Ribeiro', '1974-01-03', 'ativo'),
('joao-gabrielcaldeira@fogaca.br', 'Thales Duarte', '2001-01-10', 'inativo'),
('zcorreia@das.br', 'Enzo Gabriel Nascimento', '1977-03-02', 'ativo'),
('nogueiradanilo@da.org', 'Marcos Vinicius Araújo', '1980-02-10', 'ativo'),
('luiz-henriquenovaes@farias.br', 'Mirella Lima', '1972-09-27', 'ativo'),
('cvieira@fernandes.com', 'Caroline Cardoso', '1997-07-20', 'ativo'),
('sarah33@bol.com.br', 'Diego da Mata', '1971-05-12', 'ativo'),
('da-rochavalentina@rezende.br', 'Ana Vitória Silva', '1998-06-28', 'ativo'),
('peixotojuliana@da.net', 'Ana Lívia Rocha', '1980-04-30', 'ativo'),
('danilo69@souza.net', 'Pietra Barbosa', '1980-05-09', 'ativo'),
('calebe93@nunes.br', 'Beatriz Novaes', '1969-12-20', 'ativo'),
('maria-alice59@da.net', 'Joaquim Barbosa', '1994-08-20', 'ativo'),
('cunhamaria-eduarda@gmail.com', 'Vitor Hugo Aragão', '1981-03-17', 'ativo'),
('fcunha@hotmail.com', 'Anthony Cunha', '1972-08-05', 'ativo'),
('da-matamirella@hotmail.com', 'Maria Eduarda Teixeira', '1982-09-15', 'ativo'),
('jcastro@correia.net', 'Brenda Aragão', '1980-03-14', 'ativo'),
('eloahsilva@uol.com.br', 'Enzo Pereira', '2010-01-25', 'ativo'),
('camposmirella@bol.com.br', 'Ana Laura Cardoso', '2004-12-24', 'ativo'),
('ryan49@hotmail.com', 'Marcos Vinicius Santos', '1979-06-12', 'ativo'),
('isabelcorreia@bol.com.br', 'Carolina Souza', '1971-01-02', 'ativo'),
('vitoria83@da.com', 'Alícia Cavalcanti', '1998-07-07', 'inativo'),
('da-luzesther@uol.com.br', 'Enrico Martins', '1987-09-13', 'ativo'),
('araujoesther@hotmail.com', 'Ana Laura Oliveira', '1982-05-07', 'ativo'),
('aliceviana@carvalho.net', 'Esther Oliveira', '1981-05-31', 'ativo'),
('alvesemilly@freitas.com', 'Maria Eduarda Oliveira', '1998-08-01', 'ativo'),
('bcosta@gmail.com', 'Emanuella Lopes', '2008-04-04', 'ativo'),
('vda-rocha@hotmail.com', 'Ana Julia Barbosa', '1994-01-25', 'ativo'),
('livia01@da.br', 'Juliana Rodrigues', '1973-09-07', 'ativo'),
('aragaolara@nogueira.com', 'Melissa da Costa', '1996-02-21', 'ativo'),
('salves@teixeira.br', 'Camila Moreira', '1983-02-23', 'ativo'),
('martinsfrancisco@caldeira.org', 'Juan Correia', '1999-04-29', 'inativo'),
('daniel44@peixoto.net', 'Daniel Castro', '1997-12-07', 'ativo'),
('paulo46@mendes.br', 'Lucas Gabriel Lima', '1975-07-21', 'inativo'),
('fernando11@novaes.br', 'Raul Fernandes', '2010-08-17', 'inativo'),
('raulmoraes@aragao.org', 'Ana Sophia Santos', '1983-08-15', 'ativo'),
('cardosocamila@novaes.org', 'Bryan Rodrigues', '1986-03-19', 'ativo'),
('kda-conceicao@uol.com.br', 'Davi Lucas Costa', '1977-12-11', 'ativo'),
('isis22@bol.com.br', 'Luana Souza', '2005-09-08', 'ativo'),
('davi42@rocha.com', 'Isabel Araújo', '1990-05-03', 'inativo'),
('xdas-neves@hotmail.com', 'Nicolas Teixeira', '1999-03-05', 'ativo'),
('amandasouza@cardoso.com', 'Erick da Cunha', '2004-09-24', 'inativo'),
('leandro21@yahoo.com.br', 'Ana Carolina da Mata', '1991-12-23', 'ativo'),
('cardosodavi-lucca@hotmail.com', 'Ryan das Neves', '2001-06-13', 'inativo'),
('wlima@barbosa.com', 'Pedro Rodrigues', '1993-05-15', 'ativo'),
('maria-clarasantos@lima.net', 'Isaac Moraes', '2010-11-30', 'ativo'),
('cavalcantimaria-cecilia@rezende.net', 'Thiago da Cunha', '1974-06-22', 'ativo'),
('lribeiro@gmail.com', 'Evelyn Peixoto', '1987-06-03', 'ativo'),
('fda-conceicao@almeida.br', 'Davi Lucca da Cruz', '1994-09-12', 'ativo'),
('juliana35@hotmail.com', 'Diego Ribeiro', '1970-06-02', 'ativo'),
('ceciliaribeiro@melo.br', 'Alexandre da Cruz', '1998-08-19', 'ativo'),
('eda-rocha@caldeira.com', 'Maria Clara Duarte', '2005-03-02', 'inativo'),
('camposana-sophia@jesus.net', 'Gustavo das Neves', '1990-09-06', 'inativo'),
('isaacgoncalves@correia.net', 'Luigi Lima', '2007-02-24', 'ativo'),
('uteixeira@bol.com.br', 'Laura Pereira', '1973-03-01', 'ativo'),
('pietra31@vieira.br', 'Thales Caldeira', '1992-04-20', 'ativo'),
('fda-conceicao@correia.com', 'Luiz Henrique da Mota', '2007-08-21', 'ativo'),
('luiz-felipe70@ig.com.br', 'Gabriel Ramos', '2010-10-11', 'ativo'),
('luiz-gustavo04@hotmail.com', 'Leonardo Rodrigues', '1987-04-14', 'ativo'),
('psilveira@das.org', 'Giovanna Rocha', '1978-11-19', 'ativo'),
('beatrizcaldeira@hotmail.com', 'Pedro Azevedo', '1979-06-04', 'ativo'),
('fogacalorena@uol.com.br', 'Luiz Otávio da Conceição', '1990-03-09', 'ativo'),
('vitor-hugo39@dias.com', 'Sophia Santos', '1990-10-18', 'ativo'),
('zcosta@uol.com.br', 'Helena Dias', '1986-09-09', 'ativo'),
('valentinamoreira@ig.com.br', 'Calebe Barbosa', '1981-07-21', 'ativo'),
('portoigor@bol.com.br', 'Sophie da Conceição', '1999-11-11', 'ativo'),
('isiscardoso@ig.com.br', 'Marcela da Rocha', '1969-11-24', 'inativo'),
('melomaria@hotmail.com', 'Maria Alice Fogaça', '1978-11-24', 'inativo'),
('ccavalcanti@ig.com.br', 'Bruno Pinto', '1991-01-19', 'ativo'),
('xcaldeira@bol.com.br', 'Amanda Silva', '1987-08-03', 'ativo'),
('luiz-miguelgoncalves@dias.org', 'Giovanna Fogaça', '1988-12-08', 'ativo'),
('rodrigueslaura@porto.br', 'Amanda Pinto', '1976-04-20', 'inativo'),
('joao-feliperocha@uol.com.br', 'Vitória Correia', '1982-08-23', 'ativo'),
('maria-juliafreitas@novaes.br', 'Gabrielly Peixoto', '1977-11-06', 'inativo'),
('carolinefarias@viana.br', 'Gabriel Carvalho', '1989-12-07', 'ativo'),
('thalessantos@mendes.br', 'Beatriz das Neves', '1991-06-26', 'ativo'),
('rodriguesisaac@bol.com.br', 'Maria Sophia das Neves', '1983-09-15', 'ativo'),
('anafernandes@ramos.net', 'Ana Lívia da Rocha', '1996-09-24', 'ativo'),
('gmoraes@gmail.com', 'Luiz Fernando Gomes', '1994-03-15', 'ativo'),
('vmoura@yahoo.com.br', 'Enrico da Cruz', '1994-02-15', 'inativo'),
('vitor00@yahoo.com.br', 'Cauã Cavalcanti', '1984-12-27', 'ativo'),
('ana-luiza83@melo.com', 'Maria Fernanda Moura', '2009-02-27', 'ativo'),
('luigipinto@campos.br', 'Samuel Castro', '2005-08-01', 'ativo'),
('qsouza@yahoo.com.br', 'João Felipe Almeida', '2003-11-22', 'ativo'),
('novaesyuri@ig.com.br', 'Luana da Mota', '1978-12-02', 'ativo'),
('ferreiramelissa@lima.com', 'Raquel Cavalcanti', '1975-01-05', 'ativo'),
('da-pazvitor-gabriel@nascimento.net', 'Lorena Almeida', '1979-05-06', 'ativo'),
('da-conceicaoian@pereira.com', 'Elisa Castro', '2004-02-20', 'ativo'),
('jsouza@ig.com.br', 'Gustavo Henrique Sales', '1971-08-16', 'inativo'),
('castropedro@uol.com.br', 'Brenda Ferreira', '1971-03-09', 'ativo'),
('moreiradavi@aragao.net', 'Augusto da Conceição', '1979-06-23', 'ativo'),
('nina57@uol.com.br', 'Ana da Paz', '1998-10-27', 'ativo'),
('qdias@da.com', 'Júlia Azevedo', '1976-10-15', 'ativo'),
('carvalhoana-julia@silva.com', 'Joaquim da Paz', '2005-05-03', 'ativo'),
('leonardomoura@da.com', 'Sophia Mendes', '2005-05-03', 'ativo'),
('camposisis@yahoo.com.br', 'Davi Lima', '1984-05-26', 'ativo'),
('mendeslucas@uol.com.br', 'Heitor Silva', '1991-01-27', 'ativo'),
('luiz-fernandocardoso@ig.com.br', 'Luna da Cunha', '1992-10-05', 'ativo'),
('almeidaluiz-otavio@gmail.com', 'Caroline Moreira', '1989-05-31', 'ativo'),
('vinicius49@gmail.com', 'Igor Ferreira', '1980-04-03', 'ativo'),
('araujolarissa@ig.com.br', 'Marcela Almeida', '2009-02-18', 'ativo'),
('pnunes@da.com', 'Isabelly Moreira', '1974-02-06', 'ativo'),
('kaique85@gmail.com', 'Lívia Moura', '1987-02-20', 'ativo'),
('lucas-gabrielviana@da.com', 'Manuela Nascimento', '1991-11-14', 'ativo'),
('caue62@uol.com.br', 'Ana Vitória Lima', '1979-11-08', 'inativo'),
('sophia26@gmail.com', 'Maria Cecília Monteiro', '1984-12-10', 'ativo'),
('valentina17@yahoo.com.br', 'Sabrina Ramos', '1973-04-22', 'ativo'),
('isabellydas-neves@uol.com.br', 'João Lucas Silveira', '1983-12-18', 'ativo'),
('santosantonio@costela.com', 'Guilherme Duarte', '1979-03-10', 'ativo'),
('joao-felipedas-neves@pinto.net', 'Olivia Sales', '1982-08-19', 'ativo'),
('hrodrigues@fogaca.com', 'Sarah Farias', '1972-05-13', 'ativo'),
('cauecostela@farias.com', 'Ana Carolina da Rosa', '1986-04-22', 'ativo'),
('marianelopes@ig.com.br', 'Catarina Caldeira', '1977-11-15', 'ativo'),
('santosyasmin@hotmail.com', 'Lucas Freitas', '1991-08-21', 'ativo'),
('ramosjoao-miguel@bol.com.br', 'Alice Pires', '2010-03-16', 'ativo'),
('opereira@yahoo.com.br', 'Lara Pires', '1988-08-03', 'ativo'),
('moraesisabelly@yahoo.com.br', 'Sophia Ferreira', '1989-12-09', 'ativo'),
('knunes@yahoo.com.br', 'Brenda Moraes', '1985-03-26', 'ativo'),
('da-cruzamanda@cardoso.org', 'João Miguel Souza', '1988-07-18', 'ativo'),
('hcorreia@ig.com.br', 'Leandro Cardoso', '1974-11-29', 'ativo'),
('pda-mota@bol.com.br', 'Otávio Costela', '1995-03-15', 'ativo'),
('fogacaelisa@pires.net', 'Daniela Viana', '2010-04-08', 'ativo'),
('peixotoryan@silva.br', 'Lucca da Cunha', '2005-12-24', 'inativo'),
('ipereira@da.com', 'Joaquim Porto', '1993-01-21', 'ativo'),
('bruna92@monteiro.com', 'Lorenzo Novaes', '1979-01-17', 'ativo'),
('biancada-cruz@costela.com', 'Raul Gonçalves', '1997-06-18', 'inativo'),
('bmoreira@bol.com.br', 'Marcelo Gomes', '1998-11-09', 'ativo'),
('ncostela@gmail.com', 'Yago Moreira', '2004-07-18', 'ativo'),
('bianca11@gmail.com', 'Laura Barbosa', '1986-12-03', 'ativo'),
('mariacardoso@das.br', 'Maria Alice Cardoso', '1998-09-29', 'inativo'),
('ana50@cunha.br', 'João Pedro Rodrigues', '2000-08-27', 'ativo'),
('maria-alicecunha@hotmail.com', 'Larissa Alves', '1984-09-07', 'ativo'),
('da-cruzerick@barros.com', 'Maria Cecília Lopes', '1987-02-21', 'ativo'),
('rafael47@yahoo.com.br', 'Bernardo Pereira', '1988-02-07', 'ativo'),
('melissadas-neves@bol.com.br', 'Enzo Novaes', '1993-08-21', 'ativo'),
('joao-pedrosilva@cardoso.com', 'Renan Silva', '1970-05-16', 'ativo'),
('souzaana-laura@barros.com', 'Bianca Nogueira', '1994-02-25', 'ativo'),
('rezendeluiza@gmail.com', 'Bernardo Moura', '1997-01-13', 'ativo'),
('andrenovaes@hotmail.com', 'Marcelo das Neves', '1986-09-18', 'ativo'),
('laragao@gmail.com', 'Gabriel Novaes', '1971-05-14', 'inativo'),
('maria-luiza35@lopes.com', 'Pedro Miguel Nascimento', '2002-11-01', 'inativo'),
('almeidalarissa@ig.com.br', 'Maria Julia Araújo', '2000-07-01', 'inativo'),
('bryanpinto@costa.br', 'Thales Carvalho', '1983-06-02', 'ativo'),
('kcunha@gmail.com', 'Beatriz Alves', '1971-05-24', 'ativo'),
('das-nevesnoah@silveira.com', 'Rafaela Viana', '1980-08-23', 'ativo'),
('dalves@gmail.com', 'Enrico Rodrigues', '2005-07-04', 'ativo'),
('miguelcardoso@gmail.com', 'Joana Martins', '1987-06-29', 'ativo'),
('ferreiraaugusto@hotmail.com', 'Marcos Vinicius Monteiro', '2002-12-09', 'ativo'),
('joao-gabriel44@cavalcanti.br', 'João Felipe Novaes', '1977-06-09', 'inativo'),
('emanuel64@uol.com.br', 'Brenda da Paz', '1994-08-20', 'ativo'),
('da-cruzlevi@bol.com.br', 'Maria Alice Almeida', '1978-05-13', 'ativo'),
('mporto@uol.com.br', 'Camila Silveira', '1986-09-23', 'inativo'),
('pereiraluigi@hotmail.com', 'Enzo Gabriel Sales', '1995-08-15', 'ativo'),
('maite63@hotmail.com', 'Mirella Pinto', '1993-04-13', 'ativo'),
('eviana@lopes.com', 'Caio Lopes', '2005-05-09', 'ativo'),
('qgoncalves@bol.com.br', 'Alexandre da Rosa', '2010-10-12', 'ativo'),
('julia60@das.com', 'Heitor Rodrigues', '1970-10-08', 'inativo'),
('jfogaca@correia.br', 'Alana Sales', '2010-05-29', 'inativo'),
('marcela41@gmail.com', 'João Felipe Dias', '1980-01-12', 'inativo'),
('karaujo@araujo.com', 'Júlia Viana', '2004-03-07', 'ativo'),
('biancada-conceicao@hotmail.com', 'Sofia Ribeiro', '1970-07-22', 'ativo'),
('joao25@uol.com.br', 'Eloah Dias', '1969-12-06', 'ativo'),
('ana-liviadias@uol.com.br', 'Carlos Eduardo Carvalho', '1986-04-07', 'ativo'),
('uferreira@gmail.com', 'Ana Vitória Rodrigues', '1974-10-27', 'ativo'),
('gcastro@costa.br', 'Bryan Moura', '2005-04-08', 'ativo'),
('evelynjesus@ig.com.br', 'Pedro Henrique Duarte', '2005-10-10', 'inativo'),
('teixeiraana-beatriz@yahoo.com.br', 'Nathan Castro', '2011-08-30', 'ativo'),
('nathan11@ig.com.br', 'Lorenzo Dias', '2004-06-06', 'inativo'),
('sofia37@ig.com.br', 'Calebe da Rosa', '1983-01-17', 'ativo'),
('davi52@castro.br', 'Joaquim Lima', '1993-09-08', 'ativo'),
('fda-luz@hotmail.com', 'Isabel Gonçalves', '1983-02-14', 'ativo'),
('nunesgabriel@campos.com', 'Eloah Ramos', '2004-09-21', 'ativo'),
('castropedro-henrique@hotmail.com', 'Levi da Luz', '1972-06-29', 'ativo'),
('vitoriateixeira@yahoo.com.br', 'Leandro Jesus', '1972-10-07', 'inativo'),
('joao-lucasmelo@yahoo.com.br', 'Bruna Rodrigues', '1975-04-18', 'ativo'),
('marcela92@hotmail.com', 'Letícia Souza', '2002-10-31', 'ativo'),
('cardosothiago@lima.net', 'Alícia da Cruz', '1999-03-15', 'ativo'),
('fernanda78@yahoo.com.br', 'Antônio Moreira', '2001-07-12', 'ativo'),
('hpereira@hotmail.com', 'Camila Duarte', '1985-08-02', 'ativo'),
('pietroda-luz@silva.com', 'Vitória Peixoto', '2005-08-24', 'ativo'),
('thiago72@uol.com.br', 'Letícia Souza', '1986-11-25', 'ativo'),
('cecilia88@yahoo.com.br', 'Laís Rezende', '1993-10-06', 'ativo'),
('udas-neves@ig.com.br', 'Paulo Fogaça', '2002-07-17', 'inativo'),
('mariane88@bol.com.br', 'Milena Oliveira', '1991-02-11', 'ativo'),
('xsilva@mendes.com', 'Vinicius Cavalcanti', '1973-11-22', 'ativo'),
('julia31@fogaca.com', 'Raquel Azevedo', '1973-10-04', 'inativo'),
('joao-felipe30@gmail.com', 'Bernardo Araújo', '1972-09-03', 'ativo'),
('luiz-gustavo22@silveira.com', 'Davi Lucas Azevedo', '1970-03-07', 'ativo'),
('gomesrenan@uol.com.br', 'Henrique Porto', '2007-06-04', 'ativo'),
('rebeca69@ribeiro.br', 'Antônio Porto', '1978-07-28', 'ativo'),
('usilva@hotmail.com', 'Francisco Peixoto', '1971-02-14', 'ativo'),
('fernandesbernardo@da.br', 'Daniela Silva', '1972-01-12', 'ativo'),
('maysapires@fernandes.net', 'Vitória Moreira', '1987-05-11', 'ativo'),
('emanuella02@gmail.com', 'Júlia da Cruz', '1977-06-17', 'inativo'),
('emanuelcastro@da.com', 'Antônio Silveira', '2001-06-30', 'inativo'),
('esther63@ig.com.br', 'Thomas Pinto', '1998-11-09', 'ativo'),
('peixotoemanuella@castro.com', 'Ana Vitória Moreira', '1989-08-07', 'ativo'),
('arthur61@gmail.com', 'Eduardo Aragão', '2000-08-12', 'ativo'),
('drodrigues@cardoso.com', 'Thiago Cardoso', '1984-10-22', 'inativo'),
('enzomoura@uol.com.br', 'Beatriz Monteiro', '1996-10-10', 'ativo'),
('felipe11@novaes.net', 'Alice Ribeiro', '1972-10-31', 'ativo'),
('theo72@yahoo.com.br', 'Lucca Souza', '2002-05-23', 'ativo'),
('zgoncalves@hotmail.com', 'Luigi Ferreira', '2007-03-23', 'ativo'),
('castrodanilo@yahoo.com.br', 'Marcelo da Conceição', '1998-04-03', 'ativo'),
('azevedofernando@nogueira.net', 'Nina Melo', '1999-10-04', 'ativo'),
('enzo-gabriel28@castro.br', 'Elisa Silva', '1987-05-27', 'inativo'),
('beatrizduarte@moraes.com', 'Laura Araújo', '2010-05-24', 'ativo'),
('yurisilva@gmail.com', 'Emilly Nunes', '1987-02-28', 'inativo'),
('jmoreira@yahoo.com.br', 'Mirella Cardoso', '1985-03-16', 'ativo'),
('onascimento@lopes.br', 'Camila Castro', '1971-01-22', 'ativo'),
('natalianogueira@hotmail.com', 'João Pedro da Paz', '1988-07-26', 'inativo'),
('acunha@rocha.org', 'Maria Fernanda da Luz', '2001-09-05', 'ativo'),
('monteiroalexandre@teixeira.com', 'Luiza Melo', '2001-02-24', 'ativo'),
('faraujo@bol.com.br', 'Vitor Hugo Nunes', '1987-04-08', 'ativo'),
('da-cruzcecilia@rezende.org', 'André Gomes', '2007-10-29', 'ativo'),
('moreirabernardo@bol.com.br', 'Maria Fernanda Pires', '1983-10-21', 'ativo'),
('ecunha@ig.com.br', 'Raquel Jesus', '1975-02-11', 'inativo'),
('otavio54@ig.com.br', 'Julia Silveira', '1976-03-21', 'inativo'),
('jsouza@lima.net', 'Maria Eduarda Dias', '2005-06-17', 'ativo'),
('correiaenzo-gabriel@ig.com.br', 'Isabelly da Rosa', '1991-07-24', 'ativo'),
('meloana@yahoo.com.br', 'Luiz Felipe Pires', '1989-10-06', 'inativo'),
('melissapires@ig.com.br', 'Gabriel Martins', '1980-09-17', 'inativo'),
('brendada-mota@da.br', 'Daniel Dias', '1988-03-04', 'ativo'),
('rmendes@ig.com.br', 'Lívia Martins', '1997-01-27', 'inativo'),
('mourapaulo@uol.com.br', 'Camila Ferreira', '1993-12-25', 'ativo'),
('lcarvalho@yahoo.com.br', 'Ana Araújo', '1976-12-27', 'ativo'),
('theocardoso@ig.com.br', 'Larissa Alves', '2006-10-28', 'inativo'),
('juliananogueira@bol.com.br', 'Lucas da Costa', '1994-05-19', 'ativo'),
('ceciliacastro@hotmail.com', 'Isaac Fernandes', '1979-07-07', 'ativo'),
('luiz-fernando15@hotmail.com', 'Thales Duarte', '2011-06-12', 'ativo'),
('vinicius90@da.br', 'Cauê Martins', '2005-06-25', 'ativo'),
('livia96@barros.br', 'Gabrielly Viana', '2010-07-22', 'ativo'),
('snunes@da.br', 'Marcela Porto', '1973-01-13', 'ativo'),
('hcostela@cardoso.br', 'Eloah Cavalcanti', '1993-10-03', 'inativo'),
('benjaminda-conceicao@carvalho.br', 'Letícia Barros', '2002-03-17', 'ativo'),
('rochaguilherme@cunha.com', 'Eduardo Viana', '1970-04-26', 'ativo'),
('guilhermemoura@uol.com.br', 'Cauê Viana', '1977-10-28', 'inativo'),
('rezendekevin@da.br', 'Theo Souza', '2004-05-26', 'ativo'),
('da-costaleticia@da.org', 'Danilo Pereira', '1978-10-08', 'ativo'),
('noah18@gmail.com', 'Emanuelly Gomes', '2005-10-13', 'ativo'),
('lorenzo62@ig.com.br', 'Mirella Cavalcanti', '1971-12-23', 'ativo'),
('joao-pedronovaes@cunha.com', 'Pietra Ribeiro', '2006-08-14', 'inativo'),
('gustavo-henriquelopes@da.com', 'Olivia Viana', '1982-08-01', 'ativo'),
('ngoncalves@martins.com', 'Kamilly Azevedo', '2000-11-18', 'ativo'),
('fogacaarthur@hotmail.com', 'Helena Ferreira', '2006-07-04', 'inativo'),
('ana-juliacostela@ig.com.br', 'Yuri Porto', '2000-10-28', 'ativo'),
('nribeiro@yahoo.com.br', 'Caroline Ribeiro', '2000-03-04', 'ativo'),
('tmendes@da.br', 'Vitor Costela', '1990-11-03', 'ativo'),
('eduardo00@lopes.org', 'Heloísa Pires', '1974-10-17', 'ativo'),
('saragao@bol.com.br', 'Ana da Rosa', '1980-02-20', 'ativo'),
('ocampos@freitas.com', 'Luana Duarte', '1980-03-09', 'ativo'),
('joaomelo@bol.com.br', 'Pietra Novaes', '2005-07-20', 'inativo'),
('lunada-rosa@bol.com.br', 'Francisco Farias', '1979-04-23', 'inativo'),
('dcosta@uol.com.br', 'Lorena Nascimento', '1989-04-11', 'ativo'),
('levicaldeira@viana.com', 'João Pedro Pinto', '1997-03-21', 'ativo'),
('eduardo58@silveira.br', 'Ana Clara Ramos', '1984-12-10', 'inativo'),
('araujobarbara@gmail.com', 'Pietro da Conceição', '1983-12-12', 'ativo'),
('estherbarros@bol.com.br', 'Pedro Gonçalves', '1976-11-03', 'inativo'),
('ana-juliacunha@lima.org', 'Ana Beatriz Moraes', '1993-01-13', 'ativo'),
('enrico95@freitas.br', 'Luiz Gustavo da Costa', '1971-08-20', 'ativo'),
('ana-julia05@cardoso.br', 'Kamilly Duarte', '1982-04-09', 'ativo'),
('aragaojulia@da.org', 'Augusto Farias', '2008-05-28', 'ativo'),
('xcampos@campos.net', 'Caroline Cavalcanti', '1970-04-28', 'ativo'),
('santosmatheus@bol.com.br', 'Clarice Barros', '2005-08-29', 'inativo'),
('jcostela@uol.com.br', 'Lorenzo Moura', '1973-06-27', 'ativo'),
('mpinto@da.br', 'Ana Monteiro', '1979-10-21', 'ativo'),
('mariane22@fernandes.br', 'Letícia da Mota', '1998-09-05', 'ativo'),
('sophie35@ig.com.br', 'João Vitor Araújo', '1998-12-02', 'ativo'),
('vieirabarbara@bol.com.br', 'Rodrigo Fogaça', '1986-09-17', 'ativo'),
('hmoreira@bol.com.br', 'Mirella Farias', '2007-09-26', 'inativo'),
('wgomes@peixoto.com', 'Nina Farias', '1996-03-20', 'ativo'),
('nrezende@carvalho.br', 'Mariana Moreira', '2007-10-19', 'ativo'),
('gustavodias@ig.com.br', 'Camila Oliveira', '2000-08-05', 'ativo'),
('aliceferreira@yahoo.com.br', 'Juliana Jesus', '1987-11-24', 'ativo'),
('nunesjulia@gmail.com', 'Lorenzo Castro', '1977-09-03', 'inativo'),
('pedro95@da.br', 'Luiz Miguel Rocha', '1997-04-10', 'ativo'),
('mcastro@monteiro.org', 'Beatriz Barros', '1970-07-14', 'ativo'),
('procha@bol.com.br', 'Lucca da Rocha', '1985-01-24', 'ativo'),
('rauljesus@uol.com.br', 'Maria Vitória Rodrigues', '2001-07-25', 'ativo'),
('santoskevin@bol.com.br', 'João Guilherme Moura', '1982-03-23', 'ativo'),
('kaiquerezende@novaes.net', 'Bruna Almeida', '1997-07-03', 'ativo'),
('maite23@ig.com.br', 'Carolina Rodrigues', '2011-10-04', 'inativo'),
('kaiqueda-rosa@cardoso.net', 'Emanuelly Novaes', '2011-11-14', 'ativo'),
('moreiraenzo@azevedo.br', 'Isis Costa', '1975-01-28', 'ativo'),
('gustavo-henriqueramos@ig.com.br', 'Gabriel da Conceição', '2002-10-24', 'ativo'),
('murilo08@cardoso.com', 'Gabriela Rezende', '1983-05-16', 'ativo'),
('ana02@monteiro.com', 'Davi Lucas das Neves', '1971-11-09', 'inativo'),
('fogacaemanuel@yahoo.com.br', 'Luiz Fernando Cunha', '1993-10-20', 'ativo'),
('tda-paz@aragao.com', 'Maria Cecília Barros', '1979-03-18', 'inativo'),
('emoraes@ig.com.br', 'Heitor Campos', '1980-02-19', 'ativo'),
('carvalhogustavo-henrique@da.org', 'Nicole Teixeira', '1978-09-05', 'ativo'),
('isabelladias@carvalho.com', 'Larissa da Rocha', '1997-11-12', 'inativo'),
('ana-clara78@da.com', 'Amanda Costela', '1995-08-13', 'inativo'),
('odas-neves@viana.com', 'Luiz Gustavo da Luz', '1983-06-02', 'ativo'),
('francisco83@ramos.com', 'Benjamin Monteiro', '1977-03-04', 'inativo'),
('correiarafaela@yahoo.com.br', 'Joaquim Pereira', '1985-04-26', 'inativo'),
('isaaccostela@novaes.org', 'Letícia Almeida', '1977-05-30', 'ativo'),
('castrobernardo@hotmail.com', 'Agatha da Mota', '1995-10-07', 'ativo'),
('joao-felipefogaca@yahoo.com.br', 'Miguel Dias', '2005-02-08', 'inativo'),
('heloisa67@uol.com.br', 'Stella Gonçalves', '1996-09-03', 'ativo'),
('ygoncalves@souza.br', 'Olivia Martins', '2006-08-03', 'ativo'),
('fernandesalicia@carvalho.br', 'Maysa Freitas', '1980-08-14', 'ativo'),
('enrico33@costela.net', 'Joana da Cruz', '1974-09-06', 'ativo'),
('wda-conceicao@bol.com.br', 'Vicente Moura', '1982-07-21', 'ativo'),
('pintohelena@novaes.org', 'Davi Lucca Nunes', '1984-12-20', 'ativo'),
('clarafernandes@ferreira.com', 'Pedro Nunes', '2004-09-27', 'ativo'),
('rodriguesjoao-pedro@goncalves.com', 'Helena da Mata', '2000-04-21', 'inativo'),
('vicentefernandes@ferreira.org', 'Thiago Martins', '1970-08-29', 'ativo'),
('joao-guilhermenogueira@ig.com.br', 'Luana Cunha', '1998-08-11', 'inativo'),
('da-luzsarah@gmail.com', 'Ana Clara Teixeira', '2009-06-13', 'ativo'),
('araujothomas@teixeira.br', 'Alexandre Cardoso', '1983-11-15', 'ativo'),
('da-costabenicio@fernandes.com', 'Pedro Aragão', '1993-09-15', 'ativo'),
('nogueiramaria-cecilia@ig.com.br', 'Mirella da Mata', '1997-11-25', 'inativo'),
('leandroda-cruz@viana.com', 'Emilly Cavalcanti', '1986-03-14', 'inativo'),
('da-rosamaria-clara@da.com', 'Catarina Duarte', '1989-01-18', 'ativo'),
('da-rochaluana@hotmail.com', 'Valentina Farias', '1977-01-28', 'ativo'),
('nda-mata@hotmail.com', 'Esther Almeida', '1975-08-24', 'ativo'),
('manuela54@barbosa.org', 'Lucas Santos', '1979-06-05', 'ativo'),
('lais69@uol.com.br', 'Ana Luiza Teixeira', '1982-08-03', 'ativo'),
('cauerezende@da.com', 'João Miguel da Mota', '2002-07-10', 'ativo'),
('ana-juliada-paz@gmail.com', 'Henrique Pinto', '1979-04-05', 'ativo'),
('brenda50@almeida.net', 'Benício Pires', '2004-01-29', 'ativo'),
('luigicardoso@araujo.br', 'Kaique Pereira', '2004-11-23', 'inativo'),
('da-luzfelipe@das.org', 'Maria Alice Fogaça', '1977-08-11', 'ativo'),
('joao-vitor91@araujo.com', 'Yasmin Ramos', '2001-09-17', 'ativo'),
('diasmariana@cardoso.net', 'Valentina Correia', '1981-05-01', 'ativo'),
('pereiramarcos-vinicius@correia.org', 'Mariane da Conceição', '1991-12-07', 'ativo'),
('joanadas-neves@hotmail.com', 'Laura Correia', '2002-12-26', 'ativo'),
('maysa07@gmail.com', 'Laís Duarte', '2007-07-05', 'ativo'),
('souzaalexia@yahoo.com.br', 'Levi Gomes', '1990-07-11', 'ativo'),
('rebecada-cunha@ig.com.br', 'Cauã Araújo', '1988-09-15', 'ativo'),
('lpinto@cunha.com', 'Emanuel Azevedo', '1987-03-11', 'ativo'),
('ceciliamonteiro@pinto.com', 'Kaique Gomes', '1986-07-28', 'inativo'),
('sophiafogaca@das.br', 'Sofia Rodrigues', '2000-08-20', 'ativo'),
('limaalice@pereira.br', 'Mirella da Cunha', '2007-11-05', 'inativo'),
('laura28@silveira.com', 'Paulo Fogaça', '1996-11-22', 'ativo'),
('danielfarias@hotmail.com', 'Heloísa Martins', '1973-08-04', 'ativo'),
('da-motathiago@alves.br', 'Maria da Costa', '1973-03-01', 'inativo'),
('martinsigor@bol.com.br', 'Elisa Cavalcanti', '1987-10-01', 'inativo'),
('cecilia47@ig.com.br', 'Isaac Vieira', '1970-02-21', 'ativo'),
('oliveiraana-clara@ramos.org', 'Sophie Almeida', '1987-03-14', 'inativo'),
('da-cruzlara@da.net', 'Marcos Vinicius Moraes', '1989-12-07', 'ativo'),
('correiarodrigo@ig.com.br', 'Carolina da Conceição', '1987-05-03', 'ativo'),
('jsilva@bol.com.br', 'Gustavo Martins', '2005-03-12', 'ativo'),
('fnogueira@uol.com.br', 'Luiz Henrique da Costa', '1977-02-20', 'ativo'),
('xrocha@ig.com.br', 'Ana Júlia Oliveira', '1997-03-25', 'ativo'),
('camila08@uol.com.br', 'Isabelly Peixoto', '1983-08-15', 'ativo'),
('da-luzmaria-fernanda@araujo.org', 'Rafael Pereira', '1991-02-19', 'inativo'),
('maria-ceciliapinto@bol.com.br', 'Otávio Nascimento', '1996-08-09', 'ativo'),
('ferreirajoao-guilherme@yahoo.com.br', 'Eduardo Aragão', '1983-06-10', 'inativo'),
('stephany49@mendes.com', 'Benjamin Cavalcanti', '1986-10-22', 'ativo'),
('nascimentopedro-henrique@hotmail.com', 'Eduardo Nunes', '1972-01-17', 'ativo'),
('emendes@hotmail.com', 'Bianca Teixeira', '2001-04-25', 'ativo'),
('nfogaca@hotmail.com', 'Laís Duarte', '2003-11-11', 'ativo'),
('maria-juliaribeiro@uol.com.br', 'Francisco Souza', '1986-12-02', 'ativo'),
('leandro96@gmail.com', 'Caio da Mata', '1981-07-17', 'ativo'),
('emilly33@ig.com.br', 'Calebe Santos', '1987-03-18', 'ativo'),
('clarice23@hotmail.com', 'Heitor Souza', '2002-12-26', 'ativo'),
('vsilva@yahoo.com.br', 'Lorenzo Pires', '1971-11-02', 'ativo'),
('oda-mata@bol.com.br', 'Gustavo Henrique Pires', '1978-12-11', 'inativo'),
('luna60@hotmail.com', 'Nathan Pinto', '1992-12-28', 'inativo'),
('maria-fernanda24@cardoso.br', 'Marcelo da Paz', '1970-09-09', 'ativo'),
('joaquim62@peixoto.br', 'Nathan Alves', '2005-07-06', 'ativo'),
('nascimentovalentina@ig.com.br', 'Diego Farias', '1977-12-15', 'inativo'),
('rodrigodas-neves@gmail.com', 'Benjamin Castro', '1988-02-11', 'ativo'),
('castrojoao@ig.com.br', 'Caroline Peixoto', '2008-06-23', 'ativo'),
('eda-rosa@cardoso.net', 'João Gabriel Ribeiro', '1994-04-10', 'ativo'),
('ana-liviasantos@yahoo.com.br', 'Maria Sophia Carvalho', '1971-09-23', 'ativo'),
('giovanna33@farias.br', 'Daniel Lima', '1970-02-24', 'ativo'),
('tcunha@yahoo.com.br', 'Maria Luiza Cavalcanti', '1980-01-06', 'ativo'),
('breno67@uol.com.br', 'Ana Laura Sales', '2001-07-22', 'ativo'),
('da-luzluiz-felipe@ig.com.br', 'Igor Martins', '2010-07-20', 'inativo'),
('apeixoto@ig.com.br', 'Vitória Souza', '1979-12-21', 'inativo'),
('luizada-rosa@barbosa.br', 'João Viana', '2001-04-14', 'ativo'),
('vitor-gabriel20@nunes.com', 'Vitor Jesus', '1979-07-01', 'inativo'),
('da-matakaique@da.com', 'Joaquim Barbosa', '2004-03-22', 'ativo'),
('breno84@costela.net', 'Ana Beatriz Teixeira', '2004-06-01', 'inativo'),
('mariana78@gmail.com', 'Murilo Duarte', '1975-06-03', 'inativo'),
('rochastephany@bol.com.br', 'Vitor Gabriel Pinto', '1977-12-20', 'ativo'),
('nmelo@cavalcanti.net', 'Vitória Cardoso', '2010-12-17', 'inativo'),
('benjaminrocha@lopes.br', 'Lavínia Lima', '1978-11-28', 'ativo'),
('elima@gmail.com', 'Kevin Costa', '1991-08-26', 'inativo'),
('stella03@moraes.com', 'Gabriel Costa', '1974-03-13', 'ativo'),
('andregomes@azevedo.com', 'Luiz Felipe Ramos', '1981-04-10', 'ativo'),
('alanafernandes@da.br', 'Gustavo Henrique Lima', '1984-01-12', 'ativo'),
('mendeseduarda@vieira.com', 'Ana Moreira', '1994-07-07', 'ativo'),
('asilva@hotmail.com', 'Maria Luiza Moraes', '2007-01-03', 'ativo'),
('luiz-fernando42@peixoto.br', 'Sofia Costa', '2004-11-29', 'ativo'),
('qlopes@yahoo.com.br', 'Alícia Lima', '1996-10-15', 'ativo'),
('cardososophie@ig.com.br', 'Beatriz da Mata', '1978-02-10', 'ativo'),
('eloah60@ig.com.br', 'Sarah Azevedo', '1979-03-27', 'inativo'),
('costelaana-sophia@aragao.net', 'Sabrina Farias', '2005-08-14', 'ativo'),
('julia23@da.org', 'Sabrina Cardoso', '1980-03-12', 'ativo'),
('fariasluiz-fernando@yahoo.com.br', 'Alexia Barros', '2008-04-24', 'ativo'),
('vitor-hugo78@ig.com.br', 'Alana Monteiro', '2011-10-17', 'ativo'),
('luiz-fernandoalves@gmail.com', 'Anthony Silva', '1986-02-14', 'inativo'),
('ramosarthur@ig.com.br', 'Lavínia Melo', '1980-08-24', 'inativo'),
('sofia94@ig.com.br', 'Giovanna Fogaça', '1980-05-11', 'ativo'),
('calebe45@bol.com.br', 'Kamilly Vieira', '1989-05-07', 'ativo'),
('cunhaotavio@moreira.br', 'Vitor Gabriel Ferreira', '2001-08-09', 'ativo'),
('teixeiraisadora@ig.com.br', 'Heitor Cavalcanti', '2011-02-11', 'ativo'),
('wbarbosa@peixoto.net', 'Lorenzo Gomes', '2001-07-16', 'ativo'),
('alexia50@bol.com.br', 'Marina Ribeiro', '1986-05-12', 'ativo'),
('maiteporto@ig.com.br', 'Maria da Rocha', '1977-05-23', 'inativo'),
('agathanascimento@hotmail.com', 'Nina Novaes', '1991-12-02', 'ativo'),
('opeixoto@caldeira.org', 'Felipe Ferreira', '1989-11-25', 'inativo'),
('melobenjamin@goncalves.br', 'Clarice da Costa', '2009-05-31', 'ativo'),
('wporto@da.com', 'Breno Pinto', '1990-06-02', 'ativo'),
('marcelo83@ig.com.br', 'Sarah Pinto', '1975-09-04', 'ativo'),
('antonioporto@oliveira.com', 'Mariana Cardoso', '1993-08-30', 'ativo'),
('rnogueira@gmail.com', 'Alana Ribeiro', '2007-05-19', 'ativo'),
('isissilveira@ribeiro.br', 'Thiago da Paz', '1989-05-29', 'ativo'),
('acaldeira@uol.com.br', 'João Vitor Silva', '1994-05-18', 'inativo'),
('hteixeira@mendes.com', 'Cauê da Cruz', '2001-06-10', 'ativo'),
('hcastro@bol.com.br', 'Luigi Lima', '1987-12-12', 'inativo'),
('nicolasporto@da.org', 'Rafaela Caldeira', '1992-06-02', 'ativo'),
('paulo64@monteiro.org', 'Pedro Lucas Nascimento', '1981-03-17', 'inativo'),
('hmoura@uol.com.br', 'Beatriz Moura', '2006-12-25', 'ativo'),
('da-paznicole@yahoo.com.br', 'Alícia Almeida', '1974-07-24', 'inativo'),
('almeidaaugusto@da.br', 'Isabella Cardoso', '1975-08-02', 'ativo'),
('alicefreitas@hotmail.com', 'Júlia Caldeira', '1980-11-05', 'ativo'),
('otaviopinto@uol.com.br', 'Stephany da Mota', '1982-06-19', 'ativo'),
('zfreitas@hotmail.com', 'Sabrina Nogueira', '1984-12-06', 'ativo'),
('teixeiraalicia@correia.com', 'Felipe Rodrigues', '1982-05-27', 'ativo'),
('thomascaldeira@almeida.org', 'Eduardo Gomes', '1982-01-09', 'ativo'),
('bruna98@da.br', 'Ana Laura Azevedo', '1984-10-11', 'ativo');

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
('Gestão de Produtos Digitais',            'Metodologias Ágeis em Gestão de Produtos', 'Como utilizar metodologias ágeis como Scrum e Kanban na gestão de produtos.', 2),
('Gestão de Produtos Digitais',            'Ferramentas de Gestão de Produtos',        'Ferramentas essenciais para o gerenciamento de produtos digitais.', 3),

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
(20,    'Analista de Sistemas',                   'Levantar requisitos e analisar sistemas existentes.',                              'Systems Analysis Inc.'),
(21,    'Engenheiro de Machine Learning',         'Desenvolver e implementar modelos de aprendizado de máquina.',                     'AI Research Labs'),
(22,    'Analista de Infraestrutura',             'Gerenciar e otimizar a infraestrutura de TI.',                                     'SecureIT'),
(23,    'Desenvolvedor de Jogos',                 'Criar jogos para diferentes plataformas.',                                         'Creative Labs'),
(24,    'Consultor em Segurança da Informação',   'Ajudar empresas a implementar políticas de segurança.',                            'SecureIT'),
(25,    'Especialista em Cloud Computing',        'Gerenciar serviços e soluções na nuvem.',                                          'Tech Solutions'),
(26,    'Redator Técnico',                        'Produzir documentação técnica e manuais.',                                         'LearnTech'),
(27,    'Especialista em Testes Automatizados',   'Desenvolver e executar testes automatizados.',                                     'Quality First'),
(28,    'Analista de SEO',                        'Otimizar conteúdo para mecanismos de busca.',                                      'Digital Reach'),
(29,    'Coordenador de Desenv. de Software',     'Supervisionar equipes de desenvolvimento.',                                        'Software Dynamics'),
(30,    'Especialista em IoT',                    'Desenvolver soluções para dispositivos conectados.',                               'Innovatech');

INSERT INTO Estuda (email_aluno, nome_curso, data_conclusao, nota)
SELECT 
    A.email, 
    C.nome, 
    CURRENT_DATE + (FLOOR(RANDOM() * (365 * 2)))::INTEGER AS data_conclusao, -- Gera uma data aleatória entre 2025 e 2026
    (4 + RANDOM() * 6)::NUMERIC(3, 1) AS nota -- Gera uma nota aleatória entre 4.0 e 10.0
FROM 
    Aluno A,
    (SELECT nome FROM Curso) C -- Seleciona todos os cursos
WHERE 
    RANDOM() < 0.07; -- Ajuste a probabilidade para controlar a quantidade de inscrições

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

INSERT INTO Se_Inscreve (email_aluno, id_vaga)
SELECT 
    A.email, 
    V.id
FROM 
    Aluno A,
    (SELECT id FROM Vaga) V -- Seleciona todas as vagas
WHERE 
    RANDOM() < 0.07; -- Ajuste a probabilidade para controlar a quantidade de inscrições

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
(20,    'SQL'),
(21,    'Python'),
(21,    'TensorFlow'),
(22,    'Bash'),
(22,    'Sistemas Operacionais'),
(23,    'Unreal Engine'),
(23,    'C#'),
(24,    'Administração de Redes'),
(25,    'Amazon AWS'),
(25,    'Kubernetes'),
(26,    'Markdown'),
(26,    'Git'),
(27,    'Selenium'),
(27,    'Java'),
(28,    'Marketing Digital'),
(29,    'Java'),
(30,    'IoT'),
(30,    'C#');
