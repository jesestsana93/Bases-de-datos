-- La cl�usula WHERE consiste en una condici�n de b�squeda que especifica las filas a recuperar,
-- si la condici�n es un valor alfanum�rico, se requiere de una comilla sencilla(�), 
--si es un valor num�rico no la requiere.

--ESTRUCTURA
-- SELECT Nombre de columna
-- FROM Nombre Tabla
-- WHERE condici�n

SELECT Idoficina,ciudad,region
FROM Oficinas
WHERE region='oeste';

-- La condici�n esta acompa�ada por los siguientes operadores: =, < >,<, >, <=, >=
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