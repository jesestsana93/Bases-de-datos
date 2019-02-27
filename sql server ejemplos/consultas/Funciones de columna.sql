--Una función de columna toma los datos de ésta como rango de valores y produce un único resultado.

--SINTAXIS:
-- SELECT NOMBRE FUNCION(Nombre columna)
-- FROM Nombre tabla

--FUNCIONES:
--SUM: calcula la suma de los valores de una columna

SELECT SUM(objetivo)
FROM Oficinas;

--Con la palabra reservada AS podemos asignar un nuevo nombre de columna a la columna resultante que nos dio
--la funcion
SELECT SUM(objetivo) AS TotalObjetivo
FROM Oficinas;

--AVG: calcula el promedio de una columna.Los datos de la columna deberán tener un tipo de dato numérico
SELECT AVG(ventas)
FROM Oficinas;

--MIN: halla en un conjunto de valores de una columna el menor valor
SELECT MIN(Idjefe)
FROM Oficinas;

--MAX: halla en un conjunto de valores de una columna el mayor valor
SELECT MAX(Idjefe)
FROM Oficinas;

--COUNT: cuenta el número de valores que contiene una columna sin importar el tipo de dato que esté contenido
--en dicha columna. COUNT no cuenta los registros que tienen campos NULL a menos que se agregue el carácter 
--comodín asterisco(*).
SELECT COUNT(ventas) AS Totalventas
FROM Oficinas;

------------TABLA PEDIDOS---------------
SELECT *
FROM Pedidos;

--Calcular el valor con importe mínimo
SELECT MIN(importe)
FROM Pedidos;

--Calcular el total de los importes
SELECT COUNT(importe)
FROM Pedidos;

--Calcular el valor máximo de las cantidades
SELECT MAX(cantidad)
FROM Pedidos;

--Calcular el valor promedio de las cantidades
SELECT AVG(cantidad)
FROM Pedidos;

--Calcular la suma de las cantidades
SELECT SUM(cantidad)
FROM Pedidos;

--Calcular el promedio de las cantidades
SELECT  AVG(cantidad)
FROM Pedidos;

--Calcular el valor con el importe mínimo para los fabricantes ACI
SELECT MIN(importe)
FROM Pedidos
WHERE Idfabricante='ACI';

--Calcular el total de los importes para el cliente 2107
SELECT COUNT(importe)
FROM Pedidos
WHERE Idcliente=2107;

--Calcular el valor máximo de las cantidades para el empleado 102
SELECT MAX(cantidad)
FROM Pedidos
WHERE Idempleado=102;

--Calcular la suma de las cantidades por producto
SELECT SUM(cantidad),Idproducto
FROM Pedidos
GROUP BY Idproducto;

--Calcular el promedio de las cantidades por producto
SELECT AVG(cantidad),Idproducto
FROM Pedidos
GROUP BY Idproducto;


------------TABLA OFICINAS------------------
SELECT *
FROM Oficinas;

--Total de ventas por region
SELECT SUM(ventas), region
FROM Oficinas
GROUP BY region;

--Mostrar el promedio de ventas por cada region
SELECT AVG(ventas), region
FROM Oficinas
GROUP BY region;

--Mostrar el valor minimo de ventas por jefe
SELECT MIN(ventas), jefe
FROM Oficinas
GROUP BY jefe;

--HAVING especifica una condición de búsqueda para grupo.

SELECT Idoficina,SUM(ventas)
FROM Oficinas
GROUP BY ciudad
HAVING SUM(venta)>600000;