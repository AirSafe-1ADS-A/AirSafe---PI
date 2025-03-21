
USE airsafe;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(50),
Responsavel VARCHAR(40),
qtdFuncionarios INT,
Porte VARCHAR(15),
SetorSensor VARCHAR(20));

INSERT INTO empresa VALUES (
default, 'Empresa Um', 'Claudio', 1000, 'Médio', 4),
(default, 'Cachorro Empresa', 'Dimitri', 200, 'Pequeno', 2),
(default, 'BK', 'Jorge', 4500, 'Grande', 120);

SELECT Nome, Responsavel, Porte FROM empresa;
SELECT * FROM empresa;

UPDATE empresa SET Responsavel = 'Batman' WHERE idEmpresa = 1;
SELECT * FROM empresa;

DELETE FROM empresa WHERE idEmpresa = 2;
SELECT * FROM empresa;



CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
Informacoes VARCHAR(50),
HoraInicio DATETIME,
UltimaManutencao DATETIME,
DepositoGas VARCHAR(30));

INSERT INTO sensor VALUES (
default, 'Sensor novo para empresa de porte pequeno', '2025-01-01 23:00:00', '2025-04-08', 'Setor Frigorífico'),
(default, 'Sensor para empresa de porte médio', '2024-04-09 12:20:00', '2025-12-12','Setor 2'),
(default, 'Sensor para empresa de porte grande', '2025-05-11 10:00:00', '2025-06-03', 'Setor Amarelo');

SELECT * FROM sensor;
SELECT idSensor, HoraInicio FROM sensor;

UPDATE sensor SET DepositoGas = 'Setor Verde' WHERE idSensor = 2;

DELETE FROM sensor WHERE idSensor = 1;

CREATE TABLE alerta (
idAlerta INT PRIMARY KEY AUTO_INCREMENT,
TipoAlerta VARCHAR(15),
Descrição VARCHAR(80),
Acao VARCHAR(40),
Responsavel VARCHAR(40));

INSERT INTO alerta VALUES (
default, 'Grave', 'Alerta grave, 30 ppm', 'Paralização imediata do setor', 'Cleber'),
(default, 'Risco', 'Alerta de risco, recomenda-se retirada dos funcionários', '24 horas de manutenção', 'Claudia'),
(default, 'Observação', 'Alerta de observação do sensor', 'Alerta no setor princial da empresa', 'Bob');

SELECT * FROM alerta;

UPDATE alerta SET TipoAlerta = 'Risco' WHERE idAlerta = 1;

DELETE FROM alerta WHERE idAlerta = 3;
