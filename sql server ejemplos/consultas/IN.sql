--Esta cláusula consiste en una condición que define el valor a comprobar y las filas a recuperar.

--ESTRUCTURA
-- SELECT Nombre de columna
-- FROM Nombre Tabla
-- WHERE nombre de columna IN (constante, constante..)

SELECT Idoficina,ciudad,region
FROM Oficinas
WHERE ciudad IN('Daimiel','Navarra');

SELECT *
FROM Empleados
-----------TABLA EMPLEADOS----------
--Mostrar los nombres de Susana Santos y Samuel Clavel
SELECT Idempleado,nombre
FROM Empleados 
WHERE nombre IN('Susana Santos', 'Samuel Clavel');

--Mostrar los jefes 106,104 y 108
SELECT Idempleado,Idjefe,nombre
FROM Empleados
WHERE Idjefe IN(106,104,108);

SELECT *
FROM Pedidos
-----------TABLA PEDIDOS-------------
--Mostrar las cantidades de 10,1 y 3
SELECT Idpedido,cantidad
FROM Pedidos
WHERE cantidad IN (10,1,3);

--Mostrar los empleados 106,101 y 108
SELECT Idpedido,Idempleado
FROM Pedidos
WHERE Idempleado IN(106,101,108);