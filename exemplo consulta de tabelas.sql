CREATE DATABASE familha;
USE familha;
 
 CREATE TABLE filho(
 id_filho INT AUTO_INCREMENT,
 nome_filho VARCHAR(45),
 PRIMARY KEY (id_filho)
 );

CREATE TABLE pai(
 id_pai INT AUTO_INCREMENT,
 nome_pai VARCHAR(45),
 filho_id INT,
 FOREIGN KEY (filho_id)
 REFERENCES filho (id_filho),
 PRIMARY KEY (id_pai)
 );
 
 INSERT INTO filho
 (nome_filho)
 VALUES
 ('joaozinho'),
 ('mariazinha'),
 ('carlinha'),
 ('aninha');
 
 SELECT * FROM filho;
 
 
 INSERT INTO pai
 (nome_pai, filho_id)
 VALUES
 ('antonio', 4),
 ('antonio', 3),
 ('carlos', 2);
 
  SELECT * FROM pai;
 
 INSERT INTO pai
 (nome_pai)
 VALUES
 ('mateus');
 

 -- view é um atalho 
CREATE VIEW pai_filho AS
SELECT * FROM pai
JOIN filho
ON pai.filho_id = filho.id_filho;

SELECT * FROM pai_filho;

-- tras os dados das tabelas que tem relação
SELECT pai.nome_pai, filho.nome_filho FROM pai
JOIN filho
ON pai.filho_id = filho.id_filho;

-- tras os dados que tem relação e os que não tem relação da tabela a esquerda do left join(pai)
SELECT pai.nome_pai, filho.nome_filho FROM pai
LEFT JOIN filho
ON pai.filho_id = filho. id_filho;

-- traz os dados que tem relação e os que não tem relação da tabela a direita do right join join(filho)
SELECT pai.nome_pai, filho.nome_filho FROM pai
RIGHT JOIN filho
ON pai.filho_id = filho. id_filho;

-- tras todos os dados das tabelas
SELECT pai.nome_pai, filho.nome_filho FROM pai
LEFT JOIN filho
ON pai.filho_id = filho. id_filho
UNION
SELECT pai.nome_pai, filho.nome_filho FROM pai
RIGHT JOIN filho
ON pai.filho_id = filho. id_filho;