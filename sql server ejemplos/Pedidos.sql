CREATE TABLE Pedidos(
       Idpedido INT PRIMARY KEY,
       fecha_pedido DATE,
       Idcliente INT REFERENCES Clientes(Idcliente),
       Idempleado INT REFERENCES Empleados(Idempleado),
       Idfabricante VARCHAR(20),
       Idproducto VARCHAR(20) REFERENCES Productos(Idproducto),
       cantidad INT,
       importe VARCHAR(20)
);

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(112961,'17-12-1989',2117,106,'REI','2A45C',7,'$31,500');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113012,'11-01-1990',2111,105,'ACI','41003',35,'$3,745');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(112989,'03-01-1990',2101,106,'FEA','4100Y',6,'$1,458');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113051,'10-02-1990',2101,108,'QSA','XK47',4,'$1,420');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(112968,'12-10-1989',2102,101,'ACI','4100Y',34,'$3,978');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113036,'30-10-1990',2107,110,'ACI','41003',9,'$22,500');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113045,'02-02-1990',2112,108,'REI','2A45C',10,'$45,000');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(112963,'17-12-1989',2103,105,'ACI','41004',28,'$3,276');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113013,'14-01-1990',2108,108,'BIC','41003',1,'$652');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113058,'23-02-1990',2108,109,'FEA','112',10,'$1,480');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(112997,'08-01-1990',2124,109,'BIC','41003',1,'$652');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(112983,'27-12-1989',2103,105,'ACI','41004',6,'$702');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113024,'20-01-1990',2114,108,'QSA','XK47',20,'$71,000');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113062,'24-02-1990',2124,108,'FEA','779C',10,'$2,430');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(112979,'12-10-1989',2114,102,'ACI','4100Y',6,'$15,000');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113027,'22-01-1990',2103,105,'ACI','41002',54,'$4,104');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113007,'08-01-1990',2112,108,'IMM','779C',3,'$2,925');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113069,'02-03-1990',2112,108,'IMM','779C',22,'$31,350');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113033,'29-01-1990',2107,110,'REI','2A45C',8,'$632');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(112992,'04-11-1989',2107,108,'ACI','41002',10,'$760');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(112975,'12-10-1989',2111,103,'REI','2A45C',6,'$2,100');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113055,'15-02-1990',2111,101,'ACI','4100Y',6,'$150');

INSERT INTO Pedidos(Idpedido,fecha_pedido,Idcliente,Idempleado,Idfabricante,Idproducto,cantidad,importe)VALUES
(113048,'10-02-1990',2120,102,'IMM','779C',2,'$3,750');

SELECT *
FROM Pedidos;
