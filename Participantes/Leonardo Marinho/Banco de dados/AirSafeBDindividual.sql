CREATE DATABASE AirSafeInd;

USE AirSafeInd;

CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) UNIQUE,
    email VARCHAR (40) UNIQUE,
    telefone VARCHAR(14), -- (00) 00000-0000
    nomeResp VARCHAR(30),
    contratação DATETIME DEFAULT current_timestamp,
    localização CHAR(9), -- 00000-000
	CNPJ CHAR(18) UNIQUE -- 47.120.915/0001-02
);

INSERT INTO Empresa (nome, email, telefone, nomeResp, localização, CNPJ)
VALUES 
('TechGas', 'contato@techgas.com', '(11)98765-4321', 'Carlos Silva', '01000-000', '47.120.915/0001-02'),
('SafeAir', 'contato@safeair.com', '(21)97654-3210', 'Ana Souza', '02000-111', '33.456.789/0001-05'),
('AirProtect', 'contato@airprotect.com', '(31)99887-6543', 'João Mendes', '03000-222', '22.333.444/0001-10'),
('OxiGuard', 'contato@oxiguard.com', '(41)99999-1234', 'Mariana Castro', '04000-333', '11.222.333/0001-20');

SHOW COLUMNS FROM Empresa;
-- OU
DESC Empresa;
SELECT * FROM Empresa;
SELECT nome FROM Empresa WHERE nome LIKE "%x%";
SELECT nomeResp FROM Empresa ORDER BY nomeResp ASC;
UPDATE Empresa SET nomeResp = "Clotilde Souza" WHERE idEmpresa = 2;
UPDATE Empresa SET localização = "05000-000" WHERE idEmpresa = 4;
UPDATE Empresa SET telefone = "(13)98767-4321" WHERE idEmpresa = 1;
ALTER TABLE Empresa ADD COLUMN tamanhoEmp VARCHAR (10);
ALTER TABLE Empresa ADD CONSTRAINT chkTamanho CHECK (tamanhoEmp in ('Grande', 'Pequena'));
UPDATE Empresa SET tamanhoEmp = "Grande" WHERE idEmpresa = 1;
UPDATE Empresa SET tamanhoEmp = "Pequena" WHERE idEmpresa = 2;
UPDATE Empresa SET tamanhoEmp = "Grande" WHERE idEmpresa = 3;
UPDATE Empresa SET tamanhoEmp = "Pequena" WHERE idEmpresa = 4;
SELECT nome, tamanhoEmp FROM Empresa;
ALTER TABLE Empresa DROP COLUMN tamanhoEmp;
SELECT * FROM Empresa;
DELETE FROM Empresa WHERE idEmpresa = 3;
SELECT * FROM Empresa;
TRUNCATE Empresa;
-- ---------------------------------------------------------------------------------------------------------------------

CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
dtManutencao DATE,
respManutenccao VARCHAR(30),
statusSensor varchar(10),
constraint chkStatus
	Check(statusSensor in ('ativo', 'inativo', 'manutenção')) -- caso seja diferente disso TEM Q DAR ERRO
);

INSERT INTO Sensor (dtManutencao, respManutenccao, statusSensor)
VALUES 
('2025-03-10', 'Lucas Martins', 'ativo'),
('2025-02-25', 'Mariana Rocha', 'manutenção'),
('2025-03-05', 'Pedro Santos', 'inativo'),
('2025-01-15', 'Fernanda Lima', 'ativo');

SHOW COLUMNS FROM Sensor;
-- OU
DESC Sensor;
SELECT * FROM Sensor;
SELECT respManutenccao FROM Sensor WHERE respManutenccao LIKE "%F%";
SELECT respManutenccao FROM Sensor ORDER BY respManutenccao ASC;
UPDATE Sensor SET respManutenccao = "Marina Rocha" WHERE idSensor = 2;
UPDATE Sensor SET statusSensor = "inativo" WHERE idSensor = 4;
ALTER TABLE Sensor ADD COLUMN localizacao VARCHAR(30);
ALTER TABLE Sensor ADD CONSTRAINT chkLocalizacao CHECK (localizacao IN ('Interno', 'Externo'));
UPDATE Sensor SET localizacao = "Interno" WHERE idSensor = 1;
UPDATE Sensor SET localizacao = "Externo" WHERE idSensor = 2;
UPDATE Sensor SET localizacao = "Interno" WHERE idSensor = 3;
UPDATE Sensor SET localizacao = "Externo" WHERE idSensor = 4;
SELECT respManutenccao, localizacao FROM Sensor;
ALTER TABLE Sensor DROP COLUMN localizacao;
DELETE FROM Sensor WHERE idSensor = 2;
SELECT * FROM Sensor;
TRUNCATE Sensor;
-- --------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Financas(
idFinancas INT PRIMARY KEY AUTO_INCREMENT,
empresa VARCHAR(40) NOT NULL,
despesas FLOAT,
rdcCusto FLOAT,
lucro FLOAT
);

INSERT INTO Financas (empresa, despesas, rdcCusto, lucro)
VALUES 
('TechGas', 1500.50, 200.75, 3000.25),
('SafeAir', 1800.00, 250.50, 4000.75),
('AirProtect', 2200.75, 300.00, 5000.00),
('OxiGuard', 1700.00, 180.25, 3500.50);

SHOW COLUMNS FROM Financas;
-- OU
DESC Financas;
SELECT * FROM Financas;
SELECT empresa FROM Financas WHERE empresa LIKE "%P%";
SELECT empresa FROM Financas ORDER BY empresa ASC;
UPDATE Financas SET empresa = "SafeAirPro" WHERE idFinancas = 2;
UPDATE Financas SET despesas = 2000.00 WHERE idFinancas = 4;
ALTER TABLE Financas ADD COLUMN categoria VARCHAR(20);
ALTER TABLE Financas ADD CONSTRAINT chkCategoria CHECK (categoria IN ('Fixa', 'Variável'));
UPDATE Financas SET categoria = "Fixa" WHERE idFinancas = 1;
UPDATE Financas SET categoria = "Variável" WHERE idFinancas = 2;
UPDATE Financas SET categoria = "Fixa" WHERE idFinancas = 3;
UPDATE Financas SET categoria = "Variável" WHERE idFinancas = 4;
SELECT empresa, categoria FROM Financas;
ALTER TABLE Financas DROP COLUMN categoria;
SELECT * FROM Financas;
DELETE FROM Financas WHERE idFinancas = 4;
TRUNCATE Financas;
-- -------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Leitura(
idLeitura INT PRIMARY KEY AUTO_INCREMENT,
sensor_id INT NOT NULL,
nivel_gas DECIMAL(5,2) NOT NULL,
data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
nivMax VARCHAR(5),
nivMin VARCHAR(5),
ppm FLOAT,
porcentagem FLOAT,
stts VARCHAR(20) NOT NULL DEFAULT 'Pendente',
    CHECK (stts IN ('Pendente', 'Resolvido'))
); 

INSERT INTO Leitura (sensor_id, nivel_gas, nivMax, nivMin, ppm, porcentagem, stts)
VALUES 
(1, 2.35, 'Alta', 'Baixa', 15.2, 75.0, 'Pendente'),
(2, 1.80, 'Média', 'Baixa', 10.5, 50.0, 'Resolvido'),
(3, 3.10, 'Alta', 'Média', 20.0, 90.5, 'Pendente'),
(4, 0.95, 'Baixa', 'Baixa', 5.2, 30.0, 'Resolvido');

SHOW COLUMNS FROM Leitura;
-- OU
DESC Leitura;
SELECT * FROM Leitura;
SELECT * FROM Leitura WHERE sensor_id = 3;
SELECT ppm FROM Leitura ORDER BY ppm ASC;
UPDATE Leitura SET stts = "Resolvido" WHERE idLeitura = 3;
UPDATE Leitura SET ppm = 25.0 WHERE idLeitura = 4;
ALTER TABLE Leitura ADD COLUMN criticidade VARCHAR(10);
ALTER TABLE Leitura ADD CONSTRAINT chkCriticidade CHECK (criticidade IN ('Alta', 'Média', 'Baixa'));
UPDATE Leitura SET criticidade = "Alta" WHERE idLeitura = 1;
UPDATE Leitura SET criticidade = "Baixa" WHERE idLeitura = 2;
UPDATE Leitura SET criticidade = "Alta" WHERE idLeitura = 3;
UPDATE Leitura SET criticidade = "Baixa" WHERE idLeitura = 4;
SELECT sensor_id, criticidade FROM Leitura;
ALTER TABLE Leitura DROP COLUMN criticidade;
DELETE FROM Leitura WHERE idLeitura = 1;
SELECT * FROM Leitura;
TRUNCATE Leitura;

SHOW TABLES;
