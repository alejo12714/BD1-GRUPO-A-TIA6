-- 1. Listado de Proyectos #1
-- Listado general de proyectos ordenado por facultad, programa y código de proyecto. Obligatorio el uso de las tablas: tipo_proyecto, proyectos, facultad, programas.
SELECT
    fac.nombre_facultad,
    proa.nombre_programa_academico,
    proy.cod_proyecto,
    proy.titulo_del_proyecto,
    tipo.tipo_proyecto
FROM proyecto AS proy
JOIN tipo_proyecto AS tipo ON proy.cod_tipo_proyecto = tipo.cod_tipo_proyecto
JOIN estudiante AS estu ON proy.cod_proyecto = estu.cod_Proyecto -- Assuming a project must have at least one student to link to a program
JOIN programa_academico AS proa ON estu.cod_programa_academico = proa.cod_programa
JOIN departamento AS depa ON proa.cod_departamento = depa.cod_departamento
JOIN facultad AS fac ON depa.cod_facultad = fac.cod_facultad
ORDER BY fac.nombre_facultad, proa.nombre_programa_academico, proy.cod_proyecto;

-- 2. Listado de Proyectos #2
-- Listado detallado de proyectos ordenado por código de proyecto. Obligatorio el uso de las tablas: tipo_de_proyecto, proyectos, facultad, programas, asignaturas, grupos, docentes y estudiantes. Debe incluir los nombres de tipo_de_proyecto, nombre_proyecto, nombre_facultad, nombre_programa, nombre_asignatura, nombre_docentes, nombre_estudiantes.
SELECT
    proy.cod_proyecto,
    tipo.tipo_proyecto AS nombre_tipo_proyecto,
    proy.titulo_del_proyecto AS nombre_proyecto,
    fac.nombre_facultad,
    proa.nombre_programa_academico,
    asig.nombre_asignatura,
    curs.serie_curso AS nombre_curso,
    doce.nombre1 || ' ' || doce.apellido1 AS nombre_docente,
    estu.nombre1 || ' ' || estu.apellido1 AS nombre_estudiante
FROM proyecto AS proy
JOIN tipo_proyecto AS tipo ON proy.cod_tipo_proyecto = tipo.cod_tipo_proyecto
INNER JOIN  estudiante AS estu ON proy.cod_proyecto = estu.cod_Proyecto
LEFT JOIN programa_academico AS proa ON estu.cod_programa_academico = proa.cod_programa
LEFT JOIN departamento AS depa ON proa.cod_departamento = depa.cod_departamento
LEFT JOIN facultad AS fac ON depa.cod_facultad = fac.cod_facultad
INNER JOIN "curso-estudiante" AS curest ON estu.cod_estudiante = curest.cod_estudiante
INNER JOIN curso AS curs ON curest.cod_curso = curs.cod_curso
INNER JOIN asignatura AS asig ON curs.cod_asignatura = asig.cod_asignatura
INNER JOIN docente AS doce ON curs.cod_docente = doce.cod_docente
ORDER BY proy.cod_proyecto;

-- 3. Listado de Proyectos #3
-- Listado general de evaluación de proyectos. Nota: es libre la construcción de la consulta. Lo importante es que tenga todos los datos relevantes de los resultados de la evaluación de los proyectos.
SELECT
    proy.cod_proyecto,
    proy.titulo_del_proyecto,
    eval.cod_evaluacion,
    eval.observacion_evaluacion,
    eval.ponderacion_evaluacion,
    evalu.nombre1 || ' ' || evalu.apellido1 AS nombre_evaluador,
    inst.nombre_institucion AS institucion_evaluador,
    eval.c1, eval.c2, eval.c3, eval.c4, eval.c5, eval.c6, eval.c7, eval.c8, eval.c9, eval.c10 -- Including all generic evaluation criteria
FROM proyecto AS proy
JOIN evaluacion AS eval ON proy.cod_evaluacion = eval.cod_evaluacion
JOIN evaluadores AS evalu ON eval.cod_evaluador = evalu.cod_evaluador
JOIN institucion AS inst ON evalu.cod_institucion = inst.cod_institucion
ORDER BY proy.cod_proyecto, eval.cod_evaluacion;

-- 4. Listado de Proyectos #4
-- Listado de cantidad de proyectos por programa ordenado por facultad/programa/proyecto. Presentar el listado con código y descripción de la facultad, código y descripción del programa y cantidad_total_de_proyectos_por_programa.
SELECT
    fac.cod_facultad,
    fac.nombre_facultad,
    proa.cod_programa,
    proa.nombre_programa_academico,
    COUNT(proy.cod_proyecto) AS cantidad_total_de_proyectos_por_programa
FROM facultad AS fac
JOIN departamento AS depa ON fac.cod_facultad = depa.cod_facultad
JOIN programa_academico AS proa ON depa.cod_departamento = proa.cod_departamento
LEFT JOIN estudiante AS estu ON proa.cod_programa = estu.cod_programa_academico
LEFT JOIN proyecto AS proy ON estu.cod_Proyecto = proy.cod_proyecto
GROUP BY fac.cod_facultad, fac.nombre_facultad, proa.cod_programa, proa.nombre_programa_academico
ORDER BY fac.nombre_facultad, proa.nombre_programa_academico;

-- 5. Listado de Asignatura/Estudiantes #1
-- Listado de estudiantes de una asignatura/grupo. Ejemplo: Listado de estudiantes de la asignatura "Base de Datos I" (ET0187) "Grupo 051".
SELECT
    estu.nombre1,
    estu.apellido1,
    estu.correo_electronico,
    asig.nombre_asignatura,
    curs.serie_curso AS nombre_grupo -- Assuming serie_curso can represent the group name
FROM estudiante AS estu
JOIN "curso-estudiante" AS curest ON estu.cod_estudiante = curest.cod_estudiante
JOIN curso AS curs ON curest.cod_curso = curs.cod_curso
JOIN asignatura AS asig ON curs.cod_asignatura = asig.cod_asignatura
-- WHERE
--     asig.nombre_asignatura = 'Base de Datos I' -- Descomentar y ajustar si se requiere un filtro específico
--     AND asig.codigo = 'ET0187'
--     AND curs.serie_curso = 'Grupo 051';


-- 6. Listado de Asignatura/Estudiantes #1 (Second Instance - interpreted as #2 from the image)
-- Listado de asignaturas/grupos de los diferentes tipos de proyecto ordenado por tipo_de_proyecto, facultad, programa, asignatura.
SELECT
    tipo.tipo_proyecto,
    fac.nombre_facultad,
    proa.nombre_programa_academico,
    asig.nombre_asignatura,
    curs.serie_curso AS nombre_grupo
FROM tipo_proyecto AS tipo
LEFT JOIN proyecto AS proy ON tipo.cod_tipo_proyecto = proy.cod_tipo_proyecto
LEFT JOIN "proyecto-curso" AS procu ON proy.cod_proyecto = procu.cod_proyecto
LEFT JOIN curso AS curs ON procu.cod_curso = curs.cod_curso
LEFT JOIN asignatura AS asig ON curs.cod_asignatura = asig.cod_asignatura
LEFT JOIN programa_academico AS proa ON asig.cod_programa = proa.cod_programa
LEFT JOIN departamento AS depa ON proa.cod_departamento = depa.cod_departamento
LEFT JOIN facultad AS fac ON depa.cod_facultad = fac.cod_facultad
GROUP BY tipo.tipo_proyecto, fac.nombre_facultad, proa.nombre_programa_academico, asig.nombre_asignatura, curs.serie_curso
ORDER BY tipo.tipo_proyecto, fac.nombre_facultad, proa.nombre_programa_academico, asig.nombre_asignatura;

-- 7. Listado de Asignatura/Estudiantes #3
-- Listado de cantidad_de_proyectos_por_facultad_y_programa ordenado por tipo_de_proyecto/facultad/programa/tipo_de_proyecto. Presentar el listado con código_y_descripción de la facultad, código_y_descripción del programa, código_y_descripción del tipo_de_proyecto y cantidad_total_de_proyectos.
SELECT
    fac.cod_facultad,
    fac.nombre_facultad AS descripcion_facultad,
    proa.cod_programa,
    proa.nombre_programa_academico AS descripcion_programa,
    tipo.cod_tipo_proyecto,
    tipo.tipo_proyecto AS descripcion_tipo_proyecto,
    COUNT(proy.cod_proyecto) AS cantidad_total_de_proyectos
FROM facultad AS fac
JOIN departamento AS depa ON fac.cod_facultad = depa.cod_facultad
JOIN programa_academico AS proa ON depa.cod_departamento = proa.cod_departamento
LEFT JOIN estudiante AS estu ON proa.cod_programa = estu.cod_programa_academico
LEFT JOIN proyecto AS proy ON estu.cod_Proyecto = proy.cod_proyecto
LEFT JOIN tipo_proyecto AS tipo ON proy.cod_tipo_proyecto = tipo.cod_tipo_proyecto
GROUP BY fac.cod_facultad, fac.nombre_facultad, proa.cod_programa, proa.nombre_programa_academico, tipo.cod_tipo_proyecto, tipo.tipo_proyecto
ORDER BY tipo.tipo_proyecto, fac.nombre_facultad, proa.nombre_programa_academico, tipo.tipo_proyecto;

-- 8. Listado de Evaluadores #1
-- Listado de evaluadores de los diferentes proyectos ordenado por evaluador, facultad, programa, tipo de proyecto y proyecto (No solamente los códigos. También se requieren todas las descripciones).
SELECT
    evalu.cod_evaluador,
    evalu.nombre1 || ' ' || evalu.apellido1 AS nombre_completo_evaluador,
    evalu.especialidad_evaluador,
    insti.nombre_institucion AS institucion_evaluador,
    fac.nombre_facultad,
    proa.nombre_programa_academico,
    tipo.tipo_proyecto AS tipo_proyecto_descripcion,
    proy.cod_proyecto,
    proy.titulo_del_proyecto AS nombre_proyecto,
    proy.objetivo_proyecto
FROM evaluadores AS evalu
JOIN institucion AS insti ON evalu.cod_institucion = insti.cod_institucion
LEFT JOIN evaluacion AS eval ON evalu.cod_evaluador = eval.cod_evaluador
LEFT JOIN proyecto AS proy ON eval.cod_proyecto = proy.cod_proyecto
LEFT JOIN tipo_proyecto AS tipo ON proy.cod_tipo_proyecto = tipo.cod_tipo_proyecto
LEFT JOIN estudiante AS estu ON proy.cod_proyecto = estu.cod_Proyecto -- Link project to student to find program/faculty
LEFT JOIN programa_academico AS proa ON estu.cod_programa_academico = proa.cod_programa
LEFT JOIN departamento AS depa ON proa.cod_departamento = depa.cod_departamento
LEFT JOIN facultad AS fac ON depa.cod_facultad = fac.cod_facultad
ORDER BY evalu.nombre1, fac.nombre_facultad, proa.nombre_programa_academico, tipo.tipo_proyecto, proy.cod_proyecto;

-- 9. Listado de Evaluadores #2
-- Listado de evaluadores con resultados generales de evaluación de los proyectos asignados.
SELECT
    evalu.cod_evaluador,
    evalu.nombre1 || ' ' || evalu.apellido1 AS nombre_completo_evaluador,
    evalu.especialidad_evaluador,
    COUNT(DISTINCT proy.cod_proyecto) AS cantidad_proyectos_evaluados,
    AVG(eval.ponderacion_evaluacion) AS promedio_ponderacion_evaluacion
FROM evaluadores AS evalu
LEFT JOIN evaluacion AS eval ON evalu.cod_evaluador = eval.cod_evaluador
LEFT JOIN proyecto AS proy ON eval.cod_proyecto = proy.cod_proyecto
GROUP BY evalu.cod_evaluador, evalu.nombre1, evalu.apellido1, evalu.especialidad_evaluador
ORDER BY evalu.nombre1, evalu.apellido1;

-- 10. Listado de Evaluadores #3
-- Listado de evaluadores con resultados detallados de evaluación de los proyectos asignados.
SELECT
    evalu.cod_evaluador,
    evalu.nombre1 || ' ' || evalu.apellido1 AS nombre_completo_evaluador,
    evalu.especialidad_evaluador,
    proy.cod_proyecto,
    proy.titulo_del_proyecto,
    eval.cod_evaluacion,
    eval.descripcion_evaluacion,
    eval.ponderacion_evaluacion,
    eval.c1, eval.c2, eval.c3, eval.c4, eval.c5, eval.c6, eval.c7, eval.c8, eval.c9, eval.c10
FROM evaluadores AS evalu
JOIN evaluacion AS eval ON evalu.cod_evaluador = eval.cod_evaluador
LEFT JOIN proyecto AS proy ON eval.cod_proyecto = proy.cod_proyecto
ORDER BY evalu.nombre1, evalu.apellido1, proy.cod_proyecto, eval.cod_evaluacion;

-- 11. Listado de usuarios #1
-- Listado de usuarios del sistema con el rol asociado y las características del usuario (limitadas a las existentes en la tabla 'usuario').
SELECT
    usua.cod_usuario,
    usua.usuario,
    usua.contrasena_usuario, -- Si deseas mostrar la contraseña (considera implicaciones de seguridad)
    role.nombre_rol,
    role.descripcion_rol
FROM usuario AS usua
JOIN "usuario-rol" AS usur ON usua.cod_usuario = usur.cod_usuario
JOIN rol AS role ON usur.cod_rol = role.cod_rol
ORDER BY usua.usuario; -- Ordenar por el nombre de usuario

-- 12. Listado ... libre
-- Consulta libre con al menos 3 join, group by y order by.
SELECT
    fac.cod_facultad,
    fac.nombre_facultad,
    COUNT(DISTINCT proy.cod_proyecto) AS cantidad_proyectos,
    AVG(eval.ponderacion_evaluacion) AS promedio_ponderacion_general
FROM facultad AS fac
JOIN departamento AS depa ON fac.cod_facultad = depa.cod_facultad
JOIN programa_academico AS proa ON depa.cod_departamento = proa.cod_departamento
LEFT JOIN estudiante AS estu ON proa.cod_programa = estu.cod_programa_academico
LEFT JOIN proyecto AS proy ON estu.cod_Proyecto = proy.cod_proyecto
LEFT JOIN evaluacion AS eval ON proy.cod_evaluacion = eval.cod_evaluacion
GROUP BY fac.cod_facultad, fac.nombre_facultad
HAVING COUNT(DISTINCT proy.cod_proyecto) > 0 -- Only include faculties with at least one project
ORDER BY cantidad_proyectos DESC, fac.nombre_facultad;