-- Las columnas calculadas son columnas cuyo valor será autocalculado con valores contenidos
-- en otras columnas de la misma tabla, otras columnas calculadas, funciones o constantess,
--aplicandoles distintos operadores. 

--ESTRUCTURA

--SELECT campo + campo
--             -
--             *
--             /
--             ^
--FROM Nombre Tabla

SELECT importe*cantidad
FROM Pedidos;

--ALIAS
-- En ciertas circunstancias es necesario asignar un nombre a alguna columna determinada de un conjunto 
-- devuelto.Para resolver este problema tenemos la palabra reservada AS, que se encarga de asignar el nombre
-- que deseamos a dicha columna.

SELECT importe*cantidad AS Total
FROM Pedidos;

-----TABLA DETALLE-------------
--Crear una consulta que se llame Monto total del seguro que sea 20 veces el ingreso
SELECT *
FROM Detalles;

--Crear una consulta que se llame Cuota mensual que sea equivalente al 3% del ingreso
SELECT 
FROM Detalles;

--Crear una consulta que se llame Cuota anual que sea equivalente a 12 veces la cuota mensual 
SELECT 
FROM Detalles;