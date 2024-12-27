

CREATE TABLE carrera (
	idCarrera INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    PRIMARY KEY (idCarrera)
    );
create table instructor (
	idInstructor int not null auto_increment,
    cedulaIdentidad varchar(20) not null,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    fechaNacimiento date not null,
    fechaIncorporacion date,
    primary key (idInstructor)
    );
    
create table cohorte (
	idCohorte int not null auto_increment,
    codigo varchar(20) not null,
    idCarrera int not null,
    idInstructor int not null,
    fechaInicio date,
    fechaFinalizacion date,
    primary key (idCohorte),
    foreign key (idCarrera) references carrera (idCarrera),
    foreign key (idInstructor) references instructor (idInstructor)
    );
create table alumno (
	idAlumno int not null auto_increment,
    cedulaIdentidad varchar(50),
    nombre varchar(49) not null,
    apellido varchar(50) not null,
    fechaNacimiento date not null,
    fechaIngreso date,
    idCohorte int,
    primary key (idAlumno),
    foreign key (idCohorte) references cohorte( idCohorte)
    );