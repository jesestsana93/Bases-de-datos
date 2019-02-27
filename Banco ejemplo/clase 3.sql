select * from cliente;

select *
from cliente
where nombrecliente like '_____ %';

--Ejemplo 5
select *
from cliente
where estado = 'HIDALGO'
order by nombrecliente desc,direccion;

--Ordenando por mas de un atributo
select estado,nombrecliente
from cliente
order by nombrecliente desc,estado;

--Ejercicio 7
select nombrecliente,
       to_char(importe,'LFM9,999,999.00') importe
from prestamo,prestatario
where prestamo.numprestamo = prestatario.numprestamo
order by importe;

--Mostrando ademas el estado donde vive el cliente
select estado,cliente.nombrecliente,
       to_char(importe,'LFM9,999,999.00') importe
from prestamo,prestatario,cliente
where prestamo.numprestamo = prestatario.numprestamo and
      cliente.nombrecliente = prestatario.nombrecliente
order by estado,cliente.nombrecliente,importe;

select *
from prestamo,prestatario,cliente
where prestamo.numprestamo = prestatario.numprestamo and
      cliente.nombrecliente = prestatario.nombrecliente;
      
--Utilizando una expresion para JOIN
select *
from (prestatario natural join prestamo)
      natural join cliente;

select *
from prestatario natural join prestamo natural join cliente;

--Ejercicio 8
select estado,cliente.nombrecliente,prestamo.numprestamo
from prestamo,prestatario,cliente
where nombresucursal = 'JIMENEZ' and
      prestamo.numprestamo = prestatario.numprestamo and
      cliente.nombrecliente = prestatario.nombrecliente;

--VARIABLES DE TUPLA
select estado,t.nombrecliente,r.numprestamo
from prestamo as r,prestatario s,cliente t
where nombresucursal = 'JIMENEZ' and
      r.numprestamo = s.numprestamo and
      t.nombrecliente = s.nombrecliente;
      
--Ejercio9
select r.nombresucursal
from sucursal r,sucursal s
where r.activo > s.activo and s.estado = 'ZACATECAS'

select r.nombresucursal
from sucursal r,sucursal s
where r.activo > s.activo and s.estado = 'ZACATECAS';

--Quitar duplicados
select distinct r.nombresucursal
from sucursal r,sucursal s
where r.activo > s.activo and s