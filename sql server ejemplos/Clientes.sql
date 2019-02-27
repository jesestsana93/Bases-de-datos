CREATE TABLE Clientes(
       Idcliente INT PRIMARY KEY,
       empresa VARCHAR(50),
       Idempleado INT REFERENCES Empleados(Idempleado),
       credito VARCHAR(50)
);

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2111,'JCP S.A.',103,'$50,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2102,'Filas',101,'$65,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2103,'ACME',105,'$50,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2123,'Cruz e Hijos',102,'$40,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2107,'ACE Internacional',110,'$35,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2115,'Sierra S.A.',101,'$20,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2101,'Jarandilla LTD',106,'$65,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2112,'Zeta Producciones',108,'$50,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2121,'QMA Asociados',103,'$45,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2114,'Orion LTD',102,'$20,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2124,'Pascual Hermanos',101,'$40,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2108,'Henche & Lopez',109,'$55,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2117,'J.P Sotoca',106,'$35,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2122,'Toledo S.A.',105,'$30,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2120,'Rico S.A.',102,'$50,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2106,'F.Lopez S.A.',102,'$65,000');

INSERT INTO Clientes(Idcliente,empresa,Idempleado,credito) VALUES
(2119,'Salomon S.A.',109,'$25,000');

SELECT *
FROM Clientes;