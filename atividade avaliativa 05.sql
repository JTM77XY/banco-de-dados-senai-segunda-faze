CREATE DATABASE estacionamento_abc;
USE estacionamento_abc;

CREATE TABLE cliente(
 id_cliente INT AUTO_INCREMENT,
 nome_cliente VARCHAR(45),
 dt_nascimento DATE,
 PRIMARY KEY (id_cliente)
 );
 
 CREATE TABLE categoria(
 id_categoria INT AUTO_INCREMENT,
 nome VARCHAR(45),
 descricao VARCHAR(45),
 PRIMARY KEY (id_categoria)
 );
 
 CREATE TABLE veiculo(
 id_veiculo INT AUTO_INCREMENT,
 placa VARCHAR(45),
 cor VARCHAR(45),
 cliente_id INT,
 FOREIGN KEY (cliente_id)
 REFERENCES cliente (id_cliente),
 categoria_id INT,
 FOREIGN KEY (categoria_id)
 REFERENCES categoria (id_categoria),
 PRIMARY KEY (id_veiculo)
 );
 
 
 CREATE TABLE estacionamento(
 id_estacionamento INT AUTO_INCREMENT,
 nome VARCHAR(45),
 capacidade INT,
 dt_entrada DATE,
 dt_saida DATE,
 hs_entrada TIME,
 hs_saida TIME,
 veiculo_id INT,
 FOREIGN KEY (veiculo_id)
 REFERENCES veiculo (id_veiculo),
 PRIMARY KEY (id_estacionamento)
 );
 
 
 INSERT INTO cliente
 (nome_cliente, dt_nascimento)
 VALUES
 ('joão', '2020-08-10'),
 ('carlos', '2010-08-20'),
 ('bilu', '2005-08-30');
 
  SELECT * FROM cliente;
 
INSERT INTO categoria
 (nome, descricao)
 VALUES
 ('utilitario', 'veículo para quatro pessoas'),
 ('van', 'veículo para dez pessoas'),
 ('pick-up', 'veículo para duas pessoas');
 
  SELECT * FROM categoria;
 
 INSERT INTO veiculo
 (placa, cor, cliente_id, categoria_id)
 VALUES
 ('AAA-2020', 'preto', 1, 2 ),
 ('BBB-1111', 'branco', 1, 3 ),
 ('CCCC-5050', 'azul', 1, 3 ),
 ('DDD-1234', 'branco', 2, 2 );
 
 INSERT INTO veiculo
 (placa, cor)
 VALUES
 ('RRR-2525', 'azul');
 
 SELECT * FROM veiculo;
 
 
 
 INSERT INTO estacionamento
 (nome, capacidade, dt_entrada, dt_saida, hs_entrada, hs_saida, veiculo_id)
 VALUES
 ('estacionamento A', 10 , '2010-08-10', '2010-08-15', '14:30:00', '15:30:00', 1),
 ('estacionamento B', 20 , '2010-08-20', '2010-08-25', '15:30:00', '16:30:00', 2),
 ('estacionamento C', 30 , '2010-08-30', '2010-08-31', '16:30:00', '17:30:00', 3);
 
 SELECT * FROM estacionamento;
 
 
 
 SELECT * FROM veiculo
 JOIN categoria
 ON veiculo.categoria_id = categoria.id_categoria
 JOIN cliente
 ON veiculo.cliente_id = cliente.id_cliente;
 
 SELECT * FROM veiculo
 LEFT JOIN cliente
 ON veiculo.cliente_id = cliente.id_cliente;
 
  SELECT * FROM veiculo
  RIGHT JOIN categoria
  ON veiculo.categoria_id = categoria.id_categoria;
  
  
 SELECT * FROM veiculo
 LEFT JOIN cliente
 ON veiculo.cliente_id = cliente.id_cliente
 UNION
 SELECT * FROM veiculo
 RIGHT JOIN categoria
 ON veiculo.categoria_id = categoria.id_categoria;
 
 CREATE VIEW vw_veiculo_cliente AS
 SELECT id_veiculo, placa, cor, nome_cliente FROM veiculo
 JOIN cliente
 ON veiculo.cliente_id = cliente.id_cliente;
 
SELECT * FROM vw_veiculo_cliente;
  