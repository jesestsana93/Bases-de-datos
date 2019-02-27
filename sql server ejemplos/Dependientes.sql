CREATE TABLE Dependientes(
       nombre VARCHAR(20),
       rfc VARCHAR(30),
       numero_de_dependiente INT,
       ap_paterno VARCHAR(30),
       ap_materno VARCHAR(30),
       ocupacion VARCHAR(30),
       fecha_de_nacimiento DATE PRIMARY KEY,
       sexo VARCHAR(10)
);

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Patricia','AVRG800104',1,'NULL','NULL','Hogar','12-09-1955','F');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Jorge','AVRG800104',2,'NULL','NULL','Empleado','16-06-1955','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Alejandro','AATG010618A92',1,'Garza','Montes','Estudiante','30-04-1988','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Mónica','AATG010618A92',2,'Garza','Montes','Estudiante','23-05-1985','F');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Rafael','AATG010618A92',3,'Garza','Montes','NULL','03-06-2000','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Mario','ALPHGL52H4157',1,'López','Pérez','Estudiante','14-05-1992','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Juan','BCBH458KL98Ñ3',1,'Castro','Castro','Estudiante','16-06-1995','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Camila','COOL782LK5687',1,'Justo','Sierra','Estudiante','03-09-1991','F');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Carlos','COOL782LK5687',2,'Justo','Sierra','Estudiante','07-05-1995','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Mariana','DEC58UJWS1745',1,'Martínez','Campos','Estudiante','04-08-1986','F');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Raúl','DEC58UJWS1745',2,'Martínez','Campos','Estudiante','17-06-1985','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Claudia','DEC58UJWS1745',3,'Martínez','Campos','Estudiante','13-04-1982','F');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Daniel','DFYI980311MNE',1,'Ortega','Ángeles','Estudiante','07-12-1986','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Verónica','EGRU900101T87',1,'Rojas','Martínez','Estudiante','01-05-1982','F');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Laura','EGRU900101T87',2,'Rojas','Martínez','Estudiante','18-11-1989','F');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Mariana','EGRU900101T87',3,'Rojas','Martínez','Estudiante','13-01-1995','F');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Erick','EGRU900101T87',4,'Rojas','Martínez','NULL','11-06-2000','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Daniel','HJU85HE264654',1,'Herrera','De Jesús','Estudiante','15-05-1988','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Víctor','HJU85HE264654',2,'Herrera','De Jesús','Estudiante','20-05-1995','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Adrián','HJU85HE264654',3,'Herrera','De Jesús','NULL','01-01-2000','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Leonardo','LEOC85JUI7415',1,'Castro','Vázquez','Estudiante','08-03-1988','M');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Alma','LEOC85JUI7415',2,'Castro','Vázquez','Estudiante','25-12-1995','F');

INSERT INTO Dependientes(nombre,rfc,numero_de_dependiente,ap_paterno,ap_materno,ocupacion,fecha_de_nacimiento,sexo)VALUES
('Angélica','LEOC85JUI7415',3,'Castro','Vázquez','Estudiante','31-12-1997','F');

SELECT *
FROM Dependientes;



