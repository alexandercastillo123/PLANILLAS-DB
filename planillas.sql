drop database if exists planillas;
create database planillas;
use planillas;

create table Cargo(
	id int primary key auto_increment,
    Detalle char(30) unique );

create table CentroCosto(
	id int primary key auto_increment,
    Detalle char(30) unique);

create table Departamento(
	id int primary key auto_increment,
    RazonSocial char(30) unique,
    Cuenta char (10) );
    
    create table Empresa(
	id int primary key auto_increment,
    Ruc char(11) unique,
    RazonSocial char(30) unique,
    NombreComercial char(30) not null,
    Direccion char (50) not null,
    RepresentanteLegal char(50) not null,
    DniRepresentanteLegal char(8) unique,
    RegistroPatrnal char(20),
    RegimenLaboral char(7) check (RegimenLaboral in ('Privado','Público') ) );
    
    create table Sedes(
	id int primary key auto_increment,
    RazonSocial char(30) unique,
    Direccion char (50) not null,
    idDistrito int not null,
    idProvincia int not null,
    idDepartamento int not null,
    Estado char (1) not null );

create table Empleado(
	id int primary key auto_increment,
    Dni char(8) unique,
    Nombres char(30) not null,
    ApellidoPaterno char(30) not null,
    ApellidoMaterno char(30) not null,
    Direccion char(50) not null,
    idDistrito int not null,
    idProvincia int not null,
    idDepartamento int not null,
    Genero char(1) check (Genero in('M','F')),
    EstadoCivil char(1) check (Genero in('S','C','D','V')),
    
    idCargo int references Cargo(id)
    
);

-- Insert
insert Cargo(Detalle) values('Administrador'),('Cajero'),('Vendedor'),('Contador');
insert CentroCosto(Detalle) values('Producción'),('Ventas');
insert Departamento(RazonSocial) values('Almacen'),('Ventas');

/*

*/