create database defensa_hito4
use defensa_hito4

create table campeonato
(
    id_campeonato varchar (12) primary key,
    nombre_campeonato varchar (30) not null,
    sede varchar (20) not null,
)

create table equipo
(
    id_equipo varchar (12) primary key,
    nombre_equipo varchar (30) not null,
    categoria varchar (8) not null,

    id_campeonato varchar (12),
    Foreign key (id_campeonato) references  campeonato (id_campeonato)
)

create table jugador
(
    id_jugador varchar (12) primary key,
    nombres varchar (30) not null,
    apellidos varchar (50) not null,
    ci varchar (15) not null,
    edad int not null,

    id_equipo varchar (12),
    Foreign Key (id_equipo) references equipo (id_equipo)
)

--insercion de datos
insert into campeonato values ('camp-111','Campeonato Unifranz','La Paz')
insert into campeonato values ('camp-222','Campeonato Unifranz','Cochabamba')

insert into equipo values ('equ-111','Sao Paulo','VARONES','camp-111')
insert into equipo values ('equ-222','Palmeiras','MUJERES','camp-222')

insert into jugador values ('jug-111','Daniel','Orivaldo','8997811LP',19,'equ-111')
insert into jugador values ('jug-222','Jorge','Luis Alvarado','8997822LP',20,'equ-222')

--determinar cuantos jugadores empiezan su nombre con la letra s y su apellido con la letra m
--ademas pertenezca el alto
select count (jug.nombres)
from jugador as jug
inner join equipo as eque on jug.id_equipo = eque.id_equipo
inner join campeonato as camp on eque.id_campeonato = camp.id_campeonato
where jug.nombres LIKE 'd%' and jug.apellidos like 'o%' and camp.sede='la paz'

-- crear una funcion en base al anterior consulta

CREATE FUNCTION F1_ejercicio(@sede varchar (20))
RETURNS int AS
    BEGIN
        DECLARE @return int
        SELECT @return = count (jug.nombres)
        from jugador as jug
        inner join equipo as eque on jug.id_equipo = eque.id_equipo
        inner join campeonato as camp on eque.id_campeonato = camp.id_campeonato
        where jug.nombres LIKE 'd%' and jug.apellidos like 'o%' and camp.sede=@sede
        RETURN @return
    end
select dbo.F1_ejercicio('La Paz')

--crear una funcion que permita concatenar 3 valores

create function Concat_items(@valor1 varchar(max), @valor2 varchar(max), @valor3 varchar(max))
returns varchar(max) as
    begin
        declare @return varchar(max)
        declare @concatenado1 varchar(max)
        declare @concatenado2 varchar(max)
        declare @concatenado3 varchar(max)
        set @concatenado1 = concat('Nombres jugadores: ',@valor1)
        set @concatenado2 = concat(' Nombres Equipos: ',@valor2)
        set @concatenado3 = concat(' Sede: ',@valor3)
        set @return=@concatenado1+@concatenado2+@concatenado3
        return @return
    end

select dbo.Concat_items('Augusto Salazar ','Sao Paulo ','La paz')

select dbo.Concat_items (jug.nombres,eque.nombre_equipo, camp.sede)
from jugador as jug
inner join equipo as eque on jug.id_equipo = eque.id_equipo
inner join campeonato as camp on eque.id_campeonato = camp.id_campeonato


