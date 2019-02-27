--Ejercicio 1
select *
from prestamo
where nombresucursal = 'NAVOJOA' and
      importe > 24000;
      
select * from prestamo where nombresucursal = 'NAVOJOA' and importe > 24000;      

--Ejercicio 2
select *
from prestamo
where IMPORTE >= 6000 and IMPORTE <= 30000;

--Utilizando between
select *
from prestamo
where importe between 6000 and 30000;

--Si quisieramos el complemento
select *
from prestamo
where importe not between 6000 and 30000;

select *
from prestamo
where importe not between 6000 and 30000 and
      nombresucursal = 'MORELOS' and
      fecha > date '2014-05-14';

/*
Prestamos que no esten en el rango 6000 y 30000
de MORELOS y posteriores al 2014-05-14
*/
select *
from prestamo
where importe not between 6000 and 30000 and
      nombresucursal = 'MORELOS' and
      fecha > to_date('2014-05-14','yyyy-mm-dd');

--Obtener solo numprestamo,importe y la fecha
select fecha,numprestamo,importe
from prestamo
where importe not between 6000 and 30000 and
      nombresucursal = 'MORELOS' and
      fecha > to_date('2014-05-14','yyyy-mm-dd');

--Jugando con la presentacion
select fecha,numprestamo,importe,'PESOS'
from prestamo
where importe not between 6000 and 30000 and
      nombresucursal = 'MORELOS' and
      fecha > to_date('2014-05-14','yyyy-mm-dd');      

--Utilizando CONCAT
select fecha,numprestamo,concat('$',importe)
from prestamo
where importe not between 6000 and 30000 and
      nombresucursal = 'MORELOS' and
      fecha > to_date('2014-05-14','yyyy-mm-dd'); 

select fecha,numprestamo,concat('$',importe)
from prestamo
where importe not between 6000 and 30000 and
      (nombresucursal = 'MORELOS' or
       nombresucursal = 'NAVOJOA') and
      fecha > to_date('2014-05-14','yyyy-mm-dd');           
      
--Sin parentesis en OR
select nombresucursal,fecha,numprestamo,concat('$',importe)
from prestamo
where importe not between 6000 and 30000 and
      nombresucursal = 'MORELOS' or
      nombresucursal = 'NAVOJOA' and
      fecha > to_date('2014-05-14','yyyy-mm-dd'); 
      
--Formato moneda
select fecha,numprestamo,
       to_char(importe,'$99,999,999.00') as importe
from prestamo
where importe not between 6000 and 30000 and
      (nombresucursal = 'MORELOS' or
       nombresucursal = 'NAVOJOA') and
      fecha > to_date('2014-05-14','yyyy-mm-dd');           