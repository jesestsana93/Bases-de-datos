-- El operador BETWEEN se utiliza en una cláusula WHERE para seleccionar un rango de datos entre 
-- dos valores. Lo que hace es comprobar si un valor se encuentra entre dos valores especificados,
-- siendo separados por un AND. El primer valor debe ser el límite inferior, y el segundo valor, el 
-- límite superior. Los valores pueden ser números o fechas.

--ESTRUCTURA
-- SELECT Nombre de columna
-- FROM Nombre Tabla
-- WHERE nombre de columna BETWEEN valor minimo AND valor maximo

SELECT Idoficina,ciudad,region
FROM Oficinas
WHERE Idjefe BETWEEN 102 AND 107;

SELECT *
FROM Pedidos

------------TABLA PEDIDOS----------------
--Listar las cantidades entre 10 y 20
SELECT Idpedido,cantidad
FROM Pedidos
WHERE cantidad BETWEEN 10 AND 20;

--Listar los importes entre $100 y $1,000
SELECT Idpedido,importe
FROM Pedidos
WHERE importe BETWEEN '$100' AND '$1,000';

--Listar los empleados entre 101 y 105
SELECT Idpedido,Idempleado
FROM Pedidos
WHERE Idempleado BETWEEN 101 AND 105;

--Listar las fechas de enero de 1990
SELECT Idpedido,fecha_pedido
FROM Pedidos
WHERE fecha_pedido BETWEEN '1990-01-01' AND '1990-01-31';
