CREATE DATABASE boleto;
USE boleto;

CREATE TABLE cliente(
 id_cliente INT AUTO_INCREMENT,
 nome VARCHAR(45),
 PRIMARY KEY (id_cliente)
 );
 
 CREATE TABLE mensalidade(
 id_mensalidade INT AUTO_INCREMENT,
 cliente_id INT,
 FOREIGN KEY (cliente_id)
 REFERENCES cliente (id_cliente),
 valor DECIMAL(5,2),
 status_pagamento VARCHAR(45),
 PRIMARY KEY (id_mensalidade)
 );
 

 INSERT INTO cliente
 (nome)
 VALUES
 ('jose'),
 ('carlos'),
 ('marcos');
 
 SELECT * FROM cliente;
 
 
 INSERT INTO mensalidade
 (cliente_id, valor, status_pagamento)
 VALUES
 (1 , 650.00, 'fatura paga' ),
 (2 , 670.00, 'fatura paga' ),
 (3 , 690.00, 'fatura paga' ),
 (1 , 720.00, 'em débito' ),
 (2 , 740.00, 'em débito' ),
 (3 , 760.00, 'em débito' ),
 (3 , 800.00, 'em débito' );
 
 SELECT * FROM mensalidade;
 
 
-- qual a quantidade total de mensalidades?
SELECT count(mensalidade.status_pagamento) FROM mensalidade;


-- quantidade de mensalidade por cliente?        group by:agrupar por
-- count: contagem
SELECT cliente.nome, count(mensalidade.status_pagamento) FROM mensalidade
JOIN cliente
ON mensalidade.cliente_id = cliente.id_cliente
GROUP BY cliente.nome;


-- qual o valor $$ mensalidade por cliente?
-- sum: soma
SELECT cliente.nome, sum(mensalidade.valor) FROM mensalidade
JOIN cliente
ON mensalidade.cliente_id = cliente.id_cliente
GROUP BY cliente.nome;


-- valor médio da mensalidade por cliente?  
--  avg: media
-- AS vai mudar o nome (mensalidade.valor) para valor_médio. só na consulta, pois na tabela o nome continua o original. é só para colocar um nome bonitinho
SELECT cliente.nome, avg(mensalidade.valor) AS valor_medio FROM mensalidade
JOIN cliente
ON mensalidade.cliente_id = cliente.id_cliente
GROUP BY cliente.nome;
