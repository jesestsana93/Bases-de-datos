select nombresucursal,avg(saldo)
from cuenta
group by nombresucursal;

--Ejercicio 17
select nombresucursal,count(numprestamo)
from prestamo
group by nombresucursal;

--Mostrar ademas el numero de cuentas de debito
select r.nombresucursal,count(distinct numprestamo),
       count(distinct numcta)
from prestamo r,cuenta s
where r.nombresucursal = s.nombresucursal
group by r.nombresucursal;

--Ejercicio 18
select nombresucursal,avg(saldo) saldoprom
from cuenta
group by nombresucursal
having avg(saldo) > 450000;

--Sucursales con saldo promedio > 450000 de los
--estados de Chihuahua, Coahuila y Sonora
select estado,nombresucursal,avg(saldo) saldoprom
from cuenta natural join sucursal
where estado = 'CHIHUAHUA' or estado = 'COAHUILA' or
      estado = 'SONORA'
group by estado,nombresucursal
having avg(saldo) > 450000
order by estado,nombresucursal;

--Ejercicio 19
select nombrecliente,avg(saldo),count(distinct numcta)
from ctacliente natural join cuenta natural join cliente
where estado = 'MORELOS'
group by nombrecliente
having count(distinct numcta) >= 3;

/*
Pelicula(titulo,año,duracion,estudio,idprod)
Ejecutivo(nombre,direccion,idEj)

Nombre y direccion del productor de la pelicula
'Lo que el viento se llevo'

select nombre,direccion
from pelicula,ejecutivo
where idprod = idEj and titulo = 'Lo que...';

--Utilizando subconsultas
select nombre,direccion
from ejecutivo
where idEj = (select idprod
              from pelicula
              where titulo = 'Lo que el...');
*/
 