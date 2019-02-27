--Prestamos otorgados en Hidalgo en 2014
select nombrecliente,prestamo.numprestamo,
       to_char(importe,'$999,999,999.00') importe,
       to_char(fecha,'dd-mon-yyyy') "Fecha de alta" 
from prestamo,sucursal,prestatario
where prestamo.numprestamo = prestatario.numprestamo and
      prestamo.nombresucursal = sucursal.nombresucursal and
      estado = 'HIDALGO' and
      extract(year from fecha) = 2014;

--VARIABLES DE TUPLA
select nombrecliente,a.numprestamo,
       to_char(importe,'$999,999,999.00') importe,
       to_char(fecha,'dd-mon-yyyy') "Fecha de alta" 
from prestamo a,sucursal b,prestatario c
where a.numprestamo = c.numprestamo and
      a.nombresucursal = b.nombresucursal and
      estado = 'HIDALGO' and
      extract(year from fecha) = 2014;      

--Ejercicio 9
select distinct a.nombresucursal
from sucursal a,sucursal b
where a.activo > b.activo and b.estado = 'ZACATECAS'
order by a.nombresucursal;      

--Lista de clientes homonimos
select a.*
from cliente a,cliente b
where a.nombrecliente = b.nombrecliente and
      a.direccion <> b.direccion
order by a.nombrecliente;

--Prestamos que se solicitaron en la misma fecha
select distinct a.*
from prestamo a,prestamo b
where a.fecha = b.fecha and
      a.numprestamo != b.numprestamo
order by a.fecha;