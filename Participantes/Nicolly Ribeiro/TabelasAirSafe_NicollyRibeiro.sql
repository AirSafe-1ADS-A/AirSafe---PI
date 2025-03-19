CREATE DATABASE AirSafe;
USE AirSafe;
CREATE TABLE Empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome varchar(50),
cnpj char(14),
responsavel VARCHAR(50),
cpfresponsavel VARCHAR(16),
contratacao DATE,
logradouro VARCHAR(60),
cep CHAR(9)
);

USE AirSafe;

INSERT INTO Empresa (nome, cnpj, responsavel, cpfresponsavel, contratacao, logradouro, cep) VALUES
('SkyTech Ltda', '12345678000195', 'Carlos Mendes', '123.456.789-00', '2023-01-15', 'Av. das Nuvens, 100', '01000-000'),
('AeroLogistics SA', '98765432000188', 'Mariana Souza', '987.654.321-00', '2022-12-10', 'Rua do Hangar, 50', '02000-000'),
('FlyHigh Serviços', '56473829000133', 'Pedro Lima', '564.738.290-11', '2024-02-05', 'Alameda Aviões, 200', '03000-000'),
('AirFlow Transportes', '19283746000177', 'Fernanda Castro', '192.837.460-22', '2023-06-20', 'Estrada Aérea, 75', '04000-000'),
('BlueWings Corp', '33445566000199', 'Ricardo Alves', '334.455.660-33', '2021-11-25', 'Avenida Voo Livre, 300', '05000-000'),
('JetSpeed Ltda', '77889900000144', 'Tatiane Rocha', '778.899.000-44', '2022-08-30', 'Rua dos Jatos, 120', '06000-000'),
('SkyLog Express', '11223344000166', 'Daniel Ferreira', '112.233.440-55', '2023-09-18', 'Praça Aeroporto, 90', '07000-000'),
('CloudAir Solutions', '55667788000122', 'Beatriz Martins', '556.677.880-66', '2024-03-12', 'Travessa Planadores, 110', '08000-000');

SELECT * FROM Empresa;
UPDATE Empresa SET logradouro = 'Nova Rua das Nuvens, 150', cep = '01111-111' WHERE idEmpresa = 1;
DELETE FROM Empresa WHERE idEmpresa = 3;
SELECT * FROM Empresa ORDER BY contratacao DESC;

CREATE TABLE Sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
	Empresa INT,
    dataManutencao DATE,
    responsavel VARCHAR(50),
    statusS VARCHAR(15),
    CONSTRAINT chk_status CHECK (statusS IN ('Ativo', 'Inativo', 'Manutenção'))
);

INSERT INTO Sensor (Empresa, dataManutencao, responsavel, statusS) VALUES
(1, '2024-01-10', 'João Silva', 'Ativo'),
(2, '2023-12-15', 'Mariana Costa', 'Manutenção'),
(3, '2024-02-20', 'Carlos Mendes', 'Ativo'),
(4, '2023-11-05', 'Fernanda Castro', 'Inativo'),
(5, '2024-03-01', 'Ricardo Alves', 'Ativo'),
(6, '2023-09-25', 'Tatiane Rocha', 'Manutenção'),
(7, '2024-01-30', 'Daniel Ferreira', 'Ativo'),
(8, '2024-02-10', 'Beatriz Martins', 'Inativo');

SELECT * FROM Sensor;
SELECT * FROM Sensor WHERE Empresa = 3;
UPDATE Sensor SET statusS = 'Ativo' WHERE idSensor = 2;
DELETE FROM Sensor WHERE idSensor = 7;

CREATE TABLE Financas (
    idFinanca INT PRIMARY KEY AUTO_INCREMENT,
    Empresa INT,
    despesas DECIMAL(10,2),
    reducaoCusto DECIMAL(10,2),
    roi DECIMAL(5,2)
);

INSERT INTO Financas (Empresa, despesas, reducaoCusto, roi) VALUES
(1, 150000.00, 20000.00, 12.5),
(2, 235000.50, 35000.75, 15.8),
(3, 98000.25, 12000.50, 10.2),
(4, 175500.00, 18000.00, 11.7),
(5, 210000.75, 25000.30, 14.3),
(6, 89000.90, 5000.00, 7.9),
(7, 156700.20, 17000.60, 13.1),
(8, 245300.40, 40000.90, 16.5);

SELECT * FROM Financas;
SELECT * FROM Financas ORDER BY reducaoCusto DESC;
DELETE FROM Financas WHERE idFinanca = 4;
UPDATE Financas SET roi = 18.2 WHERE idFinanca = 2;

CREATE TABLE Leitura (
    idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    statusS VARCHAR(20),
    dia DATE,
    ultimaAtualizacao DATETIME,
    nivelMaximo DECIMAL(10,2),
    nivelMinimo DECIMAL(10,2),
    ppm DECIMAL(10,2),
    porcentagem DECIMAL(5,2)
);

INSERT INTO Leitura (statusS, dia, ultimaAtualizacao, nivelMaximo, nivelMinimo, ppm, porcentagem) VALUES
('Ativo', '2024-03-01', '2024-03-01 08:30:00', 100.50, 50.20, 300.10, 85.60),
('Inativo', '2024-03-02', '2024-03-02 09:00:00', 110.30, 60.15, 310.50, 90.20),
('Ativo', '2024-03-03', '2024-03-03 10:15:00', 120.75, 55.10, 320.00, 92.30),
('Concluído', '2024-03-04', '2024-03-04 11:00:00', 95.40, 45.80, 295.25, 80.50),
('Ativo', '2024-03-05', '2024-03-05 12:45:00', 130.60, 50.00, 330.10, 95.00),
('Inativo', '2024-03-06', '2024-03-06 13:20:00', 105.00, 47.00, 310.75, 88.80),
('Ativo', '2024-03-07', '2024-03-07 14:10:00', 115.00, 53.50, 305.60, 87.40),
('Concluído', '2024-03-08', '2024-03-08 15:00:00', 125.00, 60.00, 320.25, 90.10);

SELECT * FROM Leitura;
SELECT * FROM Leitura ORDER BY ultimaAtualizacao DESC;
UPDATE Leitura SET statusS = 'Concluído' WHERE idLeitura = 3;
DELETE FROM Leitura WHERE idLeitura = 4;



