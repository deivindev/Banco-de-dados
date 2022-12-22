drop database bdgestaovendas
create database bdgestaovendas

use bdgestaovendas


CREATE TABLE Cliente(
    CodCliente INT identity constraint PK_cliente PRIMARY KEY,
      Nome VARCHAR(60) NOT NULL,
      Cpf CHAR(11) NOT NULL,
      Email VARCHAR(100) NOT NULL
)



CREATE TABLE Venda(
    CodVenda INT identity constraint PK_venda PRIMARY KEY,
      DataVenda DATE NOT NULL,
      FormaPagto VARCHAR(20) NOT NULL,
      CodCliente INT FOREIGN KEY REFERENCES CLIENTE(codcliente)
)



CREATE TABLE Categoria(
    CodCategoria INT identity constraint PK_categoria PRIMARY KEY,
      NomeCategoria VARCHAR(20) NOT NULL
)



CREATE TABLE Produto(
     CodProduto INT identity constraint PK_produto PRIMARY KEY,
      NomeProduto VARCHAR(30) NOT NULL,
      DataValidade DATE NOT NULL,
      Preco MONEY NOT NULL,
      QuantidadeEstoque INT NOT NULL,
      UnidadeMedida VARCHAR(20) NOT NULL,
      CodCategoria INT FOREIGN KEY REFERENCES CATEGORIA(codcategoria)
)



CREATE TABLE Itens(
    CodItem INT identity constraint PK_itens PRIMARY KEY,
      CodProduto INT FOREIGN KEY REFERENCES PRODUTO(codproduto),
      CodVenda INT FOREIGN KEY REFERENCES VENDA(codvenda),
      Quantidade INT NOT NULL,
      Preco MONEY NOT NULL
)




insert into Categoria(NomeCategoria)
values('Produtos de limpeza')

insert into Categoria(NomeCategoria)
values('Padaria')

insert into Categoria(NomeCategoria)
values('Doces')

insert into Categoria(NomeCategoria)
values('Salgadinhos')

SELECT * FROM Categoria


insert into Produto(NomeProduto, DataValidade,Preco,QuantidadeEstoque, UnidadeMedida , CodCategoria)
values('Fandangos', '20-09-2023', '3.50', '1000' ,'CX', '4')

insert into Produto(NomeProduto, DataValidade,Preco,QuantidadeEstoque, UnidadeMedida , CodCategoria)
values('Bolo', '20-12-2022', '10.00', '100' ,'KG', '3')

insert into Produto(NomeProduto, DataValidade,Preco,QuantidadeEstoque, UnidadeMedida , CodCategoria)
values('Mortadela', '20-12-2024', '12.00', '1000' ,'KG', '2')

insert into Produto(NomeProduto, DataValidade,Preco,QuantidadeEstoque, UnidadeMedida , CodCategoria)
values('Presunto', '20-12-2024', '12.00', '1000' ,'KG', '2')

insert into Produto(NomeProduto, DataValidade,Preco,QuantidadeEstoque, UnidadeMedida , CodCategoria)
values('Detergente Ypê', '10-02-2025', '5.00', '1500' ,'CX', '1')

insert into Cliente (nome, Cpf, Email)
values('Victor', '23498203948', 'vinhodograu@gmail.com')

insert into Cliente (nome, Cpf, Email)
values('David', '23498203374', 'bhelder@gmail.com')

insert into Cliente (nome, Cpf, Email)
values('Rai', '23498203089', 'rai@gmail.com')

insert into Cliente (nome, Cpf, Email)
values('Roberto', '23409803374', 'roro@gmail.com')

SELECT * FROM Itens

insert into Venda(DataVenda, FormaPagto, CodCliente)
values('21-06-2022', 'Crédito', '3')


insert into Venda(DataVenda, FormaPagto, CodCliente)
values('24-06-2022', 'Débito', '2')


insert into Itens(CodProduto, CodVenda, Quantidade,Preco)
values('4', '2', '2', '24.00')

insert into Itens(CodProduto, CodVenda, Quantidade,Preco)
values('1', '1', '3', '10.50')



 Select CodVenda, Nome, DataVenda,FormaPagto  from  Cliente join Venda ON Cliente.CodCliente = Venda.CodCliente

 Faça uma consulta que retorne as seguintes informações:
 Data da Venda, Nome do Produto e a Quantidade que foi vendida

 select DataVenda, NomeProduto ,Quantidade from Itens join Produto on Itens.CodProduto = Produto.CodProduto join Venda on Itens.CodVenda = Venda.CodVenda

 Faça uma consulta que retorno as seguintes informações:
 Código da Venda, Nome do Cliente, Data da Venda e Nome do Produto


 select Venda.CodVenda, Nome ,DataVenda, NomeProduto from Venda join Cliente on Venda.CodCliente = Cliente.CodCliente join Itens on Itens.CodVenda = Venda.CodVenda join Produto on Produto.CodProduto = Itens.CodProduto


 Faça uma consulta que exiba o nome dos produtos e a quantidade em estoque. 
 Exibir apenas os produtos que não foram vendidos.

 select NomeProduto, QuantidadeEstoque from Produto left join Itens on Produto.CodProduto = Itens.CodProduto join Venda on Venda.CodVenda = Itens.CodVenda

 Faça uma consulta que exiba o nome do cliente e a quantidade de vendas registradas para ele.

 select nome, quantidade from Cliente join Venda on Cliente.CodCliente = Venda.CodCliente join Itens on Venda.CodVenda = Itens.CodVenda


 6 - Faça uma consulta na tabela itens, onde exiba o nome do produto e o subtotal daquele item.



Select NomeProduto, (itens.Quantidade * itens.Preco) FROM Produto join Itens on Produto.CodProduto = itens.CodProduto


7 - Faça uma consulta que exiba o nome dos clientes que não fizeram nenhuma compra

Select Nome, CodVenda From Cliente left join venda on Cliente.CodCliente = venda.CodCliente WHERE Venda.CodVenda is null