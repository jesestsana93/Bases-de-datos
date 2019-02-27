create table cliente(
correo varchar(100),
nombre varchar(100),
paterno varchar(100),
materno varchar(100),
direccion varchar(10),
fecha date
);

--Agregar llave primaria
alter table cliente add constraint pkcliente
                              primary key(correo);
--Añadir restricion not null
alter table cliente alter column nombre set not null;

--Añadir restriccion default
alter table cliente alter column direccion
                        set default 'No proporcionado';

insert into cliente(correo) values ('juan@gmail.com');                               

--Cambiar el tipo de dato de una columna
alter table cliente alter column direccion 
                                 type varchar(100);
                                 
insert into cliente(correo,nombre) 
                 values ('@gmail.com','juan'); 
       
select * from cliente;

--Añadir restriccion CHECK
alter table cliente add constraint mail
               check(correo like '_%@_%._%'); 

--Actulizacion de tuplas
update cliente set correo = 'juan@gmail.com',
                   paterno = 'Lopez',
                   materno = 'Gomez',
                   fecha = '12-12-1985';
select * from cliente

alter table cliente alter column paterno set not null;                 
alter table cliente alter column materno set not null;                 
alter table cliente alter column fecha set not null;

--fecha actual del servidor
select current_date;

--Calcular la edad
select age(current_date,'12-12-1985');

--EXTRACT
select extract(years from age(current_date,'12-12-1985'));


alter table cliente add constraint mayoredad
   check(extract
            (years from age(current_date,fecha)) >= 18); 

insert into cliente
      values ('carlos@gmail.com','Carlos','Lara',
              'Sanchez','Av. Universidad 54',
              '18-04-2000');                               
--Pedidos
create table pedidos(
numpedido serial,
fecha date not null,
correo varchar(100),
constraint pkpedido primary key(numpedido),
constraint fkpedido foreign key(correo) 
                references cliente(correo)
);

select * from cliente;

insert into pedidos(correo,fecha) values
         ('juan@gmail.com','24/04/2014');

insert into pedidos(correo,fecha) values
         ('gar@ciencias.unam.mx','24/04/2014');

insert into pedidos(correo,fecha) values
         ('juan@gmail.com','24/04/2014');

select * from pedidos;

delete from pedidos


update cliente set correo = 'juan23@gmail.com'
where correo = 'juan@gmail.com';

--Articulo
create table articulo(
idarticulo serial,
nombre varchar(100) not null,
cantidad int not null,
precio numeric(7,2) not null,
constraint pkart primary key(idarticulo),
constraint cant check(cantidad >= 0),
constraint prec check(precio >= 0)
);

create table detalle(
nopedido int,
noart int,
cantidad int,
constraint fkdetalle1 foreign key(nopedido)
                      references pedidos(numpedido),
constraint fkdetalle2 foreign key(noart)
                      references articulo(idarticulo),                                                 
constraint mayor check(cantidad > 0)
);                      

--Para poblar la BD
insert into cliente(correo,nombre,paterno,materno,direccion,fecha)
        values('gabriel@hotmail.com','GABRIEL','GONZÁLEZ','ARIAS','BLVD.BENITO JUAREZ Y MAGISTERIO S/N','20-07-1979');
insert into cliente(correo,nombre,paterno,materno,direccion,fecha)
        values('daniela@yahoo.com.mx','DANIELA','LOPEZ','ACOSTA','CALZ SANDERS (CTO COMER SORIANA) S/N','13-02-1981');
insert into cliente(correo,nombre,paterno,materno,direccion,fecha)
        values('jesus@hotmail.com','JOSE DE JESUS','SANCHEZ','PARRA','JUAREZ 84 P.B.','10-08-1978');
insert into cliente(correo,nombre,paterno,materno,direccion,fecha)
        values('dario@yahoo.com.mx','DARIO EMMANUEL','PÉREZ','SOSA','PRESIDENTE MAZARIK','02-01-1979');
insert into cliente(correo,nombre,paterno,materno,direccion,fecha)
        values('jorgeantonio@hotmail.com','JORGE ANTONIO','DÍAZ','FIGUEROA','PLAZA PRINCIPAL','25-09-1980');
insert into cliente(correo,nombre,paterno,materno,direccion,fecha)
        values('yair@yahoo.com.mx','YAIR NAHUM','GÓMEZ','SUÁREZ','AV. INSTITUTO POLITECNICO NACIONAL','17-11-1975');
insert into cliente(correo,nombre,paterno,materno,direccion,fecha)
        values('luisabraham@hotmail.com','LUIS ABRAHAM','TORRES','VERA','ARTEAGA NO. 78','08-03-1979');

--Para la tabla pedido
insert into pedidos(fecha,correo) values('10/1/2012','gabriel@hotmail.com');
insert into pedidos(fecha,correo) values('12/1/2012','daniela@yahoo.com.mx');
insert into pedidos(fecha,correo) values('22/1/2012','jesus@hotmail.com');
insert into pedidos(fecha,correo) values('1/2/2012','dario@yahoo.com.mx');
insert into pedidos(fecha,correo) values('11/2/2012','jorgeantonio@hotmail.com');
insert into pedidos(fecha,correo) values('21/2/2012','yair@yahoo.com.mx');
insert into pedidos(fecha,correo) values('2/3/2012','luisabraham@hotmail.com');
insert into pedidos(fecha,correo) values('12/3/2012','dario@yahoo.com.mx');
insert into pedidos(fecha,correo) values('22/3/2012','gabriel@hotmail.com');
insert into pedidos(fecha,correo) values('1/4/2012','daniela@yahoo.com.mx');
insert into pedidos(fecha,correo) values('11/4/2012','yair@yahoo.com.mx');
insert into pedidos(fecha,correo) values('21/4/2012','luisabraham@hotmail.com');
insert into pedidos(fecha,correo) values('1/5/2012','dario@yahoo.com.mx');
insert into pedidos(fecha,correo) values('11/5/2012','daniela@yahoo.com.mx');
insert into pedidos(fecha,correo) values('21/5/2012','gabriel@hotmail.com');
insert into pedidos(fecha,correo) values('31/5/2012','luisabraham@hotmail.com');

--Para la tabla de articulo
insert into articulo(nombre,cantidad,precio) values('Switch 8 puertos',100,600);
insert into articulo(nombre,cantidad,precio) values('Dlink 56K',700,100);
insert into articulo(nombre,cantidad,precio) values('Monitor Samsung 17',100,2500);
insert into articulo(nombre,cantidad,precio) values('RAM DDR2 512/533',100,300);
insert into articulo(nombre,cantidad,precio) values('Tarjeta NVIDIA FX',100,800);
insert into articulo(nombre,cantidad,precio) values('Procesador Pentium4',100,2000);
insert into articulo(nombre,cantidad,precio) values('Switch 12 puertos',100,1000);
insert into articulo(nombre,cantidad,precio) values('Dlink 56K',100,800);
insert into articulo(nombre,cantidad,precio) values('Monitor Samsung 14',100,2000);
insert into articulo(nombre,cantidad,precio) values('RAM DDR2 1024/533',100,600);
insert into articulo(nombre,cantidad,precio) values('Tarjeta NVIDIA FX 5200',100,1000);
insert into articulo(nombre,cantidad,precio) values('Procesador Pentium Celeron',100,1600);

--Para la tabla detalle
insert into detalle(nopedido,noart,cantidad) values(1,1,1);
insert into detalle(nopedido,noart,cantidad) values(1,2,1);
insert into detalle(nopedido,noart,cantidad) values(1,3,1);
insert into detalle(nopedido,noart,cantidad) values(1,11,3);
insert into detalle(nopedido,noart,cantidad) values(2,3,1);
insert into detalle(nopedido,noart,cantidad) values(2,4,1);
insert into detalle(nopedido,noart,cantidad) values(3,6,1);
insert into detalle(nopedido,noart,cantidad) values(3,7,1);
insert into detalle(nopedido,noart,cantidad) values(3,8,2);
insert into detalle(nopedido,noart,cantidad) values(4,9,2);
insert into detalle(nopedido,noart,cantidad) values(4,10,2);
insert into detalle(nopedido,noart,cantidad) values(4,11,3);
insert into detalle(nopedido,noart,cantidad) values(5,12,2);
insert into detalle(nopedido,noart,cantidad) values(5,3,3);
insert into detalle(nopedido,noart,cantidad) values(6,4,2);
insert into detalle(nopedido,noart,cantidad) values(6,8,2);
insert into detalle(nopedido,noart,cantidad) values(7,9,2);
insert into detalle(nopedido,noart,cantidad) values(7,10,3);
insert into detalle(nopedido,noart,cantidad) values(8,11,3);
insert into detalle(nopedido,noart,cantidad) values(8,12,3);
insert into detalle(nopedido,noart,cantidad) values(8,1,3);
insert into detalle(nopedido,noart,cantidad) values(9,2,2);
insert into detalle(nopedido,noart,cantidad) values(9,5,1);
insert into detalle(nopedido,noart,cantidad) values(9,6,1);
insert into detalle(nopedido,noart,cantidad) values(9,8,3);
insert into detalle(nopedido,noart,cantidad) values(10,9,1);
insert into detalle(nopedido,noart,cantidad) values(11,10,3);
insert into detalle(nopedido,noart,cantidad) values(11,12,3);
insert into detalle(nopedido,noart,cantidad) values(12,11,3);
insert into detalle(nopedido,noart,cantidad) values(12,6,1);
insert into detalle(nopedido,noart,cantidad) values(13,3,1);
insert into detalle(nopedido,noart,cantidad) values(13,2,1);
insert into detalle(nopedido,noart,cantidad) values(14,1,1);
insert into detalle(nopedido,noart,cantidad) values(14,8,1);
insert into detalle(nopedido,noart,cantidad) values(15,9,1);
insert into detalle(nopedido,noart,cantidad) values(15,6,2);
insert into detalle(nopedido,noart,cantidad) values(15,5,2);
insert into detalle(nopedido,noart,cantidad) values(16,1,2);
insert into detalle(nopedido,noart,cantidad) values(16,11,2);
insert into detalle(nopedido,noart,cantidad) values(16,12,3);                                                                                              

select * from cliente;
select * from articulo;
select * from pedidos;
select * from detalle;

--Politica por omision
delete from articulo where idarticulo = 3;

select *
from detalle
where noart = 3;

delete from detalle where noart = 3;

--Actualizando el articulo 1
update articulo set idarticulo = 20 where idarticulo = 1

select * from detalle where noart = 1

alter table pedidos drop constraint fkpedido;
alter table detalle drop constraint fkdetalle1;
alter table detalle drop constraint fkdetalle2;

--Politica de establecimiento de nulos
alter table pedidos add constraint fkpedido
    foreign key(correo) references cliente(correo)
    on update set null on delete set null;

select * from cliente; 

delete from cliente where correo = 'gabriel@hotmail.com';   

select * from pedidos;

update cliente set correo = 'dany@gmail.com' where
       correo = 'daniela@yahoo.com.mx';

--Politica en Cascada
alter table pedidos add constraint fkpedido
    foreign key(correo) references cliente(correo)
    on update cascade on delete cascade;

select * from cliente

update cliente set correo = 'dario@hotmail.com'
      where correo = 'dario@yahoo.com.mx';

delete from cliente where correo = 'jesus@hotmail.com';       

select * from pedidos