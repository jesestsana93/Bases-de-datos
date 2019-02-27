--PREGUNTA 2: Consultas
--a. Mostrar el número de consultas que ha brindado cada médico por año y trimestre.
SELECT MEDICOS.NOMBRE || ' '|| MEDICOS.APELLIDOS AS MEDICO , CONSULTAS , AÑO , TRIMESTRE
FROM MEDICOS INNER JOIN (SELECT COUNT(*) AS CONSULTAS , MEDICOS.IDMEDICO AS C,
                         extract(YEAR FROM CONSULTAS.FECHACONSULTA) AS AÑO ,
                         to_char(CONSULTAS.FECHACONSULTA,'Q') AS TRIMESTRE
                         FROM (MEDICOS INNER JOIN CONSULTAS ON MEDICOS.IDMEDICO = CONSULTAS.IDMEDICO)
                         GROUP BY extract(YEAR FROM CONSULTAS.FECHACONSULTA) ,MEDICOS.IDMEDICO,to_char(CONSULTAS.FECHACONSULTA,'Q'))
ON C= MEDICOS.IDMEDICO
ORDER BY MEDICOS.IDMEDICO,AÑO,TRIMESTRE;

--b. Información de los pacientes que recibieron consulta el día de su cumpleaños.
SELECT DISTINCT NOMBRE|| ' ' ||APELLIDOS|| ' ' ||ESTADO|| ' ' ||FECHANACIMIENTO|| ' ' ||FECHACONSULTA AS "INFORMACION"
FROM PACIENTES NATURAL JOIN CONSULTAS
WHERE extract(DAY FROM FECHANACIMIENTO)=extract(DAY FROM FECHACONSULTA) AND 
      extract(MONTH FROM FECHANACIMIENTO)=extract(MONTH FROM FECHACONSULTA);

--c. Nombre del médico y especialidades que tiene, de aquel que haya impartido más consultas.
SELECT *
FROM MEDICOSESPECIALIDADES INNER JOIN MEDICOS ON MEDICOS.IDMEDICO = MEDICOSESPECIALIDADES.IDMEDICO
                           INNER JOIN ESPECIALIDADES ON MEDICOSESPECIALIDADES.IDESPECIALIDAD = ESPECIALIDADES.IDESPECIALIDAD
WHERE MEDICOS.IDMEDICO = (SELECT MEDICOS.IDMEDICO 
                          FROM MEDICOS INNER JOIN CONSULTAS ON MEDICOS.IDMEDICO = CONSULTAS.IDMEDICO
                          GROUP BY MEDICOS.IDMEDICO
                          HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                                             FROM MEDICOS INNER JOIN CONSULTAS ON MEDICOS.IDMEDICO = CONSULTAS.IDMEDICO
                                             GROUP BY MEDICOS.IDMEDICO));

--d. Información de los pacientes que ingresaron en el cuarto trimestre de 2012 y médico que les fue asignado.
SELECT *
FROM PACIENTES INNER JOIN CONSULTAS C ON PACIENTES.IDPACIENTE = C.IDPACIENTE
               INNER JOIN MEDICOS Med ON C.IDMEDICO = Med.IDMEDICO
WHERE C.FECHACONSULTA BETWEEN to_date('1/10/12', 'dd/mm/yy') AND to_date('31/12/12','dd/mm/yy');

--e. Información de los médicos que han sido pacientes, mostrar también el nombre completo del médico que
--los atendió y fecha de la consulta.
SELECT PM.IDPACIENTE, PM.NOMBRE, PM.APELLIDOS,MEDICOS.NOMBRE, MEDICOS.APELLIDOS, FECHACONSULTA
FROM(SELECT IDPACIENTE, MEDICOS.NOMBRE, MEDICOS.APELLIDOS
     FROM MEDICOS, PACIENTES
     WHERE MEDICOS.NOMBRE = PACIENTES.NOMBRE AND MEDICOS.APELLIDOS= PACIENTES.APELLIDOS) PM, CONSULTAS, MEDICOS
WHERE PM.IDPACIENTE = CONSULTAS.IDPACIENTE AND CONSULTAS.IDMEDICO = MEDICOS.IDMEDICO ;

--f. Toda la información de los pacientes que no han recibido consulta.
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

--No se resolvio i. Indicar trimestre y año en que se impartieron más consultas.
SELECT
FROM consultas
WHERE extract(year from fecha);

--j. Consultas que se impartieron por tipo de especialidad de julio a diciembre de 2013 (se debe
--mostrar el nombre del mes).
SELECT ESPECIALIDAD,to_char(FECHACONSULTA, 'MONTH') FECHA
FROM ESPECIALIDADES NATURAL JOIN ((CONSULTAS NATURAL JOIN MEDICOS) NATURAL JOIN MEDICOSESPECIALIDADES) 
WHERE FECHACONSULTA BETWEEN to_date('01-07-2013','dd-mm-yyyy') AND to_date('31-12-2013','dd-mm-yyyy')
ORDER BY FECHACONSULTA;

--k. Información de los pacientes que hayan sido atendidos por todos los médicos.
SELECT *
FROM pacientes(SELECT DISTINCT(idmedico) as medicos
              FROM (SELECT idpaciente
                    FROM medicos INNER JOIN consultas ON consultas.idmedico=medicos.idmedico) a 
              )medicos vistos
WHERE medicosVis.idpaciente=pac.idpaciente;

-- l. Mostrar la información de los pacientes que tengan el mayor número de ingresos al Hospital.
SELECT *
FROM pacientes
WHERE (SELECT max(idpaciente)
        FROM ingresos);
-- m. ¿Cuál es la fecha de ingreso más antigua en el hospital? (deberás utilizar en tu consulta EXISTS o
--NOT EXISTS)

SELECT to_char(min(fechaingreso),'dd/mm/yyyy') as "Fecha de ingreso mas antigua al hospital"
FROM ingresos
WHERE exsists(SELECT min(fechaingreso)
              FROM ingresos);
 
--No se resolvio n. ¿Cómo puede ser simulado el operador IN usando SOME? Muestra un ejemplo no trivial.

-- o. Nombre completo de los pacientes (agrupados por especialidad) que ingresaron en los últimos 7 días.
SELECT pac.nombre||' '||pac.apellidos as Nombre del paciente
FROM(SELECT pacientes.*
     FROM pacientes, ingresos i
     WHERE pac.idpaciente = i.idpaciente and (i.fechaingreso) > sysdate - 7
    ) pacientes, medicos,(SELECT idpaciente, ingresos.idmedico, especialidades.especialidad
                          FROM(medicosespecialidades INNER JOIN ingresos ON ingresos.idmedico = medicosespecialidades.idmedico) 
                                INNER JOIN especialidades ON medicosespecialidades.idespecialidad = especialidades.idespecialidad) especialidad
WHERE pac.idpaciente = ingreso_especialidad.idpaciente and ingreso_especialidad.idmedico = medicos.idmedico
GROUP BY ingreso_especialidad.especialidad, pac.nombre||' '||pac.apellidos;

-- No se resolvio p. Total de pacientes que se han tenido por año y especialidad en cada habitación por tipo de cama.
SELECT count(idpaciente)
FROM 
WHERE
GROUP BY año,especialidad;
-- No se resolvio q. Cantidad de pacientes, por año y especialidad, que hayan tomado consulta y que tenga entre
--35 y 55 años de edad.
SELECT count(idpaciente),floor(year_between(current_date,fecha)) años,
FROM consultas
WHERE 
GROUP BY año,especialidad;


--No se resolvio r. Nombre completo y número de consultas, de aquellos que asistieron a un número superior de
--consultas que el promedio de éstas durante el primer trimestre de 2015.

--No se resolvio s. Mostrar la distribución de pacientes que han ingresado al hospital por estado, año y trimestre.
SELECT estado
FROM pacientes

GROUP BY estado,año,trimestre;

--No se resolvio t. Pacientes que haya tenido el mismo número de ingresos y de consultas al hospital.

