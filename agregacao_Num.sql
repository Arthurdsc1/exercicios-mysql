-- Utilizando o mesmo banco de dados do arquivo de procedures
-- funcoes de agregação numéricas
-- SUM, AVG, MIN, MAX, COUNT, GROUP BY

SHOW DATABASES;
USE PROJETO;

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)
);

INSERT INTO VENDEDORES VALUES(NULL,'CARLOS','M',76234.78,88346.87,5756.90);
INSERT INTO VENDEDORES VALUES(NULL,'MARIA','F',5865.78,6768.87,4467.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANTONIO','M',78769.78,6685.87,6664.90);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA','F',5779.78,446886.87,8965.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANDERSON','M',676545.78,77544.87,578665.90);
INSERT INTO VENDEDORES VALUES(NULL,'IVONE','F',57789.78,44774.87,68665.90);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO','M',4785.78,66478.87,6887.90);
INSERT INTO VENDEDORES VALUES(NULL,'CELIA','F',89667.78,57654.87,5755.90);

-- MAX - TRAZ O VALOR MAXIMO DE UMA COLUNA
SELECT MAX(FEVEREIRO) AS MAIOR_FEV
FROM VENDEDORES;

-- MIN - TRAZ O VALOR MINIMO DE UMA COLUNA
SELECT MIN(FEVEREIRO) AS MENOR_FEV
FROM VENDEDORES;

-- AVG - TRAZ O VALOR MEDIO DE UMA COLUNA
SELECT AVG(FEVEREIRO) AS MEDIA_FEV
FROM VENDEDORES;

-- VARIAS FUNCOES
SELECT MAX(JANEIRO) AS MAX_JAN,
       MIN(JANEIRO) AS MIN_JAN,
	   AVG(JANEIRO) AS MEDIA_JAN
	   FROM VENDEDORES;

-- UTILIZANDO A FUNCAO TRUNCATE PARA DIMINUIR O NUMERO DE CASAS DECIMAIS
SELECT MAX(JANEIRO) AS MAX_JAN,
       MIN(JANEIRO) AS MIN_JAN,
	   TRUNCATE(AVG(JANEIRO),2) AS MEDIA_JAN
	   FROM VENDEDORES;

--  AGREGANDO COM SUM()
SELECT SUM(JANEIRO) AS TOTAL_JAN
FROM VENDEDORES;
-- +-----------+
-- | TOTAL_JAN |
-- +-----------+
-- | 995439.21 |
-- +-----------+

SELECT SUM(JANEIRO) AS TOTAL_JAN,
	   SUM(FEVEREIRO) AS TOTAL_FEV,
	   SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES;
-- +-----------+-----------+-----------+
-- | TOTAL_JAN | TOTAL_FEV | TOTAL_MAR |
-- +-----------+-----------+-----------+
-- | 995439.21 | 795141.96 | 685831.17 |
-- +-----------+-----------+----------- 

--
-- VENDAS POR SEXO
SELECT SEXO, SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY SEXO;
-- +------+-------------+
-- | SEXO | TOTAL_MARCO |
-- +------+-------------+
-- | F    |    87855.60 |
-- | M    |   597975.57 |
-- +------+-------------+

--
-- Utilizando SUBQUERYS
SELECT * FROM VENDEDORES;
-- +------------+----------+------+-----------+-----------+-----------+
-- | IDVENDEDOR | NOME     | SEXO | JANEIRO   | FEVEREIRO | MARCO     |
-- +------------+----------+------+-----------+-----------+-----------+
-- |          1 | CARLOS   | M    |  76234.78 |  88346.87 |   5756.90 |
-- |          2 | MARIA    | F    |   5865.78 |   6768.87 |   4467.90 |
-- |          3 | ANTONIO  | M    |  78769.78 |   6685.87 |   6664.90 |
-- |          4 | CLARA    | F    |   5779.78 | 446886.88 |   8965.90 |
-- |          5 | ANDERSON | M    | 676545.75 |  77544.87 | 578665.88 |
-- |          6 | IVONE    | F    |  57789.78 |  44774.87 |  68665.90 |
-- |          7 | JOAO     | M    |   4785.78 |  66478.87 |   6887.90 |
-- |          8 | CELIA    | F    |  89667.78 |  57654.87 |   5755.90 |
-- +------------+----------+------+-----------+-----------+-----------+

-- VENDEDOR QUE VENDEU MENOS EM MARCO E O SEU NOME 
SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);
-- +-------+---------+
-- | NOME  | MARCO   |
-- +-------+---------+
-- | MARIA | 4467.90 |
-- +-------+---------+

-- NOME E O VALOR QUE VENDEU MAIS EM MARCO
SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);
--+----------+-----------+
--| NOME     | MARCO     |
-- +----------+-----------+
-- | ANDERSON | 578665.88 |
-- +----------+-----------+

-- QUEM VENDEU MAIS QUE O VALOR MEDIO DE FEV
SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO > (SELECT AVG(MARCO) FROM VENDEDORES);
-- +----------+-----------+
-- | NOME     | MARCO     |
-- +----------+-----------+
-- | ANDERSON | 578665.88 |
-- +----------+-----------+

--
-- OPERACOES EM "LINHA"
SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	   FROM VENDEDORES;
+----------+-----------+-----------+-----------+------------+-----------+
| NOME     | JANEIRO   | FEVEREIRO | MARCO     | TOTAL      | MEDIA     |
+----------+-----------+-----------+-----------+------------+-----------+
| CARLOS   |  76234.78 |  88346.87 |   5756.90 |  170338.55 |  56779.51 |
| MARIA    |   5865.78 |   6768.87 |   4467.90 |   17102.55 |   5700.84 |
| ANTONIO  |  78769.78 |   6685.87 |   6664.90 |   92120.55 |  30706.85 |
| CLARA    |   5779.78 | 446886.88 |   8965.90 |  461632.56 | 153877.51 |
| ANDERSON | 676545.75 |  77544.87 | 578665.88 | 1332756.49 | 444252.16 |
| IVONE    |  57789.78 |  44774.87 |  68665.90 |  171230.55 |  57076.85 |
| JOAO     |   4785.78 |  66478.87 |   6887.90 |   78152.55 |  26050.84 |
| CELIA    |  89667.78 |  57654.87 |   5755.90 |  153078.55 |  51026.18 |
+----------+-----------+-----------+-----------+------------+-----------+

-- APLICANDO UM %
SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   (JANEIRO+FEVEREIRO+MARCO) * .25 AS "DESCONTO",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	   FROM VENDEDORES;
+----------+-----------+-----------+-----------+------------+-----------+-----------+
| NOME     | JANEIRO   | FEVEREIRO | MARCO     | TOTAL      | DESCONTO  | MEDIA     |
+----------+-----------+-----------+-----------+------------+-----------+-----------+
| CARLOS   |  76234.78 |  88346.87 |   5756.90 |  170338.55 |  42584.64 |  56779.51 |
| MARIA    |   5865.78 |   6768.87 |   4467.90 |   17102.55 |   4275.64 |   5700.84 |
| ANTONIO  |  78769.78 |   6685.87 |   6664.90 |   92120.55 |  23030.14 |  30706.85 |
| CLARA    |   5779.78 | 446886.88 |   8965.90 |  461632.56 | 115408.14 | 153877.51 |
| ANDERSON | 676545.75 |  77544.87 | 578665.88 | 1332756.49 | 333189.12 | 444252.16 |
| IVONE    |  57789.78 |  44774.87 |  68665.90 |  171230.55 |  42807.64 |  57076.85 |
| JOAO     |   4785.78 |  66478.87 |   6887.90 |   78152.55 |  19538.14 |  26050.84 |
| CELIA    |  89667.78 |  57654.87 |   5755.90 |  153078.55 |  38269.64 |  51026.18 |
+----------+-----------+-----------+-----------+------------+-----------+-----------+