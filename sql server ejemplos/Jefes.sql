CREATE TABLE Jefes(
       Idjefe INT PRIMARY KEY,
       nombre VARCHAR(50),
       cuota VARCHAR(50)
);

INSERT INTO Jefes(Idjefe,nombre,cuota) VALUES
(104,'Martín Gutiérrez','$10,500');

INSERT INTO Jefes(Idjefe,nombre,cuota) VALUES
(116,'Armando Acosta','$15,600');

INSERT INTO Jefes(Idjefe,nombre,cuota) VALUES
(108,'Miguel Ángel Martínez','$13,200');

INSERT INTO Jefes(Idjefe,nombre,cuota) VALUES
(106,'Luis Cortés','$15,000');

INSERT INTO Jefes(Idjefe,nombre,cuota) VALUES
(114,'Juan García','$15,800');

INSERT INTO Jefes(Idjefe,nombre,cuota) VALUES
(101,'Sandra Deciga','$13,200');

INSERT INTO Jefes(Idjefe,nombre,cuota) VALUES
(126,'Antonio Mejía','$12,000');

INSERT INTO Jefes(Idjefe,nombre,cuota) VALUES
(105,'Édgar Alcántara','$11,001');

SELECT *
FROM Jefes;