create database pi;

use pi;

create table empresa(
idCliente int primary key auto_increment,
cnpj char(14),
nome varchar(40),
email varchar(100),
telefone varchar(11),
cep char(9),
contratacao date
);

create table manutencao(
idSensor int primary key,
dtManutencao datetime,
ResponsavelManutencao varchar(40),
statusManutencao varchar(10) check (statusManutencao in ('Baixo', 'Moderado', 'Alto'))
);

create table leitura(
idSensor int primary key,
statusLeitura varchar(10) check (statusLeitura in ('Ativo', 'Inativo', 'Manutencao')),
ultimaAtualizacao datetime,
nivelMax int,
nivelMin int,
ppm int,
porcentagem int
);

insert into empresa (cnpj, nome, email, telefone, cep, contratacao) values
('12345678000101', 'Frio & Sabor Logística', 'contato@frioesabor.com', '11987654321', '01001-000', '2023-05-10'),
('23456789000122', 'Gelato Armazéns', 'suporte@gelatoarma.com', '21987651234', '02002-111', '2022-08-15'),
('34567890000133', 'Congela Fácil Distribuição', 'atendimento@congelafacil.com', '31981234567', '03003-222', '2021-12-20'),
('45678901000144', 'Polar Alimentos', 'vendas@polaralimentos.com', '41986549876', '04004-333', '2020-07-30'),
('56789012000155', 'Frost Logística', 'info@frostlogistica.com', '51987776655', '05005-444', '2024-02-05');

select * from empresa;

insert into manutencao (idSensor, dtManutencao, ResponsavelManutencao, statusManutencao) values
(1, '2025-03-10 14:30:00', 'Carlos Souza', 'Baixo'),
(2, '2025-03-12 09:15:00', 'Mariana Lima', 'Moderado'),
(3, '2025-03-14 16:45:00', 'Rafael Duarte', 'Alto');

select * from manutencao;

insert into leitura (idSensor, statusLeitura, ultimaAtualizacao, nivelMax, nivelMin, ppm, porcentagem) values
(1, 'Ativo', '2025-03-15 08:00:00', 100, 20, 30, 75),
(2, 'Manutencao', '2025-03-14 18:30:00', 90, 15, 50, 60),
(3, 'Inativo', '2025-03-13 12:20:00', 110, 25, 20, 80);

select * from leitura;

alter table manutencao rename column dtManutencao to dataManutencao;
desc manutencao;

update empresa set nome='Armazem Gelato' where idCliente=2;
select * from empresa;

delete from manutencao where idSensor=3;
select * from manutencao;

select * from empresa where nome like '%o';

select * from empresa where nome not like '%m%';

select * from empresa where nome <>'Polar Alimentos';

select * from empresa order by idCliente desc;

select idSensor as 'id do sensor' from manutencao;

select concat ('O ', idSensor, ' teve sua manutenção feita em ', dataManutencao, ' por ', ResponsavelManutencao, ' e seu nivel de manutenção foi: ', statusManutencao) from manutencao;


