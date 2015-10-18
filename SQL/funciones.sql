--Ejemplo 1
--Funcion para sumar dos enteros
create or replace function suma(int,int) returns int
as $$
declare
   a int;
   b int;
   res int;
begin
   a := $1;
   b := $2;
   res := a + b;
   return res;
end;
$$
language plpgsql;

select suma(4,6);

select suma((select saldo from cuenta where numcta = 'C-2309'),(select saldo from cuenta where numcta = 'C-8286'));

select numcta,saldo,suma(saldo,10000)
from cuenta;

--Ejemplo 2
--Creando una funcion para serie de Fibonacci
create or replace function fibonacci(int) returns int
as $$
declare
   a int;
   res int := 0;
begin
   a := $1;
   if(a = 1 or a = 2) then
      res := 1;
   else
      res := fibonacci(a - 2) + fibonacci(a - 1);
   end if;
   return res;
end;
$$
Language plpgsql; 

select fibonacci(8);

--Ejemplo 3
--Funcion que determina si un cierto numero es positivo o negativo
create or replace function esPositivo(int) returns boolean
as $$
declare
   a int;
   res boolean := false;
begin
   a := $1;
   if(a > 0) then
      res := true;
   else
      if(a = 0) then
         res := true;
      end if;
   end if;
   return res;
end;
$$
Language plpgsql;

select espositivo(-5);
select espositivo(0); 

--Ejemplo 4
--Funcion que suma los n primeros numeros enteros
create or replace function adicion(int) returns int
as $$
declare
   cont int := 1;
   res int := 0;
   n int := $1;
begin   
   while(cont <= n)
      loop
         res := res + cont;
         cont := cont + 1;
      end loop;
   return res;
end;   
$$
Language plpgsql;

select adicion(100);

--Ejemplo 5
--Suma con for
create or replace function sumaFor() returns int
as $$
declare
   cont int;
   res int := 0;
begin
   for cont in 1..10
      loop
         res := res + cont;
      end loop;
   return res;
end;
$$
language plpgsql; 

select sumafor();

--Ejemplo 6
--Manejo de fechas
select age(current_date,date '1980-08-19');

create or replace function tiempo(date,date) returns varchar(150)
as $$
declare
   g varchar(150);
begin
   g := replace(
          replace(
            replace(
              replace(
                upper(
                   (age($1,$2)) :: varchar)
             ,'YEAR','AÑO')
          ,'MONS','MESES')
       ,'MON','MES')
    ,'DAY','DIA');
   return g;
end;
$$
Language plpgsql;

select tiempo(current_date,'1979-12-12');
select age(current_date,'1979-12-12');

--Ejemplo tienda
create table articulo(
   item_id serial,
   nombre varchar(150) not null,
   tipo varchar(100) not null,
   cantidad int not null default 0,
   precio_compra numeric(7,2) not null,
   precio_venta numeric(7,2) not null,
   constraint item_id_pk primary key(item_id)
);

INSERT INTO articulo(nombre,tipo,cantidad,precio_compra,precio_venta)
                     VALUES('Switch 8 puertos','Switch',2,32.5,45.6);
INSERT INTO articulo(nombre,tipo,cantidad,precio_compra,precio_venta)
                     VALUES('Switch 16 puertos','Switch',2,82.5,95.6);                     
INSERT INTO articulo(nombre,tipo,cantidad,precio_compra,precio_venta)
                     VALUES('DLink 56K','Modem',0,10.5,15.6);
INSERT INTO articulo(nombre,tipo,cantidad,precio_compra,precio_venta)
                     VALUES('Samsung 17','Monitor',0,100.0,120.0);
INSERT INTO articulo(nombre,tipo,cantidad,precio_compra,precio_venta)
                     VALUES('Dell 17','Monitor',0,100.0,135.0);                     
INSERT INTO articulo(nombre,tipo,cantidad,precio_compra,precio_venta)
                     VALUES('DDR2 512/533','RAM',2,40.0,45.0);
INSERT INTO articulo(nombre,tipo,cantidad,precio_compra,precio_venta)
                     VALUES('DDR2 1024/533','RAM',0,45.0,97.0);                     
INSERT INTO articulo(nombre,tipo,cantidad,precio_compra,precio_venta)
                     VALUES('NVIDIA FX 5200','Tarjeta',7,40.0,48.5);
INSERT INTO articulo(nombre,tipo,cantidad,precio_compra,precio_venta)
                     VALUES('NVIDIA FX 6400','Tarjeta',0,60.0,98.5);                     
INSERT INTO articulo(nombre,tipo,cantidad,precio_compra,precio_venta)
                     VALUES('Pentium4 3.2GHZ','Procesador',7,200.0,230.0);

select * from articulo;

select * from articulo where cantidad = 0;

create table articulo_por_comprar(
   item_id int not null,
   nombre varchar(150) not null
);   

create or replace function articuloporcomprar() returns int
as $$
declare
   cont_item int;
   fila articulo%rowtype;                      
begin
   /*
   drop table articulo_por_comprar;
   create table articulo_por_comprar(
      item_id int not null,
      nombre varchar(150) not null
   );
   
   delete from articulo_por_comprar;
   */
   truncate table articulo_por_comprar; --Vaciar tabla
   select count(*) into cont_item from articulo where cantidad = 0;
   --cont_item := select count(*) from articulo where cantidad = 0;
   for fila in select * from articulo where cantidad = 0
     loop
        insert into articulo_por_comprar values
                       (fila.item_id,fila.nombre);
     end loop;
   return cont_item;
end;
$$
language plpgsql; 

select articuloporcomprar();

select * from articulo_por_comprar;

select * from articulo;

update articulo set cantidad = 10 where cantidad = 0;

update articulo set cantidad = 0 where item_id = 1;
update articulo set cantidad = 0 where item_id = 2;
update articulo set cantidad = 0 where item_id = 6;
update articulo set cantidad = 0 where item_id = 10;

select articuloporcomprar();

--Funcion patrimonio
create or replace function patrimonio() returns numeric(7,2)
as $$
declare
   total numeric(7,2) := 0.0;
   fila articulo%rowtype;
begin
   for fila in select * from articulo where cantidad != 0
      loop
         total := total + (fila.cantidad * fila.precio_venta);
      end loop;
   return total;
end;
$$
Language plpgsql; 

select to_char(patrimonio(),'LFM999,999.00');