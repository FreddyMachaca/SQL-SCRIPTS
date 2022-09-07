create database agregacion
use agregacion

CREATE TABLE USUARIOS
(
  ID_USUARIOS INTEGER PRIMARY KEY NOT NULL,
  NAME VARCHAR(20),
  LAST_NAME VARCHAR(20),
  AGE INTEGER,
  CIUDAD VARCHAR(15)
);

INSERT INTO USUARIOS VALUES (1, 'William', 'Barra', 32, 'El Alto');
INSERT INTO USUARIOS VALUES (2, 'Micaela', 'Quispe', 20, 'La Paz');
INSERT INTO USUARIOS VALUES (3, 'Saul', 'Mar', 15, 'El Alto');
INSERT INTO USUARIOS VALUES (4, 'Ana', 'Perez', 25, 'Cochabamba');
INSERT INTO USUARIOS VALUES (5, 'Luz', 'Maria', 22, 'Santa Cruz');

select usu.NAME, usu.AGE
from USUARIOS usu
where usu.age >22;

-- cuantos usuarios son mayores de 22 años
select count (usu.AGE)
from USUARIOS as usu
where usu.age >22;

--cuantos usuarios son de la paz
select count (usu.CIUDAD)
from USUARIOS as usu
where usu.CIUDAD = 'La Paz'

-- count contar, avg promedio, sum sumar, max valor mas alto, min valor mas bajo

select avg (us.AGE)
from USUARIOS as us

select sum (us.AGE)
from USUARIOS as us

select max (us.AGE)
from USUARIOS as us

select min (us.AGE)
from USUARIOS as us

-- determinar cuantos usuarios registrados tengo

select count (us.ID_USUARIOS) as contar
from USUARIOS us

-- determinar cual es la edad minima que se tiene en los resultados

select min (us.AGE)
from USUARIOS as us





-- determinar cuantos usuarios son de la ciudad de el alto
select count (usu.CIUDAD)
from USUARIOS as usu
where usu.CIUDAD = 'el alto'