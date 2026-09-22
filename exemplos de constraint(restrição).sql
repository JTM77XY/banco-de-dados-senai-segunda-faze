CREATE DATABASE regra_constraint;
USE regra_constraint;

CREATE TABLE usuario(
id_cliente INT AUTO_INCREMENT,
nome VARCHAR (50) NOT NULL,
cpf BIGINT UNIQUE,
pais VARCHAR (50) DEFAULT 'brasil',
graduado ENUM('sim','não'),
num_filhos INT,
CHECK (num_filhos >=0),
PRIMARY KEY (id_cliente));

-- deixar o NOME vazio, ou seja, NULO. 
INSERT INTO usuario
(nome,cpf, pais, graduado, num_filhos)
VALUES
('jose',12345678912, 'brasil', 'sim', 2);

-- colocar o mesmo CPF
INSERT INTO usuario
(nome,cpf, pais, graduado, num_filhos)
VALUES
('manoel',12345678913, 'brasil', 'sim', 2);

-- deixar o nome pais vazio (testando DEFALT)
INSERT INTO usuario
(nome,cpf, graduado, num_filhos)
VALUES
('carlos', 12345678914, 'sim', 2);

INSERT INTO usuario
(nome,cpf, pais, graduado, num_filhos)
VALUES
(' carlos manoel',12345678915, 'Equador', 'sim', 2);


-- colocar INCOMPLETO na graduação
INSERT INTO usuario
(nome,cpf, pais, graduado, num_filhos)
VALUES
('Maria',12345678916, 'brasil', 'sim', 2);


-- colocar NUMERO de filhos NEGATIVO
INSERT INTO usuario
(nome,cpf, pais, graduado, num_filhos)
VALUES
('camila',12345678917, 'brasil', 'sim', 3);


-- * significa tudo
SELECT * FROM usuario;
SELECT nome, num_filhos FROM usuario;