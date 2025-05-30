-- 1. Listado de Docentes #1
-- Listado de docentes en orden alfabético por apellidos y nombres. Incluir 6 campos
SELECT 
    doc.cod_docente,
    doc.apellido1,
    doc.apellido2,
    doc.nombre1,
    doc.nombre2,
    doc.correo_electronico
FROM docente AS doc
ORDER BY doc.apellido1, doc.apellido2, doc.nombre1, doc.nombre2;

-- 2. Listado de Docentes #2
-- Listado de docentes en orden de código de departamento y alfabético por apellidos y nombres. Incluir 6 campos
SELECT 
    doc.cod_docente,
    doc.cod_departamento,
    doc.apellido1,
    doc.apellido2,
    doc.nombre1,
    doc.nombre2
FROM docente AS doc
ORDER BY doc.cod_departamento, doc.apellido1, doc.apellido2, doc.nombre1, doc.nombre2;

-- 3. Listado de Docentes #3
-- Listado de docentes del departamento de “Sistemas Digitales” ordenado por código de docente. Incluir 5 campos
SELECT 
    doc.cod_docente,
    doc.nombre1,
    doc.nombre2,
    doc.apellido1,
    doc.apellido2
FROM docente AS doc
JOIN departamento AS dep ON doc.cod_departamento = dep.cod_departamento
WHERE dep.nombre_departamento = 'Departamento de Ingeniería de Sistemas'
ORDER BY doc.cod_docente;

-- 4. Listado de Docentes #4
-- Listado de cantidad de docentes por departamento. Presentar el listado con código de departamento y cantidad total
SELECT 
    doc.cod_departamento,
    COUNT(*) AS total_docentes
FROM docente AS doc
GROUP BY doc.cod_departamento
ORDER BY doc.cod_departamento;

-- 5. Listado de Estudiantes #1
-- Listado de estudiantes en orden de género (sexo), apellidos y nombres. Incluir 6 campos
SELECT 
    est.cod_estudiante,
    est.genero,
    est.apellido1,
    est.apellido2,
    est.nombre1,
    est.nombre2
FROM estudiante AS est
ORDER BY est.genero, est.apellido1, est.apellido2, est.nombre1, est.nombre2;

-- 6. Listado de Estudiantes #2
-- Listado de estudiantes ordenado por género (sexo), apellidos y nombres. Incluir 7 campos
SELECT 
    est.cod_estudiante,
    est.genero,
    est.apellido1,
    est.apellido2,
    est.nombre1,
    est.nombre2,
    est.correo_electronico
FROM estudiante AS est
ORDER BY est.genero, est.apellido1, est.apellido2, est.nombre1, est.nombre2;

-- 7. Listado de Estudiantes #3
-- Listado de estudiantes del programa “Ingeniería de Software” y “Tecnología en Desarrollo de Software”
-- ordenado por código de programa y documento de identificación. Incluir 5 campos
SELECT 
    est.cod_estudiante,
    est.cod_usuario AS documento,
    est.nombre1,
    est.apellido1,
    est.cod_programa_academico
FROM estudiante AS est
JOIN programa_academico AS pro ON est.cod_programa_academico = pro.cod_programa
WHERE pro.nombre_programa_academico IN ('Ingeniería de Software', 'Tecnología en Desarrollo de Software')
ORDER BY est.cod_programa_academico, est.cod_usuario;

-- 8. Listado de Estudiantes #4
-- Listado de cantidad de estudiantes por programa. Presentar código de programa y cantidad total
SELECT 
    est.cod_programa_academico,
    COUNT(*) AS total_estudiantes
FROM estudiante AS est
GROUP BY est.cod_programa_academico
ORDER BY est.cod_programa_academico;

-- 9. Listado de Asignaturas #1
-- Listado de asignaturas ordenado por nombre. Incluir 6 campos
SELECT 
    asi.cod_asignatura,
    asi.codigo,
    asi.nombre_asignatura,
    asi.creditos_asignatura,
    asi.semestre,
    asi.horas_clase
FROM asignatura AS asi
ORDER BY asi.nombre_asignatura;

-- 10. Listado de Asignaturas #2
-- Listado de asignaturas del programa “Ingeniería de Sistemas” y “Tecnologías en Desarrollo de Software”
-- ordenado por código de programa y código asignatura. Incluir 6 campos
SELECT
    asi.cod_asignatura,
    asi.nombre_asignatura,
    asi.codigo,
    asi.creditos_asignatura,
    asi.semestre,
    asi.cod_programa
FROM asignatura AS asi
JOIN programa_academico AS pro ON asi.cod_programa = pro.cod_programa
WHERE pro.nombre_programa_academico IN ('Ingeniería de Sistemas', 'Tecnología en Desarrollo de Software')
ORDER BY asi.cod_programa, asi.cod_asignatura;

-- 11. Listado de Asignaturas #11
-- Listado de asignaturas del programa de “Ingeniería de Software” y “Tecnologías en Desarrollo de Software”
-- ordenado por código de programa y código asignatura. Incluir 6 campos
SELECT
    asi.cod_asignatura,
    asi.nombre_asignatura,
    asi.codigo,
    asi.creditos_asignatura,
    asi.semestre,
    asi.cod_programa
FROM asignatura AS asi
JOIN programa_academico AS pro ON asi.cod_programa = pro.cod_programa
WHERE pro.nombre_programa_academico IN ('Ingeniería de Sistemas', 'Tecnología en Desarrollo de Software')
ORDER BY asi.cod_programa, asi.cod_asignatura;
ORDER BY asi.cod_programa, asi.cod_asignatura;

-- 12. Listado de Asignaturas #12
-- Listado de cantidad de asignaturas por programa. Presentar código de programa y cantidad total
SELECT 
    asi.cod_programa AS codigo_programa,
    COUNT(*) AS total_asignaturas
FROM asignatura AS asi
GROUP BY asi.cod_programa
ORDER BY asi.cod_programa;

-- 13. Listado libre #13
-- Cantidad de entregables por tipo de entregable
SELECT 
    ent.cod_tipo_entregable AS tipo_entregable,
    COUNT(*) AS total_entregables
FROM entregable AS ent
GROUP BY ent.cod_tipo_entregable
ORDER BY total_entregables DESC;

-- 14. Listado libre #14
-- Cantidad de proyectos por tipo de proyecto
SELECT 
    pro.cod_tipo_proyecto AS tipo_proyecto,
    COUNT(*) AS total_proyectos
FROM proyecto AS pro
GROUP BY pro.cod_tipo_proyecto
ORDER BY total_proyectos DESC;

-- 15. Listado libre #15
-- Cantidad de evaluaciones por evaluador
SELECT 
    eva.cod_evaluador AS codigo_evaluador,
    COUNT(*) AS total_evaluaciones
FROM evaluacion AS eva
GROUP BY eva.cod_evaluador
ORDER BY total_evaluaciones DESC;



