CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDEREÇO(
	IDENDEREÇO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RESIDENCIAL','COMERCIAL','CELULAR') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
	
);

--ENDEREÇO É OBRIGATORIO CADASTRO SOMENTE 1
--TELEFONE NÃO É OBRIGATORIO, CADASTRO + DE 1 (OPICIONAL)

INSERT INTO CLIENTE VALUES(NULL,'JOÃO','M','JOAO@GMAIL.COM','51545454517');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOS@GAMIL.COM','15318516241');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@GAMIL.COM','16715895426');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'34927825412');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@GMAIL.COM','27894685215');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','F','CELIA@GMAIL.COM','97832165473');

+-----------+--------+------+------------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL            | CPF         |
+-----------+--------+------+------------------+-------------+
|         1 | JOÃO   | M    | JOAO@GMAIL.COM   | 51545454517 |
|         2 | CARLOS | M    | CARLOS@GAMIL.COM | 15318516241 |
|         3 | ANA    | F    | ANA@GAMIL.COM    | 16715895426 |
|         4 | CLARA  | F    | NULL             | 34927825412 |
|         5 | JORGE  | M    | JORGE@GMAIL.COM  | 27894685215 |
|         6 | CELIA  | F    | CELIA@GMAIL.COM  | 97832165473 |
+-----------+--------+------+------------------+-------------+


INSERT INTO ENDEREÇO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA CAPITÃO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SÃO PAULO','SP',3);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

INSERT INTO TELEFONE VALUES(NULL,'CELULAR','78945623',5);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','45621427',5);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','96452318',1);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','94659781',2);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','46252379',1);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','96785120',3);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','12034850',3);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','30542610',1);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','49673015',5);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','36140215',2);

/* JUNÇÃO - JOIN */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDEREÇO.BAIRRO, ENDEREÇO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDEREÇO
ON CLIENTE.IDCLIENTE = ENDEREÇO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+--------+------+---------+----------------+-------------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO        | NUMERO   |
+--------+------+---------+----------------+-------------+----------+
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | CELULAR     | 96452318 |
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | RESIDENCIAL | 46252379 |
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | COMERCIAL   | 30542610 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COMERCIAL   | 94659781 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CELULAR     | 36140215 |
| ANA    | F    | JARDINS | SÃO PAULO      | CELULAR     | 96785120 |
| ANA    | F    | JARDINS | SÃO PAULO      | CELULAR     | 12034850 |
| JORGE  | M    | CENTRO  | VITORIA        | CELULAR     | 78945623 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 45621427 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 49673015 |
+--------+------+---------+----------------+-------------+----------+

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDEREÇO E         /* MAIS USADO */
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+--------+------+---------+----------------+-------------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO        | NUMERO   |
+--------+------+---------+----------------+-------------+----------+
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | CELULAR     | 96452318 |
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | RESIDENCIAL | 46252379 |
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | COMERCIAL   | 30542610 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COMERCIAL   | 94659781 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CELULAR     | 36140215 |
| ANA    | F    | JARDINS | SÃO PAULO      | CELULAR     | 96785120 |
| ANA    | F    | JARDINS | SÃO PAULO      | CELULAR     | 12034850 |
| JORGE  | M    | CENTRO  | VITORIA        | CELULAR     | 78945623 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 45621427 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 49673015 |
+--------+------+---------+----------------+-------------+----------+

/* 
	DML - DATA MANIPULATION LANGUAGE (MANIPULAÇÃO DE DADOS)
	DDL - DATA DEFINITION LANGUAGEM (DEFINIÇÃO DE DADOS)
	DCL - DATA CONTROL LANGUAGE (CONTROLE DE ACESSO DE DADOS)
	TCL - TRANSACTION CONTROL LANGUAGE (CONTROLE DE TRANSAÇÂO)
 */

/* DML - INSERT, SELECT, FILTROS, UPDATE, DELETE */

INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'12379548625');
INSERT INTO ENDEREÇO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

SELECT * FROM CLIENTE; 

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

INSERT INTO CLIENTE VALUES(NULL,'XXX','M',NULL,'XXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

DELETE FROM CLIENTE
WHERE IDCLIENTE = 8;

/* DDL - DEFINIR TIPOS, ALTER TABLE,   */

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PREÇO INT,
	FRETE FLOAT(10,2) NOT NULL
);

# ALTERANDO O NOME DE UMA COLUNA - CHANGE

ALTER TABLE PRODUTO
CHANGE PREÇO VALOR_UNITARIO INT NOT NULL;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

# ADICIONANDO COLUNAS

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

# APAGANDO UM COLUNA

ALTER TABLE PRODUTO
DROP COLUMN PESO;

# ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| PESO           | float(10,2) | NO   |     | NULL    |                |
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* EXERCICIOS DML */

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDEREÇO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDEREÇO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDEREÇO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDEREÇO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDEREÇO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

/* CADASTRE TELEFONES PARA OS CLIENTES */


INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','44522578',20);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','44522578',21);

/* RELATORIO GERAL DE TODOS OS CLIENTES */

DESC CLIENTE;
DESC ENDEREÇO;
DESC TELEFONE;

+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int           | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| IDENDEREÇO  | int         | NO   | PRI | NULL    | auto_increment |
| RUA         | varchar(30) | NO   |     | NULL    |                |
| BAIRRO      | varchar(30) | NO   |     | NULL    |                |
| CIDADE      | varchar(30) | NO   |     | NULL    |                |
| ESTADO      | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE  | int         | YES  | UNI | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
+------------+-------------------------------------------+------+-----+---------+----------------+
| Field      | Type                                      | Null | Key | Default | Extra          |
+------------+-------------------------------------------+------+-----+---------+----------------+
| IDTELEFONE | int                                       | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RESIDENCIAL','COMERCIAL','CELULAR') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)                               | NO   |     | NULL    |                |
| ID_CLIENTE | int                                       | YES  | MUL | NULL    |                |
+------------+-------------------------------------------+------+-----+---------+----------------+

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+-----------+---------+------+-------------------+-------------+---------------------+------------+----------------+--------+-------------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | RUA                 | BAIRRO     | CIDADE         | ESTADO | TIPO        | NUMERO   |
+-----------+---------+------+-------------------+-------------+---------------------+------------+----------------+--------+-------------+----------+
|         5 | JORGE   | M    | JORGE@GMAIL.COM   | 27894685215 | RUA URUGUAIANA      | CENTRO     | VITORIA        | ES     | CELULAR     | 78945623 |
|         5 | JORGE   | M    | JORGE@GMAIL.COM   | 27894685215 | RUA URUGUAIANA      | CENTRO     | VITORIA        | ES     | RESIDENCIAL | 45621427 |
|         1 | JOÃO    | M    | JOAO@GMAIL.COM    | 51545454517 | RUA CAPITÃO HERMES  | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 96452318 |
|         2 | CARLOS  | M    | CARLOS@GAMIL.COM  | 15318516241 | RUA ALFANDEGA       | ESTACIO    | RIO DE JANEIRO | RJ     | COMERCIAL   | 94659781 |
|         1 | JOÃO    | M    | JOAO@GMAIL.COM    | 51545454517 | RUA CAPITÃO HERMES  | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 46252379 |
|         3 | ANA     | F    | ANA@GAMIL.COM     | 16715895426 | RUA PRES VARGAS     | JARDINS    | SÃO PAULO      | SP     | CELULAR     | 96785120 |
|         3 | ANA     | F    | ANA@GAMIL.COM     | 16715895426 | RUA PRES VARGAS     | JARDINS    | SÃO PAULO      | SP     | CELULAR     | 12034850 |
|         1 | JOÃO    | M    | JOAO@GMAIL.COM    | 51545454517 | RUA CAPITÃO HERMES  | CENTRO     | RIO DE JANEIRO | RJ     | COMERCIAL   | 30542610 |
|         5 | JORGE   | M    | JORGE@GMAIL.COM   | 27894685215 | RUA URUGUAIANA      | CENTRO     | VITORIA        | ES     | RESIDENCIAL | 49673015 |
|         2 | CARLOS  | M    | CARLOS@GAMIL.COM  | 15318516241 | RUA ALFANDEGA       | ESTACIO    | RIO DE JANEIRO | RJ     | CELULAR     | 36140215 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES          | CASCADURA  | B. HORIZONTE   | MG     | RESIDENCIAL | 68976565 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES          | CASCADURA  | B. HORIZONTE   | MG     | CELULAR     | 99656675 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA     | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 33567765 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA     | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 88668786 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA     | CENTRO     | RIO DE JANEIRO | RJ     | COMERCIAL   | 55689654 |
|        12 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA  | COPACABANA | RIO DE JANEIRO | RJ     | COMERCIAL   | 88687979 |
|        13 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA     | CENTRO     | VITORIA        | ES     | COMERCIAL   | 88965676 |
|        15 | EDUARDO | M    | NULL              | 54376457    | AV CAPITAO ANTUNES  | CENTRO     | CURITIBA       | PR     | CELULAR     | 89966809 |
|        16 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767    | AV CARLOS BARROSO   | JARDINS    | SAO PAULO      | SP     | COMERCIAL   | 88679978 |
|        17 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | ALAMEDA SAMPAIO     | BOM RETIRO | CURITIBA       | PR     | CELULAR     | 99655768 |
|        18 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA         | LAPA       | SAO PAULO      | SP     | RESIDENCIAL | 89955665 |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO        | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 77455786 |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO        | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 89766554 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE    | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 77755785 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE    | CENTRO     | RIO DE JANEIRO | RJ     | COMERCIAL   | 44522578 |
|        21 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE    | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 44522578 |
+-----------+---------+------+-------------------+-------------+---------------------+------------+----------------+--------+-------------+----------+



/* RELATORIO DE HOMENS */

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';
+-----------+---------+------+-------------------+-------------+---------------------+------------+----------------+--------+-------------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | RUA                 | BAIRRO     | CIDADE         | ESTADO | TIPO        | NUMERO   |
+-----------+---------+------+-------------------+-------------+---------------------+------------+----------------+--------+-------------+----------+
|         1 | JOÃO    | M    | JOAO@GMAIL.COM    | 51545454517 | RUA CAPITÃO HERMES  | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 96452318 |
|         1 | JOÃO    | M    | JOAO@GMAIL.COM    | 51545454517 | RUA CAPITÃO HERMES  | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 46252379 |
|         1 | JOÃO    | M    | JOAO@GMAIL.COM    | 51545454517 | RUA CAPITÃO HERMES  | CENTRO     | RIO DE JANEIRO | RJ     | COMERCIAL   | 30542610 |
|         2 | CARLOS  | M    | CARLOS@GAMIL.COM  | 15318516241 | RUA ALFANDEGA       | ESTACIO    | RIO DE JANEIRO | RJ     | COMERCIAL   | 94659781 |
|         2 | CARLOS  | M    | CARLOS@GAMIL.COM  | 15318516241 | RUA ALFANDEGA       | ESTACIO    | RIO DE JANEIRO | RJ     | CELULAR     | 36140215 |
|         5 | JORGE   | M    | JORGE@GMAIL.COM   | 27894685215 | RUA URUGUAIANA      | CENTRO     | VITORIA        | ES     | CELULAR     | 78945623 |
|         5 | JORGE   | M    | JORGE@GMAIL.COM   | 27894685215 | RUA URUGUAIANA      | CENTRO     | VITORIA        | ES     | RESIDENCIAL | 45621427 |
|         5 | JORGE   | M    | JORGE@GMAIL.COM   | 27894685215 | RUA URUGUAIANA      | CENTRO     | VITORIA        | ES     | RESIDENCIAL | 49673015 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES          | CASCADURA  | B. HORIZONTE   | MG     | RESIDENCIAL | 68976565 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES          | CASCADURA  | B. HORIZONTE   | MG     | CELULAR     | 99656675 |
|        12 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA  | COPACABANA | RIO DE JANEIRO | RJ     | COMERCIAL   | 88687979 |
|        13 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA     | CENTRO     | VITORIA        | ES     | COMERCIAL   | 88965676 |
|        15 | EDUARDO | M    | NULL              | 54376457    | AV CAPITAO ANTUNES  | CENTRO     | CURITIBA       | PR     | CELULAR     | 89966809 |
|        17 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | ALAMEDA SAMPAIO     | BOM RETIRO | CURITIBA       | PR     | CELULAR     | 99655768 |
|        18 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA         | LAPA       | SAO PAULO      | SP     | RESIDENCIAL | 89955665 |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO        | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 77455786 |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO        | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 89766554 |
+-----------+---------+------+-------------------+-------------+---------------------+------------+----------------+--------+-------------+----------+

/* 12 - 13 - 18 - 19 */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 12;
+-----------+-------+------+-----------------+-----------+
| IDCLIENTE | NOME  | SEXO | EMAIL           | CPF       |
+-----------+-------+------+-----------------+-----------+
|        12 | KARLA | M    | KARLA@GMAIL.COM | 545676778 |
+-----------+-------+------+-----------------+-----------+
UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 12;
+-----------+-------+------+-----------------+-----------+
| IDCLIENTE | NOME  | SEXO | EMAIL           | CPF       |
+-----------+-------+------+-----------------+-----------+
|        12 | KARLA | F    | KARLA@GMAIL.COM | 545676778 |
+-----------+-------+------+-----------------+-----------+
################################################################
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 13;
+-----------+---------+------+-------------------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF      |
+-----------+---------+------+-------------------+----------+
|        13 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789 |
+-----------+---------+------+-------------------+----------+
UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 13;
+-----------+---------+------+-------------------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF      |
+-----------+---------+------+-------------------+----------+
|        13 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789 |
+-----------+---------+------+-------------------+----------+
################################################################
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 18;
+-----------+--------+------+------------------+----------+
| IDCLIENTE | NOME   | SEXO | EMAIL            | CPF      |
+-----------+--------+------+------------------+----------+
|        18 | ELAINE | M    | ELAINE@GLOBO.COM | 32567763 |
+-----------+--------+------+------------------+----------+
UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 18;
+-----------+--------+------+------------------+----------+
| IDCLIENTE | NOME   | SEXO | EMAIL            | CPF      |
+-----------+--------+------+------------------+----------+
|        18 | ELAINE | F    | ELAINE@GLOBO.COM | 32567763 |
+-----------+--------+------+------------------+----------+
###############################################################
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 19;
+-----------+--------+------+---------------+-----------+
| IDCLIENTE | NOME   | SEXO | EMAIL         | CPF       |
+-----------+--------+------+---------------+-----------+
|        19 | CARMEM | M    | CARMEM@IG.COM | 787832213 |
+-----------+--------+------+---------------+-----------+
UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 19;
+-----------+--------+------+---------------+-----------+
| IDCLIENTE | NOME   | SEXO | EMAIL         | CPF       |
+-----------+--------+------+---------------+-----------+
|        19 | CARMEM | F    | CARMEM@IG.COM | 787832213 |
+-----------+--------+------+---------------+-----------+

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';
+-----------+---------+------+------------------+-------------+---------------------+------------+----------------+--------+-------------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL            | CPF         | RUA                 | BAIRRO     | CIDADE         | ESTADO | TIPO        | NUMERO   |
+-----------+---------+------+------------------+-------------+---------------------+------------+----------------+--------+-------------+----------+
|         5 | JORGE   | M    | JORGE@GMAIL.COM  | 27894685215 | RUA URUGUAIANA      | CENTRO     | VITORIA        | ES     | CELULAR     | 78945623 |
|         5 | JORGE   | M    | JORGE@GMAIL.COM  | 27894685215 | RUA URUGUAIANA      | CENTRO     | VITORIA        | ES     | RESIDENCIAL | 45621427 |
|         1 | JOÃO    | M    | JOAO@GMAIL.COM   | 51545454517 | RUA CAPITÃO HERMES  | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 96452318 |
|         2 | CARLOS  | M    | CARLOS@GAMIL.COM | 15318516241 | RUA ALFANDEGA       | ESTACIO    | RIO DE JANEIRO | RJ     | COMERCIAL   | 94659781 |
|         1 | JOÃO    | M    | JOAO@GMAIL.COM   | 51545454517 | RUA CAPITÃO HERMES  | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 46252379 |
|         1 | JOÃO    | M    | JOAO@GMAIL.COM   | 51545454517 | RUA CAPITÃO HERMES  | CENTRO     | RIO DE JANEIRO | RJ     | COMERCIAL   | 30542610 |
|         5 | JORGE   | M    | JORGE@GMAIL.COM  | 27894685215 | RUA URUGUAIANA      | CENTRO     | VITORIA        | ES     | RESIDENCIAL | 49673015 |
|         2 | CARLOS  | M    | CARLOS@GAMIL.COM | 15318516241 | RUA ALFANDEGA       | ESTACIO    | RIO DE JANEIRO | RJ     | CELULAR     | 36140215 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM    | 4657765     | RUA GUEDES          | CASCADURA  | B. HORIZONTE   | MG     | RESIDENCIAL | 68976565 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM    | 4657765     | RUA GUEDES          | CASCADURA  | B. HORIZONTE   | MG     | CELULAR     | 99656675 |
|        15 | EDUARDO | M    | NULL             | 54376457    | AV CAPITAO ANTUNES  | CENTRO     | CURITIBA       | PR     | CELULAR     | 89966809 |
|        17 | ANTONIO | M    | ANTONIO@UOL.COM  | 3423565     | ALAMEDA SAMPAIO     | BOM RETIRO | CURITIBA       | PR     | CELULAR     | 99655768 |
+-----------+---------+------+------------------+-------------+---------------------+------------+----------------+--------+-------------+----------+

### OTIMIZANDO ###

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 12
OR IDCLIENTE = 13
OR IDCLIENTE = 18
OR IDCLIENTE = 19;

SELECT * FROM CLIENTE
WHERE IDCLIENTE IN (12,13,18,19);

UPDATE CLIENTE SET SEXO = 'F'
WHERE IDCLIENTE IN (12,13,18,19);



/* RELATORIO DE MULHERES */

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+-------------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | RUA                | BAIRRO     | CIDADE         | ESTADO | TIPO        | NUMERO   |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+-------------+----------+
|         3 | ANA     | F    | ANA@GAMIL.COM     | 16715895426 | RUA PRES VARGAS    | JARDINS    | SÃO PAULO      | SP     | CELULAR     | 96785120 |
|         3 | ANA     | F    | ANA@GAMIL.COM     | 16715895426 | RUA PRES VARGAS    | JARDINS    | SÃO PAULO      | SP     | CELULAR     | 12034850 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 33567765 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 88668786 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COMERCIAL   | 55689654 |
|        12 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COMERCIAL   | 88687979 |
|        13 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COMERCIAL   | 88965676 |
|        16 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767    | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | COMERCIAL   | 88679978 |
|        18 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RESIDENCIAL | 89955665 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 77455786 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 89766554 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 77755785 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COMERCIAL   | 44522578 |
|        21 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 44522578 |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+-------------+----------+

/* 16 */
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 16;
+-----------+---------+------+----------------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL          | CPF      |
+-----------+---------+------+----------------+----------+
|        16 | ANTONIO | F    | ANTONIO@IG.COM | 12436767 |
+-----------+---------+------+----------------+----------+
UPDATE CLIENTE
SET SEXO = 'M'
WHERE IDCLIENTE = 16;
+-----------+---------+------+----------------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL          | CPF      |
+-----------+---------+------+----------------+----------+
|        16 | ANTONIO | M    | ANTONIO@IG.COM | 12436767 |
+-----------+---------+------+----------------+----------+

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+-------------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | RUA                | BAIRRO     | CIDADE         | ESTADO | TIPO        | NUMERO   |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+-------------+----------+
|         3 | ANA     | F    | ANA@GAMIL.COM     | 16715895426 | RUA PRES VARGAS    | JARDINS    | SÃO PAULO      | SP     | CELULAR     | 96785120 |
|         3 | ANA     | F    | ANA@GAMIL.COM     | 16715895426 | RUA PRES VARGAS    | JARDINS    | SÃO PAULO      | SP     | CELULAR     | 12034850 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 33567765 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 88668786 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COMERCIAL   | 55689654 |
|        12 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COMERCIAL   | 88687979 |
|        13 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COMERCIAL   | 88965676 |
|        18 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RESIDENCIAL | 89955665 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 77455786 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 89766554 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 77755785 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COMERCIAL   | 44522578 |
|        21 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 44522578 |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+-------------+----------+


/* QUANTIDADE DE MULHERES E HOMENS */

SELECT COUNT(*) AS QUANTIDADE, SEXO
FROM CLIENTE
GROUP BY SEXO;
+------------+------+
| QUANTIDADE | SEXO |
+------------+------+
|          9 | M    |
|         11 | F    |
+------------+------+


/* IDS E EMAIL DAS MULHERES QUE MORAM NO CENTRO DO RIO DE JANEIRO E NÃO TENHAM CELULAR */

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO 
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO';

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, T.TIPO, E.BAIRRO, E.CIDADE
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO';
+-----------+-------------------+---------+------+-------------+--------+----------------+
| IDCLIENTE | EMAIL             | NOME    | SEXO | TIPO        | BAIRRO | CIDADE         |
+-----------+-------------------+---------+------+-------------+--------+----------------+
|        11 | NULL              | GIOVANA | F    | CELULAR     | CENTRO | RIO DE JANEIRO |
|        11 | NULL              | GIOVANA | F    | CELULAR     | CENTRO | RIO DE JANEIRO |
|        11 | NULL              | GIOVANA | F    | COMERCIAL   | CENTRO | RIO DE JANEIRO |
|        19 | CARMEM@IG.COM     | CARMEM  | F    | RESIDENCIAL | CENTRO | RIO DE JANEIRO |
|        19 | CARMEM@IG.COM     | CARMEM  | F    | RESIDENCIAL | CENTRO | RIO DE JANEIRO |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    | RESIDENCIAL | CENTRO | RIO DE JANEIRO |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    | COMERCIAL   | CENTRO | RIO DE JANEIRO |
|        21 | JOICE@GMAIL.COM   | JOICE   | F    | CELULAR     | CENTRO | RIO DE JANEIRO |
+-----------+-------------------+---------+------+-------------+--------+----------------+

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, T.TIPO, E.BAIRRO, E.CIDADE
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO'
AND TIPO = 'RESIDENCIAL' OR TIPO = 'COMERCIAL';
+-----------+-------------------+---------+------+-------------+------------+----------------+
| IDCLIENTE | EMAIL             | NOME    | SEXO | TIPO        | BAIRRO     | CIDADE         |
+-----------+-------------------+---------+------+-------------+------------+----------------+
|         2 | CARLOS@GAMIL.COM  | CARLOS  | M    | COMERCIAL   | ESTACIO    | RIO DE JANEIRO |
|         1 | JOAO@GMAIL.COM    | JOÃO    | M    | COMERCIAL   | CENTRO     | RIO DE JANEIRO |
|        11 | NULL              | GIOVANA | F    | COMERCIAL   | CENTRO     | RIO DE JANEIRO |
|        12 | KARLA@GMAIL.COM   | KARLA   | F    | COMERCIAL   | COPACABANA | RIO DE JANEIRO |
|        13 | DANIELE@GMAIL.COM | DANIELE | F    | COMERCIAL   | CENTRO     | VITORIA        |
|        16 | ANTONIO@IG.COM    | ANTONIO | M    | COMERCIAL   | JARDINS    | SAO PAULO      |
|        19 | CARMEM@IG.COM     | CARMEM  | F    | RESIDENCIAL | CENTRO     | RIO DE JANEIRO |
|        19 | CARMEM@IG.COM     | CARMEM  | F    | RESIDENCIAL | CENTRO     | RIO DE JANEIRO |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    | RESIDENCIAL | CENTRO     | RIO DE JANEIRO |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    | COMERCIAL   | CENTRO     | RIO DE JANEIRO |
+-----------+-------------------+---------+------+-------------+------------+----------------+

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, T.TIPO, E.BAIRRO, E.CIDADE
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO'
AND (TIPO = 'RESIDENCIAL' OR TIPO = 'COMERCIAL');
                                                                                 
SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, T.TIPO, E.BAIRRO, E.CIDADE
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO'
AND TIPO IN('RESIDENCIAL','COMERCIAL');

##### TA ERRADO POIS GEOVANA NÃO PODERIA VIR!! EXPLICAÇÃO MAIS PARA FRENTE

+-----------+-------------------+---------+------+-------------+--------+----------------+
| IDCLIENTE | EMAIL             | NOME    | SEXO | TIPO        | BAIRRO | CIDADE         |
+-----------+-------------------+---------+------+-------------+--------+----------------+
|        11 | NULL              | GIOVANA | F    | COMERCIAL   | CENTRO | RIO DE JANEIRO |
|        19 | CARMEM@IG.COM     | CARMEM  | F    | RESIDENCIAL | CENTRO | RIO DE JANEIRO |
|        19 | CARMEM@IG.COM     | CARMEM  | F    | RESIDENCIAL | CENTRO | RIO DE JANEIRO |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    | RESIDENCIAL | CENTRO | RIO DE JANEIRO |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    | COMERCIAL   | CENTRO | RIO DE JANEIRO |
+-----------+-------------------+---------+------+-------------+--------+----------------+

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR DOS CLIENTE 
QUE MORARM NO ESTADO DO RIO DE JANEIRO, VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR */

DESC TELEFONE;
+------------+-------------------------------------------+------+-----+---------+----------------+
| Field      | Type                                      | Null | Key | Default | Extra          |
+------------+-------------------------------------------+------+-----+---------+----------------+
| IDTELEFONE | int                                       | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RESIDENCIAL','COMERCIAL','CELULAR') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)                               | NO   |     | NULL    |                |
| ID_CLIENTE | int                                       | YES  | MUL | NULL    |                |
+------------+-------------------------------------------+------+-----+---------+----------------+

SELECT C.NOME, C.EMAIL, T.NUMERO, T.TIPO, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;
+---------+-------------------+----------+-------------+--------+
| NOME    | EMAIL             | NUMERO   | TIPO        | ESTADO |
+---------+-------------------+----------+-------------+--------+
| JORGE   | JORGE@GMAIL.COM   | 78945623 | CELULAR     | ES     |
| JORGE   | JORGE@GMAIL.COM   | 45621427 | RESIDENCIAL | ES     |
| JOÃO    | JOAO@GMAIL.COM    | 96452318 | CELULAR     | RJ     |
| CARLOS  | CARLOS@GAMIL.COM  | 94659781 | COMERCIAL   | RJ     |
| JOÃO    | JOAO@GMAIL.COM    | 46252379 | RESIDENCIAL | RJ     |
| ANA     | ANA@GAMIL.COM     | 96785120 | CELULAR     | SP     |
| ANA     | ANA@GAMIL.COM     | 12034850 | CELULAR     | SP     |
| JOÃO    | JOAO@GMAIL.COM    | 30542610 | COMERCIAL   | RJ     |
| JORGE   | JORGE@GMAIL.COM   | 49673015 | RESIDENCIAL | ES     |
| CARLOS  | CARLOS@GAMIL.COM  | 36140215 | CELULAR     | RJ     |
| FLAVIO  | FLAVIO@IG.COM     | 68976565 | RESIDENCIAL | MG     |
| FLAVIO  | FLAVIO@IG.COM     | 99656675 | CELULAR     | MG     |
| GIOVANA | NULL              | 33567765 | CELULAR     | RJ     |
| GIOVANA | NULL              | 88668786 | CELULAR     | RJ     |
| GIOVANA | NULL              | 55689654 | COMERCIAL   | RJ     |
| KARLA   | KARLA@GMAIL.COM   | 88687979 | COMERCIAL   | RJ     |
| DANIELE | DANIELE@GMAIL.COM | 88965676 | COMERCIAL   | ES     |
| EDUARDO | NULL              | 89966809 | CELULAR     | PR     |
| ANTONIO | ANTONIO@IG.COM    | 88679978 | COMERCIAL   | SP     |
| ANTONIO | ANTONIO@UOL.COM   | 99655768 | CELULAR     | PR     |
| ELAINE  | ELAINE@GLOBO.COM  | 89955665 | RESIDENCIAL | SP     |
| CARMEM  | CARMEM@IG.COM     | 77455786 | RESIDENCIAL | RJ     |
| CARMEM  | CARMEM@IG.COM     | 89766554 | RESIDENCIAL | RJ     |
| ADRIANA | ADRIANA@GMAIL.COM | 77755785 | RESIDENCIAL | RJ     |
| ADRIANA | ADRIANA@GMAIL.COM | 44522578 | COMERCIAL   | RJ     |
| JOICE   | JOICE@GMAIL.COM   | 44522578 | CELULAR     | RJ     |
+---------+-------------------+----------+-------------+--------+


SELECT C.NOME, C.EMAIL, T.NUMERO, T.TIPO, E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE TIPO = 'CELULAR'
AND ESTADO = 'RJ';
+---------+------------------+----------+---------+--------+
| NOME    | EMAIL            | NUMERO   | TIPO    | ESTADO |
+---------+------------------+----------+---------+--------+
| JOÃO    | JOAO@GMAIL.COM   | 96452318 | CELULAR | RJ     |
| CARLOS  | CARLOS@GAMIL.COM | 36140215 | CELULAR | RJ     |
| GIOVANA | NULL             | 33567765 | CELULAR | RJ     |
| GIOVANA | NULL             | 88668786 | CELULAR | RJ     |
| JOICE   | JOICE@GMAIL.COM  | 44522578 | CELULAR | RJ     |
+---------+------------------+----------+---------+--------+

SELECT C.NOME, C.EMAIL, T.NUMERO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE TIPO = 'CELULAR'
AND ESTADO = 'RJ';
+---------+------------------+----------+
| NOME    | EMAIL            | NUMERO   |
+---------+------------------+----------+
| JOÃO    | JOAO@GMAIL.COM   | 96452318 |
| CARLOS  | CARLOS@GAMIL.COM | 36140215 |
| GIOVANA | NULL             | 33567765 |
| GIOVANA | NULL             | 88668786 |
| JOICE   | JOICE@GMAIL.COM  | 44522578 |
+---------+------------------+----------+

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR /* PROJEÇÃO */
FROM CLIENTE C /* ORIGEM */
INNER JOIN TELEFONE T /* JUNÇÃO */
ON C.IDCLIENTE = T.ID_CLIENTE /* JUNÇÃO CONDIÇÃO */
INNER JOIN ENDEREÇO E /* JUNÇÃO */
ON C.IDCLIENTE = E.ID_CLIENTE /* JUNÇÃO CONDIÇÃO */
WHERE TIPO = 'CELULAR' /* SELEÇÃO */
AND ESTADO = 'RJ'; /* SELEÇÃO */
+---------+------------------+----------+
| NOME    | EMAIL            | CELULAR  |
+---------+------------------+----------+
| JOÃO    | JOAO@GMAIL.COM   | 96452318 |
| CARLOS  | CARLOS@GAMIL.COM | 36140215 |
| GIOVANA | NULL             | 33567765 |
| GIOVANA | NULL             | 88668786 |
| JOICE   | JOICE@GMAIL.COM  | 44522578 |
+---------+------------------+----------+

/* PARA UMA COMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR
DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO VOCÊ TERÁ PASSAR A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR */

DESC CLIENTE;
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int           | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

SELECT C.NOME, C.EMAIL, C.SEXO, T.NUMERO, T.TIPO, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND ESTADO = 'SP' AND TIPO = 'CELULAR';
+------+---------------+------+----------+---------+--------+
| NOME | EMAIL         | SEXO | NUMERO   | TIPO    | ESTADO |
+------+---------------+------+----------+---------+--------+
| ANA  | ANA@GAMIL.COM | F    | 96785120 | CELULAR | SP     |
| ANA  | ANA@GAMIL.COM | F    | 12034850 | CELULAR | SP     |
+------+---------------+------+----------+---------+--------+

SELECT C.NOME, C.EMAIL, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND ESTADO = 'SP' AND TIPO = 'CELULAR';
+------+---------------+----------+
| NOME | EMAIL         | NUMERO   |
+------+---------------+----------+
| ANA  | ANA@GAMIL.COM | 96785120 |
| ANA  | ANA@GAMIL.COM | 12034850 |
+------+---------------+----------+

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR /* PROJEÇÃO */
FROM CLIENTE C /* ORIGEM */
INNER JOIN ENDEREÇO E /* JUNÇÃO */
ON C.IDCLIENTE = E.ID_CLIENTE /* JUNÇÃO */
INNER JOIN TELEFONE T /* JUNÇÃO */
ON C.IDCLIENTE = T.ID_CLIENTE /* JUNÇÃO */
WHERE SEXO = 'F' /* SELEÇÃO */
AND ESTADO = 'SP' AND TIPO = 'CELULAR'; /* SELEÇÃO */
+------+---------------+----------+
| NOME | EMAIL         | CELULAR  |
+------+---------------+----------+
| ANA  | ANA@GAMIL.COM | 96785120 |
| ANA  | ANA@GAMIL.COM | 12034850 |
+------+---------------+----------+

/* nome, email, numero, estado */

SELECT C.NOME, C.EMAIL, E.ESTADO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
+---------+-------------------+--------+----------+
| NOME    | EMAIL             | ESTADO | NUMERO   |
+---------+-------------------+--------+----------+
| JORGE   | JORGE@GMAIL.COM   | ES     | 78945623 |
| JORGE   | JORGE@GMAIL.COM   | ES     | 45621427 |
| JOÃO    | JOAO@GMAIL.COM    | RJ     | 96452318 |
| CARLOS  | CARLOS@GAMIL.COM  | RJ     | 94659781 |
| JOÃO    | JOAO@GMAIL.COM    | RJ     | 46252379 |
| ANA     | ANA@GAMIL.COM     | SP     | 96785120 |
| ANA     | ANA@GAMIL.COM     | SP     | 12034850 |
| JOÃO    | JOAO@GMAIL.COM    | RJ     | 30542610 |
| JORGE   | JORGE@GMAIL.COM   | ES     | 49673015 |
| CARLOS  | CARLOS@GAMIL.COM  | RJ     | 36140215 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 68976565 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 99656675 |
| GIOVANA | NULL              | RJ     | 33567765 |
| GIOVANA | NULL              | RJ     | 88668786 |
| GIOVANA | NULL              | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM | ES     | 88965676 |
| EDUARDO | NULL              | PR     | 89966809 |
| ANTONIO | ANTONIO@IG.COM    | SP     | 88679978 |
| ANTONIO | ANTONIO@UOL.COM   | PR     | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM  | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 44522578 |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 44522578 |
+---------+-------------------+--------+----------+

/* IFNULL () */

SELECT C.NOME, 
	   IFNULL(C.EMAIL,'NÃO TEM EMAIL'), 
	   E.ESTADO, 
	   T.NUMERO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;
+---------+----------------------------------+--------+----------+
| NOME    | IFNULL(C.EMAIL,'NÃO TEM EMAIL')  | ESTADO | NUMERO   |
+---------+----------------------------------+--------+----------+
| JORGE   | JORGE@GMAIL.COM                  | ES     | 78945623 |
| JORGE   | JORGE@GMAIL.COM                  | ES     | 45621427 |
| JOÃO    | JOAO@GMAIL.COM                   | RJ     | 96452318 |
| CARLOS  | CARLOS@GAMIL.COM                 | RJ     | 94659781 |
| JOÃO    | JOAO@GMAIL.COM                   | RJ     | 46252379 |
| ANA     | ANA@GAMIL.COM                    | SP     | 96785120 |
| ANA     | ANA@GAMIL.COM                    | SP     | 12034850 |
| JOÃO    | JOAO@GMAIL.COM                   | RJ     | 30542610 |
| JORGE   | JORGE@GMAIL.COM                  | ES     | 49673015 |
| CARLOS  | CARLOS@GAMIL.COM                 | RJ     | 36140215 |
| FLAVIO  | FLAVIO@IG.COM                    | MG     | 68976565 |
| FLAVIO  | FLAVIO@IG.COM                    | MG     | 99656675 |
| GIOVANA | NÃO TEM EMAIL                    | RJ     | 33567765 |
| GIOVANA | NÃO TEM EMAIL                    | RJ     | 88668786 |
| GIOVANA | NÃO TEM EMAIL                    | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM                  | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM                | ES     | 88965676 |
| EDUARDO | NÃO TEM EMAIL                    | PR     | 89966809 |
| ANTONIO | ANTONIO@IG.COM                   | SP     | 88679978 |
| ANTONIO | ANTONIO@UOL.COM                  | PR     | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM                 | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM                    | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM                    | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM                | RJ     | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM                | RJ     | 44522578 |
| JOICE   | JOICE@GMAIL.COM                  | RJ     | 44522578 |
+---------+----------------------------------+--------+----------+

SELECT C.NOME, 
	   IFNULL(C.EMAIL,'*****') AS "EMAIL", 
	   E.ESTADO, 
	   T.NUMERO
FROM CLIENTE C
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;
+---------+-------------------+--------+----------+
| NOME    | EMAIL             | ESTADO | NUMERO   |
+---------+-------------------+--------+----------+
| JORGE   | JORGE@GMAIL.COM   | ES     | 78945623 |
| JORGE   | JORGE@GMAIL.COM   | ES     | 45621427 |
| JOÃO    | JOAO@GMAIL.COM    | RJ     | 96452318 |
| CARLOS  | CARLOS@GAMIL.COM  | RJ     | 94659781 |
| JOÃO    | JOAO@GMAIL.COM    | RJ     | 46252379 |
| ANA     | ANA@GAMIL.COM     | SP     | 96785120 |
| ANA     | ANA@GAMIL.COM     | SP     | 12034850 |
| JOÃO    | JOAO@GMAIL.COM    | RJ     | 30542610 |
| JORGE   | JORGE@GMAIL.COM   | ES     | 49673015 |
| CARLOS  | CARLOS@GAMIL.COM  | RJ     | 36140215 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 68976565 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 99656675 |
| GIOVANA | *****             | RJ     | 33567765 |
| GIOVANA | *****             | RJ     | 88668786 |
| GIOVANA | *****             | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM | ES     | 88965676 |
| EDUARDO | *****             | PR     | 89966809 |
| ANTONIO | ANTONIO@IG.COM    | SP     | 88679978 |
| ANTONIO | ANTONIO@UOL.COM   | PR     | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM  | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 44522578 |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 44522578 |
+---------+-------------------+--------+----------+

/* VIEW */

SELECT C.NOME, 
	   C.SEXO, 
	   C.EMAIL, 
	   T.TIPO, 
	   T.NUMERO, 
	   E.BAIRRO, 
	   E.CIDADE, 
	   E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE;
+---------+------+-------------------+-------------+----------+------------+----------------+--------+
| NOME    | SEXO | EMAIL             | TIPO        | NUMERO   | BAIRRO     | CIDADE         | ESTADO |
+---------+------+-------------------+-------------+----------+------------+----------------+--------+
| JORGE   | M    | JORGE@GMAIL.COM   | CELULAR     | 78945623 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@GMAIL.COM   | RESIDENCIAL | 45621427 | CENTRO     | VITORIA        | ES     |
| JOÃO    | M    | JOAO@GMAIL.COM    | CELULAR     | 96452318 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOS@GAMIL.COM  | COMERCIAL   | 94659781 | ESTACIO    | RIO DE JANEIRO | RJ     |
| JOÃO    | M    | JOAO@GMAIL.COM    | RESIDENCIAL | 46252379 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@GAMIL.COM     | CELULAR     | 96785120 | JARDINS    | SÃO PAULO      | SP     |
| ANA     | F    | ANA@GAMIL.COM     | CELULAR     | 12034850 | JARDINS    | SÃO PAULO      | SP     |
| JOÃO    | M    | JOAO@GMAIL.COM    | COMERCIAL   | 30542610 | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | JORGE@GMAIL.COM   | RESIDENCIAL | 49673015 | CENTRO     | VITORIA        | ES     |
| CARLOS  | M    | CARLOS@GAMIL.COM  | CELULAR     | 36140215 | ESTACIO    | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM     | RESIDENCIAL | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CELULAR     | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| GIOVANA | F    | NULL              | CELULAR     | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | NULL              | CELULAR     | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | NULL              | COMERCIAL   | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COMERCIAL   | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COMERCIAL   | 88965676 | CENTRO     | VITORIA        | ES     |
| EDUARDO | M    | NULL              | CELULAR     | 89966809 | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@IG.COM    | COMERCIAL   | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM   | CELULAR     | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | RESIDENCIAL | 89955665 | LAPA       | SAO PAULO      | SP     |
| CARMEM  | F    | CARMEM@IG.COM     | RESIDENCIAL | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM     | RESIDENCIAL | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RESIDENCIAL | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | COMERCIAL   | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | CELULAR     | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+-------------+----------+------------+----------------+--------+

CREATE VIEW RELATORIO AS
SELECT C.NOME, 
	   C.SEXO, 
	   C.EMAIL, 
	   T.TIPO, 
	   T.NUMERO, 
	   E.BAIRRO, 
	   E.CIDADE, 
	   E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM RELATORIO;

SHOW TABLES;
SHOW DATABASES;

## NO SHOW TABLES APARECE OS VIEWS

/* APAGANDO UMA VIEW */

DROP VIEW RELATORIO;

/* INSERINDO UM PREFIXO */

CREATE VIEW V_RELATORIO AS
SELECT C.NOME, 
	   C.SEXO, 
	   IFNULL(C.EMAIL,'***') AS "EMAIL", 
	   T.TIPO, 
	   T.NUMERO, 
	   E.BAIRRO, 
	   E.CIDADE, 
	   E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDEREÇO E
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT NOME, NUMERO, ESTADO
FROM V_RELATORIO;

/* UPDATE, INSERT E DELETE - DML */

INSERT INTO V_RELATORIO VALUES('ANDREIA','F','ANDREIA@UOL.COM.BR','CELULAR','943761280','CENTRO','VITORIA','ES');

# NÃO POSSO FAZER INSERT OU DELETE EM VIEW COM JOIN, MAS POSSO FAZER UPDATE

# MAS SE A VIEW NÃO TIVER JOIN, POSSO DELETAR E INSERIR

/* ORDEM BY */

CREATE TABLE ALUNO(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNO(1,JOÃO);
INSERT INTO ALUNO(1,JOÃO);
INSERT INTO ALUNO(1,JOÃO);
INSERT INTO ALUNO(1,JOÃO);
INSERT INTO ALUNO(1,JOÃO);
INSERT INTO ALUNO(1,JOÃO);
INSERT INTO ALUNO(1,JOÃO);
INSERT INTO ALUNO(1,JOÃO);
INSERT INTO ALUNO(1,JOÃO);










