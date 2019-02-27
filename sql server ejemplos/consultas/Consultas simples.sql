--Estructura:
-- SELECT Nombre de columna
-- FROM Nombre Tabla

-- 1.Nombre de columna
-- Especifica las columnas con los alias, o en caso de que sean todas, se podrá utilizar 
-- el símbolo (*). Si los alias contienen espacios en blanco, deben estar entre corchetes[].
-- 2. Nombre de tabla
-- La tabla es el origen de donde se obtendrán los datos. Si la tabla contiene espacios en
-- blanco, deben estar entre corchetes[].

SELECT Idoficina,region,objetivo
FROM Oficinas;

--TOP: Devuelve un determinado numero de registros de la tabla en SQL SERVER
SELECT TOP 2 ciudad,region,objetivo
FROM Oficinas;

-----------TABLA PEDIDOS----------------
--Obtener todos los campos de la tabla
SELECT *
FROM Pedidos;

--Obtener el campo numero de pedido
SELECT Idpedido
FROM Pedidos;

--Obtener los campos producto y cantidad
SELECT Idproducto,cantidad
FROM Pedidos;

--Obtener el numero de pedido y fecha
SELECT Idpedido,fecha_pedido
FROM Pedidos;

-----------TABLA PRODUCTOS--------------
--Mostrar la descripcion y el precio
SELECT descripcion, precio
FROM Productos;

--Mostrar todos los campos
SELECT *
FROM Productos;

--Mostrar la descripcion, el precio y el stock
SELECT descripcion, precio,stock
FROM Productos;

--TABLA CLIENTES
--Mostrar el limite de credito
SELECT credito
FROM Clientes;