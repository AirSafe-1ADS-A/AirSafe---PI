CREATE DATABASE Airsafe;
USE Airsafe;

CREATE TABLE empresa(
idEmpresa int PRIMARY KEY auto_increment,
nome VARCHAR(50),
dtcontratacao DATE,
cep CHAR(9),
responsavel VARCHAR(50),
CNPJ CHAR(18),
email VARCHAR(30)
);

INSERT INTO empresa (nome, dtcontratacao, cep, responsavel, CNPJ, email) VALUES
('Alimentoz', '2023-08-30', '18117-190', 'Carlos Abreu', '13.839.347/0001-74', 'alimentoz@gmail.com'),
('Mafrius', '2024-04-16', '04194-355', 'Leila de Andrade', '49.927.232/0001-89', 'mafrius@gmail.com'),
('Frigor', '2024-10-02', '18132-820', 'Thacianne Costa', '94.280.874/0001-93', 'frigor@gmail.com'),
('PontoRefriz', '2025-01-31', '08591-659', 'Roberto Aguiar', '58.200.748/0001-18', 'pontorefriz@gmail.com'),
('Polar', '2023-12-04', '13232-110', 'Antonio J. Gomes', '34.038.930/0001-56', 'polar@gmail.com');

SELECT * FROM empresa;
SELECT * FROM empresa WHERE responsavel LIKE '%o %';
SELECT * FROM empresa WHERE email LIKE 'p%';
SELECT * FROM empresa WHERE dtcontratacao < '2024-06-01';
UPDATE empresa SET dtcontratacao = '2025-02-14' WHERE idEmpresa = 4;
UPDATE empresa SET email = 'frigor123@gmail.com' WHERE idEmpresa = 3;
UPDATE empresa SET CNPJ = '34.167.232/0001-50' WHERE idEmpresa = 1;
DELETE FROM empresa WHERE idEmpresa = 2;
DELETE FROM empresa WHERE idEmpresa = 4;
DELETE FROM empresa WHERE idEmpresa = 5;
SELECT * FROM empresa;

CREATE TABLE sensor(
idSensor int PRIMARY KEY auto_increment,
empresa VARCHAR(30),
dtmanutencao DATE,
responsavel VARCHAR(50),
statusSensor VARCHAR(20),
	constraint chkstatus check(statusSensor in ('baixo', 'moderado', 'alto'))
);

INSERT INTO sensor(empresa, dtmanutencao, responsavel, statusSensor) VALUES
('Alimentoz', '2023-09-03', 'Igor Augusto de Freitas', 'baixo'),
('Mafrius', '2024-04-26', 'Thais Amaral Campos', 'moderado'),
('Frigor', '2024-10-12', 'José Aparecido Soares', 'moderado'),
('PontoRefriz', '2025-02-26', 'Gabriel Bertinelli dos Santos', 'alto'),
('Polar', '2023-12-15', 'Ingrid Lopez Leite', 'baixo');

SELECT * FROM sensor;
SELECT * FROM sensor WHERE responsavel LIKE 'I%';
SELECT * FROM sensor WHERE statusSensor = 'moderado';
SELECT * FROM sensor WHERE dtmanutencao > '2024-06-01';
UPDATE sensor SET dtmanutencao = '2024-07-09' WHERE idSensor = 2;
UPDATE sensor SET empresa = 'PolarBearz' WHERE idSensor = 5;
UPDATE sensor SET statusSensor = 'alto' WHERE idSensor = 5;
DELETE FROM sensor WHERE idSensor = 2;
DELETE FROM sensor WHERE idSensor = 4;
DELETE FROM sensor WHERE idSensor = 1;
SELECT * FROM sensor;

CREATE TABLE financas(
idFinancas int PRIMARY KEY auto_increment,
empresa VARCHAR(30),
despesas DOUBLE,
reducaoCusto DOUBLE,
lucro DOUBLE
);

INSERT INTO financas (empresa, despesas, reducaoCusto, lucro) VALUES
('Alimentoz', '200000.00', '500000.00', '300000.00'),
('Mafrius', '190000.00', '460000.00', '270000.00'),
('Frigor', '550000.00', '900000.00', '780000.00'),
('PontoRefriz', '340000.00', '600000.00', '450000.00'),
('Polar', '280000.00', '520000.00', '300000.00');

SELECT * FROM financas;
SELECT * FROM financas WHERE empresa LIKE '%o_';
SELECT * FROM financas WHERE lucro >= 450000;
SELECT * FROM financas WHERE reducaoCusto < 550000;
UPDATE financas SET empresa = 'RefriPontoz' WHERE idFinancas = 3;
UPDATE financas SET despesas = 340000 WHERE idFinancas = 5;
UPDATE financas SET lucro = 380000 WHERE idFinancas = 2;
DELETE FROM financas WHERE idFinancas = 1;
DELETE FROM financas WHERE idFinancas = 4;
DELETE FROM financas WHERE idFinancas = 3;
SELECT * FROM financas;

CREATE TABLE leitura(
idLeitura int PRIMARY KEY auto_increment,
dia DATE,
ultAtalizacao DATETIME DEFAULT current_timestamp,
ppm DOUBLE,
porcentagem FLOAT,
statusAmbiente VARCHAR (15),
	constraint chkstatus check(statusAmbiente in ('seguro', 'perigo'))
);

INSERT INTO leitura(dia, ppm, porcentagem, statusAmbiente) VALUES
('2025-02-26', 20, 0.002, 'seguro'),
('2025-02-26', 12, 0.0012, 'seguro'),
('2025-02-26', 9, 0.0009, 'seguro'),
('2025-02-26', 47, 0.0047, 'perigo'),
('2025-02-26', 5, 0.0005, 'seguro');

SELECT * FROM leitura;
SELECT * FROM leitura WHERE statusAmbiente = 'seguro';
SELECT * FROM leitura WHERE ppm > 10;
UPDATE leitura SET ppm = 17 WHERE idLeitura = 4;
UPDATE leitura SET porcentagem = 0.0017 WHERE idLeitura = 4;
UPDATE leitura SET statusAmbiente = 'seguro' WHERE idLeitura = 4;
DELETE FROM leitura WHERE idLeitura = 2;
DELETE FROM leitura WHERE idLeitura = 5;
DELETE FROM leitura WHERE idLeitura = 1;
SELECT * FROM leitura;