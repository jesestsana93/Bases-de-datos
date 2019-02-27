--Ejercicio 24
select nombresucursal
from sucursal
where activo > any (select activo
                    from sucursal
                    where estado = 'SONORA');

--Ejemplo 25
select nombrecliente
from prestatario p
where exists (select *
              from ctacliente c
              where c.nombrecliente = p.nombrecliente);                                  
              
--Ejemplo 26
select avg(saldo)
from cuenta
group by nombresucursal

--Subconsultas en FROM
select max(saldoprom)
from (select avg(saldo)
      from cuenta
      group by nombresucursal) as res(saldoprom);
      
select max(saldoprom)
from (select avg(saldo) saldoprom
      from cuenta
      group by nombresucursal) as res;      

--VISTAS
create view saldospromedio as      
select avg(saldo) saldoprom
from cuenta
group by nombresucursal;

select max(saldoprom)
from saldospromedio;

select *
from saldospromedio;

--eliminar vistas
drop view saldospromedio;

--Desventajas
insert into saldospromedio values(608000);

--Tablas temporales
create temp table saldospromedio as      
select avg(saldo) saldoprom
from cuenta
group by nombresucursal;

select *
from saldospromedio;

select max(saldoprom)
from saldospromedio;

--Es posible hacer modificaciones
insert into saldospromedio values(508000);

select nombresucursal
from cuenta
group by nombresucursal
having avg(saldo) = (select max(saldoprom)
                     from saldospromedio);

select nombresucursal
from cuenta
group by nombresucursal
having avg(saldo) >= all (select avg(saldo)
                         from cuenta
                         group by nombresucursal);
                     