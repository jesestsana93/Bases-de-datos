--Funciones de agregacion
select count(*) from cliente;

select count(*) from ctacliente;
select count(nombrecliente) from ctacliente;

--La suma de saldos
select sum(saldo)
from cuenta;

--Saldo promedio de todas las cuentas
select avg(saldo)
from cuenta;

--El mayor prestamo
select max(importe)
from prestamo;

--El menor prestamo
select min(importe)
from prestamo;

--Ejercicio 15
select avg(saldo)
from cuenta
where nombresucursal = 'TLAQUEPAQUE';

--Ejercicio 16
select nombresucursal,
       to_char(avg(saldo),'$999,999,999.00') saldoprom
from cuenta
group by nombresucursal
order by saldoprom desc;

--Numero de prestamos que se han otorgado por estado
select estado,count(numprestamo)
from prestamo a,sucursal b
where a.nombresucursal = b.nombresucursal
group by estado;

--Si quisieramos ademas el detalle de cada sucursal
select estado,a.nombresucursal,count(numprestamo)
from prestamo a,sucursal b
where a.nombresucursal = b.nombresucursal
group by estado,a.nombresucursal
order by estado desc,a.nombresucursal desc;

--Mostar ademas mayor y menor prestamo otorgados
select estado,a.nombresucursal,
       count(numprestamo) "Prestamos otorgados",
       max(importe) "Mayor prestamo",
       min(importe) "Menor prestamo",
       sum(importe) "Importe total de prestamos",
       avg(importe) "Importe promedio"
from prestamo a,sucursal b
where a.nombresucursal = b.nombresucursal
group by estado,a.nombresucursal
having count(numprestamo) > 40
order by estado desc,a.nombresucursal desc,
      "Prestamos otorgados";
      
--Total de prestamos y de cuentas que se han otorgado
--por estado y por sucursal
select estado,a.nombresucursal,
       count(numprestamo),
       count(numcta)
from sucursal a,cuenta b,prestamo c
where a.nombresucursal = b.NOMBRESUCURSAL and
      a.NOMBRESUCURSAL = c.NOMBRESUCURSAL --Join erroneo
group by estado,a.nombresucursal
order by estado,a.nombresucursal;                

--Correcto
select estado,a.nombresucursal,
       count(distinct numprestamo),
       count(distinct numcta)
from sucursal a,cuenta b,prestamo c
where  b.NOMBRESUCURSAL = c.NOMBRESUCURSAL and
       b.NOMBRESUCURSAL = a.NOMBRESUCURSAL
group by estado,a.nombresucursal
order by estado,a.nombresucursal;                   