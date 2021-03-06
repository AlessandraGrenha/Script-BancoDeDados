/* CRIAR BANCO DE DADOS */
CREATE DATABASE LIVRARIA;

/* SE CONECTAR AO BANCO DE DADOS */
USE LIVRARIA;

/* CRIAR TABELA NO BANCO DE DADOS */
CREATE TABLE LIVROS(
	LIVRO VARCHAR(100),
	AUTOR VARCHAR(100),
	SEXO CHAR(1),
	PÁGINAS INT(5),
	EDITORA VARCHAR(30),
	VALOR FLOAT(10,2),
	UF CHAR(2),
	ANO INT(4)
	);
	
/* INSERIR DADOS NA TABELA */
INSERT INTO LIVROS VALUES ('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);
INSERT INTO LIVROS VALUES('SQL para leigos','João Nunes','M',450,'Addison',98.00,'SP',2018);
INSERT INTO LIVROS VALUES('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45.00,'RJ',2008);
INSERT INTO LIVROS VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78.99,'RJ',2018);
INSERT INTO LIVROS VALUES('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150.98,'RJ',2019);
INSERT INTO LIVROS VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60.00,'MG',2016);
INSERT INTO LIVROS VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100.00,'ES',2015);
INSERT INTO LIVROS VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78.98,'ES',2011);
INSERT INTO LIVROS VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130.98,'RS',2018);
INSERT INTO LIVROS VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56.58,'SP',2017);

/* 1º TRAZER TODOS OS DADOS */
SELECT * FROM LIVROS;

/* 2º TRAZER O NOME DO LIVRO E O NOME DA EDITORA */
SELECT LIVRO, EDITORA FROM LIVROS;

/* 3º TRAZER O NOME DE LIVRO E A UF DOS LIVROS PUBLICADOS POR AUTORES SO SEXO MASCULINO */
SELECT LIVRO, UF FROM LIVROS
WHERE SEXO = 'M';

/* 4º TRAZER O NOME DO LIVRO E O NUMERO DE PAGINAS DOS LIVROS PUBLICADOS POR AUTORES DO SEXO FEMININO */
SELECT  LIVRO, PÁGINAS FROM LIVROS
WHERE SEXO = 'F';


/* 5º TRAZER OS VALORES DOS LIVROS DAS EDITORAS DE SÃO PAULO. */
SELECT LIVRO, VALOR FROM LIVROS
WHERE UF = 'SP';


/* 6º TRAZER OS DADOS DOS AUTORES DO SEXO MASCULINO QUE TIVERAM LIVROS PUBLICADOS POR SÃO PAULO OU RIO DE JANEIRO */
SELECT AUTOR, SEXO FROM LIVROS
WHERE SEXO = 'M' AND (UF = 'SP' OR UF = 'RJ'); (ERRO)
