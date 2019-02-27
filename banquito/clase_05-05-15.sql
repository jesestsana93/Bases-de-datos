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