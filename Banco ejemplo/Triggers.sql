CREATE OR REPLACE FUNCTION nombreFuncion(param1,param2,...,paramN)
	RETURNS trigger
	AS $$
	DECLARE
		variable;
		variable;
		...
	BEGIN
		sentencia;
		sentencia;
		...
		RETURN retorno;
	END;
	$$
	Language plpgsql;
	
CREATE TRIGGER nombreTrigger
	[AFTER | BEFORE] [INSERT | UPDATE | DELETE]
	ON nombreTabla
	FOR EACH {ROW | STATEMENT]
	EXECUTE PROCEDURE funcion;

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
CREATE TABLE articulo_actualizado(
	item_id int NOT NULL,
	nombre varchar(150) NOT NULL,
	precio_anterior numeric(7,2) NOT NULL,
	precio_actualizado numeric(7,2) NOT NULL,
	autor varchar(100) NOT NULL,
	fecha_cambio date NOT NULL,
	hora_cambio timetz NOT NULL,
	constraint item_id_fk foreign key(item_id) 
	references articulo(item_id) on delete cascade
	);

CREATE OR REPLACE FUNCTION articulo_actualizado()
	RETURNS trigger
	AS $$
	BEGIN
		IF (TG_OP = 'UPDATE') THEN
			IF (OLD.precio_venta != NEW.precio_venta) THEN
				INSERT INTO articulo_actualizado VALUES(
				OLD.item_id,OLD.nombre, OLD.precio_venta,
				NEW.precio_venta,current_user,current_date,current_time);
			END IF;
		END IF;
		RETURN NULL;
	END;
	$$
	Language plpgsql;

--Definicion del trigger	
CREATE TRIGGER actualizar_articulo
AFTER UPDATE ON articulo
FOR EACH ROW
EXECUTE PROCEDURE articulo_actualizado();

SELECT * FROM articulo;

UPDATE articulo SET precio_venta = 50.0 WHERE item_id = 1;
UPDATE articulo SET precio_venta = 118.5 WHERE item_id = 3;
UPDATE articulo SET precio_venta = 46.0 WHERE item_id = 4;
UPDATE articulo SET precio_venta = 49.8 WHERE item_id = 5;
UPDATE articulo SET precio_venta = 95.60 WHERE item_id = 2;

SELECT * FROM articulo_actualizado;

UPDATE articulo SET precio_venta = 65.0 WHERE item_id = 1;
UPDATE articulo SET precio_venta = 19.5 WHERE item_id = 3;
UPDATE articulo SET precio_venta = 48.0 WHERE item_id = 4;
UPDATE articulo SET precio_venta = 64.8 WHERE item_id = 5;

select * from articulo_actualizado;

--Ejemplo para mostrar de otro trigger
CREATE TABLE articulo_eliminado(
	item_id int NOT NULL,
	nombre varchar(150) NOT NULL,
	precio_compra numeric(7,2) NOT NULL,
	precio_venta numeric(7,2) NOT NULL,
	autor varchar(100) NOT NULL,
	fecha_eliminacion date NOT NULL,
	hora_eliminacion timetz NOT NULL
);

CREATE or replace FUNCTION articulo_eliminado()
	RETURNS trigger
	AS $$
	BEGIN
		IF (TG_OP = 'DELETE') THEN
			INSERT INTO articulo_eliminado VALUES(
			OLD.item_id,OLD.nombre, OLD.precio_compra,
			OLD.precio_venta,current_user,current_date,
			current_time);
		END IF;
	RETURN NULL;
	END;
	$$
	Language plpgsql;
	
CREATE TRIGGER eliminar_articulo
AFTER DELETE ON articulo
FOR EACH ROW
EXECUTE PROCEDURE articulo_eliminado();

SELECT * FROM articulo;

DELETE FROM articulo where item_id = 1;
DELETE FROM articulo where item_id = 3;

select * from articulo;

SELECT * FROM articulo_eliminado;

SELECT * FROM articulo_actualizado;

--Ejemplo de disparador sobre el Banco
create table pagos(
   numPrestamo varchar(100),
   pago numeric(10,2),
   fecha date
); 

select * from prestatario;

alter table prestatario add column pagado int default 0; 

select * from prestatario; 

create or replace function paguitos() returns trigger
as
$$
declare
   suma numeric(10,2);
   total numeric(10,2);
begin
   if(TG_OP = 'INSERT') then
      select sum(pago) into suma from pagos where numprestamo = NEW.numPrestamo;
      select importe into total from prestamo where numprestamo = NEW.numPrestamo;
      if(suma >= total) then
          update prestatario set pagado = 1 where numprestamo = NEW.numPrestamo;
      end if;
    end if;
   return null;
end;
$$
language plpgsql;

create trigger pagados
after insert on pagos
for each row
execute procedure paguitos();

select * from prestamo;

--probando el trigger
insert into pagos values('P-3366',434427,'08-06-2013');
insert into pagos values('P-7835',80000,'08-06-2013');

insert into pagos values('P-7835',3887,'08-06-2013');

select * from prestatario where pagado = 1;
select * from pagos;
--Un trigger para el sistema de ventas en linea
create or replace function venta() returns trigger
as
$$
declare
   venta int;
   stock int;
begin
   if(TG_OP = 'INSERT') then
      select cantidad into stock from articulo where idart = NEW.idArt;
      --select unidad into venta from articulopedido where idart = NEW.idart;
      venta := NEW.unidad;
           
      if(venta > stock) then
         RAISE EXCEPTION 'Ya no hay articulos % en el stock', NEW.idArt;
      else
          update articulo set cantidad = (stock-venta) where idart = NEW.idart;
      end if;
    end if;
   return null;
end;
$$
language plpgsql;

create trigger actualizaventa
after insert on articulopedido
for each row
execute procedure venta();