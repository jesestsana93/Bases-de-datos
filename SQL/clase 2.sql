--Ejercicio 2
select *
from prestamo
where importe >= 250000 and importe <= 450000;

select nombresucursal,numprestamo,importe,'pesos'
from prestamo
where importe >= 250000 and importe <= 450000;

select *,'pesos'
from prestamo
where importe >= 250000 and importe <= 450000;

select nombresucursal,numprestamo,'$' || importe
from prestamo
where importe >= 250000 and importe <= 450000;

select nombresucursal as sucursal,
       numprestamo numpres,
       '$' || importe importe
from prestamo
where importe >= 250000 and importe <= 450000;

--Formato moneda a una columna
select nombresucursal as sucursal,
       numprestamo numpres,
       to_char(importe,'LFM9,999,999.000') importe
from prestamo
where importe >= 250000 and importe <= 450000;

--BETWEEN
select nombresucursal as sucursal,
       numprestamo numpres,
       to_char(importe,'LFM9,999,999.000') importe
from prestamo
where importe between 250000 and 450000;

--NOT BETWEEN
select nombresucursal as sucursal,
       numprestamo numpres,
       to_char(importe,'LFM9,999,999.000') importe
from prestamo
where importe not between 250000 and 450000;

--Trabajo con cadenas
select * 
from sucursal;

select *
from sucursal
where nombresucursal = 'SAN';

--LIKE
select *
from sucursal
where nombresucursal like 'SAN%';

select *
from sucursal
where nombresucursal like 'SAN %';

select *
from sucursal
where nombresucursal like '%DE';

select *
from sucursal
where nombresucursal like '_ME%';

--Sucursales que comiencen con cualquier letra en 
--el rango A-G
select *
from sucursal
where nombresucursal like 'A%' or ...;

--Expresiones regulares
select *
from sucursal
where nombresucursal ~ '^[A-G]';

select *
from sucursal
where nombresucursal ilike 'sa