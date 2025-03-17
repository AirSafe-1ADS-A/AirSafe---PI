CREATE DATABASE projetoPi;
USE projetoPi;

-- 1. Criação da Tabela Empresa
CREATE TABLE Empresa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    contratacao DATE,
    localizacao VARCHAR(255),
    cnpj VARCHAR(18) UNIQUE NOT NULL
);

-- 2. Inserção de dados na Tabela Empresa
INSERT INTO Empresa (nome, contratacao, localizacao, cnpj) 
VALUES ('Empresa XYZ', '2020-01-01', 'São Paulo, SP', '12.345.678/0001-90');

-- 3. Seleção de dados na Tabela Empresa
SELECT * FROM Empresa;

-- 4. Atualização de dados na Tabela Empresa
UPDATE Empresa 
SET localizacao = 'Rio de Janeiro, RJ' 
WHERE id = 1;

-- 5. Exclusão de dados na Tabela Empresa
DELETE FROM Empresa 
WHERE id = 1;

-- 6. Criação da Tabela Sensor
CREATE TABLE Sensor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    empresa INT,  -- Relacionamento por ID de empresa, sem FK
    data_manutencao DATE,
    responsavel_manutencao VARCHAR(255),
    status VARCHAR(50)
);

-- 7. Inserção de dados na Tabela Sensor
INSERT INTO Sensor (empresa, data_manutencao, responsavel_manutencao, status) 
VALUES (1, '2025-03-10', 'Carlos Silva', 'Ativo');

-- 8. Seleção de dados na Tabela Sensor
SELECT * FROM Sensor;

-- 9. Atualização de dados na Tabela Sensor
UPDATE Sensor 
SET status = 'Inativo' 
WHERE id = 1;

-- 10. Exclusão de dados na Tabela Sensor
DELETE FROM Sensor 
WHERE id = 1;

-- 11. Criação da Tabela Financas
CREATE TABLE Financas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    empresa INT,  -- Relacionamento por ID de empresa, sem FK
    despesas DECIMAL(10, 2),
    reducao_custo DECIMAL(10, 2),
    lucro DECIMAL(10, 2)
);

-- 12. Inserção de dados na Tabela Financas
INSERT INTO Financas (empresa, despesas, reducao_custo, lucro) 
VALUES (1, 5000.00, 1000.00, 2000.00);

-- 13. Seleção de dados na Tabela Financas
SELECT * FROM Financas;

-- 14. Atualização de dados na Tabela Financas
UPDATE Financas 
SET lucro = 2500.00 
WHERE id = 1;

-- 15. Exclusão de dados na Tabela Financas
DELETE FROM Financas WHERE id = 1;

-- 16. Criação da Tabela Leitura
CREATE TABLE Leitura (
    id INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(50),
    dia DATE,
    ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    nivel_maximo DECIMAL(10, 2),
    nivel_minimo DECIMAL(10, 2),
    ppm INT,
    porcentagem DECIMAL(5, 2)
);

-- 17. Inserção de dados na Tabela Leitura
INSERT INTO Leitura (status, dia, nivel_maximo, nivel_minimo, ppm, porcentagem) 
VALUES ('Normal', '2025-03-10', 100.00, 50.00, 500, 80.00);

-- 18. Seleção de dados na Tabela Leitura
SELECT * FROM Leitura;

-- 19. Atualização de dados na Tabela Leitura
UPDATE Leitura 
	SET status = 'Alto', ppm = 600 
		WHERE id = 1;

-- 20. Exclusão de dados na Tabela Leitura
DELETE FROM Leitura WHERE id = 1;