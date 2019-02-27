/*
CLASE JUEVES 9 DE ABRIL
Gerardo Aviles
*/
--Como comentaba la clase pasada, es posible hacer ordenamientos ASC/DESC
--Obtener informacion de las cuentas ordenadas por sucursal
select *
from cuenta
order by nombresucursal;

--Es posible ordenar por mas de un atributo, siempre que esto sea posible
--Obtener la misma informacion, pero ordenada por sucursal, saldo y fecha
select *
from cuenta
order by nombresucursal,saldo,fecha;
/*
Podemos observar que es el primer atributo, quien lleva la batuta del ordenamiento
general de la consulta. Uno de los aspectos escenciales al llevar a cabo los
ordenamiento es tener el cuenta el "grano" de la informacion.

El GRANO se refiere al detalle del que disponemos, en la informacion almacenada
en la BD. Podemos decir que entre mas GRUESO sea el grano, tendremos informacion
mas GENERAL y mientras mas FINO sea el grano, tendremos mayor detalle.

El en el ejemplo anterior, el acomodo de la informacion no es el adecuado, ya que
en las sucursales se pueden abrir muchas cuentas y en cada una de ellas, puede
suceder que en una fecha determinada se hayan aperturado varias cuentas, cada
una de ellas con su propio saldo, de esta forma, la consulta obtendria informacion
mas intereseante si cambiamos el grano de la informacion:
*/
select nombresucursal "Sucursal", 
       to_char(fecha,'dd-mon-yyyy') "Fecha de apertura", 
       to_char(saldo,'$999,9999,999.00') as "Saldo"
from cuenta
order by nombresucursal,fecha,saldo;

/*
En el ejemplo anterior, se muestra la informacion ordenada ahora si, por
orden de relevancia.
Un aspecto importante es que cuando queremos ordenar por mas de un atributo,
basta con que a la clausula ORDER BY le agreguemos una lista separada por comas
con el orden en que deseamos que se realice el ordenamiento. Veamos que se
obtienen resultados inesperados si cambiamos el orden en la clausula ORDER BY:
*/
select nombresucursal "Sucursal", 
       to_char(fecha,'dd-mon-yyyy') "Fecha de apertura", 
       to_char(saldo,'$999,9999,999.00') as "Saldo"
from cuenta
order by nombresucursal,saldo,fecha;

/*
Otro aspecto a tener en cuenta es sobre los metadatos de la tabla, como se puede
observar, estamos utilizando ALIAS en el nombre de las columnas, pero es importante
notar que si requerimos que el ALIAS tenga algun formato particular, por ejemplo,
que acepte minusculas/mayusculas, espacios en blanco, etc., sera necesario que
este texto aparezca entre comillas dobles
*/

/*************MANEJO DE FECHAS EN ORACLE************/
/*
Una de las operaciones que se realizan con mayor frecuencia tienen que ver con
la manipulacion de fechas, que permiten hacer analisis con respecto al tiempo
*/
--Obtener la cuentas que se hayan obtenido en 2012
select nombresucursal,fecha,numcta,saldo
from cuenta
where extract(year from fecha) = 2012;

/*
La funcion EXTRACT, nos permite extraer el año (YEAR), mes (MONTH) o dia (DAY)
de una fecha en particular
*/
--Si quisieramos la misma informacion anterior, pero ordenada por sucursal y mes
select nombresucursal,
       extract(month from fecha),numcta,saldo
from cuenta
where extract(year from fecha) = 2012
order by nombresucursal,extract(month from fecha);

/*Como se puede observar, tanto el mes como el año, se devuelven como enteros*/

--En la consulta anterior, si nos interesa el nombre del mes
select nombresucursal,
       to_char(fecha,'month') mes,
       numcta,saldo
from cuenta
where extract(year from fecha) = 2012
order by nombresucursal,extract(month from fecha);

/*
Si quisieramos saber ademas, el dia de la semana en que se efectuo la apertura
de la cuenta y el dia del año al que corresponde
*/


/*
En el ejemplo anterior, utilizamos la funcion To_CHAR con la mascara 'MONTH'
para especificar que queriamos que de la fecha, mostrara el nombre del mes
*/
select nombresucursal,
       to_char(fecha,'month') mes,
       to_char(fecha,'ww') "Semana del año",
       to_char(fecha,'w') "Semana del mes",
       to_char(fecha,'ddd') "Dia del año",
       to_char(fecha,'dd') "Dia del mes",
       to_char(fecha,'d') "Dia de la semana",
       to_char(fecha,'day') "Nombre del dia",
       numcta,saldo
from cuenta
where extract(year from fecha) = 2012
order by nombresucursal,extract(month from fecha);

--Si quisieramos saber el numero de meses que tiene activa una cuenta
select nombresucursal,
       floor(months_between(current_date,fecha)) meses,
       to_char(fecha,'dd-mon-yyyy') "Fecha",
       numcta,saldo
from cuenta
order by nombresucursal,meses,extract(month from fecha);

--Es posible sumar una cierta cantidad de meses a una fecha
--Queremos saber la fecha en que terminarian de pagar un prestamo en particular
select to_char(fecha,'dd-mon-yyyy') "Fecha apertura",
       numprestamo,importe,
       to_char(add_months(fecha,12),'dd-mon-yyyy') "Fecha pago"       
from prestamo
where extract(year from fecha) = 2013
order by fecha;

--Para mayor referencia, revisar el documento sobre fechas que esta en el
--servidor de archivos

/******Productos y JOINS******/
/*
Hasta el momento, solo se han hecho consultas sobre una tabla, pero como ya
se ha visto, la Normalizacion al buscar atenuar la redundancia, crea esquemas
fraccionados, lo cual nos lleva a pensar en que la informacion se encontrara
repartida en al menos un par de tablas, de ahi que sea importante es tener la
capacidad de poder recuperar informacion de mas de una tabla. Retomemos los
ejercicios de la hoja que se proporciono:
*/
--Ejercicio 7
select nombrecliente,prestamo.numprestamo,
       to_char(importe,'$999,999,999.00') importe
from prestamo, prestatario
where prestamo.numprestamo = prestatario.numprestamo
order by nombrecliente;

/*
En este ejemplo, se puede observar que la informacion se encuentra repartida entre
dos tablas: PRESTAMO y PRESTATARIO. En este caso, se observa que las tablas tienen
en comun la columna NUMPRESTAMO, luego entonces, es posible realizar una union
de estas dos tablas para poder recuperar la informacion que nos solicitaban.

En el ejemplo anterior, estamos realizando una reunion "a mano", de ahi que en la
clausula WHERE, lo primero que resolvemos es la forma en que se uniran.

Un aspecto importante es el resolver la ambigüedad, ya que, como vimos en la 
parte de Algebra Relacional, estamos trabajando con una especie de THETA JOIN y
esto obliga a tener las columnas en comun en la misma tabla, dado que el modelo
relacional no admite el tener columnas con mismos nombres, utilizamos la notacion
punto para indicar a que tabla nos referimos
*/
--Ejercicio 8
select nombrecliente,prestamo.numprestamo,
       to_char(importe,'$999,999,999.00') importe
from prestamo, prestatario
where prestamo.numprestamo = prestatario.numprestamo and
      nombresucursal = 'JIMENEZ'
order by nombrecliente;

--Si nos pidieran ahora los prestamos otorgados en HIDALGO en 2014
select estado,nombrecliente,prestamo.numprestamo,
       to_char(importe,'$999,999,999.00') importe,
       to_char(fecha,'dd-month-yyyy') fecha
from prestamo, prestatario,sucursal
where prestamo.numprestamo = prestatario.numprestamo and
      prestamo.nombresucursal = sucursal.nombresucursal and
      estado = 'HIDALGO' and extract(year from fecha) = 2014
order by nombrecliente;