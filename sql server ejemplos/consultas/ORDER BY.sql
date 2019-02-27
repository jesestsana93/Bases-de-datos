--La cláusula ORDER BY va seguida de una lista de especificaciones de orden separadas por comas.Automáticamente
--establece un orden ascendente de la columna asignada, sin embargo para especificar que se quiere en orden
--descendente se pone DESC

--SINTAXIS
-- SELECT Nombre de columna
-- FROM Nombre Tabla
-- ORDER BY campo, campo ASC
--						 DESC

SELECT Idoficina,ciudad,region
FROM Oficinas
ORDER BY Ciudad;

-------------TABLA PEDIDOS-------------
SELECT *
FROM Pedidos;

--Ordenar la columna Cliente de manera descendente
SELECT Idpedido,Idcliente
FROM Pedidos
ORDER BY Idcliente DESC;

--Ordenar la columna Cantidad de manera ascendente
SELECT Idpedido,cantidad
FROM Pedidos
ORDER BY cantidad;

--Ordenar la columna Fabricante de manera descendente
SELECT Idpedido,Idfabricante
FROM Pedidos
ORDER BY Idfabricante DESC;

--Ordenar la columna Importe de manera ascendente
SELECT Idpedido,importe
FROM Pedidos
ORDER BY importe;

--------------------TABLA EMPLEADOS----------------------
SELECT *
FROM Empleados;

--Ordenar la columnas Puesto y Jefe de manera ascendente
SELECT Idempleado,puesto,Idjefe
FROM Empleados
ORDER BY puesto,Idjefe ASC;

--Ordenar la columnas Puesto y Jefe de manera descendente
SELECT Idempleado,puesto,Idjefe
FROM Empleados
ORDER BY puesto DESC,Idjefe DESC;

--Ordenar la columnas Nombre y Edad de manera ascendente
SELECT Idempleado,nombre,edad
FROM Empleados
ORDER BY nombre ASC,edad ASC;

--Ordenar la columnas Nombre y Edad de manera descendente
SELECT Idempleado,nombre,edad
FROM Empleados
ORDER BY nombre DESC,edad DESC;

