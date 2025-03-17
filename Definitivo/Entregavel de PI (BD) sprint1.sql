-- grupo 6 "AirSafe"
-- nome: Marilia Donato, Julia Yoshimura, Thalita Moraes, Luiz Cesar, Nicolly Ribeiro, Kauany Silva, Willian Martins, Otavio Rodrigues, Leonardo Marinho, Paulo Junior

create database Airsafe;
use Airsafe;

create table Empresa(
idEmpresa int primary key auto_increment,
nomeEmp varchar(50) not null,
nomeResp varchar(50) not null,
cnpj char(14) not null unique,
email varchar(50) not null unique,
cep char(9) not null,
endereco varchar(250),
contratacao datetime default current_timestamp,
telefone char (11)
);

INSERT INTO Empresa (nomeEmp, nomeResp, cnpj, email, cep, endereco, telefone) VALUES 
('TechGas','Carlos Silva', '47120915000102', 'contato@techgas.com', '01000-000', 'Rua Estrela, Bairro Colônia, Vila Joanna, 167', '11987654321'),
('Runer', 'Ana Souza',  '33456789000105', 'contato@runer.com', '02000-111','Rua Lua, Bairro Centro, Vila Clotilde, 320',  '21976543210'),
('AirProtect','João Mendes', '22333444000110', 'contato@airprotect.com', '03000-222', 'Rua Sol, Bairro Alameda, Vila Europa, 1006', '31998876543'),
('OxiGuard', 'Mariana Castro' , '11222333000120', 'contato@oxiguard.com', '04000-333', 'Rua Mar, Bairro Ondinhas, Vila Eucaliptos, 765', '41999991234');

SELECT * FROM Empresa;


create table Sensor (
idSensor int primary key auto_increment,
nomeEmp varchar(50) not null,
dtInstalacao datetime default current_timestamp,
areaSensor INT,
statusMq2 varchar(20) not null,
constraint chkStt 
	check(statusMq2 in ('ativo', 'inativo', 'manutenção')),
constraint chkArea 
	check(areaSensor in (50, 75, 100))

);

INSERT INTO Sensor (nomeEmp, areaSensor, statusMq2) VALUES
('TechGas', 50.00, 'ativo'),
('Runer', 75.00, 'manutenção'),
('AirProtect', 100.00, 'inativo'),
('OxiGuard', 50.00, 'ativo');

SELECT * FROM Sensor;

create table Leitura (
idLeitura int primary key auto_increment,
dataHora datetime default current_timestamp,
nomeEmp varchar(50),
porcentagem float,
statusAmbiente varchar(15),
constraint chkNv
	check(statusAmbiente in ('seguro', 'perigoso', 'risco'))
);

INSERT INTO Leitura (nomeEmp, porcentagem, statusAmbiente) VALUES
	('TechGas', 0 ,'seguro'),
    ('Runer', '0.95', 'perigoso'),
	('AirProtect', 0.1 ,  'risco'),
    ('OxiGuard',0.45 ,  'perigoso');
    
    SELECT * FROM Leitura;
    
create table Manutencao (
idManutencao int primary key auto_increment,
numSerie char(3),
nomeEmp varchar(50),
nomeResp varchar(40) not null,
dataHora datetime default current_timestamp
);

INSERT INTO Manutencao (numSerie, nomeEmp, nomeResp) VALUES
	('001', 'TechGas' ,'Carlos Silva'),
    ('013', 'Runer', 'Ana Souza'),
	('022', 'AirProtect' , 'João Mendes'),
    ('090', 'OxiGuard' ,  'Mariana Castro');
    
    SELECT * FROM Manutencao;