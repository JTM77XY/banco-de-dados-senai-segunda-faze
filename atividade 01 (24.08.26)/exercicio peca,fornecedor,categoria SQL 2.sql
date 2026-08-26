CREATE DATABASE usinagem_2;
USE usinagem_2;

CREATE TABLE fornecedor(
idfornecedor INT NOT NULL PRIMARY KEY,
nome VARCHAR (100),
nacionalidade VARCHAR (100)
);

CREATE TABLE categoria(
idcategoria INT NOT NULL PRIMARY KEY,
descricao VARCHAR (100)
);

CREATE TABLE peca(
idpeca INT NOT NULL PRIMARY KEY,
nome VARCHAR (100),
peso DECIMAL (8,2),
ano_fabricacao VARCHAR (100),
fornecedor_id INT,
FOREIGN KEY (fornecedor_id)
REFERENCES fornecedor (idfornecedor),
categoria_id INT,
FOREIGN KEY (categoria_id)
REFERENCES categoria (idcategoria)
);
