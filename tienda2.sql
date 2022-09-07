create database tienda2
use tienda2

create table cliente
(
id_cliente varchar(20) primary key,
nombres_Apellido varchar(50),
Ci varchar(15),
direccion varchar(80),
)

drop table cliente

create table venta
(
    id_venta varchar(20) primary key,
    fecha varchar(20),
    monto_final varchar(20),

)

create table producto
(
    id_producto varchar(20) primary key,
    nombre_producto varchar(30),
    precio varchar(15),
    cantidad varchar(10),


)

create table categoria
(
    id_categoria varchar(20) primary key,
    nombre_categoria varchar(30),
    descripcion varchar(50),

)

create table proveedor
(
    id_proveedor varchar(20) primary key,
    nombre_proveedor varchar(40),
    Telefono int,
    direccion_proveedor varchar(50),


)

create table vendedor
(
    id_vendedor varchar(20) primary key,
    nombre_vendedor varchar(30),
    usuario varchar(20),
    Contrasena varchar(20),
)

insert into  vendedor values ('User1','Daniel Orivaldo','admin','admin')