CREATE DATABASE UNIVERSIDADH3;
USE UNIVERSIDADH3;

CREATE TABLE estudiantes
(
  id_est INT IDENTITY PRIMARY KEY NOT NULL,
  nombres VARCHAR(100),
  apellidos VARCHAR(100),
  edad INT,
  fono INT,
  email VARCHAR(50),
  direccion VARCHAR(200),
  sexo VARCHAR(10)
);

CREATE TABLE materias
(
  id_mat INT IDENTITY PRIMARY KEY  NOT NULL,
  nombre_mat VARCHAR(100),
  cod_mat VARCHAR(100)
);

CREATE TABLE inscripcion
(
  id_ins INT IDENTITY PRIMARY KEY NOT NULL,
  id_est INT NOT NULL,
  id_mat INT NOT NULL,
  semestre VARCHAR(20),
  gestion INT,
  FOREIGN KEY (id_est) REFERENCES estudiantes (id_est),
  FOREIGN KEY (id_mat) REFERENCES materias (id_mat)
);

INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Samuel' ,'Gonzales Veliz', 20, 2832115, 'samuel@gmail.com', 'Av. 6 de Agosto', 'masculino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Carla' ,'Mavir Uria', 25, 2832116, 'carla@gmail.com', 'Av. 6 de Agosto', 'femenino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Roberto' ,'Adubiri Mondar', 30, 2832117, 'robert@gmail.com', 'Av. 6 de Agosto', 'masculino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Ximena' ,'Arias Ballesteros', 21, 2832118, 'ximena@gmail.com', 'Av. 6 de Agosto', 'femenino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Saul' ,'Montes Valenzuela', 24, 2832119, 'saul@gmail.com', 'Av. 6 de Agosto', 'masculino');

INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Introduccion a la Arquitectura','ARQ-101');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Urbanismo y Diseno','ARQ-102');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Dibujo y Pintura Arquitectonico','ARQ-103');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Matematica discreta','ARQ-104');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Fisica Basica','ARQ-105');

INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (1, 1, '1er Semestre', 2015);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (1, 2, '2do Semestre', 2015);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (2, 4, '1er Semestre', 2016);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (2, 3, '2do Semestre', 2016);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (3, 3, '2do Semestre', 2017);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (3, 1, '3er Semestre', 2017);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (4, 4, '4to Semestre', 2017);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (5, 5, '5to Semestre', 2017);

SELECT* FROM estudiantes

--manejo de consultas
select est.*
from estudiantes as est;

select mat.nombre_mat as 'Nombre de la materia', mat.cod_mat as 'Codigo de la materia'
from materias as mat;

select nombre_mat, cod_mat
from materias

--mostrar el nombre, apellido y edad de los estudiantes
select est.nombres, est.apellidos, est.edad
from estudiantes as est;

--mostrar el nombre, apellido y edad de los estudiantes mayores a 23 anhos
select est.nombres, est.apellidos, est.edad
from estudiantes as est
where est.edad>23;

--menores a 25 anos de edad sin mostrar edad
select est.nombres, est.apellidos
from estudiantes as est
where est.edad<25;

--and muestra un registro cuando la primera y la segunda condicion se cumple
--or muestra un registro cuando se cumple la primera condicion Ó la segunda

--verificar si el estudiante saul montes valenzuela esta inscrito
select est.*
from estudiantes as est
where est.nombres ='Saul' and est.apellidos ='Montes Valenzuela'

select est.*
from estudiantes as est
where est.nombres ='Saul' OR est.apellidos ='Montes Valenzuela'
-- verificar si esta inscrito el estudiante saul montes
select est.*
from estudiantes as est
where est.nombres ='Saul' and est.apellidos Like 'Montes%'

-- el uso de like nos permite la busqueda flexible
select est.*
from estudiantes as est
where  est.apellidos Like '%balle%'

--mostrar los estudiantes donde su apellido empiece con la letra M y adicionalmente verfificar si son mayores a 22 años
select est.*
from estudiantes as est
where  est.apellidos Like 'M%' and est.edad>22;

--seleccionar todos los estudiantes (nombres y a apellidos)
--inscritos en la gestion 2017 o en la gestion 2015

-- identificar tablas que tengo que acceder estudiantes y inscripcion
-- verificar si estan relacionadas

select est.nombres, est.apellidos, ins.gestion
from inscripcion as ins
  inner join estudiantes as est on ins.id_est = est.id_est
where ins.gestion = 2017 OR ins.gestion = 2015;

--mostra el nombre del estudiante inscrito en el 4to smemestre
select est.nombres, ins.semestre
from inscripcion as ins
  inner join estudiantes as est on ins.id_est = est.id_est
where ins.semestre = '4to Semestre'

--crear cosnulta para mostrar ximena arias

select est.*
from estudiantes as est
where est.nombres ='Ximena'

-- edad mayor a 23
select est.nombres, est.apellidos, est.edad
from estudiantes as est
where est.edad>23;

select est.nombres, est.apellidos
from estudiantes as est
where  est.apellidos Like '%ma%'

select est.*
from estudiantes as est
where

select est.*
from estudiantes as est
where est.edad>24




--nombres y apellidos den los estudiantes inscritos en la gestion 2016
select est.nombres, est.apellidos, ins.semestre, ins.gestion
from inscripcion as ins
  inner join estudiantes as est on ins.id_est = est.id_est
where ins.gestion = 2017

--mostrar nombres y apelldios de los estudiantes inscritos en la gestion 2017
select est.nombres , est.apellidos, ins.semestre, ins.gestion
from inscripcion as ins
inner join estudiantes as est on ins.id_est = est.id_est
where ins.gestion = 2017


--DOBLE INNER JOIN
-- Mostrar el nombre y apelldos de los estudiantes inscritos en la materia ARQ-105
select est.nombres, est.apellidos, mat.nombre_mat, mat.cod_mat
from inscripcion as ins
  inner join estudiantes as est on ins.id_est = est.id_est
inner join  materias as mat on ins.id_mat= mat.id_mat
where mat.cod_mat = 'ARQ-105'