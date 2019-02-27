--Forma simple de una consulta IS NULL

--SELECT Nombre de columna
--FROM Nombre Tabla
--WHERE nombre de columna IS NULL
--						  IS NOT NULL

select *
from mascotas;
--Encuentra las filas que no contienen un valor NULL(vacío)

SELECT nombre,propietario,[fecha_fallecimiento]
FROM Mascotas
WHERE [fecha_fallecimiento] IS NULL;

SELECT nombre,propietario,[fecha_fallecimiento]
FROM Mascotas
WHERE [fecha_fallecimiento] IS NOT NULL;


------------OPERADORES LOGICOS------------------

-- AND: Es el "y" lógico. Evalúa dos condiciones y devuelve un valor de verdad sólo si AMBAS son ciertas.
-- OR: Es el "o" lógico. Evalúa dos condiciones y devuelve un valor de verdad si ALGUNA de las dos es cierta.
-- NOT: Negación lógica. Devuelve un valor contrario de la expresión

--ESTRUCTURA:

--SELECT Nombre de columna
--FROM Nombre Tabla
--WHERE Expresión>Expresión AND Expresión>Expresión
--				 <			OR			 <
--				 =          NOT          =
--				<>                       <>

SELECT *
FROM Mascotas

SELECT nombre,propietario,especie
FROM Mascotas
WHERE propietario = 'Ana' OR propietario = 'Alma';

SELECT nombre,propietario,especie
FROM Mascotas
WHERE propietario = 'Ana' OR propietario = 'Isabel';


SELECT *
FROM Pedidos;
----------------TABLA PEDIDOS---------------------

--Mostrar los pedidos del fabricante ACI con importes mayores a $10,000
SELECT Idpedido,Idfabricante,importe
FROM Pedidos
WHERE Idfabricante='ACI' AND importe>'10,000';

--Mostrar los pedidos del empleado 101 con importes mayores a $3,000
SELECT Idpedido,Idempleado,importe
FROM Pedidos
WHERE Idempleado=101 AND importe>'$3,000';

--Mostrar los pedidos del empleado 108 con el fabricante QSA
SELECT Idpedido,Idempleado,Idfabricante
FROM Pedidos
WHERE Idempleado=108 AND Idfabricante='QSA';

--Mostrar los pedidos del empleado 108 con el cliente 2112
SELECT Idpedido,Idempleado,Idcliente
FROM Pedidos
WHERE Idempleado=108 AND Idcliente=2112;

--Mostrar los pedidos del empleado 108 que tengan la cantidad de 10
SELECT Idpedido,Idempleado,cantidad
FROM Pedidos
WHERE  Idempleado=108 AND cantidad=10;