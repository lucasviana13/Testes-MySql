drop database companhia;
create database  if not exists  Companhia;
use Companhia; 
CREATE TABLE if not exists FUNCIONARIO
(
PNome varchar (15) NOT NUll,
CPF char (11) NOT NUll,
DataNasc Char (10),
Logra varchar (30),
Sexo char (1),
Salario decimal(10,2),
CPF_Supervisor char (11), -- check(Sexo in ('M' or 'F')) não estava funcionando aqui
Dnr int,
primary key (CPF)
);
insert into FUNCIONARIO value ('João','12345678966','09-01-1965','rua das flores','M', 30000.00,'33344555587', 5), 
 ('Fernando','33344555587','08-12-1965','rua da lapa','M', 40000.00,'8886555576', 5),
 ('Joice','45345345376','31-07-1972','av Lucas Obes','F', 25000,'33344555587', 5),
 ('Ronaldo','66688444476','15-09-1962','rua rebouças','M', 38000.00,'33344555587', 5),
 ('Jorge','8886555576','10-11-1937','rua do hirto','M', 55000.00,'33344555587', 1),
 ('Jennifer','98765432168','20-06-1941','Av. arthur de lima','F', 43000.00,'8886555576', 4),
 ('André','98798798733','29-03-1969','rua timbira','M', 25000.00,'9876432168', 4),
 ('Alice','99988777707','19-01-1968','rua Souza lima','F', 25000.00,'9876432168', 4);
select * from Funcionario;

CREATE TABLE if not exists DEPARTAMENTO( 
DNome varchar(15) NOT NUll,
DNumero int NOT NULL check(DNumero<21),
CPF_Gerente char (11) NOT NUll,
Data_Inicio_gerente char(10), 
PRIMARY KEY (DNumero),
UNIQUE (DNome),
foreign key (CPF_Gerente) references FUNCIONARIO (CPF)
);

insert into Departamento value ('Matriz','1','8886555576','21-06-1981');
insert into Departamento value ('Administração','4','98765432168','01-01-1995');
insert into Departamento value ('Pesquisa','5','33344555587','21-06-1988');
select * from Departamento;

CREATE TABLE if not exists LOCALIZACAO_DEP( 
DNumero int NOT NULL,
DLocal varchar (15) NOT NUll,
PRIMARY KEY (DNumero, DLocal),
foreign key (DNumero) references DEPARTAMENTO (DNumero)
);
insert into LOCALIZACAO_DEP value ('1','São Paulo');
insert into LOCALIZACAO_DEP value ('4','Mauá');
insert into LOCALIZACAO_DEP value ('5','Itu');
insert into LOCALIZACAO_DEP value ('5','Santo André');
insert into LOCALIZACAO_DEP value ('5','São Paulo');
select * from LOCALIZACAO_DEP;

CREATE TABLE if not exists PROJETO( 
ProjNome varchar(15) NOT NUll,
ProjNumero int NOT NULL,
ProjLocal varchar (15),
DNum int NOT NULL,
PRIMARY KEY (ProjNumero),
UNIQUE (ProjNome),
foreign key (DNum) references DEPARTAMENTO (DNumero)
);

insert into PROJETO value ('Produtox','1','Santo André', 5);
insert into PROJETO value ('Produtoy','2','Itu', 5);
insert into PROJETO value ('Produtoz','3','São Paulo', 5);
insert into PROJETO value ('Informatização','10','Mauá', 4);
insert into PROJETO value ('Reorganização','20','São Paulo', 1);
insert into PROJETO value ('NovosBeneficios','30','Mauá', 4);
select * from PROJETO;


CREATE TABLE if not exists TRABALHA_EM( 
FCPF char (11) NOT NUll,
PNR int NOT NUll,
Horas decimal (3,1) NOT NUll,
Numero int,
PRIMARY KEY (FCPF, PNR),
foreign key (FCPF) references FUNCIONARIO (CPF),
foreign key (PNR) references PROJETO (ProjNumero)
);

insert into TRABALHA_EM value ('12345678966',1,32.5, 0);
insert into TRABALHA_EM value ('12345678966',2,7.5, 0);
insert into TRABALHA_EM value ('33344555587',2,10.0, 0);
insert into TRABALHA_EM value ('33344555587',3,10.0, 0);
insert into TRABALHA_EM value ('33344555587',10,10.0, 0);
insert into TRABALHA_EM value ('33344555587',20,10.0, 0);
insert into TRABALHA_EM value ('45345345376',1,20.0, 0);
insert into TRABALHA_EM value ('45345345376',2,20.0, 0);
insert into TRABALHA_EM value ('66688444476',3,40.0, 0);
insert into TRABALHA_EM value ('98765432168',20,0.0, 0);
insert into TRABALHA_EM value ('98765432168',30,20.0, 0);
insert into TRABALHA_EM value ('98798798733',10,35.0, 0);
insert into TRABALHA_EM value ('98798798733',30,5.0, 0);
insert into TRABALHA_EM value ('99988777707',10,10.0, 0);
insert into TRABALHA_EM value ('99988777707',30,30.0, 0);
select * from TRABALHA_EM;

CREATE TABLE if not exists DEPENDENTE( 
FCPF char (11) NOT NUll,
Nome_Dependente varchar (15) NOT NUll,
Sexo char,
DataNasc char (10),
Parentesco varchar (8),
PRIMARY KEY (FCPF, Nome_Dependente),
foreign key (FCPF) references FUNCIONARIO (CPF)
);

insert into DEPENDENTE value ('12345678966','Alicia','F','30-12-1988','filha');
insert into DEPENDENTE value ('12345678966','Elizabeth','F','05-05-1967','esposa');
insert into DEPENDENTE value ('12345678966','Michael','M','04-01-1988','filho');
insert into DEPENDENTE value ('33344555587','Alicia','F','05-04-1986','filha');
insert into DEPENDENTE value ('33344555587','Janaina','F','03-06-1958','esposa');
insert into DEPENDENTE value ('33344555587','Tiago','M','25-10-1983','filho');
insert into DEPENDENTE value ('98765432168','Antônio','M','28-02-1942','Marido');
select * from DEPENDENTE;

show tables;