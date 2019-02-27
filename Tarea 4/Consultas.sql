--a Encontrar el nombre y la ciudad de todos los empleados que trabajan en PEMEX.
SELECT nombre,ciudad
FROM Empleado,Empresa
WHERE razon_social='PEMEX';

--b. Encontrar todos los empleados que viven en la misma ciudad en la que trabajan.
SELECT  
FROM Empleado
WHERE ciudad

--c. Calcular el salario de todos los directores.
SELECT nombre,concat('$',salario) AS SALARIO
FROM Dirigir;


--d. Obtener la información de los directores y empresas que comenzaron a dirigir dicha
--empresa en el primer y tercer trimestre del año que tú elijas.
SELECT to_char(fecha_inicio,'q') trim ,razon_social,CURP
FROM Empresa,Dirigir
where extract(year from fecha_inicio) = 2012;

--e. Encontrar a todos los empleados que viven en la misma ciudad y en la misma calle
--que su supervisor.
SELECT 
FROM Empleado,Supervisar


--f. Obtener una lista de cada compañía y el salario promedio que paga.
SELECT AVG(salario) AS SALARIO PROM,razon_social
FROM Empresa,Trabajar;

--g. Empleados que colaboran en proyectos que controlan empresas para las que no trabajan.
SELECT
FROM

--h. Encontrar el total de salarios pagados por cada compañía.
SELECT COUNT(salario),razon_social
FROM Empresa;

--i. Encontrar información de los empleados y número de horas que dedican a los
--proyectos, para aquellos empleados que colaboran en al menos dos proyectos y en
--donde el número de horas que dediquen a algún proyecto sea mayor a 20.
SELECT CURP,Nombre,f_nac,ciudad,numHoras
FROM Empleado,Colaborar
WHERE numHoras>20 and numProyec=2;

--j. Encontrar la cantidad de empleados en cada compañía.
SELECT COUNT
FROM Empresa,Empleado;

--k. Encontrar el nombre del empleado que gana más dinero en cada compañía.
SELECT MAX(salario), Nombre
FROM Empleado,Trabajar;

--l. Obtener una lista de los empleados que ganan más del salario promedio que pagan las compañías.
SELECT
FROM Empresa

--m. Encontrar la compañía que tiene menos empleados y listar toda la información de los mismos.
SELECT MIN(),razon_social 
FROM Empresa
ORDER BY razon_social;

--n. Información de los proyectos en los que colaboran los empleados que son directores.
SELECT
FROM Proyecto, Empleado,Dirigir
WHERE 

--o. Encontrar la compañía que tiene empleados en cada una de las ciudades que hayas definido.
SELECT DISTINCT(ciudad),razon_social
FROM Empresa

--p. Empleados que dejaron de colaborar en proyectos, antes de la fecha de finalización de los mismos.
SELECT Nombre
FROM Empleado,Proyecto,Colaborar
WHERE fecha_fin

--q. Información de los empleados que no colaboran en ningún proyecto.
SELECT
FROM Empleado

--r. Encontrar la información de las compañías que tienen al menos dos empleados en la misma ciudad en 
--que tienen sus instalaciones.
SELECT
FROM Empresa,Empleado

--s. Proyecto que más empleados requiere (o requirió) y el número de horas que éstos le dedicaron.
SELECT
FROM Empleado,Proyecto

--t. Empleados que comenzaron a colaborar en proyectos en la misma fecha de su cumpleaños.
SELECT
FROM

--u. Obtener una lista del número de empleados que supervisa cada supervisor.
SELECT
FROM 

--v. Obtener una lista de los directores de más de 50 años.
SELECT
FROM Dirigir

--w. Obtener una lista de los empleados cuyo apellido paterno comience con las letras A,D, G, J, L, P o R.
SELECT *
FROM Empleado
WHERE regexp_like(paterno,'^[ADGJLPR]')
ORDER BY paterno;

--x. Número de empleados que colaboran en los proyectos que controla cada empresa para aquellos proyectos 
--que hayan iniciado en diciembre.
SELECT COUNT
FROM Empleado

--y. Crea una vista con la información de los empleados y compañías en que trabajan,de aquellos empleados 
--que lo hagan en al menos tres compañías diferentes.
CREATE or REPLACE view infoEmpleados as
select *
from Empleado
where exists (select *
              from Empresa
              where );
--z. Una lista de los empleados que cumplen 45 años en el mes de junio.
SELECT *      
FROM Empleado
WHERE extract(month from f_nac)=junio;

--aa. Obtener una lista de la edad promedio de los trabajadores por compañía.
SELECT AVG
FROM 

--bb. Encontrar toda información del supervisor que menos empleados supervisa.
SELECT
FROM

--cc. A todos los empleados que ganan menos de la mitad que su jefe aumentarles el sueldo en un 10%
SELECT
FROM