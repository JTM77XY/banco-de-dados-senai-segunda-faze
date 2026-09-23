CREATE DATABASE banco_livraria;
USE banco_livraria;

CREATE TABLE editora(
id_editora INT AUTO_INCREMENT,
nomefantasia_editora ENUM('editora a','editora b','editora c') NOT NULL,
razaosocial_editora VARCHAR(45) NOT NULL,
Pais VARCHAR(45) DEFAULT 'brasil',
PRIMARY KEY (id_editora)
);


CREATE TABLE autor(
id_autor INT AUTO_INCREMENT,
nome_autor VARCHAR(45) NOT NULL,
rg_autor VARCHAR(45),
PRIMARY KEY (id_autor)
);

CREATE TABLE financiador(
id_financiador INT AUTO_INCREMENT,
nome_financiador VARCHAR(45) DEFAULT 'financiador publico',
cnpj_financiador VARCHAR(45),
PRIMARY KEY (id_financiador)
);

CREATE TABLE cliente(
id_cliente INT AUTO_INCREMENT,
nome_cliente VARCHAR(45) NOT NULL,
rg_cliente VARCHAR(45),
cpf_cliente VARCHAR(45) UNIQUE,
pais VARCHAR(45) DEFAULT 'brasil',
PRIMARY KEY (id_cliente)
);

CREATE TABLE pedido(
id_pedido INT AUTO_INCREMENT,
livro_id INT,
FOREIGN KEY (livro_id)
REFERENCES livro (id_livro),
qtd_pedido INT,
CHECK (qtd_pedido >=0),
cliente_id INT,
FOREIGN KEY (cliente_id)
REFERENCES cliente (id_cliente),
PRIMARY KEY (id_pedido)
);

CREATE TABLE livro(
id_livro INT AUTO_INCREMENT,
isbn_livro VARCHAR(45),
titulo_livro VARCHAR(45),
preco_livro INT,
CHECK (preco_livro >=0),
categoria_livro ENUM('horror','ficção','romance','ação'),
editora_id INT,
FOREIGN KEY (editora_id)
REFERENCES editora (id_editora),
autor_id INT,
FOREIGN KEY (autor_id)
REFERENCES autor (id_autor),
financiador_id INT,
FOREIGN KEY (financiador_id)
REFERENCES financiador (id_financiador),
PRIMARY KEY (id_livro)
);


INSERT INTO editora
(nomefantasia_editora, razaosocial_editora, pais)
VALUES
('editora a', 'editora syle', 'brasil'),
('editora b', 'editora ceps', 'brasil'),
('editora c', 'editora cefaz', 'brasil');

INSERT INTO autor
(nome_autor, rg_autor)
VALUES
( 'joão','11223344-1'),
( 'camila','11223344-2'),
('jorge','11223344-3');


INSERT INTO financiador
(nome_financiador, cnpj_financiador)
VALUES
('bradesco', '22334455881161'),
('cebras' , '22334455881162'),
('banco inter', '22334455881163');

INSERT INTO cliente
(nome_cliente, rg_cliente, cpf_cliente, pais)
VALUES
('jorge', '223344551','1111112221','brasil'),
('jete' , '223344552', '111111222', 'brasil'),
('ana', '223344553', '1111112223', 'brasil');

INSERT INTO livro
(isbn_livro, titulo_livro, preco_livro, categoria_livro)
VALUES
('22233344', 'homem na lua', 20,'ficção'),
('222333355' , 'carros', 10, 'fff'),
('22233366', 'hora do espanto', 30, 'horror');

INSERT INTO pedido
(qtd_pedido)
VALUES
(-1),
(20),
(50);






