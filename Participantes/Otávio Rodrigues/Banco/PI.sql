CREATE DATABASE AirSafe;
USE AirSafe;

CREATE TABLE Empresa(	
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	nomeEmpre VARCHAR(50),
    cnpj CHAR(14),
    telefone CHAR(14),
    cep CHAR(8),
    dtCriacao  DATETIME DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(50),
    nomeResp VARCHAR(40)
);


CREATE TABLE Sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
	numSerie int,
    dtmanutencao DATE,
    dtInstalacao DATETIME DEFAULT current_timestamp,
    responsavel VARCHAR(30)
);

CREATE TABLE leitura(
idLeitura int PRIMARY KEY auto_increment,
dia DATE,
ultAtalizacao DATETIME DEFAULT current_timestamp,
porcentagem FLOAT,
 statusSensor VARCHAR(30),
    constraint chkStatus 
    CHECK (statusSensor 
    in ('baixo','normal','alto'))
);

CREATE TABLE Financas (
	idFinanceiro INT PRIMARY KEY AUTO_INCREMENT,
    prejuizos Float,
    lucros Float,
    manutencao Float
);

INSERT INTO Financas (prejuizos, lucros, manutencao) VALUES
(500.00, 1500.00, 200.00),
(300.50, 1200.75, 150.25),
(1000.00, 2500.00, 300.00),
(200.00, 800.00, 100.00),
(750.25, 1800.50, 250.75);


INSERT INTO Empresa(nomeEmpre,cnpj,telefone,cep,email,nomeResp)VALUES
('Giovanni e Bernardo Contábil Ltda','70744145000182','1125648590','13251465','contato@giovanniebernardocontabilltda.com.br','Giovanni'),
('Antonio e Clarice Telas Ltda','56645031000154','1136743762','07432005','financeiro@antonioeclaricetelasltda.com.br','Antonio'),
('Benício e Carolina Alimentos ME','56233834000100','1929818997','13417650','estoque@benicioecarolinaalimentosme.com.br','Carolina '),
('Bianca e Giovanni Financeira Ltda','58255796000103','1126268561','03570140','contato@biancaegiovannifinanceiraltda.com.br','Bianca'),
('Guilherme e Anthony Fotografias Ltda','26531308000157','1227698081','12226798','diretoria@guilhermeeanthonyfotografiasltda.com.br','Anthony');

INSERT INTO Sensor (numSerie, dtmanutencao, responsavel) VALUES
(1001, '2024-01-15', 'Carlos Souza'),
(1002, '2024-02-20', 'Ana Ribeiro'),
(1003, '2024-03-10', 'João Fernandes'),
(1004, '2024-04-05', 'Mariana Lopes'),
(1005, '2024-05-18', 'Roberto Silva');

INSERT INTO leitura (dia, porcentagem, statusSensor) VALUES
('2024-03-01', 0.0, 'normal'),
('2024-03-02', 0.1, 'normal'),
('2024-03-03', 0.2, 'normal'),
('2024-03-04', 0.3, 'alto'),
('2024-03-05', 0.5, 'alto');

-- Empresa
SELECT * FROM Empresa;
SELECT * FROM Empresa WHERE dtCriacao <= '2026-03-13';
SELECT * FROM Empresa WHERE nomeResp LIKE 'G%';
SELECT * FROM Empresa ORDER BY nomeEmpre DESC;

ALTER TABLE Empresa ADD COLUMN endereco VARCHAR(100);
ALTER TABLE Empresa MODIFY COLUMN cnpj CHAR(18);
ALTER TABLE Empresa MODIFY COLUMN telefone VARCHAR(15);

UPDATE Empresa SET telefone = '11999998888' WHERE idEmpresa = 2;
UPDATE Empresa SET nomeResp = 'Giovanni Oliveira' WHERE idEmpresa = 1;
UPDATE Empresa SET endereco = 'Rua das Flores, 123 - Centro' WHERE idEmpresa = 3;
-- Limpar Dados da Tabela
TRUNCATE TABLE Empresa;


-- Sensor
SELECT * FROM Sensor;
SELECT * FROM Sensor WHERE dtmanutencao < '2024-06-01';
SELECT * FROM Sensor WHERE responsavel LIKE 'A%';
SELECT * FROM Sensor WHERE dtInstalacao >= '2024-06-01';

ALTER TABLE Sensor ADD COLUMN localizacao VARCHAR(50);
ALTER TABLE Sensor RENAME COLUMN numSerie TO numeroSerie;
ALTER TABLE Sensor MODIFY COLUMN responsavel VARCHAR(50);

UPDATE Sensor SET responsavel = 'Fernando Lima' WHERE idSensor = 2;
UPDATE Sensor SET dtmanutencao = '2024-12-01' WHERE idSensor = 3;
UPDATE Sensor SET localizacao = 'Bloco A - Sala 3' WHERE idSensor = 4;
-- Limpar Dados da Tabela
TRUNCATE TABLE Sensor;

-- Leitura
SELECT * FROM Leitura;
SELECT * FROM leitura WHERE statusSensor = 'alto';
SELECT * FROM leitura WHERE ultAtalizacao > '2025-01-01';
SELECT * FROM leitura WHERE porcentagem BETWEEN 0.1 AND 0.3;

ALTER TABLE leitura MODIFY COLUMN porcentagem DOUBLE;
ALTER TABLE leitura RENAME COLUMN ultAtalizacao TO ultimaAtualizacao;
ALTER TABLE leitura ADD COLUMN comentario VARCHAR(100);

UPDATE leitura SET statusSensor = 'alto' WHERE porcentagem > 0.2;
UPDATE leitura SET porcentagem = 0.15 WHERE idLeitura = 5;
UPDATE leitura SET comentario = 'Leitura estável' WHERE idLeitura = 3;
-- Limpar Dados da Tabela
TRUNCATE TABLE Leitura;

-- Financas
SELECT * FROM Financas;
SELECT * FROM Financas WHERE lucros > prejuizos;
SELECT * FROM Financas ORDER BY lucros DESC;
SELECT * FROM Financas WHERE lucros <= 1000;

ALTER TABLE Financas MODIFY COLUMN prejuizos DECIMAL(10,2);
ALTER TABLE Financas MODIFY COLUMN lucros DECIMAL(10,2);
ALTER TABLE Financas ADD COLUMN descricao VARCHAR(100);

UPDATE Financas SET manutencao = 350.75 WHERE idFinanceiro = 2;
UPDATE Financas SET descricao = 'Reparo em equipamentos' WHERE idFinanceiro = 4;
UPDATE Financas SET lucros = 2200.50 WHERE idFinanceiro = 1;
-- Limpar Dados da Tabela
TRUNCATE TABLE Financa;

























