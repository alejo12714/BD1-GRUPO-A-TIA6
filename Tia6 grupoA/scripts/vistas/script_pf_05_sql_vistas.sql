-- 1. vista_proyectos
-- Propósito: Proporciona un listado completo y detallado de proyectos, uniendo información
--            relevante de diferentes tablas para ofrecer una visión consolidada.
-- Tablas Clave: proyecto, tipo_proyecto, estudiante, programa_academico, facultad,
--                asignatura, curso, docente.
CREATE VIEW vista_proyectos AS
SELECT
    p.cod_proyecto,
    p.titulo_del_proyecto,
    p.objetivo_proyecto,
    p.fecha_inicio_proyecto,
    p.fecha_fin_proyecto,
    tp.cod_tipo_proyecto,
    tp.tipo_proyecto,
    f.cod_facultad,
    f.nombre_facultad,
    pa.cod_programa,
    pa.nombre_programa_academico,
    a.cod_asignatura,
    a.nombre_asignatura,
    a.codigo AS codigo_asignatura,
    c.cod_curso,
    c.serie_curso AS nombre_grupo,
    d.cod_docente,
    d.nombre1 AS nombre_docente1,
    d.nombre2 AS nombre_docente2,
    d.apellido1 AS apellido_docente1,
    d.apellido2 AS apellido_docente2,
    e.cod_estudiante,
    e.nombre1 AS nombre_estudiante1,
    e.nombre2 AS nombre_estudiante2,
    e.apellido1 AS apellido_estudiante1,
    e.apellido2 AS apellido_estudiante2
FROM
    proyecto AS p
JOIN
    tipo_proyecto AS tp ON p.cod_tipo_proyecto = tp.cod_tipo_proyecto
LEFT JOIN
    estudiante AS e ON p.cod_proyecto = e.cod_Proyecto
LEFT JOIN
    programa_academico AS pa ON e.cod_programa_academico = pa.cod_programa
LEFT JOIN
    departamento AS dep ON pa.cod_departamento = dep.cod_departamento
LEFT JOIN
    facultad AS f ON dep.cod_facultad = f.cod_facultad
LEFT JOIN
    "proyecto-curso" AS pc ON p.cod_proyecto = pc.cod_proyecto
LEFT JOIN
    curso AS c ON pc.cod_curso = c.cod_curso
LEFT JOIN
    asignatura AS a ON c.cod_asignatura = a.cod_asignatura
LEFT JOIN
    docente AS d ON c.cod_docente = d.cod_docente;


-- 2. vista_evaluaciones
-- Propósito: Proporciona un listado detallado de las evaluaciones realizadas,
--            vinculando cada evaluación con el proyecto evaluado y sus detalles asociados.
-- Tablas Clave: evaluacion, evaluadores, proyecto, tipo_proyecto, estudiante,
--                programa_academico, facultad, asignatura, curso, docente.
-- 2. vista_evaluaciones
-- Propósito: Proporciona un listado detallado de las evaluaciones realizadas,
--            vinculando cada evaluación con el proyecto evaluado y sus detalles asociados.
-- Tablas Clave: evaluacion, evaluadores, proyecto, tipo_proyecto, estudiante,
--                programa_academico, facultad, asignatura, curso, docente.
CREATE VIEW vista_evaluaciones AS
SELECT
    evalu.cod_evaluacion,
    evalu.descripcion_evaluacion,
    evalu.ponderacion_evaluacion,
    evaluador.nombre1 || ' ' || evaluador.apellido1 AS nombre_evaluador,
    pro.cod_proyecto,
    pro.titulo_del_proyecto AS nombre_proyecto,
    tip.tipo_proyecto AS nombre_tipo_proyecto,
    fac.nombre_facultad,
    proa.nombre_programa_academico,
    asi.nombre_asignatura,
    curs.serie_curso AS nombre_curso, -- <-- ¡Campo 'nombre_curso' añadido aquí!
    doc.nombre1 || ' ' || doc.apellido1 AS nombre_docente,
    estu.nombre1 || ' ' || estu.apellido1 AS nombre_estudiante,
    evalu.c1, evalu.c2, evalu.c3, evalu.c4, evalu.c5, evalu.c6, evalu.c7, evalu.c8, evalu.c9, evalu.c10
FROM
    evaluacion AS evalu
JOIN
    evaluadores AS evaluador ON evalu.cod_evaluador = evaluador.cod_evaluador
LEFT JOIN
    proyecto AS pro ON evalu.cod_proyecto = pro.cod_proyecto
LEFT JOIN
    tipo_proyecto AS tip ON pro.cod_tipo_proyecto = tip.cod_tipo_proyecto
LEFT JOIN
    estudiante AS estu ON pro.cod_proyecto = estu.cod_Proyecto
LEFT JOIN
    programa_academico AS proa ON estu.cod_programa_academico = proa.cod_programa
LEFT JOIN
    departamento AS depa ON proa.cod_departamento = depa.cod_departamento
LEFT JOIN
    facultad AS fac ON depa.cod_facultad = fac.cod_facultad
LEFT JOIN
    "curso-estudiante" AS cures ON estu.cod_estudiante = cures.cod_estudiante
LEFT JOIN
    curso AS curs ON cures.cod_curso = curs.cod_curso -- <-- La unión a 'curso' ya existe
LEFT JOIN
    asignatura AS asi ON curs.cod_asignatura = asi.cod_asignatura
LEFT JOIN
    docente AS doc ON curs.cod_docente = doc.cod_docente;
-- 3. vista_estadistica
-- Propósito: Genera un resumen estadístico de la cantidad de proyectos,
--            agrupados por facultad, programa académico, asignatura y tipo de proyecto.
-- Tablas Clave: facultad, departamento, programa_academico, asignatura,
--                curso, proyecto, tipo_proyecto.
CREATE OR REPLACE VIEW vista_estadistica AS
SELECT
    f.nombre_facultad,
    pa.nombre_programa_academico,
    -- Se corrige el tipo de dato explícitamente para COALESCE en nombre_asignatura
    COALESCE(a.nombre_asignatura, CAST('Sin Asignatura' AS VARCHAR(255))) AS nombre_asignatura,
    -- Se corrige el tipo de dato explícitamente para COALESCE en tipo_proyecto
    COALESCE(tp.tipo_proyecto, CAST('Sin Tipo de Proyecto' AS VARCHAR(10))) AS tipo_proyecto,
    COUNT(DISTINCT p.cod_proyecto) AS cantidad_total_de_proyectos
FROM
    facultad AS f
JOIN
    departamento AS d ON f.cod_facultad = d.cod_facultad
JOIN
    programa_academico AS pa ON d.cod_departamento = pa.cod_departamento
LEFT JOIN
    asignatura AS a ON pa.cod_programa = a.cod_programa
LEFT JOIN
    curso AS c ON a.cod_asignatura = c.cod_asignatura
LEFT JOIN
    "proyecto-curso" AS pc ON c.cod_curso = pc.cod_curso
LEFT JOIN
    proyecto AS p ON pc.cod_proyecto = p.cod_proyecto
LEFT JOIN
    tipo_proyecto AS tp ON p.cod_tipo_proyecto = tp.cod_tipo_proyecto
GROUP BY
    f.nombre_facultad,
    pa.nombre_programa_academico,
    -- El GROUP BY también debe usar la expresión COALESCE corregida
    COALESCE(a.nombre_asignatura, CAST('Sin Asignatura' AS VARCHAR(255))),
    COALESCE(tp.tipo_proyecto, CAST('Sin Tipo de Proyecto' AS VARCHAR(10)));

-- 4. Nombre de la Vista: vista_detalles_proyectos
-- Descripción:
-- Esta vista proporciona una visión consolidada y detallada de los proyectos,
-- incluyendo información del proyecto en sí, los estudiantes asociados y sus programas académicos,
-- las evaluaciones realizadas, los evaluadores participantes, y los docentes vinculados
-- a los cursos de los estudiantes.
CREATE VIEW vista_detalles_proyectos AS
SELECT
    p.cod_proyecto,
    p.titulo_del_proyecto,
    tp.tipo_proyecto AS tipo_de_proyecto,
    p.fecha_inicio_proyecto,
    p.fecha_fin_proyecto,
    -- Información del Estudiante
    COALESCE(e.nombre1 || ' ' || e.apellido1, CAST('Sin Estudiante Asignado' AS VARCHAR(41))) AS nombre_estudiante,
    COALESCE(e.correo_electronico, CAST('N/A' AS VARCHAR(50))) AS correo_estudiante,
    COALESCE(pa.nombre_programa_academico, CAST('Sin Programa Estudiante' AS VARCHAR(100))) AS programa_academico_estudiante,
    -- Información de la Evaluación
    COALESCE(eva.descripcion_evaluacion, CAST('Sin Evaluación Registrada' AS VARCHAR(500))) AS descripcion_evaluacion,
    COALESCE(eva.ponderacion_evaluacion, 0.00) AS ponderacion_evaluacion,
    -- Información del Evaluador
    COALESCE(ev.nombre1 || ' ' || ev.apellido1, CAST('Sin Evaluador Asignado' AS VARCHAR(41))) AS nombre_evaluador,
    COALESCE(ev.correo_electronico, CAST('N/A' AS VARCHAR(50))) AS correo_evaluador,
    COALESCE(ev.especialidad_evaluador, CAST('N/A' AS VARCHAR(200))) AS especialidad_evaluador,
    -- Información del Curso y Docente (a través del estudiante y el curso)
    COALESCE(c.serie_curso, CAST('Sin Curso Vinculado' AS VARCHAR(100))) AS serie_curso,
    COALESCE(a.nombre_asignatura, CAST('Sin Asignatura Vinculada' AS VARCHAR(255))) AS nombre_asignatura,
    COALESCE(d.nombre1 || ' ' || d.apellido1, CAST('Sin Docente Asignado al Curso' AS VARCHAR(41))) AS nombre_docente_curso,
    COALESCE(d.correo_electronico, CAST('N/A' AS VARCHAR(50))) AS correo_docente_curso
FROM
    proyecto AS p
JOIN
    tipo_proyecto AS tp ON p.cod_tipo_proyecto = tp.cod_tipo_proyecto
LEFT JOIN
    estudiante AS e ON p.cod_proyecto = e.cod_proyecto -- Relación Proyecto a Estudiante
LEFT JOIN
    programa_academico AS pa ON e.cod_programa_academico = pa.cod_programa -- Programa del Estudiante
LEFT JOIN
    evaluacion AS eva ON p.cod_proyecto = eva.cod_proyecto -- Relación Proyecto a Evaluación
LEFT JOIN
    evaluadores AS ev ON eva.cod_evaluador = ev.cod_evaluador -- Evaluador de la Evaluación
LEFT JOIN
    "curso-estudiante" AS ce ON e.cod_estudiante = ce.cod_estudiante -- Estudiante a Curso
LEFT JOIN
    curso AS c ON ce.cod_curso = c.cod_curso -- Curso
LEFT JOIN
    asignatura AS a ON c.cod_asignatura = a.cod_asignatura -- Asignatura del Curso
LEFT JOIN
    docente AS d ON c.cod_docente = d.cod_docente; -- Docente del Curso

-- 5. Vista-consulta #3 (Utiliza vista_estadistica)
-- Propósito: Muestra el número total de proyectos por cada Programa Académico,
--            filtrando solo los programas que tienen al menos 3 proyectos.
-- Utiliza: vista_estadistica
CREATE OR REPLACE VIEW vista_consulta_proyectos_por_programa_conteo AS
SELECT
    ve.nombre_programa_academico,
    SUM(ve.cantidad_total_de_proyectos) AS total_proyectos_por_programa
FROM
    vista_estadistica AS ve
GROUP BY
    ve.nombre_programa_academico
HAVING
    SUM(ve.cantidad_total_de_proyectos) >= 3 -- Umbral de cantidad de proyectos
ORDER BY
    total_proyectos_por_programa DESC,
    ve.nombre_programa_academico;

-- 6. Vista-consulta #4 (Utiliza vista_detalles_proyectos)
-- Propósito: Lista los proyectos que ya tienen una evaluación registrada y, además, tienen un docente de curso asignado.
--            Esto es útil para ver el estado de madurez y supervisión de los proyectos.
-- Utiliza: vista_detalles_proyectos
CREATE OR REPLACE VIEW vista_consulta_proyectos_evaluados_y_supervisados AS
SELECT
    vdp.cod_proyecto,
    vdp.titulo_del_proyecto,
    vdp.tipo_de_proyecto,
    vdp.nombre_evaluador,
    vdp.ponderacion_evaluacion,
    vdp.nombre_docente_curso,
    vdp.nombre_asignatura
FROM
    vista_detalles_proyectos AS vdp
WHERE
    vdp.descripcion_evaluacion <> 'Sin Evaluación Registrada' -- Se ha registrado una evaluación
    AND vdp.nombre_docente_curso <> 'Sin Docente Asignado al Curso' -- Hay un docente asignado al curso del estudiante
ORDER BY
    vdp.titulo_del_proyecto,
    vdp.nombre_docente_curso;

-- 7. Vista-consulta #1 (Utiliza vista_proyectos)
-- Propósito: Lista todos los proyectos que tienen un estudiante asignado.
--            Útil para obtener una lista de proyectos activos con participación estudiantil.
-- Utiliza: vista_proyectos
CREATE OR REPLACE VIEW vista_consulta_proyectos_con_estudiantes AS
SELECT
    vp.cod_proyecto,
    vp.titulo_del_proyecto,
    vp.nombre_estudiante1,
    vp.nombre_programa_academico,
    vp.nombre_facultad
FROM
    vista_proyectos AS vp
WHERE
    vp.cod_estudiante IS NOT NULL
ORDER BY
    vp.titulo_del_proyecto;


-- 8. Vista-consulta #2 (Utiliza vista_evaluaciones)
-- Propósito: Muestra el nombre del proyecto, su ponderación de evaluación, y la descripción de la evaluación,
--            solo para proyectos que han sido evaluados.
-- Utiliza: vista_evaluaciones
CREATE OR REPLACE VIEW vista_consulta_evaluaciones_basicas AS
SELECT
    ve.nombre_proyecto,
    ve.ponderacion_evaluacion,
    ve.descripcion_evaluacion,
    ve.nombre_evaluador
FROM
    vista_evaluaciones AS ve
WHERE
    ve.cod_evaluacion IS NOT NULL -- Asegura que la evaluación exista
ORDER BY
    ve.nombre_proyecto;