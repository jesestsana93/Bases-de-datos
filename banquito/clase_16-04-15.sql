--Operaciones de conjuntos
--Ejemplo 10
select nombrecliente,numcta from ctacliente
union all
select nombrecliente,numprestamo from prestatario
order by numcta desc

--Ejemplo 11
select nombrecliente from ctacliente
minus
select nombrecliente from prestatario

--Ejemplo 12
select nombrecliente from ctacliente
intersect
select nombrecliente from prestatario

/*
clientes que tienen una cuenta con saldo menor a $3,000 o
que tienen prestamos y que viven en Chiapas o que tienen
cuenta en la sucursal YAUTEPEC
*/
(select nombrecliente
from cuenta a,ctacliente b
where a.numcta = b.numcta and saldo < 3000)
union
(select a.nombrecliente
from cliente a,prestatario b
where a.nombrecliente = b.nombrecliente and estado = 'CHIAPAS')
union
(select nombrecliente
from ctacliente a,cuenta b
where a.numcta = b.numcta and nombresucursal = 'YAUTEPEC')

/*
Clientes que obtuvieron un prestamo en 2013 y que tengan
una cuenta en la sucursal HUATULCO
*/
(select nombrecliente
from prestamo a,prestatario b
where a.numprestamo = b.numprestamo and
      extract(year from fecha) = 2013)
intersect
(select nombrecliente
from cuenta a, ctacliente b
where a.numcta = b.numcta and
      nombresucursal = 'HUATULCO')      
      
/*
Clientes que tenga una cuenta y un prestamo en la sucursal
CUAJIMALPA y que no vivan en JALISCO
*/
(select nombrecliente
from ctacliente a,cuenta b
where a.numcta = b.numcta and nombresucursal = 'CUAJIMALPA')
intersect
(select nombrecliente
from prestamo a,prestatario b
where a.numprestamo = b.numprestamo and
      nombresucursal = 'CUAJIMALPA')
minus
(select nombrecliente from cliente where estado = 'JALISCO')      
      
--Funciones de agregacion
select count(*) from ctacliente;
select count(nombrecliente) from ctacliente;