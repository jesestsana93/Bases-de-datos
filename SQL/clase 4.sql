/*
Operaciones de conjuntos
 1) UNION --> union
 2) INTERSECCION --> intersect
 3) DIFERENCIA --> except
 
--> Ninguna devuelve duplicados
--> Las relaciones deben ser conformables 
*/

--Ejercicio 10
(select nombrecliente from ctacliente)
UNION
(select nombrecliente from prestatario);

--Ejercicio 11
(select nombrecliente from ctacliente)
EXCEPT
(select nombrecliente from prestatario);

--Ejercicio 12
(select nombrecliente from ctacliente)
INTERSECT
(select nombrecliente from prestatario);

--Ejercicio 13
select avg(saldo)
from cuenta;

--Redondeando
select round(avg(saldo))
from cuenta;

select round(avg(saldo),3)
from cuenta;

--Rendodeo hacia arriba
select ceiling(avg(saldo))
from cuenta;

--Rendondea hacia abajo
select floor(avg(saldo))
from cuenta;

/*
  Suma de saldos de las cuentas de clientes
  que viven en HIDALGO
*/  
select estado,r.nombrecliente,saldo
from cliente r,cuenta s,ctacliente t
where r.nombrecliente = t.nombrecliente and
      s.numcta = t.numcta and
      estado = 'HIDALGO';

select to_char(sum(saldo),'LFM999,999,999.00')
from cliente r,cuenta s,ctacliente t
where r.nombrecliente = t.nombrecliente and
      s.numcta = t.numcta and
      estado = 'HIDALGO';

--El mayor saldo de cuenta que tiene el cliente
--que vive en HIDALGO
select to_char(max(saldo),'LFM999,999,999.00')
from cliente r,cuenta s,ctacliente t
where r.nombrecliente = t.nombrecliente and
      s.numcta = t.numcta and
      estado = 'HIDALGO';

--Menor saldo
select to_char(min(saldo),'LFM999,999,999.00')
from cliente r,cuenta s,ctacliente t
where r.nombrecliente = t.nombrecliente and
      s.numcta = t.numcta and
      estado = 'HIDALGO';              

--Cantidad de clientes que tienen cuenta y que viven
--en HIDALGO      
select count(*)
from cliente r,cuenta s,ctacliente t
where r.nombrecliente = t.nombrecliente and
      s.numcta = t.numcta and
      estado = 'HIDALGO';        

--Ejercicio 15
select avg(saldo)
from cuenta
where nombresucursal = 'TLAQUEPAQUE';

select distinct nombresucursal
from sucursal
order by nombresucursal;

select nombresucursal,saldo
from cuenta
where nombresucursal = 'TLAQUEPAQUE';

select nombresucursal,
       to_char(avg(saldo),'LFM999,999,999.00') saldopromedio
from cuenta
group by nombresucursal
order by saldopromedio;