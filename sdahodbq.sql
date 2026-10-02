create database kart_gt_bd;
use kart_gt_bd;

create table BATERIAS(
id_bateria int auto_increment primary key,
nome varchar(50) not null,
valor decimal (8,2) not null,
duracao_minutos int not null
);

create table pilotos(
id_piloto int auto_increment primary key,
nome varchar (100) not null,
cpf varchar (14) unique not null,
telefone varchar (20),
data_nascimento date not null
);

create table karts(
id_kart int auto_increment primary key,
numero int not null unique,
categoria varchar(50) not null,
potencia_hp varchar (20)
);

create table reservas(
id_reserva int auto_increment primary key,
id_piloto int not null,
id_bateria int not null,
id_kart int,
data_corrida date default (current_date),
status varchar(20) default 'confirmada',
foreign key(id_piloto) references pilotos(id_piloto),
foreign key(id_bateria) references baterias(id_bateria),
foreign key(id_kart) references karts(id_kart)
);

insert into baterias (nome, valor, duracao_minutos) values
('Treino Livre', 99.90, 15),
('Sprint Race',  149.90, 25),
('Grand Prix GP', 199.90, 40);

insert into karts(numero, categoria, potencia_hp) values
(12, 'Rental Padrao', '6.5 HP'),
(27, 'Rental Padrao', '6.5 HP'),
(44, 'Profissional 2T', '13 HP');

insert into pilotos (nome, cpf, telefone, data_nascimento) values
('lucas Mendes', '111.222.333-44', '41-999999-3333', '1998-05-14'),
('Mariana Lima', '555.666.000-888', '41-999999-3333', '2000-06-10'),
('Juliana Ferreira', '111.999.777-54', '41-999999-3333', '2001-03-15');

insert into reservas (id_pilotos, id_bateria, id_kart) values
(1,2,1),
(2,3,2),
(3,1,3);
