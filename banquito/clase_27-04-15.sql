--Ejercicio 25
select nombrecliente
from ctacliente r
where exists (select *
              from prestatario
              where nombrecliente = r.nombrecliente);
              
--Creando una vista:
create or replace view ctasprestamos as
select nombrecliente
from ctacliente r
where exists (select *
              from prestatario
              where nombrecliente = r.nombrecliente);

select * from ctasprestamos;              

--Ejercicio 26
select nombresucursal
from cuenta
group by nombresucursal
having avg(saldo) >= all(select avg(saldo)
                        from cuenta
                        group by nombresucursal);

--Otra forma
select nombresucursal
from cuenta
group by nombresucursal
having avg(saldo) = (select max(saldoprom)
                     from (select nombresucursal sucursal,
                                  avg(saldo) saldoprom
                           from cuenta
                           group by nombresucursal) res);

--Clientes que tienen una sola cuenta en la sucursal
--PENJAMO
select distinct nombrecliente
from ctacliente r
where (select count(numcta)
       from cuenta natural join ctacliente
       where nombrecliente = r.nombrecliente and
             nombresucursal = 'PENJAMO') = 1;

--Estados que tienen entre 150 y 200 cuentas abiertas
select distinct estado
from sucursal r
where (select count(numcta)
       from sucursal natural join cuenta
       where estado = r.estado) between 150 and 200;                                        

