drop database Supermercado;
create database  if not exists  Supermercado;
use Supermercado;

CREATE TABLE if not exists Cliente
(
Nome varchar (15) NOT NUll,
Telefone varchar (12) NOT NULL,
email varchar (30) NOT NULL,
CPF char (11) NOT NULL,
primary key (CPF)
); 

insert into Cliente values ('Luan', '98812-3465', 'luan@mail.com', '11122233345'),
						   ('Maria', '99214-5675', 'maria@mail.com', '01243568721'),
                           ('Ana', '92344-5467', 'ana@mail.com', '07654412341');


CREATE TABLE if not exists Produto
(
Pnome varchar (20) NOT NULL,
minimo int NOT NULL,
maximo int NOT NULL,
descricao varchar (45) NOT NULL,
Codigo char (6) NOT NULL,
primary key (Codigo)
);
insert into Produto values ('Abacaxi', 1, 3, 'Abacaxi grande e maduro', '123456'),
						   ('Banana', 2, 15, 'Banana prata madura', '112233'),
                           ('Biscoito', 5, 20, 'Biscoito recheado sabor chocolate', '987654');
                           
CREATE TABLE if not exists Compra
(
quantidade int NOT NULL,
Pcodigo char (6) NOT NULL,
CCPF char (11) NOT NULL,
foreign key (CCPF) references Cliente (CPF),
foreign key (Pcodigo) references Produto (Codigo)
);

insert into Compra values (2, '123456', '01243568721'),
						   (10, '987654', '11122233345'),
                           (12, '112233', '07654412341');


select nome from cliente;
select Pnome from Produto;
select * from Cliente;
select * from Produto;
select * from Compra;
select Pnome from Produto, Compra where codigo=pcodigo and quantidade>0;
select Pnome from Produto, Compra where codigo=pcodigo and quantidade>2;


select distinct C.nome as Nome_Cliente, S.Quantidade as Quantidade_comprada, P.Pnome as Nome_Produto --  Distinct -Elimina a repetição se tiver
   from cliente as C inner Join compra as S -- Inner opcional
   on C.CPF = S.CCPF -- Faz a junção de Tabelas
   join Produto as p
   on P.Codigo=S.Pcodigo; 
   
/* right Outer Join - pega tudo da tabela da direita, independente se é interseção ou não
   left outer join - pega tudo da tabela da esquerda, independente se é interseção ou não
   OBS: Outer é opcional
*/
 