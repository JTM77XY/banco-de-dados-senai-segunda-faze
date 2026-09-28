CREATE DATABASE escola;
USE escola;

CREATE TABLE aluno(
id_aluno INT AUTO_INCREMENT,
nome VARCHAR(45),
dt_nascimento DATE,
cpf BIGINT UNIQUE,
PRIMARY KEY (id_aluno)
);

CREATE TABLE disciplina(
id_disciplina INT AUTO_INCREMENT,
nome VARCHAR(45),
qtd_creditos INT,
PRIMARY KEY (id_disciplina)
);

CREATE TABLE turma(
id_turma INT AUTO_INCREMENT,
disciplina_id INT,
FOREIGN KEY (disciplina_id)
REFERENCES disciplina (id_disciplina),
turno VARCHAR(45),
PRIMARY KEY (id_turma)
);


CREATE TABLE inscricao(
id_inscricao INT AUTO_INCREMENT,
aluno_id INT,
FOREIGN KEY (aluno_id)
REFERENCES aluno (id_aluno),
turma_id INT,
FOREIGN KEY (turma_id)
REFERENCES turma (id_turma),
dt_incricao DATE,
PRIMARY KEY (id_inscricao)
);


CREATE TABLE mensalidade(
id_mensalidade INT AUTO_INCREMENT,
inscricao_id INT,
FOREIGN KEY (inscricao_id)
REFERENCES inscricao (id_inscricao),
dt_vencimento DATE,
valor DECIMAL,
status_pagamento ENUM('pago' , 'não pago'),
PRIMARY KEY (id_mensalidade)
);

INSERT INTO aluno
(nome, dt_nascimento, cpf)
VALUES
('jorge','2018-08-10', 1112223331),
('ana', '2015-07-10', 1112223332),
('jete', '2004-04-10', 1112223333),
('bilu', '2002-03-10', 1112223334),
('babi', '2010-01-10', 1112223335);

INSERT INTO disciplina
(nome, qtd_creditos)
VALUES
('matemática', 30),
('artes', 20 ),
('história', 15 ),
('programação', 10 ),
('geografia', 5 );