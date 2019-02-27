--Nombre de los clientes que tienen una cuenta en
--cada una de las sucursales de GUANAJUATO
select count(distinct nombrecliente)
from ctacliente r
where not exists(
(select nombresucursal
from sucursal
where estado = 'GUANAJUATO')
minus
(select nombresucursal
from ctacliente natural join cuenta
where nombrecliente = r.nombrecliente));

--OLAP
create or replace view olap as
select estado,nombresucursal,numprestamo,importe
from prestamo natural join sucursal

select * from olap;

--Cantidad de prestamos
select count(numprestamo)
from olap;

--Obtener la cantidad de prestamos por estado
select estado,count(numprestamo)
from olap
group by estado
order by estado;

--Obtener la catidad de prestamos por sucursal
select nombresucursal,count(numprestamo)
from olap
group by nombresucursal
order by nombresucursal;

--Cantidad de prestamos por estado y sucursal
select estado,nombresucursal,count(numprestamo)
from olap
group by estado,nombresucursal
order by estado,nombresucursal;

--Grouping sets
select estado,nombresucursal,count(numprestamo)
from olap
group by grouping sets(estado,nombresucursal);

--Rollup
select estado,nombresucursal,count(numprestamo)
from olap
group by rollup(estado,nombresucursal);

--Rollup
select estado,nombresucursal,count(numprestamo)
from olap
group by cube(estado,nombresucursal);

--Obtener el conteo de cuentas por 
--año,mes y sucursal de GUANAJUATO

select extract(year from fecha) año,
       to_char(fecha,'month') mes,
       nombresucursal sucursal,
       count(numcta) cuentas
from sucursal natural join cuenta
where estado = 'GUANAJUATO'
group by extract(year from fecha),
         to_char(fecha,'month'),nombresucursal     
order by año,mes,sucursal; 

--Rotamos la informacion
select *
from (select extract(year from fecha) año,
             to_char(fecha,'month') mes,
             nombresucursal sucursal
      from sucursal natural join cuenta
      where estado = 'GUANAJUATO') r
pivot(count(*) for sucursal in ('ACAMBARO' as "Acambaro",
                                'PENJAMO' as "Penjamo",
                                'SALAMANCA' as "Salamanca",
                                'IRAPUATO' as "Irapuato",
                                'SAN MIGUEL DE ALLENDE' as "San Miguel de Allende",
                                'CELAYA' as "Celaya",
                                'DOLORES HIDALGO' as "Dolores Hidalgo"))
order by año,mes;                                