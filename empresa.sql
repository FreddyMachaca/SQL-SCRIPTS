create database empresa;
use empresa;

create table empresa (
    nit int primary key,
    nombre varchar(20)

);

create table cliente(
    num_cliente int primary key,
    CI varchar(20),
    nombre varchar(20),

    nit int,
    foreign key (nit) references empresa (nit)
    );

create table empleados(
    num_empleados int primary key,
     CI varchar(20),
    nombre varchar(20),
    cargo varchar(20),
    salario int,

    nit int,
    foreign key (nit) references empresa (nit)
);

create table pedido(
    codigo_pedido int primary key,
    especificaciones varchar(50),
    precio_venta int,

    num_cliente int,
    foreign key (num_cliente) references cliente(num_cliente),
    num_empleados int,
    foreign key (num_empleados) references empleados(num_empleados)
);

create table producto (
    codigo_producto int primary key ,
    precio int,
    costo int,

    codigo_pedido int,
    foreign key (codigo_pedido) references pedido(codigo_pedido)
);
