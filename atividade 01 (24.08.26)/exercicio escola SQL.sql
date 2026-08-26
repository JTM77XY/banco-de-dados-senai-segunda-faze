CREATE DATABASE escola;
USE escola;

CREATE TABLE sala(
idsala INT NOT NULL PRIMARY KEY,
nome_sala VARCHAR (45),
capacidade_sala INT
);

CREATE TABLE turma(
idturma INT NOT NULL PRIMARY KEY,
nome_turma VARCHAR (45),
periodo VARCHAR (45),
sala_id INT,
FOREIGN KEY (sala_id)
REFERENCES sala (idsala)
);

CREATE TABLE professor(
idprofessor INT NOT NULL PRIMARY KEY,
nome_prof VARCHAR(45),
for_academica VARCHAR(45),
turma_id INT,
FOREIGN KEY (turma_id)
REFERENCES turma (idturma)
);

CREATE TABLE aula(
idaula INT  NOT NULL PRIMARY KEY,
nome_aula VARCHAR (45),
professor_id INT,
FOREIGN KEY (professor_id)
REFERENCES professor (idprofessor)
);

