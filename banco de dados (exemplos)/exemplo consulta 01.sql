CREATE DATABASE loja_z;
USE loja_z;

CREATE TABLE cliente(
id_cliente INT AUTO_INCREMENT,
nome VARCHAR(45),
cidade VARCHAR(45),
PRIMARY KEY (id_cliente)
);


CREATE TABLE acompanhamento(
id_acompanhamento INT AUTO_INCREMENT,
situação VARCHAR(45),
PRIMARY KEY (id_acompanhamento)
);

CREATE TABLE pedido(
id_pedido INT AUTO_INCREMENT,
data_pedido DATE,
valor DECIMAL(8,2),  -- 8 digitos e duas casas após a virgula
cliente_id INT,
FOREIGN KEY (cliente_id)
REFERENCES cliente (id_cliente),
acompanhamento_id INT,
FOREIGN KEY (acompanhamento_id)
REFERENCES acompanhamento (id_acompanhamento),
PRIMARY KEY (id_pedido)
);


INSERT INTO cliente
(nome, cidade)
VALUES
('joão', 'macaé'),
('carlos', 'salvador'),
('maria', 'niteroí'),
('ana', 'campinas'),
('marcos', 'santos');

SELECT * FROM  cliente;

INSERT INTO acompanhamento
(situação)
VALUES
('registrado'),
('em transporte'),
('entregue');

SELECT * FROM acompanhamento;

INSERT INTO pedido
(data_pedido, valor, cliente_id, acompanhamento_id)
VALUES
('2024-09-24', 250.00 , 2 , 1),
('2024-09-25', 150.0 , 1 , 2),
('2024-09-25', 450.00 , 4 , 3);

SELECT * FROM pedido;

-- quero saber quem foi o cliente que realizou o pedido
SELECT * FROM pedido
JOIN cliente
ON pedido.cliente_id = cliente.id_cliente;

-- tambem quero saber qual a situação do pedido desses clientes
SELECT * FROM pedido
JOIN cliente
ON pedido.cliente_id = cliente.id_cliente
JOIN acompanhamento
ON pedido.acompanhamento_id = acompanhamento.id_acompanhamento;

-- quero visualizar apenas as seguintes colunas:
-- id_pedido, data do pedido, nome do cliente e a situação do pedido
SELECT pedido.id_pedido, pedido.data_pedido, cliente.nome, acompanhamento.situação FROM pedido
JOIN cliente
ON pedido.cliente_id = cliente.id_cliente
JOIN acompanhamento
ON pedido.acompanhamento_id = acompanhamento.id_acompanhamento;

