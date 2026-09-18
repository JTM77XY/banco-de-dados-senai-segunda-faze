CREATE DATABASE abc;
USE abc

CREATE TABLE categoria_cliente(
id_categoria_cliente INT NOT NULL PRIMARY KEY,
nom_categoria_cliente VARCHAR(45)
);

CREATE TABLE agenda(
id_agenda INT NOT NULL PRIMARY KEY,
nom_agenda VARCHAR(100)
);

CREATE TABLE tipo_conta(
id_tipo_conta INT NOT NULL PRIMARY KEY,
des_tipo_conta VARCHAR(100)
);

CREATE TABLE cliente(
id_cliente INT NOT NULL PRIMARY KEY,
nom_cliente VARCHAR(45),
num_cpf_cnpj VARCHAR(20),
num_celular VARCHAR(20),
rua VARCHAR(45),
numero INT,
bairro VARCHAR(45),
cep VARCHAR(8),
cidade VARCHAR(45),
estado VARCHAR(45),
categoria_cliente_id INT,
FOREIGN KEY (categoria_cliente_id)
REFERENCES categoria_cliente (id_categoria_cliente)
);

CREATE TABLE conta(
id_conta INT NOT NULL PRIMARY KEY,
val_saldo DECIMAL(8,2),
agenda_id INT,
FOREIGN KEY (agenda_id)
REFERENCES agenda (id_agenda),
cliente_id INT,
FOREIGN KEY (cliente_id)
REFERENCES cliente (id_cliente),
tipo_conta_id INT,
FOREIGN KEY (tipo_conta_id)
REFERENCES tipo_conta (id_tipo_conta)
);

ALTER TABLE cliente
RENAME COLUMN num_celular TO telefone;

ALTER TABLE categoria_cliente
ADD COLUMN observacao TEXT;

ALTER TABLE cliente
ADD COLUMN renda DECIMAL(8,2);

ALTER TABLE tipo_conta
MODIFY COLUMN des_tipo_conta TEXT;
 
ALTER TABLE agenda
MODIFY COLUMN nom_agenda VARCHAR(45);

ALTER TABLE cliente
DROP COLUMN estado;

ALTER TABLE categoria_cliente
RENAME TO categoria;

ALTER TABLE tipo_conta
ADD COLUMN observacao TEXT;

INSERT INTO categoria 
(id_categoria_cliente, nom_categoria_cliente, observacao)
VALUES
('1', 'básico', 'cliente com renda acima de 10mil'),
('2', 'private', 'cliente com renda acima de 20mil'),
('3', 'exclusive', 'cliente com renda acima de 30mil'),
('4', 'gold', 'cliente com renda acima de 40mil');
 
 INSERT INTO agenda 
 (id_agenda, nom_agenda)
 VALUES
 ('1', 'campeche'),
 ('2', 'ingleses'),
 ('3', 'centro');
 
 INSERT INTO tipo_conta
 (id_tipo_conta , des_tipo_conta)
 VALUES
 ('1','poupança'),
 ('2','corrente');
 
 INSERT INTO cliente
 (id_cliente ,nom_cliente, categoria_cliente_id)
 VALUES
 ('1', 'joão', '1'),
 ('2', 'maria', '3'),
 ('3', 'carlos', '2'),
 ('4', 'ana', '1'),
 ('5', 'jet', '4'),
 ('6', 'davi', '2'),
 ('7', 'bilu', '4'),
 ('8', 'gabriel', '1');

INSERT INTO conta
(id_conta , cliente_id , tipo_conta_id)
VALUES
( '1', '1' , '2'),
( '2', '2' , '2'),
( '3', '3' , '2'),
( '4', '4' , '2'),
( '5', '5' , '1'),
( '6', '6' , '1'),
( '7', '7' , '1'),
( '8', '8' , '1');

SELECT * FROM conta;
