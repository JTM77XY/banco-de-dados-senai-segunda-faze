CREATE DATABASE estacionamento_abc;
USE estacionamento_abc;

CREATE TABLE ticket(
id_ticket INT NOT NULL PRIMARY KEY,
codigo_barra INT,
observacao TEXT
);

CREATE TABLE estacionamento(
id_estacionamento INT NOT NULL PRIMARY KEY,
nome VARCHAR(45),
cnpj VARCHAR(45),
ticket_id INT,
FOREIGN KEY (ticket_id)
REFERENCES ticket (id_ticket)
);

CREATE TABLE setor(
id_setor INT NOT NULL PRIMARY KEY,
nome VARCHAR(45),
descricao VARCHAR(45),
estacionamento_id INT,
FOREIGN KEY (estacionamento_id)
REFERENCES estacionamento (id_estacionamento)
);

CREATE TABLE vaga(
id_vaga INT NOT NULL PRIMARY KEY,
numero_vaga INT,
setor_id INT,
FOREIGN KEY (setor_id)
REFERENCES setor (id_setor)
);

-- apagar chave estrangeira
ALTER TABLE vaga
DROP FOREIGN KEY vaga_ibfk_1;

-- inserir chave estrangeira novamente
ALTER TABLE vaga
ADD FOREIGN KEY (setor_id)
REFERENCES setor (id_setor);

-- adicionar coluna
ALTER TABLE ticket
ADD COLUMN descricao TEXT;

-- modificar tipo de dado da coluna
ALTER TABLE ticket
MODIFY COLUMN descricao VARCHAR (100);

-- apagar coluna 
ALTER TABLE ticket
DROP COLUMN descricao;

-- modificar nome da coluna
ALTER TABLE ticket
RENAME COLUMN codigo_barra TO codigo;

-- modificar o nome da tabela
ALTER TABLE estacionamento
RENAME TO parking;

-- mostra uma descricao de uma tabela
DESCRIBE setor;

