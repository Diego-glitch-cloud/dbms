-- =============================================================
-- QUERIES DE EJEMPLO — Práctica de JOINs
-- =============================================================


-- -------------------------------------------------------------
-- INNER JOIN
-- Devuelve solo los registros con coincidencia en ambas tablas
-- -------------------------------------------------------------

-- Empleados con su departamento
SELECT e.nombre, e.apellido, d.nombre AS departamento
FROM empleados AS e
INNER JOIN departamentos AS d ON e.departamento_id = d.id;

-- Empleados con sus proyectos asignados
SELECT e.nombre, e.apellido, p.nombre AS proyecto, ep.rol
FROM empleados AS e
INNER JOIN empleados_proyectos AS ep ON e.id = ep.empleado_id
INNER JOIN proyectos AS p ON ep.proyecto_id = p.id
ORDER BY e.apellido;

-- Departamentos con cantidad de empleados (solo los que tienen al menos uno)
SELECT d.nombre AS departamento, COUNT(e.id) AS total_empleados
FROM departamentos AS d
INNER JOIN empleados AS e ON d.id = e.departamento_id
GROUP BY d.id, d.nombre
ORDER BY total_empleados DESC;


-- -------------------------------------------------------------
-- LEFT JOIN
-- Todos los registros de la tabla izquierda + coincidencias
-- -------------------------------------------------------------

-- Todos los empleados, con o sin departamento
SELECT e.nombre, e.apellido, d.nombre AS departamento
FROM empleados AS e
LEFT JOIN departamentos AS d ON e.departamento_id = d.id
ORDER BY d.nombre;

-- Empleados SIN departamento asignado
SELECT e.nombre, e.apellido
FROM empleados AS e
LEFT JOIN departamentos AS d ON e.departamento_id = d.id
WHERE d.id IS NULL;

-- Todos los empleados y los proyectos en que participan (si los hay)
SELECT e.nombre, e.apellido, p.nombre AS proyecto
FROM empleados AS e
LEFT JOIN empleados_proyectos AS ep ON e.id = ep.empleado_id
LEFT JOIN proyectos AS p ON ep.proyecto_id = p.id
ORDER BY e.apellido;


-- -------------------------------------------------------------
-- RIGHT JOIN
-- Todos los registros de la tabla derecha + coincidencias
-- -------------------------------------------------------------

-- Todos los departamentos, tengan o no empleados
SELECT e.nombre AS empleado, e.apellido, d.nombre AS departamento
FROM empleados AS e
RIGHT JOIN departamentos AS d ON e.departamento_id = d.id
ORDER BY d.nombre;

-- Departamentos SIN empleados
SELECT d.nombre AS departamento
FROM empleados AS e
RIGHT JOIN departamentos AS d ON e.departamento_id = d.id
WHERE e.id IS NULL;

-- Todos los proyectos, tengan o no empleados asignados
SELECT p.nombre AS proyecto, e.nombre AS empleado
FROM empleados AS e
RIGHT JOIN empleados_proyectos AS ep ON e.id = ep.empleado_id
RIGHT JOIN proyectos AS p ON ep.proyecto_id = p.id
ORDER BY p.nombre;


-- -------------------------------------------------------------
-- FULL OUTER JOIN
-- Todos los registros de ambas tablas
-- NOTA: MariaDB/MySQL no soporta FULL OUTER JOIN directamente.
-- Usar la versión con UNION al final de esta sección.
-- -------------------------------------------------------------

-- PostgreSQL: empleados y departamentos (todos, haya o no coincidencia)
SELECT e.nombre AS empleado, d.nombre AS departamento
FROM empleados AS e
FULL OUTER JOIN departamentos AS d ON e.departamento_id = d.id
ORDER BY d.nombre;

-- MariaDB / MySQL — equivalente con UNION:
SELECT e.nombre AS empleado, d.nombre AS departamento
FROM empleados AS e
LEFT JOIN departamentos AS d ON e.departamento_id = d.id
UNION
SELECT e.nombre AS empleado, d.nombre AS departamento
FROM empleados AS e
RIGHT JOIN departamentos AS d ON e.departamento_id = d.id;


-- -------------------------------------------------------------
-- CROSS JOIN
-- Producto cartesiano: todas las combinaciones posibles
-- -------------------------------------------------------------

-- Todas las combinaciones posibles de empleados y turnos
SELECT e.nombre, e.apellido, t.nombre AS turno
FROM empleados AS e
CROSS JOIN turnos AS t
ORDER BY e.apellido, t.id;

-- Cuántas combinaciones genera (empleados × turnos)
SELECT COUNT(*) AS total_combinaciones
FROM empleados
CROSS JOIN turnos;


-- -------------------------------------------------------------
-- SELF JOIN
-- Una tabla se une consigo misma
-- -------------------------------------------------------------

-- Empleados con el nombre de su jefe directo
SELECT
    e.nombre  AS empleado,
    e.apellido AS apellido_empleado,
    j.nombre  AS jefe,
    j.apellido AS apellido_jefe
FROM empleados AS e
JOIN empleados AS j ON e.jefe_id = j.id
ORDER BY j.apellido, e.apellido;

-- Empleados que NO tienen jefe (nivel más alto)
SELECT e.nombre, e.apellido
FROM empleados AS e
LEFT JOIN empleados AS j ON e.jefe_id = j.id
WHERE e.jefe_id IS NULL;

-- Cadena: empleado → jefe → jefe del jefe
SELECT
    e.nombre  AS empleado,
    j.nombre  AS jefe,
    jj.nombre AS jefe_del_jefe
FROM empleados AS e
LEFT JOIN empleados AS j  ON e.jefe_id  = j.id
LEFT JOIN empleados AS jj ON j.jefe_id  = jj.id
ORDER BY jj.nombre, j.nombre, e.nombre;


-- -------------------------------------------------------------
-- USING
-- Simplifica ON cuando la columna tiene el mismo nombre
-- -------------------------------------------------------------

-- Empleados en proyectos usando USING
SELECT
    e.nombre,
    e.apellido,
    p.nombre AS proyecto,
    ep.rol
FROM empleados_proyectos AS ep
JOIN empleados AS e  USING (empleado_id)
JOIN proyectos  AS p USING (proyecto_id)
ORDER BY p.nombre, e.apellido;


-- -------------------------------------------------------------
-- CONSULTAS COMBINADAS (más complejas)
-- -------------------------------------------------------------

-- Salario promedio por departamento (solo departamentos con empleados)
SELECT
    d.nombre          AS departamento,
    ROUND(AVG(e.salario), 2) AS salario_promedio,
    MIN(e.salario)    AS salario_minimo,
    MAX(e.salario)    AS salario_maximo,
    COUNT(e.id)       AS total_empleados
FROM departamentos AS d
INNER JOIN empleados AS e ON d.id = e.departamento_id
GROUP BY d.id, d.nombre
ORDER BY salario_promedio DESC;

-- Proyectos activos con cantidad de empleados asignados
SELECT
    p.nombre AS proyecto,
    p.fecha_inicio,
    COUNT(ep.empleado_id) AS total_asignados
FROM proyectos AS p
LEFT JOIN empleados_proyectos AS ep ON p.id = ep.proyecto_id
WHERE p.fecha_fin IS NULL
GROUP BY p.id, p.nombre, p.fecha_inicio
ORDER BY total_asignados DESC;

-- Top 5 empleados con mayor cantidad de proyectos
SELECT
    e.nombre,
    e.apellido,
    d.nombre AS departamento,
    COUNT(ep.proyecto_id) AS proyectos
FROM empleados AS e
INNER JOIN empleados_proyectos AS ep ON e.id = ep.empleado_id
LEFT  JOIN departamentos AS d ON e.departamento_id = d.id
GROUP BY e.id, e.nombre, e.apellido, d.nombre
ORDER BY proyectos DESC
LIMIT 5;
