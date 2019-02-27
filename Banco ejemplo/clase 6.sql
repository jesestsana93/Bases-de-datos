--Ejercicio 20
select distinct nombrecliente
from prestatario
where nombrecliente in (select nombrecliente
                        from ctacliente);
                        
--Ejercicio 21
select distinct nombrecliente
from prestatario
where nombrecliente <> 'HERNANDEZ' and
      nombrecliente != 'PEREZ';

select distinct nombrecliente
from prestatario
where nombrecliente not like '%HERNANDEZ%' and
      nombrecliente not like '%PEREZ%';

--Con subconsultas
select distinct nombrecliente
from prestatario
where nombrecliente not in ('%HERNANDEZ%','%PEREZ%');

--Ejercicio 22
select nombrecliente
from prestatario r join prestamo s 
                 on (s.numprestamo = r.numprestamo and
                     lower(nombresucursal) = 'cozumel')
where (nombresucursal,nombrecliente) in
(select nombresucursal,nombrecliente
from ctacliente r join cuenta s on (r.numcta = s.numcta));

--Ejercicio 23
(select nombrecliente
from prestatario)
except
(select nombrecliente
from ctacliente)
order by nombrecliente;

select distinct nombrecliente
from prestatario
where nombrecliente not in (select nombrecliente
                            from ctacliente)
order by nombrecliente;

                         