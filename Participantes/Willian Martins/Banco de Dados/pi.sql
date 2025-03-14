CREATE DATABASE AirSafe;
USE AirSafe;

CREATE TABLE Empresa(
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(100),
    contratacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    cep CHAR(9),
    responsavel VARCHAR(100),
    cnpj CHAR(14) UNIQUE,
    emailContato VARCHAR(50) UNIQUE,
    telefoneContato VARCHAR(18) UNIQUE,
    qtdSensoresEmpresa INT
);

CREATE TABLE Sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
	areaSensor FLOAT,
    modeloSensor VARCHAR(10),
    tipoSensor VARCHAR(30),
    descricaoSensor VARCHAR(50),
    numeroSerie VARCHAR(30) UNIQUE,
    statusFuncional VARCHAR(20),
    CONSTRAINT chkStatusFuncional CHECK
		( statusFuncional in("Funcionando", "Em Manutenção", "Não funcionando")),
	dataManutencao DATE,
    dataInstalacao DATE
);

CREATE TABLE Financas(
	idFinancas INT PRIMARY KEY AUTO_INCREMENT,
    lucroEmpresa DOUBLE,
    prejuEmpresa DOUBLE, 
    mediaFinancaEmpresa DOUBLE,
    investimentoEmpresa DOUBLE,
    margemLucro DOUBLE,
    margemPreju DOUBLE
);

CREATE TABLE Leitura(
	idLeituraSensor INT PRIMARY KEY AUTO_INCREMENT,
    valorSensor INT,
    porcentagem FLOAT,
    CONSTRAINT chkPorcentagem CHECK
		(porcentagem IN (0, 100)),
	statusSensor VARCHAR(20),
    CONSTRAINT chkStatus CHECK
		(statusSensor IN ("Seguro", "Risco", "Alerta")),
	mediaDiaSensor FLOAT
);