--Ejercicio 20
(select nombrecliente from ctacliente)
intersect
(select nombrecliente from prestatario)

(select nombrecliente
from ctacliente
where nombrecliente in (select nombrecliente
                        from prestatario))
minus
((select nombrecliente from ctacliente)
intersect
(select nombrecliente from prestatario))

--Ejercicio 21
select nombrecliente
from prestatario
where nombrecliente not in ('%P_REZ%','%HERNANDEZ%');

--Ejercicio 22
select nombresucursal,nombrecliente
from cuenta natural join ctacliente
where nombresucursal = 'COZUMEL' and
      (nombresucursal,nombrecliente) in
      (select nombresucursal,nombrecliente
       from prestatario natural join prestamo);

--Ejercicio 24
select nombresucursal
from sucursal
where activo > any(select activo
                   from sucursal
                   where estado = 'SONORA')
order by nombresucursal;       
