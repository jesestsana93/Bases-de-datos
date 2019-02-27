--LOOP..exit
create or replace procedure adicion(n int) is
i int:= 1;
res int := 0;
begin
	loop
		dbms_output.put_line('Contador = ' || i);
		res := res + i;
		dbms_output.put_line('Acumulado = ' || res);
		i := i + 1;
		if i > n then exit; end if;
	end loop;
end adicion;

--LOOP..exit when
create or replace procedure adicion(n int) is
i int:= 1;
res int := 0;
begin
	loop
		dbms_output.put_line('Contador = ' || i);
		res := res + i;
		dbms_output.put_line('Acumulado = ' || res);
		i := i + 1;
		exit when i > n;
	end loop;
end adicion;

--WHILE
create or replace procedure adicion(n int) is
i int:= 1;
res int := 0;
begin
	while i <= n
	loop
		dbms_output.put_line('Contador = ' || i);
		res := res + i;
		dbms_output.put_line('Acumulado = ' || res);
		i := i + 1;
	end loop;
end adicion;

--FOR
create or replace procedure adicion(n int) is
res int := 0;
begin
	for i in 1..n
	loop
		dbms_output.put_line('Contador = ' || i);
		res := res + i;
		dbms_output.put_line('Acumulado = ' || res);
	end loop;
end adicion;

--**CURSORES***

--IMPLICITOS
declare
	cta cuenta.numcta%type;
	s cuenta.saldo%type;
begin
	select numcta,saldo into cta,s
	from cuenta
	where numcta = 'C-00391';
	dbms_output.put_line('Num cta: ' || cta ||
	                     ' con saldo ' ||
	                     to_char(s,'$999,999,999.00'));
end;
/

--ROWTYPE
declare
	c cuenta%rowtype;
begin
	select * into c
	from cuenta
	where numcta = 'C-00391';
	dbms_output.put_line('Num cta: ' || c.numcta ||
	                     ' con saldo ' ||
	                     to_char(c.saldo,'$999,999,999.00'));
end;
/

--Cursores explicitos
declare
	c cuenta%rowtype;
	cursor cuenta_cursor is select * from cuenta
	                        where nombresucursal = 'ARAGON'
	                        and 
	                        extract(year from fecha) = 2014;
begin
	open cuenta_cursor;
	loop
		fetch cuenta_cursor into c;
		dbms_output.put_line('Num cta: ' || c.numcta ||
	                         ' con saldo ' ||
	                     to_char(c.saldo,'$999,999,999.00'));
	    exit when cuenta_cursor%notfound;
	end loop;
	close cuenta_cursor;
end;
/

--Cursor explicito con ciclo FOR                     
declare
	c cuenta%rowtype;
	cursor cuenta_cursor is select * from cuenta
	                        where nombresucursal = 'ARAGON'
	                        and 
	                        extract(year from fecha) = 2014;
begin
	for c in cuenta_cursor loop
		dbms_output.put_line('Num cta: ' || c.numcta ||
	                         ' con saldo ' ||
	                     to_char(c.saldo,'$999,999,999.00'));
	end loop;
end;
/

--Utilizar JOIN
declare
	cursor cuenta_cursor is select * 
	                        from cuenta natural join ctacliente
	                        where nombresucursal = 'ARAGON'
	                        and 
	                        extract(year from fecha) = 2014;
begin
	for c in cuenta_cursor loop
		dbms_output.put_line('Nombre: ' || c.nombrecliente ||
		                     ' Num cta: ' || c.numcta ||
	                         ' con saldo ' ||
	                     to_char(c.saldo,'$999,999,999.00'));
	end loop;
end;
/

/*
Crear un procedimiento parametrizado que reciba el estado,mes y saldo
y devuelva la informacion de las cuentas que correspondan
*/
create or replace procedure cuentas(edo varchar,anio int,
                                    mes int,s number) is
cursor cuentas_cursor is
select * from ctacliente natural join cuenta natural join sucursal
where estado = edo and extract(year from fecha) = anio and
		      extract(month from fecha) = mes and saldo >= s;
begin
	for c in cuentas_cursor loop
		dbms_output.put_line( c.estado || ' | ' ||
		                      c.nombresucursal || ' | ' ||
		                      extract(year from c.fecha) || ' | ' ||
		                      extract(month from c.fecha) || ' | ' ||
		                      c.numcta || ' | ' ||
		                      to_char(c.saldo,'$999,999,999.00'));
	end loop;
end cuentas;

--Si queremos manejar excepciones
--en raise_application_error el valor va de -20000 a -20999
create or replace procedure cuentas(edo varchar,anio int,
                                    mes int,saldo number) is
cursor cuentas_cursor is
select * from ctacliente natural join cuenta natural join sucursal
where estado = edo and extract(year from fecha) = anio and
     extract(month from fecha) = mes and saldo >= saldo;
nomes exception;
noanio exception;
begin
	if mes not between 1 and 12 
	  then raise_application_error(-20001,'El mes ' || mes || ' no existe!');
	elsif anio not in (2012,2013,2014) 
	  then raise_application_error(-20002,'El anio ' || anio || ' no existe!');
	else
	for c in cuentas_cursor loop
		dbms_output.put_line( c.estado || ' | ' ||
		                      c.nombresucursal || ' | ' ||
		                      extract(year from c.fecha) || ' | ' ||
		                      extract(month from c.fecha) || ' | ' ||
		                      c.numcta || ' | ' ||
		                      to_char(c.saldo,'$999,999,999.00'));
	end loop;
	end if;
	/*exception
		when nomes then 
			<acciones a realizar>;
		when noanio then 
			<acciones a realizar>;*/
end cuentas;