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


 