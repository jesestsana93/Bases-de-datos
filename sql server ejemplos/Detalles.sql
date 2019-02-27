CREATE TABLE Detalles(
       RFC VARCHAR(30) PRIMARY KEY,
       grado VARCHAR(30),
       titulo VARCHAR(20),
       dependientes INT,
       ocupacion VARCHAR(30),
       ingreso VARCHAR(30),
       fecha_de_registro DATE,
       fecha_de_registro_final DATE
       
);

--INSERCION DE DATOS A LA TABLA Detalles
INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('TTTT000115TTT','Profesional','INA',2,'Maestra','$15,000','01-01-2001','01-12-2001');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('NCHT910610QW','Profesional','INA',2,'Empresario','$56,000','01-01-2001','01-12-2001');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('LACL840726R76','Profesional','INA',3,'Coordinador','$32,000','01-01-2001','01-12-2001');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('DFYI980311MNE','Maestría','LGR',1,'Maestra','$25,000','01-01-2001','01-12-2001');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('AATG010618A92','Doctorado','LAE',3,'Empresario','$40,900','01-01-2001','01-12-2001');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('EGRU900101T87','Doctorado','LSCA',4,'Empresario','$70,000','01-01-2001','01-12-2001');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('ALPHGL52H4157','Doctorado','LSCA',2,'Gerente comercial','$12,500','01-01-2001','01-12-2001');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('BCBH458KL98Ñ3','Carrera trunca','TES',1,'Maestro','$18,000','01-03-2001','31-03-2002');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('COOL782LK5687','Doctorado','LSCA',2,'Director general','$50,000','01-03-2001','31-03-2002');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('DEC58UJWS1745','Profesional','LTC',3,'Diseñador gráfico','$18,000','01-03-2001','31-03-2002');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('HCLZ14LAS1536','Maestría','LGR',2,'Empresario','$38,000','01-03-2001','31-03-2002');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('HJU85HE264654','Carrera trunca','TES',3,'Maestro','$28,000','01-03-2001','31-03-2002');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('JEFEBO475826N','Doctorado','LSCA',0,'Consultor','$70,000','01-03-2001','31-03-2002');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('KAPHJ5258J879','Profesional','LTC',1,'Maestra','$36,000','15-06-2001','30-06-2002');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('LEOC85JUI7415','Doctorado','LAE',4,'Supervisor','$70,000','15-06-2001','30-06-2002');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('MAGA4587HY129','Carrera trunca','TES',0,'Maestra','$22,000','15-06-2001','30-06-2002');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('MDJZKI4587Y89','Profesional','LTC',1,'Gerente de RH','$40,000','15-06-2001','30-06-2002');

INSERT INTO Detalles(RFC,grado,titulo,dependientes,ocupacion,ingreso,fecha_de_registro,fecha_de_registro_final) VALUES
('MELB859JKU785','Maestria','LRH',1,'Gerente de RH ','$37,000','20-10-2001','30-11-2002');

--CONSULTAS

SELECT *
FROM Detalles;
