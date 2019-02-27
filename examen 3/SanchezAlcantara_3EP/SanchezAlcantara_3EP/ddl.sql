--1 (g)Agrega las siguientes restricciones check:

--En la tabla Pacientes: para el código postal y para el teléfono celular.
ALTER TABLE pacientes ADD CONSTRAINT ck_Pacientes CHECK (codigoPostal>0);
ALTER TABLE pacientes ADD CONSTRAINT ck_Pacientes2 CHECK(celular like '04%');

--En la tabla Ingresos: para la habitación y el tipo de cama.
ALTER TABLE ingresos ADD CONSTRAINT ck_Ingresos CHECK(habitacion>0);
ALTER TABLE ingresos ADD CONSTRAINT ck_Ingresos2 CHECK(cama IN ('A','M','E','O'));

--En la tabla Médicos: para el número celular.
 ALTER TABLE medicos ADD CONSTRAINT ck_Medicos CHECK(celular like'04%');
 
--En la tabla Consultas: para el consultorio.
 ALTER TABLE consultas ADD CONSTRAINT ck_Consultas CHECK(consultorio>0);

