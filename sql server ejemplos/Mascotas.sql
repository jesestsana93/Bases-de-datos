CREATE TABLE Mascotas(
       clave_mascota INT PRIMARY KEY,
       nombre VARCHAR(50),
       propietario VARCHAR(50),
       especie VARCHAR(50),
       sexo VARCHAR(50),
       fecha_nacimiento DATE,
       fecha_fallecimiento DATE
       --OTRA FORMA DE PONER LA LLAVE PRIMARIA ES:
       --PRIMARY KEY(nombre)
);

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7801,'Fluffy','Arnoldo','Gato','F','02/02/1999',NULL);

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7802,'Mau','Juan','Gato','M','17/03/1998',NULL);

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7803,'Buffy','Arnoldo','Perro','F','13/02/1999',NULL);

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7804,'Fanfan','Benito','Perro','M','27/08/2000',NULL);

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7805,'Kaisper','Diana','Perro','M','31/08/1998','29/07/1989');

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7806,'Chispa','Omar','Ave','F','11/02/1989',NULL);

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7807,'Bongo','Tomás','Perro','M','09/02/2000',NULL);

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7808,'Skim','Benito','Serpiente','M','29/04/2001',NULL);

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7809,'Mowgli','Ana','Perro','M','16/06/2007',NULL);

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7810,'Ruffo','Ana','Perro','M','14/02/2004',NULL);

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7811,'Luna','Ana','Gato','F','15/09/2002',NULL);

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7812,'Salo','Alma,Alma','Rata','F','01/02/2003','15/06/2007');

INSERT INTO Mascotas(clave_mascota,nombre,propietario,especie,sexo,fecha_nacimiento,fecha_fallecimiento) VALUES
(7813,'Boggie','Alma','Perro','M','22/08/2002',NULL);

--1.Muestra todos los campos de la base de datos creada
SELECT *
FROM Mascotas;

--2. Mostrar el nombre, porpietario y fecha de fallecimiento, pero solo los que no han fallecido
SELECT nombre,propietario,fecha_fallecimiento
FROM Mascotas
WHERE fecha_fallecimiento IS NULL;

--3. Mostrar el nombre,propietario y especie, pero solo las mascotas que sean de Ana o Isabel.
SELECT nombre,propietario,especie
FROM Mascotas
WHERE propietario='Ana' OR propietario='Isabel';

--4. Mostrar el nombre,propietario y especie, pero solo las mascotas que sean de Ana y Alma.
--IN comprueba si un valor se encuentra en la lista de valores posibles
SELECT nombre,propietario,especie
FROM Mascotas
WHERE propietario IN('Ana','Alma');

--5.Mostrar LAS CLAVES DE LOS ANIMATES ENTRE 7801 y 7808
SELECT *
FROM Mascotas
WHERE clave_mascota BETWEEN 7801 and 7808; 

--6.Mostrar las especies de animales que terminen con e.
SELECT *
FROM Mascotas
WHERE especie LIKE'%e';

--7.Mostrar las especies de animales que tengan alguna g en su nombre.
SELECT *
FROM Mascotas
WHERE nombre LIKE '%g%';

--8.Mostrar las especies de animales que empiecen con P.
--Nota: el uso de mayusculas y minusculas a la hora de buscar algun dato es importante(perro es distinto de Perro)
SELECT *
FROM Mascotas
WHERE especie LIKE 'P%';

--9.Mostrar las especies de animales que tengan 6 caracteres en su nombre.(_)
SELECT *
FROM Mascotas
WHERE nombre LIKE '______';

--10. Mostrar el numero total de animales en la tienda
SELECT COUNT(*)  
FROM Mascotas;

--11.Mostrar el nombre de la mascota,propietario,especie,sexo y fecha de nacimiento pero ordenados por nombre 
SELECT nombre,propietario,especie,sexo,fecha_nacimiento
FROM Mascotas
ORDER BY nombre;

--12.Mostrar el nombre de la mascota,propietario,especie,sexo y fecha de nacimiento pero ordenados por nombre descendentemente
SELECT nombre,propietario,especie,sexo,fecha_nacimiento
FROM Mascotas
ORDER BY nombre DESC;

--13.Mostrar el nombre de la mascota,propietario,especie,sexo y fecha de nacimiento pero ordenados por fecha de nacimiento
--Nota:sql por default cuando ordene una tabla lo va a ser de forma ascendente(de menor a mayor)
SELECT nombre,propietario,especie,sexo,fecha_nacimiento
FROM Mascotas
ORDER BY fecha_nacimiento;

--14.Mostrar el total de animales que hay en la tienda por especie
SELECT COUNT(especie) AS TotalAnimales,especie  --se renombra especie con AS
FROM Mascotas
GROUP BY especie;