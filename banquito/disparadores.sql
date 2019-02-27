--Disparadores
/*
Los disparadores tiene la siguiente estructura:
1) Nombre del disparador:
create [or replace] trigger <nombre del disparador>

2) Punto en el tiempo en que debe "dispararse":
before | after

3) Eventos que pueden dispararlo:
insert or update [of <columna(s)] | or delete on <nombre de la tabla>

4) Tipo de disparador:
for each [row | statement]

5) Restriccion del disparo:
when (<condiciones>)

6) Cuerpo del disparador:
<Un bloque PL/SQL>
*/

--Formas de uso de los DISPARADORES
--Verificar restricciones a nivel de la Base de Datos (ASSERTIONS)
--Queremos asegurarnos que las cuentas que se abren o actualizan en CHIAPAS
--tienen al menos un saldo inicial de $1,000.00
create or replace trigger check_saldo_chiapas
after insert or update of saldo on cuenta
for each row
when (new.saldo < 1000)
declare
	edo varchar(20);
begin
	--recuperamos el estado al que pertenece la apertura de la cuenta
	select estado into edo from sucursal 
	where nombresucursal = :new.nombresucursal;
	if edo = 'CHIAPAS' and :new.saldo < 1000 then
		raise_application_error(-20003,'El saldo minimo debe ser $1,000.00');
	end if;
end;

--Probemos el disparador
insert into cliente values ('CARLOS ROQUE FERNANDO','15 DE SEPT. NO. 1550','CHIAPAS');
--Asociamos una cuenta al cliente
insert into cuenta values ('TONALA','C-12185',500,current_date);
insert into cuenta values ('ACAMBARO','C-12186',500,current_date);
select * from cuenta where numcta = 'C-12186';
select * from sucursal;
select * from cuenta where numcta = 'C-12185';

--Actualizamos la informacion de una cuenta;
update cuenta set saldo = 500 where numcta = 'C-00536';
select * from cuenta where numcta = 'C-00536';

--Crear historicos
--Monitorear los movimientos (retiros/depositos) de los clientes;
create table movimientos(
numcta char(7),
fecha date,
saldo_ant number(10,2),
saldo_nuevo number(10,2)
);

create or replace trigger mov_saldo
after insert or update on cuenta
for each row
begin
	if inserting then
		insert into movimientos values(:new.numcta,current_date,
		                               :new.saldo,:new.saldo);
	elsif updating then
		insert into movimientos values(:old.numcta,current_date,
		                               :old.saldo,:new.saldo);
	end if;		                             
end;

--Probamos el disparador
insert into cuenta values ('TONALA','C-12185',1000,current_date);			                               
select * from cuenta where numcta = 'C-12185';
select * from movimientos;

select * from cuenta where numcta = 'C-00536';
update cuenta set saldo = 50000 where numcta = 'C-00536';
select * from movimientos;

update cuenta set saldo = 2000 where numcta = 'C-12185';
select * from movimientos;

--Crear un disparador para almacenar la informacion que haya eliminado
--Creamos un procedimiento que elimine la informacion de cuentas de un cliente
create or replace procedure elimina_cuenta_cliente (nom varchar) is
	c ctacliente%rowtype;
	nofound exception;
begin
	select * into c from ctacliente where nombrecliente = nom;
    delete from ctacliente where numcta = c.numcta;
    delete from cuenta where numcta = c.numcta;
	exception
		when NO_DATA_FOUND then
			raise_application_error(-20004,'El cliente ' || nom ||
			                               ' no se encontro!');
end;

--Creamos la tabla historico
create table baja_cuenta(
	cliente varchar(200),
	cuenta char(7),
	sucursal varchar(100),
	saldo number(10,2),
	apertura date,
	usuario varchar(100),
	fecha date
);

--Creamos el disparador
create or replace trigger del_cuenta
after delete on ctacliente
for each row
declare
	c cuenta%rowtype;
begin
	select * into c from cuenta where numcta = :old.numcta;
	insert into baja_cuenta values(:old.nombrecliente,:old.numcta,
	                               c.nombresucursal,c.saldo,c.fecha,
	                               sys_context('USERENV','current_user'),
	                               current_date);                              
end;

--Probamos el disparador
call elimina_cuenta_cliente('CARLOS')
select * from ctacliente
call elimina_cuenta_cliente('BERNARDO VIDAL VÁZQUEZ')
select * from BAJA_CUENTA;
--Disparador que verifique si un cliente ya termino de pagar su prestamo
--Hacamos una copia de la tabla prestamo
create table prestamo1 as
select * from prestamo;
--Agregamos una columna que permita validar si ya pago o no
alter table prestamo1 add pagado int default 0;

select * from prestamo1;

--Creamos una tabla para almacenar los pagos de los clientes
create table pagos(
	numprestamo char(7),
	pago number(10,2),
	fecha date
);	

--Creamos el disparador
create or replace trigger paguitos
for insert on pagos
compound trigger
	total number(10,2);
	monto number(10,2);
	np char(7);
before each row is	
begin
    np := :new.numprestamo;
end before each row;
after statement is
begin
    select importe into total from prestamo1 where numprestamo = np;
	select sum(pago) into monto from pagos where numprestamo = np;
if(monto >= total) then
		update prestamo1 set pagado = 1 where numprestamo = np;
	end if;
end after statement;
end;

insert into pagos values('P-00195',1000,current_date);
insert into pagos values('P-00195',3869.06,current_date);
select * from pagos;
select * from prestamo1;

--Crear campos autoincrementales:
drop table prueba;
create table prueba(
	id number,
	nombre varchar(100)
);

--Creación de la secuencia para simular el campo AUTOINCREMENTAL
create sequence seq_id 
start with 1 
increment by 1
nomaxvalue; 

--Creación del TRIGGER para que la inserción sea automática
create or replace trigger trig_prueba
before insert on prueba
for each row
begin
	select seq_id.nextval into :new.id from dual;
end;

--Probando
insert into prueba(nombre) values('Carlos');

select * from prueba;