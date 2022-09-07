Create database Unifranzitos
use Unifranzitos

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
insert into campeonato values ('camp-111','Campeonato Unifranz','El Alto')
insert into campeonato values ('camp-222','Campeonato Unifranz','Cochabamba')

insert into equipo values ('equ-111','Google','VARONES','camp-111')
insert into equipo values ('equ-222','404 Not found','VARONES','camp-111')
insert into equipo values ('equ-333','girls unifranz','MUJERES','camp-111')

insert into jugador values ('jug-111','Carlos','Villa','8997811LP',19,'equ-222')
insert into jugador values ('jug-222','Pedro','Salas','8997822LP',20,'equ-222')
insert into jugador values ('jug-333','Saul','Araj','8997833LP',21,'equ-222')
insert into jugador values ('jug-444','Sandra','Solis','8997844LP',20,'equ-333')
insert into jugador values ('jug-555','Ana','Mica','8997855LP',23,'equ-333')

--ejemplos inner join
--Seleccionar los campeonatos que esten en la categoria varones

select camp.nombre_campeonato,camp.sede,equ.categoria
from equipo as equ
inner join campeonato as camp on equ.id_campeonato = camp.id_campeonato
where equ.categoria = 'VARONES'

--seleccionar los campeonato en modalid mujeres

select camp.nombre_campeonato,camp.sede,equ.categoria
from equipo as equ
inner join campeonato as camp on equ.id_campeonato=camp.id_campeonato
where equ.categoria = 'MUJERES'


-- LEFT JOIN

select camp.nombre_campeonato,camp.sede,equ.categoria
from equipo as equ
left join campeonato as camp on equ.id_campeonato = camp.id_campeonato

--right join
select camp.nombre_campeonato,camp.sede,equ.categoria
from equipo as equ
right join campeonato as camp on equ.id_campeonato = camp.id_campeonato

--MOSTRAR LOS NOMBRES Y APELLDIOS Y NOMBRE DE EQUIPO

select jug.nombres, jug.apellidos,equ.nombre_equipo
from jugador as jug
inner join equipo as equ on jug.id_equipo = equ.id_equipo


--DOBLE INNER JOIN
--MOSTRAR LOS NOMBRES Y APELLDIOS Y NOMBRE DE EQUIPO y categoria y sede

select jug.nombres,jug.apellidos,equ.nombre_equipo,equ.categoria,camp.sede
from jugador as jug
inner join equipo as equ on jug.id_equipo = equ.id_equipo
inner join campeonato as camp on equ.id_campeonato=camp.id_campeonato

--PRACTICA

--Mostrar que jugadores que formen parte del equipo equ-222

select jug.nombres,jug.apellidos,equ.id_equipo,equ.nombre_equipo
from jugador as jug
inner join equipo as equ on jug.id_equipo = equ.id_equipo
where equ.id_equipo = 'equ-222'

--Mostrar que jugadores que formen parte del equipo equ-333
select jug.nombres,jug.apellidos,equ.id_equipo,equ.nombre_equipo
from jugador as jug
inner join equipo as equ on jug.id_equipo = equ.id_equipo
where equ.id_equipo = 'equ-333'

--Mostrar aquellos jugadores mayores o igual a 21 años
Select jug.*
from jugador as jug
where jug.edad >= 21

--Mostrar a todos los jugadores en donde su apellido empiece con la letra S

select jug.*
from jugador as jug
where jug.apellidos LIKE 'S%'

--Mostrar que equipos forman parte del campeonato camp-111 y además sean de la categoría MUJERES.

select camp.nombre_campeonato, equ.nombre_equipo,equ.categoria
from equipo as equ
inner join campeonato as camp on equ.id_campeonato = camp.id_campeonato
where camp.id_campeonato ='camp-111' and equ.categoria = 'MUJERES'

--Mostrar el nombre del equipo del jugador con id_jugador igual a jug-333
select equ.nombre_equipo,jug.id_jugador,jug.nombres,jug.apellidos
from jugador as jug
inner join equipo as equ on jug.id_equipo = equ.id_equipo
where jug.id_jugador = 'jug-333'

--Mostrar el nombre del campeonato del jugador con id_jugador igual a jug-333
select camp.nombre_campeonato,jug.id_jugador,jug.nombres,jug.apellidos
from jugador as jug
inner join equipo as equ on jug.id_equipo = equ.id_equipo
inner join campeonato as camp on equ.id_campeonato=camp.id_campeonato
where jug.id_jugador='jug-333'