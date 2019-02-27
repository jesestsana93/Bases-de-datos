--Entidades Fuertes:
CREATE TABLE Empleado(
	CURP varchar(18) PRIMARY KEY,	
	nombre varchar(40),
	paterno varchar(40),
	materno varchar(40),
    f_nac date,
	calle varchar(256),
	num integer,
	ciudad varchar(256),
	CP integer
);

CREATE TABLE Empresa(
	RFC varchar(13) PRIMARY KEY,
	razon_social varchar(256),
	calle varchar(256),
	num integer,
	ciudad varchar(256),
	CP integer
);

CREATE TABLE Proyecto(
	numProy integer PRIMARY KEY,
	fecha_inicio date,	
	fecha_fin date,
	Nombre varchar(256)	
);

--Relaciones entre entidades:

-- Muchos empleados trabajan en muchas empresas.
CREATE TABLE Trabajar(
	CURP varchar(18) ,
	RFC varchar(10),
	fecha_ingreso date,
	salario integer	
);


-- Un empleado dirige a una empresa.
CREATE TABLE Dirigir(
	CURP varchar(18),
	RFC varchar(10),
	fecha_inicio date
);

--Un supervisor tiene muchos supervisados.
CREATE TABLE Supervisar(
	CURP_supervisor varchar(18) ,
	CURP_supervisado varchar(18) 
);

--Un empleado colabora en muchos proyectos.
CREATE TABLE Colaborar(
	CURP varchar(18),
	numProy integer,
	fecha_inicio date,
	fecha_fin date,
	numHoras integer
);


--Llaves foraneas.
ALTER TABLE Persona_Direccion ADD CONSTRAINT fk_Persona_Direccion  FOREIGN KEY(nIdEmpleado) REFERENCES Persona(nidPersona);

-- ALTER TABLE nombreDeLaTabla ADD CONSTRAINT nombreDeLaLlave FOREIGN KEY(nombreDelAtributoEnLaTabla) REFERENCES tablaDeLaPK(atributoPK);
ALTER TABLE Trabajar ADD CONSTRAINT fk_Trabajar_CURP_supervisor FOREIGN KEY(CURP_supervisor) REFERENCES Empleado(CURP);
ALTER TABLE Trabajar ADD CONSTRAINT fk_Trabajar_CURP_supervisado FOREIGN KEY(CURP_supervisado) REFERENCES Empleado(CURP);


--Restricciones de integridad
ALTER TABLE Empleado ADD CONSTRAINT ck_Empleado CHECK(CURP<=18 AND CURP like'[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][H-M][A-Z][A-Z][A-Z][A-Z][A-Z][0-9][0-9]');
ALTER TABLE Colaborar ADD CONSTRAINT unq_Colaborar UNIQUE(numProy);
ALTER TABLE Trabajar ADD CONSTRAINT ck_Trabajar CHECK(salario>0);
ALTER TABLE Colaborar ADD CONSTRAINT ck_Colaborar CHECK(numHoras>0);
