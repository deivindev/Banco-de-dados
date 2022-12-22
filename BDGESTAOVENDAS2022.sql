
CREATE DATABASE BDGESTAOVENDAS
USE BDGESTAOVENDAS




CREATE TABLE Categoria (
	CodCategoria	INT IDENTITY CONSTRAINT PKCategoria PRIMARY KEY,
	NomeCategoria	VARCHAR(100) NOT NULL
)

CREATE TABLE Produto (
	CodProduto		INT IDENTITY CONSTRAINT PKProduto PRIMARY KEY,
	NomeProduto		VARCHAR(100) NOT NULL,
	DataValidade	DATE,
	Preco			MONEY NOT NULL,
	Quantidade		INT NOT NULL,
	Unidade			CHAR(2),
	CodCategoria	INT CONSTRAINT FKCategoria FOREIGN KEY REFERENCES Categoria (CodCategoria)	
)

CREATE TABLE Cliente (
	CodCliente		INT IDENTITY CONSTRAINT PKCliente PRIMARY KEY,
	Nome			VARCHAR(100) NOT NULL,
	CPF				CHAR(11) NOT NULL CONSTRAINT UQCpf UNIQUE,
	Email			VARCHAR(100) NOT NULL CONSTRAINT UQEmail UNIQUE
)

CREATE TABLE Venda (
	CodVenda	INT IDENTITY CONSTRAINT PKVenda PRIMARY KEY,
	DataVenda	DATE NOT NULL,
	FormaPagto	VARCHAR(50) NOT NULL,
	CodCliente	INT CONSTRAINT FKCliente FOREIGN KEY REFERENCES Cliente (CodCliente)
)



CREATE TABLE Itens (
	CodItem		INT IDENTITY CONSTRAINT PKItens PRIMARY KEY,
	CodProduto	INT CONSTRAINT FKProduto FOREIGN KEY REFERENCES Produto (CodProduto) NOT NULL,
	CodVenda	INT CONSTRAINT FKVenda FOREIGN KEY REFERENCES Venda (CodVenda) NOT NULL,
	Quantidade	INT NOT NULL,
	Preco		MONEY NOT NULL
)


--Cadastro de Categorias
INSERT INTO Categoria VALUES 
('Eletrônicos'), 
('Limpeza'), 
('Higiene'),
('Doce'),
('Bebida'),
('Salgado'),
('Carnes')

SELECT * FROM Categoria

--Cadastro de Produtos
INSERT INTO Produto VALUES 
('Notebook DELL XPS',NULL,3500,5,'UN',1), 
('Coca-Cola 2L','2023-08-15',7.5,10,'UN',5),
('Sabonete Dove','2022-12-30',2.69,4,'CX',3), 
('Chocolate Bis','2022-10-10',4,10,'CX',4), 
('TV LG 50 polegadas',NULL,2700.50,2,'UN',1),
('Detergente Ipê','2021-12-12',1.99,20,'UN',2)

SELECT * FROM Produto

--Cadastro de Clientes
INSERT INTO Cliente VALUES
('Gustavo','12345678909','gustavo@gmail.com'),
('Gabriela','98765432100','gabrielao@gmail.com'),
('Nicolas','19283746567','nicolas@gmail.com'),
('Antônio Toninho','44556677889','toninho@gmail.com'),
('Lenita','90897867564','lenita@gmail.com')

SELECT * FROM Cliente

--Cadastro de Vendas / Itens

INSERT INTO Venda VALUES
('2022-09-07','À vista',1),
('2022-05-10','Cartão de Crédito',3),
('2022-01-22','Cartão de Débito',5),
('2021-10-10','Cartão de Débito',4)

INSERT INTO Itens VALUES
(2, 1, 2, 7.5),
(3, 1, 1, 2.69),
(2, 2, 2, 1.99),
(2, 2, 2, 7.5)

SELECT * FROM Venda
SELECT * FROM Itens


--- Exercícios VIEWS ---

1 - Crie uma VIEW com o nome vwClientes onde exiba apenas os clientes que não compraram nada
CREATE VIEW vwClientes
AS
SELECT * FROM Cliente right join Venda on Cliente.CodCliente = Venda.CodCliente where Venda.CodCliente is null

2 - Crie uma VIEW com o nome vwVendas onde exiba os atributos: DataVenda, Nome do Cliente e FormaPagto
CREATE VIEW vwClientes
AS
SELECT DataVenda, Nome, FormaPagto from Cliente join Venda on Cliente.CodCliente = Venda.CodCliente

3 - Altere a VIEW com o nome vwVendas para incluir na exibição o atributo CodVenda
ALTER VIEW vwClientes
AS
SELECT CodVenda, DataVenda, Nome, FormaPagto from Cliente join Venda on Cliente.CodCliente = Venda.CodCliente

4 - Crie uma VIEW com o nome vwProdutos onde exiba apenas os produtos com o preço acima de 100
create view vwProdutos
AS
SELECT * from Produto WHERE Preco > 100

5 - Faça um cadastro usando como base a VIEW vwProdutos
INSERT INTO vwProdutos (NomeProduto, DataValidade, Preco, Quantidade, Unidade,CodCategoria) 
VALUES ('Chocolate Oreo','2022-10-05',5,9,'CX',4)

6 - Adicione abaixo o comando para excluir a VIEW vwProdutos 

drop view vwProdutos

-- Exercícios TOP ---
1 - Faça uma consulta que retorne os três primeiros clientes ordenando alfabeticamente por nome

SELECT TOP 3 * from CLIENTE order by Nome asc

2 - Faça uma consulta que exiba os dados do produto mais caro

SELECT TOP 1 * from Produto order by Preco asc
3 - Faça uma consulta que exiba os 3 produtos que estão com o estoque mais baixo

SELECT TOP 3 * from Produto order by Quantidade desc

-- Exercícios Subconsulta

1 - Usando uma subconsulta, faça uma consulta dos produtos que sejam da categoria Eletrônicos
 SELECT * FROM Produto WHERE CodCategoria = 1

2 - Usando uma subconsulta, faça uma consulta dos produtos que tenham o preço acima da média
SELECT * FROM Produto WHERE Preco > (SELECT AVG(Preco) FROM Produto)
3 - Usando uma subconsulta, faça uma consulta que exiba apenas os clientes que fizeram compra.
SELECT * FROM Cliente WHERE CodCliente in (SELECT CodCliente from Venda)

