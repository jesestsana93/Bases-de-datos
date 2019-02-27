-- El operador LIKE comprueba si el valor de una columna coincide con un patrón especificado, el patrón es una
-- cadena que puede incluir uno o más caracteres comodín.

--ESTRUCTURA:

-- SELECT Nombre de columna
-- FROM Nombre Tabla
-- WHERE nombre de columna LIKE '% Constante'
--								'Constante%'
--								'%Constante%'

SELECT *
FROM Personas

SELECT nombre,[calle_y_numero],municipio
FROM Personas
WHERE [calle_y_numero] LIKE 'av.%';

SELECT nombre,[calle_y_numero],municipio
FROM Personas
WHERE [calle_y_numero] LIKE '%Carmelo Pérez%';

SELECT *
FROM Productos
-----------TABLA PRODUCTOS-------------

--Mostrar todas las descripciones que terminen con la palabra cable
SELECT descripcion
FROM Productos
WHERE descripcion LIKE '%cable';

--Mostrar todos los productos que inicien con la palabra serie
SELECT descripcion
FROM Productos
WHERE descripcion LIKE 'Serie%';

--Mostrar todos los Idfabricante que inicien con el número 4
SELECT Idfabricante,Idproducto
FROM Productos
WHERE Idproducto LIKE '4%';


SELECT *
FROM Clientes;
----------TABLA CLIENTES---------------

--Mostrar las empresas que inician con la letra H
SELECT empresa
FROM Clientes
WHERE empresa LIKE 'H%';

--Mostrar los clientes que estan en una empresa que termina con la palabra S.A
SELECT Idcliente,empresa
FROM Clientes
WHERE empresa LIKE '%S.A.';