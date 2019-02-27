--Creación de la tabla de Pacientes
create table pacientes( 
idpaciente number,
nombre varchar(50) not null,
apellidos varchar(50) not null,
direccion varchar(100),
codigoPostal char(5) not null,
estado varchar(50) not null,
celular varchar(14),
fechaNacimiento date not null,
constraint pacientes_pk primary key(idpaciente)
);

/*******************************************************************/
--Creación de la tabla Medicos
create table medicos(
idMedico number,
nombre varchar(50) not null,
apellidos varchar(50) not null,
celular varchar(14) not null,
constraint medicos_pk primary key(idMedico)
);

/***********************************************************************/
--Creación de la tabla Especialidades
create table especialidades(
idEspecialidad number,
especialidad varchar(50) not null,
constraint especialidades_pk primary key(idEspecialidad)
);

/************************************************************************/
--Creación de la tabla MedicosEspecialidades
create table medicosEspecialidades(
idEspecialidad number not null, 
idMedico number not null, 
constraint medicosesp_pk primary key (idEspecialidad,idMedico),
constraint medicosesp_esp_fk foreign key (idEspecialidad) 
           references Especialidades(idEspecialidad),
constraint medicosesp_med_fk foreign key(idMedico)
           references Medicos(idMedico)
);

/**********************************************************************/
--Creacion de la tabla Ingresos
create table ingresos(
numIngreso number,
idpaciente number not null,
idmedico number not null,
habitacion int not null,
cama char(1) not null,
fechaIngreso timestamp not null,
constraint ingresos_fk foreign key(idPaciente) 
           references Pacientes(idPaciente)
);

/************************************************************************/
--Creación de la tabla Consultas
create table consultas(
idConsulta  number,
idMedico number not null,
idPaciente number not null,
consultorio int not null,
fechaConsulta date not null,
constraint consultas_pk primary key(idConsulta),
constraint consultas_pac_fk foreign key (idPaciente) 
           references Pacientes(idPaciente),
constraint consultas_med_fk foreign key(idMedico)
           references Medicos(idMedico)
);

/****DISPARADORES PARA CREAR LOS CAMPOS DE TIPO AUTOINCREMENTAL*****/
--Creación de la secuencia para simular el campo AUTOINCREMENTAL para PACIENTES
create sequence seq_idpaciente 
start with 1 
increment by 1
nomaxvalue; 

--Creación del TRIGGER para que la inserción sea automática
create or replace trigger trig_pacientes
before insert on pacientes
for each row
begin
select seq_idpaciente.nextval into :new.idPaciente from dual;
end;

--Creación de la secuencia para simular el campo AUTOINCREMENTAL para MEDICOS
create sequence seq_idmedicos 
start with 1
increment by 1
nomaxvalue;

--Creación del TRIGGER para que la inserción sea automática
create or replace trigger trig_medicos
before insert on medicos
for each row
begin
select seq_idmedicos.nextval into :new.idMedico from dual;
end;

--Creación de la secuencia para simular el campo AUTOINCREMENTAL para ESPECIALIDAD
create sequence seq_idespecialidad
start with 1
increment by 1
nomaxvalue;

--Creación del TRIGGER para que la inserción sea automática
create or replace trigger trig_especialidades
before insert on especialidades
for each row
begin
select seq_idespecialidad.nextval into :new.idEspecialidad from dual;
end;

--Creación de la secuencia para simular el campo AUTOINCREMENTAL para INGRESOS
create sequence seq_numIngreso
start with 1
increment by 1
nomaxvalue;

--Creación del TRIGGER para que la inserción sea automática
create or replace trigger trig_ingresos
before insert on ingresos
for each row
begin
select seq_numIngreso.nextval into :new.numIngreso from dual;
end;

--Creación de la secuencia para simular el campo AUTOINCREMENTAL para CONSULTAS
create sequence seq_idconsulta
start with 1 
increment by 1 
nomaxvalue; 

--Creación del TRIGGER para que la inserción sea automática
create or replace trigger trig_consultas
before insert on consultas
for each row
begin
select seq_idconsulta.nextval into :new.idConsulta from dual;
end;