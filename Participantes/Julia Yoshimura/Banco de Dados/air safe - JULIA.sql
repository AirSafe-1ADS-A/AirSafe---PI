create database monitoramentoamoniag2;

use monitoramentoamoniag2;

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar (50),
contratacao date, 
localizacao char (9),
CNPJ char (14),
responsavel varchar(40),
email varchar(50),
telefone char (14)
);

desc empresa;

select * from empresa

create table sensor (
idSensor int primary key auto_increment,
nome varchar (50),
dtManutencao date,
responsavelManutencao varchar (50),
statusSensor varchar (40),
constraint chkStatus 
check (statusSensor in ('baixo','moderado','alto')));

desc sensor;

create table financas (
idFinancas int primary key auto_increment,
nome varchar (50),
despesas float,
redCusto varchar(4),
lucro varchar (4)
);

desc financas;

create table leitura (
idLeitura int primary key auto_increment,
statusLeitura varchar(20),
constraint chkstleitura
check (statusLeitura in ('ativo','inativo','em manutenção...')),
dia date,
ultAtualizacao date,
nivelMax varchar (4),
nivelMin varchar (4),
ppm int,
porcentagem int
);

desc leitura;

insert into empresa (nome, contratacao, localizacao, CNPJ, responsavel) values  
('TechNova Solutions', '2023-05-12', 'SP', '12345678000190', 'Mariana Silva'),  
('EcoGreen Ltda', '2021-08-19', 'RJ', '23456789000121', 'Carlos Mendes'),  
('SkyNet Systems', '2022-03-25', 'MG', '34567891000132', 'Joana Costa'),  
('FutureSoft Corp', '2020-11-04', 'PR', '45678912000143', 'Pedro Almeida'),  
('DataPrime Tech', '2024-02-15', 'BA', '56789123000154', 'Ana Beatriz'),  
('ByteForce Solutions', '2023-07-22', 'RS', '67891234000165', 'Lucas Pereira'),  
('BlueCore Innovations', '2021-05-10', 'SC', '78912345000176', 'Fernanda Rocha'),  
('CodeWave Software', '2022-12-01', 'PE', '89123456000187', 'Ricardo Oliveira');

-- comandos empresa:

select * from empresa;
select nome from empresa where idEmpresa = 6;
select localizacao,CNPJ,email from empresa where idEmpresa = 7;
select telefone, CNPJ, localizacao, nome from empresa where nome like '%s';
select * from empresa where idEmpresa = 6 order by contratacao desc;
select * from empresa order by contratacao desc;

update empresa set contratacao = '2024-07-05' where idEmpresa = 7;
select * from empresa where idEmpresa = 7;
update empresa set responsavel = 'Juliana Lima' where idEmpresa = 8;
select responsavel from empresa where idEmpresa = 8;

alter table empresa rename column responsavel to nomeResponsavel;
desc empresa;
alter table empresa rename column contratacao to dtContratacao;
alter table empresa modify column dtContratacao datetime;
desc empresa;

insert into sensor (nome, dtManutencao, responsavelManutencao, statusSensor) values  
('Sensor 1', '2024-01-15', 'Carlos Almeida', 'moderado'),  
('Sensor 2', '2023-12-10', 'Ana Beatriz', 'baixo'),  
('Sensor 3', '2024-02-20', 'Rafael Souza', 'alto'),  
('Sensor 4', '2024-03-05', 'Fernanda Lopes', 'moderado'),  
('Sensor 5', '2024-01-30', 'Marcos Silva', 'alto'),  
('Sensor 6', '2023-11-22', 'Lucas Pereira', 'baixo'),  
('Sensor 7', '2024-02-01', 'Juliana Costa', 'moderado'),  
('Sensor 8', '2023-12-18', 'Roberto Lima', 'baixo');
select * from sensor;

-- comandos sensor:

select nome from sensor where dtManutencao like '%18';
select * from sensor where idSensor = 5;
select dtManutencao from sensor;
select statusSensor from sensor where dtManutencao like '2024%';
select responsavelManutencao from sensor where nome like 's%';
select responsaManutencao from sensor where nome like '_e%';
select dtManutencao from sensor order by responsaManutencao desc;
select * from sensor where responsaManutencao like '%a%';

update sensor set dtManutencao = '2023-09-09' where idSensor = 10;
update sensor set responsaManutencao = 'Juliana Lima' where idSensor = 9;
update sensor set dtManutencao = '2024-06-12' where idSensor = 6;
alter table sensor rename column responsavelManutencao to responsaManutencao;
alter table sensor modify column responsaManutencao varchar(70);
alter table sensor drop column statusSensor;
alter table sensor rename column nome to nomeSensor;
delete from sensor where idSensor = 8;
delete from sensor where idSensor = 4;
update sensor set responsaManutencao = 'Caroline Camargo' where idSensor = 3;
delete from sensor where idSensor = 3;
select * from sensor;
desc sensor;


insert into financas (nome, despesas, redCusto, lucro) values 
('TechNova Solutions', 15000.50, 'sim', 'não'),  
('EcoGreen Ltda', 9800.75, 'não', 'sim'),  
('SkyNet Systems', 25000.00, 'sim', 'sim'),  
('FutureSoft Corp', 18300.20, 'não', 'não'),  
('DataPrime Tech', 11200.80, 'sim', 'sim'),  
('ByteForce Solutions', 17450.60, 'não', 'não'),  
('BlueCore Innovations', 21500.40, 'sim', 'sim'),  
('CodeWave Software', 9400.30, 'sim', 'não');
 select * from financas;
 
  -- comandos financas:
 select * from financas;
 select * from financas where idFinancas = 8;
 select redCusto as 'Redução de custos'  from financas where idFinancas = 7;
 select nome from financas order by despesas desc;
 update financas set nome = 'TechnologyNova Solutions' where idFinancas = 1;
 select * from financas;

 select lucro, case
	when lucro = 'sim' then 'Obteve lucro'
		else 'Não obteve lucro'
			end as 'Margem de lucro'
            from financas;
            
alter table financas rename column lucro to margLucro;
desc financas;

update financas set despesas = '11201.00' where idFinancas = 5;

select * from financas where nome like '%o_';
select * from financas where nome like '%o';
select * from financas where nome like 's%';

select concat 
	(nome, ', foi estimado que obteve despesas de R$', despesas) 
		as frase from financas;
        
 insert into leitura (statusLeitura, dia, ultAtualizacao, nivelMax, nivelMin, ppm, porcentagem) values  
('ativo', '2024-03-01', '2024-03-10', 'sim', 'não', 0.001, 0),  
('inativo', '2024-02-15', '2024-02-28', 'não', 'sim', 0.002, 0),  
('em manutenção...', '2024-03-05', '2024-03-07', 'não', 'não', 0, 0),  
('ativo', '2024-03-02', '2024-03-09', 'sim', 'não', 0.00015, 0.015),  
('inativo', '2024-02-20', '2024-03-01', 'não', 'sim', 0.00014, 0.014),  
('ativo', '2024-03-04', '2024-03-10', 'sim', 'não', 0.0006, 0.06 ),  
('em manutenção...', '2024-02-28', '2024-03-05', 'não', 'não', 0, 0),  
('ativo', '2024-03-03', '2024-03-10', 'sim', 'não', 0.0003, 0.03 ),  
('inativo', '2024-02-18', '2024-02-27', 'não', 'sim', 0.0005, 0.05 ),  
('ativo', '2024-03-06', '2024-03-10', 'sim', 'não', 0.00045, 0.045);  

-- comandor leitura
alter table leitura rename column dia to diaLeitura;
alter table leitura modify column statusLeitura varchar (45);
select * from leitura;
select * from leitura order by ppm desc;
select diaLeitura from leitura where idLeitura = 9;
select statusLeitura from leitura where idLeitura = 5;
select * from leitura order by diaLeitura desc;

update leitura set diaLeitura = '2023-06-30' where idLeitura = 8;
update leitura set statusLeitura = 'em manutenção...' where idLeitura = 7;
update leitura set ppm = 0.0003 where idLeitura = 4;
update leitura set porcentagem = 0.03 where idLeitura = 4;
delete nivelMin from leitura where idLeitura = 8;
select statusleitura as 'Status da Leitura' from leitura;
select ultAtualizacao as 'Último dia de atualização da leitura' from leitura;
alter table leitura drop column nivelMax;
desc leitura;
alter table leitura drop column nivelMin;
desc leitura;

alter table leitura drop column diaLeitura;
select * from leitura;
desc leitura;






 
 



  









