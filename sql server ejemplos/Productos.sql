CREATE TABLE Productos(
       Idfabricante VARCHAR(20),
       Idproducto VARCHAR(30) PRIMARY KEY,
       descripcion VARCHAR(30),
       precio VARCHAR(20),
       stock INT
);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('REI','2A45C','Rueda','$79',210);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('QSA','4100Y','Zapata pequeña','$2,750',25);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('QSA','XK47','Reductora','$355',38);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('BIC','41672','Plato','$180',0);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('IMM','779C','90 kg brazo','$1,875',9);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('ACI','41003','Serie 3,cable','$107',207);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('ACI','41004','Serie 4,cable','$117',139);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('BIC','41002','Hélice','$652',3);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('IMM','887P','Bulón','$250',24);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('QSA','XK48','Reductora','$134',203);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('REI','2A33L','Llave','$45,000',12);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('FEA','112','Huso','$148',115);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('IMM','887H','Barillete','$54',223);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('BIC','41089','Retén','$225',78);

INSERT INTO Productos(Idfabricante,Idproducto,descripcion,precio,stock)VALUES
('ACI','41001','Serie 1','$55',277);

SELECT *
FROM Productos;