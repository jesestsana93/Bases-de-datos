--Ejercicio 3
select *
from sucursal
where nombresucursal like 'SAN%';

--Nombres de sucursal con nombre de Santos
select *
from sucursal
where nombresucursal like 'SAN %';

--Nombres de sucursal que terminan con IO
select lower(nombresucursal)
from sucursal
where lower(nombresucursal) like '%io';

--Nombres de sucursal que contienen el patron CA
select lower(nombresucursal)
from sucursal
where lower(nombresucursal) like '_%ca%_';

--Con expresiones regulares
select lower(nombresucursal)
from sucursal
where regexp_like(nombresucursal,'.+CA.*[^CA]$');

--Nombres de sucursa que comienzan con A-D, L, M o T
select nombresucursal
from sucursal
where regexp_like(nombresucursal,'^[A-DLMT]');

select nombresucursal
from sucursal
where regexp_like(nombresucursal,'^[^A-DLMT]');

--Sucursales que empiezan con A y que terminan con A o S
select nombresucursal
from sucursal
where regexp_like(nombresucursal,'^A.*[AS]$');

select *
from cuenta;

select *
from cuenta
where regexp_like(numcta,'C-0{3}[2-5]');

select *
from cliente
where nombrecliente like '%CASTRO _%';

--Con expresiones regulares
select *
from cliente
where regexp_like(nombrecliente,'castro.+','i');

--Reemplazando con expresiones regulares
select nombrecliente,
       regexp_replace(direccion,'NUM.','NO.')
from cliente
where regexp_like(nombrecliente,'castro.+','i');


--ordenando el resultado
--Reemplazando con expresiones regulares
select nombrecliente,
       regexp_replace(direccion,'NUM.','NO.')
from cliente
where regexp_like(nombrecliente,'castro.+','i')
order by nombrecliente desc;