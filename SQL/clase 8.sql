--Ejercicio 27
select sucursal,saldoprom
from (select nombresucursal sucursal,avg(saldo) saldoprom
      from cuenta
      group by nombresucursal) as r
where saldoprom > 450000;      
      
--Obtener el nombre de los clientes que tienen un cuenta
--en cada una de las sucursales de Guanajuato
select distinct t.nombrecliente
from ctacliente as t
where not exists
((select distinct nombresucursal
from sucursal
where estado = 'GUANAJUATO')
except
(select nombresucursal
from cuenta natural join ctacliente
where nombrecliente = t.nombrecliente));

--Entendiendo la consulta
explain (analyze,costs) (select distinct t.nombrecliente
from ctacliente as t
where not exists
((select distinct nombresucursal
from sucursal
where estado = 'GUANAJUATO')
except
(select nombresucursal
from cuenta natural join ctacliente
where nombrecliente = t.nombrecliente)));