USE MASTER
--CREANDO BASE DE DATOS
CREATE DATABASE BD_escuela
USE BD_escuela
GO
--CREANDO TABLAS

--TABLA ESTADO
create table Estado
(
	id_Estado int IDENTITY(1,1),
	estado varchar(20) not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_estado PRIMARY KEY(id_Estado)
);

INSERT INTO Estado(estado) VALUES('activo'),('inactivo');

--TABLA Nivel
CREATE TABLE Nivel
(
	id_Nivel int IDENTITY(1,1),
	nombreNivel varchar(20) not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_nivel PRIMARY KEY(id_Nivel)
);
INSERT INTO Nivel(nombreNivel) VALUES('administrador'),('profesor');

--TABLA SEXO
CREATE TABLE Sexo
(
	id_Sexo int IDENTITY(1,1),
	nombreSexo varchar(20) not null,
	--LLAVE PRIMARIA
	CONSTRAINT id_Sexo PRIMARY KEY(id_Sexo)
);
INSERT INTO Sexo(nombreSexo) VALUES('M'),('F');

--TABLA PROFESOR
create table Profesor
(
	id_Profesor int IDENTITY(1,1),
	DUI varchar(20) not null,
	NIT varchar(20) not null,
	nombreProfesor varchar(50) not null,
	apellidoProfesor varchar(50) not null,
	edadProfesor int not null,
	direccionProfesor varchar(100) not null,
	telefonoProfesor varchar(10) not null,
	correoProfesor varchar(150) not null,
	fechaNacProfesor date not null,
	fotoPerfilProfesor varchar(200) not null,
	numeroEscalafon varchar(20) not null,
	id_Nivel int not null,
	id_Sexo int not null,
	id_Estado int not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_Profesor PRIMARY KEY(id_Profesor),
	--LLAVES SECUNDARIAS
	CONSTRAINT fk_profesor_nivel FOREIGN KEY(id_Nivel) REFERENCES Nivel(id_Nivel),
	CONSTRAINT fk_profesor_sexo FOREIGN KEY(id_Nivel) REFERENCES Sexo(id_Sexo),
	CONSTRAINT fk_profesor_estado FOREIGN KEY(id_Estado) REFERENCES Estado(id_Estado)
);

INSERT INTO Profesor(DUI,NIT,nombreProfesor,apellidoProfesor,edadProfesor,direccionProfesor,telefonoProfesor,correoProfesor,fechaNacProfesor,fotoPerfilProfesor,numeroEscalafon,id_Nivel,id_Sexo,id_Estado) VALUES('11425','5555','Juan','Perez',15,'San Salvador','77777','correo','01/01/2000','fotosUsuarios\\JuanPerez11425.png','555',1,1,1);
INSERT INTO Profesor(DUI,NIT,nombreProfesor,apellidoProfesor,edadProfesor,direccionProfesor,telefonoProfesor,correoProfesor,fechaNacProfesor,fotoPerfilProfesor,numeroEscalafon,id_Nivel,id_Sexo,id_Estado) VALUES('23223','3222','Pedro','Diaz',15,'San Miguel','33333','correo','01/01/1990','fotosUsuarios\\PedroDiaz11425.png','444',2,1,1)
select * from profesor	


--TABLA USUARIO
CREATE TABLE Usuario
(
	id_Usuario int IDENTITY(1,1),
	usuario varbinary(255) not null,
	contra varbinary(MAX) not null,
	id_Profesor int not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_Usuario PRIMARY KEY(id_Usuario)
);
INSERT INTO Usuario(usuario,contra,id_Profesor) VALUES( CAST('admin' AS VARBINARY(MAX)),CAST('123' AS VARBINARY(MAX)),1)
INSERT INTO Usuario(usuario,contra,id_Profesor) VALUES( CAST('profesor' AS VARBINARY(MAX)),CAST('123' AS VARBINARY(MAX)),2)

select * from Usuario
--TABLA ALUMNO
create table Alumno
(
	id_Alumno int IDENTITY(1,1),
	numPartida varchar(20) not null,
	NIE varchar(20) not null,
	nombreAlumno varchar(50) not null,
	apellidoAlumno varchar(50) not null,
	edadAlumno int not null,
	direccionAlumno varchar(100) not null,
	telefonoAlumno varchar(10) not null,
	fechaNacAlumno date not null,
	NombrePapaAlumno varchar(100) not null,
	NombreMamaAlumno varchar(100) not null,
	NombreEncargadoAlumno varchar(100) not null,
	fotoAlumno varchar(200) not null,
	id_Sexo int not null,
	id_Estado int not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_alumno PRIMARY KEY(id_Alumno),
	--LLAVES SECUNDARIAS
	CONSTRAINT fk_alumno_sexo FOREIGN KEY(id_Sexo) REFERENCES Sexo(id_Sexo),
	CONSTRAINT fk_alumno_estado FOREIGN KEY(id_Estado) REFERENCES Estado(id_Estado)
);

INSERT INTO Profesor(DUI,NIT,nombreProfesor,apellidoProfesor,edadProfesor,direccionProfesor,telefonoProfesor,correoProfesor,fechaNacProfesor,fotoPerfilProfesor,numeroEscalafon,id_Nivel,id_Sexo,id_Estado) VALUES('11425','5555','Juan','Perez',15,'San Salvador','77777','correo','01/01/2000','fotosUsuarios\\JuanPerez11425.png','555',1,1,1);

--TABLA MATERIA
create table Materia
(
	id_Materia int IDENTITY(1,1),
	nombreMateria varchar(20) not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_materia PRIMARY KEY(id_Materia)
);

--TABLA GRADO
create table Grado
(
	id_Grado int IDENTITY(1,1),
	nombreGrado varchar(20) not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_grado PRIMARY KEY(id_Grado)
);

--TABLA SECCION
create table Seccion
(
	id_Seccion int IDENTITY(1,1),
	Seccion varchar(20) not null,
	--LLAVE PRIMARIA
	CONSTRAINT pk_seccion PRIMARY KEY(id_Seccion)
);

--TABLA Grupo
create table Detalle_Grado_Seccion
(
	id_Detalle_Grado_Seccion int IDENTITY(1,1),
	id_Grado int not null,
	id_Seccion int not null,
	id_ProfesorEncargado int not null,
	anioEscolar varchar(10) not null,
	--LLAVES PRIMARIA
	CONSTRAINT pk_detalle_grado_seccion PRIMARY KEY(id_Detalle_Grado_Seccion),
	--LLAVES SECUNDARIAS
	CONSTRAINT fk_detalle_grado FOREIGN KEY(id_Grado) REFERENCES Grado(id_Grado),
	CONSTRAINT fk_detalle_seccion FOREIGN KEY(id_Seccion) REFERENCES Seccion(id_Seccion),
	CONSTRAINT fk_detalle_profesor FOREIGN KEY(id_ProfesorEncargado) REFERENCES Profesor(id_Profesor)
);

--TABLA REGISTRO_ALUMNO
create table Registro_Alumno
(
	id_Detalle_Grado_Seccion int not null,
	id_Alumno int not null,
	--LLAVES SECUNDARIAS
	CONSTRAINT fk_registroAlumno_detalleSeccion FOREIGN KEY(id_Detalle_Grado_Seccion) REFERENCES Detalle_Grado_Seccion(id_Detalle_Grado_Seccion),
	CONSTRAINT fk_registroAlumno_alumno FOREIGN KEY(id_Alumno) REFERENCES Alumno(id_Alumno)
);

--TABLA CURSO
create table Curso
(
	id_Curso int IDENTITY(1,1),
	id_Detalle_Grado_Seccion int not null,
	id_Materia int not null,
	id_Profesor int not null,
	--LLAVES PRIMARIA
	CONSTRAINT pk_curso PRIMARY KEY(id_Curso),
	--LLAVES SECUNDARIAS
	CONSTRAINT fk_detalleMateria_detalleSeccion FOREIGN KEY(id_Detalle_Grado_Seccion) REFERENCES Detalle_Grado_Seccion(id_Detalle_Grado_Seccion),
	CONSTRAINT fk_detalleMateria_materia FOREIGN KEY(id_Materia) REFERENCES Materia(id_Materia),
	CONSTRAINT fk_detalleMateria_profesor FOREIGN KEY(id_Profesor) REFERENCES Profesor(id_Profesor)
);

--CONSTRAINTS EN LA TABLA ALUMNO
--Sería mejor hacer las restricciones directamente en las tablas
ALTER TABLE Alumno
ADD CONSTRAINT U_numPartida UNIQUE (numPartida)

ALTER TABLE Alumno
ADD CONSTRAINT U_NIE UNIQUE (NIE)

ALTER TABLE Alumno
	ADD CONSTRAINT CK_fechaNac
	CHECK (fechaNacAlumno<getdate());
	GO

ALTER TABLE Alumno
ADD CONSTRAINT CK_edad
CHECK (edadAlumno>=4)



--CONSTRAINTS TABLA DETALLE_GRADO_SECCION
ALTER TABLE Detalle_Grado_Seccion
	ADD CONSTRAINT CK_anioEscolar
	CHECK (anioEscolar<year(getdate()));
	GO

--CONSTRAINTS EN LA TABLA PROFESOR
ALTER TABLE Profesor
ADD CONSTRAINT U_NIT UNIQUE (NIT)

ALTER TABLE Profesor
ADD CONSTRAINT U_DUI UNIQUE (DUI)

ALTER TABLE Profesor
ADD CONSTRAINT U_numE UNIQUE (numeroEscalafon)
GO

--PROCEDIMIENTOS ALMACENADOS
--MOSTRAR NIVEL
create proc ps_mostrar_nivel_usuario
(@usuario varchar(100),
@contra varchar(100))
as
begin try
begin tran
SELECT id_Nivel, P.id_Profesor,P.nombreProfesor FROM Profesor P 
INNER JOIN Usuario U ON p.id_Profesor = U.id_Profesor 
WHERE U.usuario = CAST(@usuario AS VARBINARY(100)) AND contra =  CAST(@contra AS VARBINARY(100)) AND id_Estado = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar id_profesor
create proc ps_mostrar_id_profesor
(@usuario varchar(100),
@contra varchar(100))
as
begin try
begin tran
SELECT P.id_Profesor FROM Profesor P 
INNER JOIN Usuario U ON p.id_Profesor = U.id_Profesor 
WHERE U.usuario = CAST(@usuario AS VARBINARY(100)) AND contra =  CAST(@contra AS VARBINARY(100)) AND id_Estado = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar NombreProfesor
create proc ps_mostrar_nombre_profesor
(@usuario varchar(100),
@contra varchar(100))
as
begin try
begin tran
SELECT P.nombreProfesor, P.apellidoProfesor FROM Profesor P 
INNER JOIN Usuario U ON p.id_Profesor = U.id_Profesor 
WHERE U.usuario = CAST(@usuario AS VARBINARY(100)) AND contra =  CAST(@contra AS VARBINARY(100)) AND id_Estado = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar FotoProfesor
create proc ps_mostrar_foto_profesor
(@usuario varchar(100),
@contra varchar(100))
as
begin try
begin tran
SELECT P.fotoPerfilProfesor FROM Profesor P 
INNER JOIN Usuario U ON p.id_Profesor = U.id_Profesor 
WHERE U.usuario = CAST(@usuario AS VARBINARY(100)) AND contra =  CAST(@contra AS VARBINARY(100)) AND id_Estado = 1
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar Alumnos
create proc ps_mostrar_alumnos
as
begin try
begin tran
SELECT * FROM Alumno
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Insertar grado
create proc ps_insertar_grado
@nombreGrado varchar(20)
as
begin try
begin tran
	INSERT INTO grado (nombreGrado) VALUES(@nombreGrado)
commit
end try
begin catch
rollback
print error_message()
end catch;
GO


--Modificar grado
create proc ps_modificar_grado
(@idGrado int, 
@nombreGrado varchar(20))
as
begin try
begin tran
	update grado set nombreGrado=@nombreGrado
	where id_Grado=@idGrado
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Eliminar grado
create proc ps_eliminar_grado
@idGrado int
as
begin try
begin tran
	delete from grado where id_Grado=@idGrado
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar Grados
create proc ps_mostrar_grados
as
begin try
begin tran
SELECT id_Grado as [Num], nombreGrado as [Grado] FROM Grado
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

--Mostrar Grados
create proc ps_buscar_grados
@nombreGrado varchar(20)
as
begin try
begin tran
SELECT id_Grado as [Num], nombreGrado as [Grado] FROM Grado
WHERE nombreGrado LIKE ('%'+@nombreGrado+'%')
commit
end try
begin catch
rollback
print error_message()
end catch;
GO

