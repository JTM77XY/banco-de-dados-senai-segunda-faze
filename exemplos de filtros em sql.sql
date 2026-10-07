CREATE DATABASE estacionamento_xyz;
USE estacionamento_xyz;

 CREATE TABLE estacionamento(
 id_estacionamento INT AUTO_INCREMENT,
 nome VARCHAR(45),
 capacidade INT,
 subsolo VARCHAR(45),
 especial ENUM('sim','não'),
 PRIMARY KEY (id_estacionamento)
 );
 
 INSERT INTO estacionamento
 (nome, capacidade, subsolo, especial)
 VALUES
 ('estacionamento A', 20, 'não', 'não' ),
 ('estacionamento B' , 35, 'sim', 'sim' ),
 ('estacionamento C' , 40, 'sim', 'sim' ),
 ('estacionamento D' , 50, 'sim', 'sim' ),
 ('estacionamento E' , 15, 'sim', 'não' ),
 ('estacionamento F' , 85, 'sim', 'sim' ),
 ('estacionamento G' , 100, 'não', 'não' );
 
 SELECT * FROM estacionamento;
 
 
 -- filtra pelos estacionamentos que são especiais
 -- where: onde
 SELECT nome, capacidade, especial FROM estacionamento
 WHERE especial = 'sim';
 
 
 -- filtra estacionamentos que sejam especiais e que sejam subsolo
 -- AND: E
 SELECT * FROM estacionamento
 WHERE especial = 'sim' AND subsolo = 'sim';
 
 
 -- filtrar capacidades maiores que 50 em ordem decrescente da capacidade
 -- order by: ordenar por
 -- desc: decrescente
 -- asc crescente
 SELECT * FROM estacionamento
 WHERE capacidade > 50
 ORDER BY capacidade DESC;
 
 
 
 
 
 
 SELECT nome, capacidade FROM estacionamento
 WHERE capacidade >= 20 AND capacidade <= 40  AND subsolo = 'sim'
 ORDER BY capacidade ASC;