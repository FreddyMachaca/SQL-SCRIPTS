create database hito4
use hito4

CREATE TABLE estudiantes
(
  id_est    INTEGER IDENTITY NOT NULL PRIMARY KEY,
  nombres   VARCHAR(15),
  apellidos VARCHAR(25),
  edad      INTEGER,
  fono      INTEGER,
  email     VARCHAR(100),
  direccion VARCHAR(150),
  genero    char(1)
);

INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, genero) VALUES
   ('Miguel' ,'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'm'),
   ('Sandra' ,'Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'f'),
   ('Joel' ,'Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'm'),
   ('Andrea' ,'Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'f'),
   ('Santos' ,'Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'm');


INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, genero) VALUES
   ('Micaela' ,'Adubiri Mondar', 20, 2832117, 'mica@gmail.com', 'Av. 6 de Agosto', 'f'),
   ('Saul' ,'Arias Ballesteros', 15, 2832118, 'saul@gmail.com', 'Av. 6 de Agosto', 'm'),
   ('Carlos' ,'Montes Valenzuela', 24, 2832119, 'carlos@gmail.com', 'Av. 6 de Agosto', 'm');

select count (est.id_est)
from estudiantes est
--obtener mayor edad de los estudiantes cuyo sexo sea femenino
select max (est.edad)
from estudiantes est
where est.genero='f'

--obtener mayor edad de los estudiantes cuyo sexo sea masculino y femenino
select max (est.edad)
from estudiantes est
where est.genero='f' or est.genero ='m'

--determinar cuantos estudiantes hay en donde su apellido comienza con la letra m
select count (est.apellidos)
from estudiantes est
where est.apellidos like 'm%'

-- cuantos estudiantes tiene una edad de 20
select count (est.edad)
from estudiantes est
where est.edad= 20





create table categories
(
    category_id integer identity primary key not null,
    name varchar(20)
)

create table publishers
(
    publisher_id int identity primary key not null,
    name varchar(20)
)

create table books
(
    book_id int identity primary key not null,
    title varchar(20),
    isbn varchar(20),
    published_date date,
    description varchar(20),
    category_id int,
    publisher_id int,

    foreign key (category_id) references categories(category_id),
    foreign key (publisher_id) references publishers(publisher_id)
)
select sysdatetime()

insert categories values ('terror')
insert categories values ('mangas')
insert publishers values ('panini')
insert into books values ('A droga da obdencia','ivrea','2022-05-30','una obra juvenil',1,1)

-- contar cunatos libros son de la categoria historia
select count (cat.name)
from categories as cat
inner join books as boo on cat.category_id = boo.category_id
where cat.name= 'Terror'

-- contar cunatos libros son de la categoria historia y hallan
-- sido publicados por la empresa don bosco
select count (cat.name)
from categories as cat
inner join books as boo on cat.category_id = boo.category_id
inner join publishers as pub on boo.publisher_id = pub.publisher_id
where cat.name= 'Terror' and pub.name='panini'

-- contar cunatos libros tienen una categoria que empieze con la letra m
select count (boo.book_id)
from categories as cat
inner join books as boo on cat.category_id = boo.category_id
where cat.name like 'm%'

-- crear funciones
create function ejercicio_3()
returns int
    begin
        declare resultado int;

        select count (boo.book_id) into resultado
        from categories as cat
        inner join books as boo on cat.category_id = boo.category_id
        where cat.name like 'm%'

        return resultado
    end

-- sumar dos numeros
-- a=5, b=10, respuesta= 15
create function suma_dos_numeros(@num1 int,@num2 int)
returns int as
    begin
        declare @respuesta int;
        set @respuesta = @num1+@num2;

        return @respuesta
    end;

select dbo.suma_dos_numeros(5,10);

-- suma de tres numeros
create function suma_tres_numeros(@num1 int,@num2 int,@num3 int)
returns int as
    begin
        declare @respuesta int;
        set @respuesta = @num1+@num2+@num3;

        return @respuesta
    end;

select dbo.suma_tres_numeros(5,10,5);

--crear una funcion que retorne su nombre completo
create or alter function NombreCompleto()
returns varchar(50) as
    begin
        declare @nombrecompleto varchar(50)
        set @nombrecompleto ='freddy machaca mamani'
        return @nombrecompleto
    end;

select dbo.NombreCompleto()

--obtner el año actual

select sysdatetime()

create function anhoActual()
returns int as
    begin
        declare @anhoactual int;
        set @anhoactual = month(sysdatetime());

        return @anhoactual
    end;

select dbo.anhoActual()
-- mes actual
create function mesActual()
returns int as
    begin
        declare @mesactual int;
        set @mesactual = month(sysdatetime());

        return @mesactual
    end;

select dbo.mesActual()
-- dia actual
create function diaActual()
returns int as
    begin
        declare @diaactual int;
        set @diaactual = day(sysdatetime());

        return @diaactual
    end;

select dbo.diaActual()

create function horaActual()
returns varchar(50) as
    begin
        declare @horaactual varchar(50);
        set @horaactual = (sysdatetime());

        return @horaactual
    end;

select dbo.horaActual()




-- crar la consulta sql que determine la menor edad de los estudiantes
select min (est.edad)
from estudiantes as est

-- crear una funcion que pbtneha la menor edad de los estudiantes

create function get_min_edad()
returns int  as
    begin
        declare @min_edad int

        select @min_edad = min (est.edad)
        from estudiantes as est

        return @min_edad
    end

select dbo.get_min_edad() as edad_minima

-- crear una funcion que obtenga promedio de las edades

create function get_avg_edad()
returns int as
    begin
        declare @avg_edad int
        select @avg_edad= avg(est.edad)
        from estudiantes as est

        return @avg_edad
    end

select dbo.get_avg_edad()

-- crear una funcion que obtngaa la mayor edad de los estudiantes y que sean masculinos

create function get_max_masculino_edad(@genero char)
returns int as
    begin
        declare @max_edad int
        select @max_edad = max(est.edad)
        from estudiantes as est
        where est.genero='m'

        return @max_edad
    end

select dbo.get_max_masculino_edad()

-- crear una funcion que obtenga la mayor edad de los estudiantes y que sean femeninos

create function get_max_femenino_edad(@genero char)
returns int as
    begin
        declare @max_edad int
        select @max_edad = max(est.edad)
        from estudiantes as est
        where est.genero='f'

        return @max_edad
    end

select dbo.get_max_femenino_edad()

-- Unica funcion para obtner la mayor edad del sexo masculino o femenino
create function get_max_edad(@genero char)
returns int as
    begin
        declare @max_edad int
        select @max_edad = max(est.edad)
        from estudiantes as est
        where est.genero=@genero

        return @max_edad
    end

select dbo.get_max_edad('m')


-- sumar dos numeros
create function sumardosnumer(@num1 int, @num2 int)
returns int as
begin
    declare @respuesta int
    set @respuesta= @num1+@num2
    return @respuesta
end

SELECT dbo.sumardosnumer(4,6)

--restar dos numeros
create function restardosnumeros(@num1 int, @num2 int)
returns int as
begin
    declare @respuesta int
    set @respuesta= @num1-@num2
    return @respuesta
end

SELECT dbo.restardosnumeros(4,6)

-- manejo de if
create function sumar_restar (@num1 int,@num2 int,@type varchar(20))
returns int as
begin
declare @respuesta int

if @type='suma'
    begin
       set @respuesta=@num1+@num2;
    end

if @type='resta'
    begin
       set @respuesta=@num1-@num2;
    end

return @respuesta
end

select dbo.sumar_restar (10,5,'suma')

create function sumar_restar_concat (@num1 int,@num2 int,@type varchar(20))
returns varchar(20) as
begin
declare @respuesta int
declare @concatenado varchar(20)

if @type='suma'
    begin
       set @respuesta=@num1+@num2
       set @concatenado = concat('suma: ', @respuesta)
    end

if @type='resta'
    begin
       set @respuesta=@num1-@num2
        set @concatenado = concat('resta: ', @respuesta)
    end

return @concatenado
end

select dbo.sumar_restar_concat (10,5,'suma')



create table numeros
(
    numero int,
    cuadrado int
)
select* from numeros

--crear una funcion (no se puede insertar valores en una funcion)
--que permita insertar registos em la tabla numeros
create procedure insertar_tabla_numeros(@numero int, @cuadrado int) as
begin
    insert into numeros(numero, cuadrado)
    values (@numero,@cuadrado)
end
-- insertando
declare @num1 int =6;
declare @cuad int =36;
execute dbo.insertar_tabla_numeros @num1,@cuad