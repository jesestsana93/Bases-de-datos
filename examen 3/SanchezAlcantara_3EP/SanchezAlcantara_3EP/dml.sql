--PREGUNTA 2: Consultas
--a. Mostrar el n�mero de consultas que ha brindado cada m�dico por a�o y trimestre.
SELECT MEDICOS.NOMBRE || ' '|| MEDICOS.APELLIDOS AS MEDICO , CONSULTAS , A�O , TRIMESTRE
FROM MEDICOS INNER JOIN (SELECT COUNT(*) AS CONSULTAS , MEDICOS.IDMEDICO AS C,
                         extract(YEAR FROM CONSULTAS.FECHACONSULTA) AS A�O ,
                         to_char(CONSULTAS.FECHACONSULTA,'Q') AS TRIMESTRE
                         FROM (MEDICOS INNER JOIN CONSULTAS ON MEDICOS.IDMEDICO = CONSULTAS.IDMEDICO)
                         GROUP BY extract(YEAR FROM CONSULTAS.FECHACONSULTA) ,MEDICOS.IDMEDICO,to_char(CONSULTAS.FECHACONSULTA,'Q'))
ON C= MEDICOS.IDMEDICO
ORDER BY MEDICOS.IDMEDICO,A�O,TRIMESTRE;

--b. Informaci�n de los pacientes que recibieron consulta el d�a de su cumplea�os.
SELECT DISTINCT NOMBRE|| ' ' ||APELLIDOS|| ' ' ||ESTADO|| ' ' ||FECHANACIMIENTO|| ' ' ||FECHACONSULTA AS "INFORMACION"
FROM PACIENTES NATURAL JOIN CONSULTAS
WHERE extract(DAY FROM FECHANACIMIENTO)=extract(DAY FROM FECHACONSULTA) AND 
      extract(MONTH FROM FECHANACIMIENTO)=extract(MONTH FROM FECHACONSULTA);

--c. Nombre del m�dico y especialidades que tiene, de aquel que haya impartido m�s consultas.
SELECT *
FROM MEDICOSESPECIALIDADES INNER JOIN MEDICOS ON MEDICOS.IDMEDICO = MEDICOSESPECIALIDADES.IDMEDICO
                           INNER JOIN ESPECIALIDADES ON MEDICOSESPECIALIDADES.IDESPECIALIDAD = ESPECIALIDADES.IDESPECIALIDAD
WHERE MEDICOS.IDMEDICO = (SELECT MEDICOS.IDMEDICO 
                          FROM MEDICOS INNER JOIN CONSULTAS ON MEDICOS.IDMEDICO = CONSULTAS.IDMEDICO
                          GROUP BY MEDICOS.IDMEDICO
                          HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                                             FROM MEDICOS INNER JOIN CONSULTAS ON MEDICOS.IDMEDICO = CONSULTAS.IDMEDICO
                                             GROUP BY MEDICOS.IDMEDICO));

--d. Informaci�n de los pacientes que ingresaron en el cuarto trimestre de 2012 y m�dico que les fue asignado.
SELECT *
FROM PACIENTES INNER JOIN CONSULTAS C ON PACIENTES.IDPACIENTE = C.IDPACIENTE
               INNER JOIN MEDICOS Med ON C.IDMEDICO = Med.IDMEDICO
WHERE C.FECHACONSULTA BETWEEN to_date('1/10/12', 'dd/mm/yy') AND to_date('31/12/12','dd/mm/yy');

--e. Informaci�n de los m�dicos que han sido pacientes, mostrar tambi�n el nombre completo del m�dico que
--los atendi� y fecha de la consulta.
SELECT PM.IDPACIENTE, PM.NOMBRE, PM.APELLIDOS,MEDICOS.NOMBRE, MEDICOS.APELLIDOS, FECHACONSULTA
FROM(SELECT IDPACIENTE, MEDICOS.NOMBRE, MEDICOS.APELLIDOS
     FROM MEDICOS, PACIENTES
     WHERE MEDICOS.NOMBRE = PACIENTES.NOMBRE AND MEDICOS.APELLIDOS= PACIENTES.APELLIDOS) PM, CONSULTAS, MEDICOS
WHERE PM.IDPACIENTE = CONSULTAS.IDPACIENTE AND CONSULTAS.IDMEDICO = MEDICOS.IDMEDICO ;

--f. Toda la informaci�n de los pacientes que no han recibido consulta.
SELECT *
FROM pacientes
WHERE idpaciente not in(SELECT idpaciente FROM consultas);

-- g. Pacientes que han tomado consulta en cada uno de los consultorios del hospital.
SELECT DISTINCT(consultorio),idpaciente
FROM Consultas;

--h. Pacientes que han ingresado por lo menos una vez al hospital, cuyo estado de procedencia sea
--CHIAPAS y su primer apellido sea MOLINA.
SELECT NOMBRE || ' ' || APELLIDOS AS PACIENTE, ESTADO
FROM PACIENTES NATURAL JOIN INGRESOS
WHERE regexp_like(APELLIDOS, 'MOLINA.+') and ESTADO='CHIAPAS';

--No se resolvio i. Indicar trimestre y a�o en que se impartieron m�s consultas.
SELECT
FROM consultas
WHERE extract(year from fecha);

--j. Consultas que se impartieron por tipo de especialidad de julio a diciembre de 2013 (se debe
--mostrar el nombre del mes).
SELECT ESPECIALIDAD,to_char(FECHACONSULTA, 'MONTH') FECHA
FROM ESPECIALIDADES NATURAL JOIN ((CONSULTAS NATURAL JOIN MEDICOS) NATURAL JOIN MEDICOSESPECIALIDADES) 
WHERE FECHACONSULTA BETWEEN to_date('01-07-2013','dd-mm-yyyy') AND to_date('31-12-2013','dd-mm-yyyy')
ORDER BY FECHACONSULTA;

--k. Informaci�n de los pacientes que hayan sido atendidos por todos los m�dicos.
SELECT *
FROM pacientes(SELECT DISTINCT(idmedico) as medicos
              FROM (SELECT idpaciente
                    FROM medicos INNER JOIN consultas ON consultas.idmedico=medicos.idmedico) a 
              )medicos vistos
WHERE medicosVis.idpaciente=pac.idpaciente;

-- l. Mostrar la informaci�n de los pacientes que tengan el mayor n�mero de ingresos al Hospital.
SELECT *
FROM pacientes
WHERE (SELECT max(idpaciente)
        FROM ingresos);
-- m. �Cu�l es la fecha de ingreso m�s antigua en el hospital? (deber�s utilizar en tu consulta EXISTS o
--NOT EXISTS)

SELECT to_char(min(fechaingreso),'dd/mm/yyyy') as "Fecha de ingreso mas antigua al hospital"
FROM ingresos
WHERE exsists(SELECT min(fechaingreso)
              FROM ingresos);
 
--No se resolvio n. �C�mo puede ser simulado el operador IN usando SOME? Muestra un ejemplo no trivial.

-- o. Nombre completo de los pacientes (agrupados por especialidad) que ingresaron en los �ltimos 7 d�as.
SELECT pac.nombre||' '||pac.apellidos as Nombre del paciente
FROM(SELECT pacientes.*
     FROM pacientes, ingresos i
     WHERE pac.idpaciente = i.idpaciente and (i.fechaingreso) > sysdate - 7
    ) pacientes, medicos,(SELECT idpaciente, ingresos.idmedico, especialidades.especialidad
                          FROM(medicosespecialidades INNER JOIN ingresos ON ingresos.idmedico = medicosespecialidades.idmedico) 
                                INNER JOIN especialidades ON medicosespecialidades.idespecialidad = especialidades.idespecialidad) especialidad
WHERE pac.idpaciente = ingreso_especialidad.idpaciente and ingreso_especialidad.idmedico = medicos.idmedico
GROUP BY ingreso_especialidad.especialidad, pac.nombre||' '||pac.apellidos;

-- No se resolvio p. Total de pacientes que se han tenido por a�o y especialidad en cada habitaci�n por tipo de cama.
SELECT count(idpaciente)
FROM 
WHERE
GROUP BY a�o,especialidad;
-- No se resolvio q. Cantidad de pacientes, por a�o y especialidad, que hayan tomado consulta y que tenga entre
--35 y 55 a�os de edad.
SELECT count(idpaciente),floor(year_between(current_date,fecha)) a�os,
FROM consultas
WHERE 
GROUP BY a�o,especialidad;


--No se resolvio r. Nombre completo y n�mero de consultas, de aquellos que asistieron a un n�mero superior de
--consultas que el promedio de �stas durante el primer trimestre de 2015.

--No se resolvio s. Mostrar la distribuci�n de pacientes que han ingresado al hospital por estado, a�o y trimestre.
SELECT estado
FROM pacientes

GROUP BY estado,a�o,trimestre;

--No se resolvio t. Pacientes que haya tenido el mismo n�mero de ingresos y de consultas al hospital.

