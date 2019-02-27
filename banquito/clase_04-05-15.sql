create or replace procedure hola is
begin
	dbms_output.put_line('Hola mundo');
end hola;	

create or replace procedure hola(n varchar2) is
begin
	dbms_output.put_line('Hola ' || n);
end hola;

create or replace procedure suma(a number,b number) is
	res number;
begin
	res := a + b;
	dbms_output.put_line('El resultado es: ' || 
	                      to_char(res));
end suma;

create or replace procedure espositivo(a number) is
begin
	if(a >= 0) then
		dbms_output.put_line('Es positivo');
	else
		dbms_output.put_line('Es negativo');
    end if;
end espositivo;    		

create or replace procedure espositivo(a number) is
begin
	if(a > 0) then
		dbms_output.put_line('Es positivo');
	elsif (a = 0) then
		dbms_output.put_line('Es positivo');
	else
		dbms_output.put_line('Es negativo');
    end if;
end espositivo;