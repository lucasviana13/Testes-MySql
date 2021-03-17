drop database Venda;
create database  if not exists  Venda;
use Venda; 
CREATE TABLE if not exists Cliente
(
id int auto_increment,
nome varchar(50) NOT NULL,
endereco varchar(50) NOT NULL,
telefone varchar(20) NOT NULL,
email varchar(50) unique NOT NULL,
primary key (id)
);
desc Cliente;

CREATE TABLE if not exists Compra( 
id_compra int auto_increment,
datas date NOT NULL,
quantidade int NOT NULL,
parcelas int NOT NULL,
cliente_id int NOT NULL, 
foreign key (cliente_id) references Cliente(id),
primary key (id_compra)
);
desc Compra;

CREATE TABLE if not exists Produto(
id_produto int auto_increment,
descricao varchar(50) NOT NULL,
marca varchar(50) NOT NULL,
preco double NOT NULL,
primary key (id_produto)
);
desc Produto;

CREATE TABLE if not exists Compra_Produto( 
compra int,
produto int,
foreign key (compra) references Compra(id_compra),
foreign key (produto) references Produto(id_produto)
);
desc Compra_Produto;

show tables;