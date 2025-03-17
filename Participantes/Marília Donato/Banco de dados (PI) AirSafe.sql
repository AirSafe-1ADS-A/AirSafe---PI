create database Airsafe;
use Airsafe;

create table Empresa(
idEmpresa int primary key auto_increment,
nomeEmp varchar(40) not null,
nomeResp varchar(40) not null,
cnpj char(14) not null unique,
email varchar(40) not null unique,
cep char(9) not null,
contratação datetime default current_timestamp,
telefone char (11)
);

create table Sensor (
idSensor int primary key auto_increment,
empresa varchar(40) not null,
dtInstalacao datetime default current_timestamp,
statusMq2 varchar(20) not null,
constraint chkStt 
	check(statusMq2 in ('ativo', 'inativo', 'manutenção'))
);


create table Financas (
idFinacas int primary key auto_increment,
empresa varchar(40) not null,
despesas float,
reducaoCts float,
lucro float
);


create table Leitura (
idLeitura int primary key auto_increment,
dia datetime default current_timestamp,
atualizacao datetime default current_timestamp,
ppm float,
porcentagem float,
nivel varchar(30),
setor varchar(40),
constraint chkNv
	check(nivel in ('baixo', 'médio', 'alto'))
);


create table Manutencao (
idManutencao int primary key auto_increment,
nomeResp varchar(40) not null,
dia datetime default current_timestamp,
setor varchar(40)
);
