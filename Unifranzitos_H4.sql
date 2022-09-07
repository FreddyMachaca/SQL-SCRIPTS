Create database Unifranzitos_H4
use Unifranzitos_H4

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

--3.1. Mostrar que jugadores que formen parte del equipo equ-333
select jug.nombres,jug.apellidos,equ.id_equipo,equ.nombre_equipo
from jugador as jug
inner join equipo as equ on jug.id_equipo = equ.id_equipo
where equ.id_equipo = 'equ-333'

--3.2. Crear una función que permita saber cuántos jugadores están inscritos.
create function  F1_CantidadJugadores()
returns int as
    begin
        declare @Cant_Jug int
        SELECT @Cant_Jug = count (jug.id_jugador)
        from jugador as jug
        return @Cant_Jug
    end

select dbo.F1_CantidadJugadores()

--3.3. Crear una función que permita saber cuántos jugadores están inscritos y que sean de
-- la categoría varones o mujeres.

 create function F2_CantidadJugadoresParam(@categoria varchar(8))
 returns varchar as
    begin
        declare @Cant_Jug varchar
        select @Cant_Jug = count(jug.id_jugador)
        from jugador as jug
        inner join equipo as equ on jug.id_equipo = equ.id_equipo
        where equ.categoria =@categoria
        return @Cant_Jug
    end

select dbo. F2_CantidadJugadoresParam('VARONES')

--3.4. Crear una función que obtenga el promedio de las edades mayores a una cierta edad.
--La función debe llamarse F3_PromedioEdades()
--La función debe recibir como parámetro 2 valores.
--La categoría. (Varones o Mujeres)
--La edad con la que se comparara (21 años ejemplo)
--Es decir mostrar el promedio de edades que sean de una categoría y que sean mayores a 21 años.


CREATE FUNCTION F3_PromedioEdades(@categoria varchar(8), @edad int)
RETURNS int AS
    BEGIN
        DECLARE @Prom_edad int
        SELECT @Prom_edad = avg (jug.edad)
        FROM jugador as jug
        INNER JOIN equipo AS equ on jug.id_equipo = equ.id_equipo
        where equ.categoria = @categoria and jug.edad > @edad
        RETURN @Prom_edad
    end

select dbo.F3_PromedioEdades('varones',19)

-- consulta sin funcion
SELECT avg (jug.edad)
FROM jugador as jug
INNER JOIN equipo AS equ on jug.id_equipo = equ.id_equipo
where equ.categoria = 'varones' and jug.edad > 19

--3.5. Crear una función que permita concatenar 3 parámetros.
-- La función debe llamarse F4_ConcatItems()
-- La función debe de recibir 3 parámetros.
-- La función debe de concatenar los 3 valores.
-- Para verificar la correcta creación de la función debe mostrar lo siguiente.
-- Mostrar los nombres de los jugadores, el nombre del equipo y la sede concatenada, utilizando la función
-- que acaba de crear
create function Pruebaf4 (@nombres varchar(max),@nombre_equipo varchar(max),@sede varchar(max))
returns varchar(max) as
    begin
        declare @return varchar(max)
        declare @concatenado1 varchar(max)
        declare @concatenado2 varchar(max)
        declare @concatenado3 varchar(max)
        set @concatenado1 = concat ('Nombres de jugadores: ',@nombres)
        set @concatenado2 = concat ('Nombres de equipo: ',@nombre_equipo)
        set @concatenado3 = concat ('Sede: ',@sede)
        set @return=@concatenado1+@concatenado2+@concatenado3
        return @return
    end

select dbo.Pruebaf4('Daniel Orivaldo ','Sao Paulo ','Santa Cruz')

create function F4_ConcatItems(@nombres varchar(max), @nombre_equipo varchar(max), @sede varchar(max))
returns varchar(max) as
    begin
        declare @return varchar(max)
        declare @conc1 varchar(max)
        declare @conc2 varchar(max)
        declare @conc3 varchar(max)
        set @conc1 = concat('Nombres jugadores: ',@nombres)
        set @conc2 = concat('Nombres Equipos: ',@nombre_equipo)
        set @conc3 = concat('Sede: ',@sede)
        set @return=@conc1+@conc2+@conc3
        return @return
    end


select dbo.F4_ConcatItems('Augusto Salazar ','Sao Paulo ','La paz')


--3.6. Generar la serie fibonacci.


CREATE FUNCTION fn_Fibonacci(@max int)
RETURNS @numbers TABLE(number int)
AS
BEGIN
	Declare @n1 int = 0,@n2 int =1,@i int=0,@temp int
	Insert Into @numbers Values(@n1),(@n2)
	WHILE (@i<=@max-2)
	BEGIN
		Insert Into @numbers Values(@n2+@n1)
		set @temp = @n2
		Set @n2 = @n2 + @n1
		Set @n1 = @temp
		Set @i += 1
	END
	RETURN
END

Select * from dbo.fn_Fibonacci(5)

Create FUNCTION fn_Fibonacci2(@count int)
RETURNS @numbers TABLE(number int)
AS
BEGIN
	Declare @n int,@i int=0
	Insert Into @numbers Values(0),(1)
	WHILE (@i<@count)
	BEGIN
		Select @n = sum(number) from (Select top 2 number from @numbers order by number desc) as T
		Insert Into @numbers Values(@n)
		Select @i = count(*) from @numbers
	END
	RETURN
END

Select * from dbo.fn_Fibonacci2(5)










