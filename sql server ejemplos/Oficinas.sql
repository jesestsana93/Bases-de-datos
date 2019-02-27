CREATE TABLE Oficinas(
       Idoficina INT PRIMARY KEY,
       ciudad VARCHAR(50),
       region VARCHAR(50),
       Idjefe INT REFERENCES Jefes(Idjefe),
       objetivo VARCHAR(20),
       ventas VARCHAR(20)
);

INSERT INTO Oficinas(Idoficina,ciudad,region,Idjefe,objetivo,ventas) VALUES
(22,'Daimiel','Oeste',108,'$300,001','$186,042');

INSERT INTO Oficinas(Idoficina,ciudad,region,Idjefe,objetivo,ventas) VALUES
(11,'Navarra','Este',106,'$575,000','$692,637');

INSERT INTO Oficinas(Idoficina,ciudad,region,Idjefe,objetivo,ventas) VALUES
(12,'Castellón','Este',104,'$800,000','$735,042');

INSERT INTO Oficinas(Idoficina,ciudad,region,Idjefe,objetivo,ventas) VALUES
(13,'Almería','Este',105,'$350,000','$367,911');

INSERT INTO Oficinas(Idoficina,ciudad,region,Idjefe,objetivo,ventas) VALUES
(21,'León','Oeste',108,'$725,000','$835,915');

SELECT *
FROM Oficinas;