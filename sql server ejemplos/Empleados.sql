CREATE TABLE Empleados(
       Idempleado INT PRIMARY KEY,
       nombre VARCHAR(50),
       edad INT,
       oficina INT REFERENCES Oficinas(Idoficina),
       puesto VARCHAR(50),
       fecha_contrato DATE,
       Idjefe INT REFERENCES Jefes(Idjefe),
       cuota VARCHAR(30),
       ventas VARCHAR(30)
       --OTRA FORMA DE PONER LAS LLAVES EXTERNAS ES AL FINAL DE LA SIGUIENTE FORMA:
       --FOREIGN KEY oficina REFERENCES Oficinas(Idoficina), 
);

INSERT INTO Empleados(Idempleado,nombre,edad,oficina,puesto,fecha_contrato,Idjefe,cuota,ventas) VALUES
(105,'Bruno Ortega',37,13,'Empleado','12-02-2004',104,'$350,000','$367,911');

INSERT INTO Empleados(Idempleado,nombre,edad,oficina,puesto,fecha_contrato,Idjefe,cuota,ventas) VALUES
(109,'María Jiménez',48,21,'Empleado','12-10-2005',116,'$330,000','$392,725');

INSERT INTO Empleados(Idempleado,nombre,edad,oficina,puesto,fecha_contrato,Idjefe,cuota,ventas) VALUES
(102,'Susana Santos',52,11,'Empleado','10-12-2002',108,'$350,000','$474,050');

INSERT INTO Empleados(Idempleado,nombre,edad,oficina,puesto,fecha_contrato,Idjefe,cuota,ventas) VALUES
(106,'Samuel Clavel',33,12,'VP Ventas','14-06-2004',NULL,'$275,000','$299,912');

INSERT INTO Empleados(Idempleado,nombre,edad,oficina,puesto,fecha_contrato,Idjefe,cuota,ventas) VALUES
(104,'Bernardo Sánchez',45,12,'jefe Ventas','19-05-2004',106,'$200,000','$142,594');

INSERT INTO Empleados(Idempleado,nombre,edad,oficina,puesto,fecha_contrato,Idjefe,cuota,ventas) VALUES
(101,'Daniel Hernández',41,12,'Empleado','20-10-2004',114,'$330,000','$305,673');

INSERT INTO Empleados(Idempleado,nombre,edad,oficina,puesto,fecha_contrato,Idjefe,cuota,ventas) VALUES
(110,'Ángel Mejía',36,NULL,'Empleado','13-01-2006',101,'NULL','$75,987');

INSERT INTO Empleados(Idempleado,nombre,edad,oficina,puesto,fecha_contrato,Idjefe,cuota,ventas) VALUES
(108,'Saíd Jacob',20,12,'Jefe Ventas','12-1-2005',106,'$350,000','$361,865');

INSERT INTO Empleados(Idempleado,nombre,edad,oficina,puesto,fecha_contrato,Idjefe,cuota,ventas) VALUES
(103,'Pablo Cruz',29,11,'Empleado','01-03-2003',104,'$275,000','$286,775');

SELECT *
FROM Empleados;