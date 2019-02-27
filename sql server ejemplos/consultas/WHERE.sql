-- La cláusula WHERE consiste en una condición de búsqueda que especifica las filas a recuperar,
-- si la condición es un valor alfanumérico, se requiere de una comilla sencilla(´), 
--si es un valor numérico no la requiere.

--ESTRUCTURA
-- SELECT Nombre de columna
-- FROM Nombre Tabla
-- WHERE condición

SELECT Idoficina,ciudad,region
FROM Oficinas
WHERE region='oeste';

-- La condición esta acompañada por los siguientes operadores: =, < >,<, >, <=, >=
SELECT *
FROM Oficinas
WHERE Idoficina = 22;

SELECT *
FROM Oficinas
WHERE Idoficina <> 22;

SELECT *
FROM Oficinas
WHERE Idoficina < 22;

SELECT *
FROM Oficinas
WHERE Idoficina > 22;

SELECT *
FROM Oficinas
WHERE Idoficina <= 22;

SELECT *
FROM Oficinas
WHERE Idoficina >= 22;

SELECT *
FROM Oficinas

-----------TABLA OFICINAS------------
--Listar las oficinas de la region Este
SELECT Idoficina,ciudad,region
FROM Oficinas
WHERE region='este';

--Listar las oficinas con ventas mayores a $500,000
SELECT Idoficina,ciudad,ventas
FROM Oficinas
WHERE ventas>'$500000';

--Listar las oficinas con objetivos menores o iguales a $500,000
SELECT Idoficina,ciudad,objetivo
FROM Oficinas
WHERE objetivo <= '$500000';

--Listar las oficinas de la region Oeste
SELECT Idoficina,ciudad,region
FROM Oficinas
WHERE region='oeste';

--Listar las oficinas de la ciudad de Navarra
SELECT Idoficina,ciudad
FROM Oficinas
WHERE ciudad='Navarra';