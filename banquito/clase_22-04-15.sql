--Ejercicio 19: Morelos --> DURANGO
select estado,a.nombrecliente,
       to_char(avg(saldo),'$999,999,999.00') saldoprom,
       count(c.numcta) cuentas
from cliente a,cuenta b,ctacliente c
where a.nombrecliente = c.nombrecliente and
      b.numcta = c.numcta and
      estado = 'DURANGO'
group by estado,a.nombrecliente
having count(c.numcta) >= 3;

--Informacion del total de cuentas se abrieron por
--trimestre en 2012
select to_char(fecha,'q') trim,nombresucursal,fecha,
       count(numcta)
from cuenta
where extract(year from fecha) = 2012
group by to_char(fecha,'q'),nombresucursal,fecha
order by trim,nombresucursal;

--EXPRESIONES PARA JOIN SQL

--NATURAL JOIN
select estado,nombrecliente,
       to_char(avg(saldo),'$999,999,999.00') saldoprom,
       count(numcta) cuentas
from (cuenta natural join ctacliente) natural join
     cliente
where estado = 'DURANGO'
group by estado,nombrecliente
having count(numcta) >= 3;

--THETA JOIN: JOIN ON
select estado,c.nombrecliente,
       to_char(avg(saldo),'$999,999,999.00') saldoprom,
       count(a.numcta) cuentas
from (cuenta a join ctacliente b on a.numcta = b.numcta)
     join cliente c on c.nombrecliente = b.nombrecliente
                       and estado = 'DURANGO'
group by estado,c.nombrecliente
having count(a.numcta) >= 3;

select *
from (cuenta natural join ctacliente) natural join
     cliente;

select *
from (cuenta a join ctacliente b on a.numcta = b.numcta)
     join cliente c on c.nombrecliente = b.nombrecliente     

--THETA JOIN: INNER JOIN
select estado,c.nombrecliente,
       to_char(avg(saldo),'$999,999,999.00') saldoprom,
       count(a.numcta) cuentas
from (cuenta a inner join ctacliente b on a.numcta = b.numcta)
     inner join cliente c on c.nombrecliente = b.nombrecliente
                       and estado = 'DURANGO'
group by estado,c.nombrecliente
having count(a.numcta) >= 3;     

--JOIN EXTERNO
--Join externo por la izquierda

--Clientes que tienen cuenta y prestamo o solo cuenta
select *
from ctacliente natural left outer join prestatario
order by numprestamo;

--Clientes que tienen cuenta y prestamo o solo prestamo
select *
from ctacliente natural right outer join prestatario
order by numcta;

select *
from ctacliente natural full outer join prestatario

--Clientes que no tienen prestamo
select *
from ctacliente natural full outer join prestatario
where numprestamo is null;
