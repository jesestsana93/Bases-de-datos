--FUNCIONES QUE DEVUELVEN TABLAS

--Funcion para crear saldos promedio por sucursal
create or replace function saldosprom() returns setof "record"
as $$
declare 
   r record;
begin
   for r in select nombresucursal,avg(saldo)
            from cuenta
            group by nombresucursal
      loop
         return next r;
      end loop;
   return;
end;
$$
language plpgsql; 

--USO
select sucursal,to_char(saldoprom,'LFM999,999,999.00')
from saldosprom() as (sucursal varchar(30),saldoprom numeric)
order by sucursal,saldoprom desc; 

--Funcion que devuelva el numero de cuentas y prestamos de cada cliente
create or replace function clientesCtas()
returns setof "record" as
$$
declare
   r record;
begin
   for r in select nombrecliente,count(distinct numcta),count(distinct numprestamo)
            from ctacliente natural join prestatario
            group by nombrecliente
      loop
         return next r;
      end loop;
   return;
end;
$$
language plpgsql;

--USO
select *
from clientesctas() as (nombrecliente varchar(50),cuentas bigint,prestamos bigint);             

--Funcion que devuelve un "subconjunto" de la tabla ctacliente
create or replace function getClientes() returns setof ctacliente
as 'select * from ctacliente;'
language sql;

--USO
select *
from getClientes();

create or replace function getClientes(varchar) returns setof ctacliente
as $$
select * from ctacliente where nombrecliente like $1;
$$
language sql;

select *
from getClientes('CARLOS%');

--Funcion que devuelva el numero de cuentas y prestamos de cada cliente
create or replace function clientes(nombre varchar) returns
    table(cliente varchar(100),cuenta bigint,prestamos bigint)
as
$$
   select nombrecliente,count(distinct numcta),count(distinct numprestamo)
   from ctacliente natural join prestatario
   group by nombrecliente
   having nombrecliente like nombre;
$$
language sql; 

--USO
select * from clientes('%CHAVEZ%');

select (clientes('CARLOS%')).cliente;

--Funcion 2
create or replace function clientes(nombre varchar,cuenta bigint) returns
    table(cliente varchar(100),cuenta bigint,prestamos bigint)
as
$$
   select nombrecliente,count(distinct numcta),count(distinct numprestamo)
   from ctacliente natural join prestatario
   group by nombrecliente
   having nombrecliente like nombre and count(distinct numcta) = cuenta;
$$
language sql; 

--USO
select * from clientes('FERNANDO%',3);



--para borrar una funcion
drop function clientesctas(varchar);

--Otra forma de devolver una tabla
create or replace function clientesctas(est varchar,nombre varchar) returns 
    table(cliente varchar(100),cuenta bigint,prestamos bigint)
as $$
begin
   return query select nombrecliente,count(distinct numcta),count(distinct numprestamo)
                from (ctacliente natural join prestatario) natural join cliente
                where estado = est
                group by nombrecliente
                having nombrecliente like nombre;
end;
$$
language plpgsql;             

--Uso
select * from clientesctas('CHIHUAHUA','%');

--Ultima forma de devolver una tabla
create or replace function clientesctas(est varchar,cta bigint) returns 
    table(cliente varchar(100),cuenta bigint,prestamo bigint)
as $$
declare
   r record;
begin
   for r in select nombrecliente,count(distinct numcta) as cuentas,
                   count(distinct numprestamo) as prestamos
            from (ctacliente natural join prestatario) natural join cliente
            where estado = $1
            group by nombrecliente
            having count(distinct numcta) = $2
      loop
         cliente := r.nombrecliente;
         cuenta := r.cuentas;
         prestamo := r.prestamos;
         return next;
      end loop;
end;
$$
language plpgsql;

--uso
select * from clientesctas('CHIHUAHUA',2);          