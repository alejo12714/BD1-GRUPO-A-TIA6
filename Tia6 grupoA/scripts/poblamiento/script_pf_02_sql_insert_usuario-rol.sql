INSERT INTO "usuario-rol" (cod_usuario, cod_rol) VALUES
(1, 1), (1, 8), (2, 2), (2, 4), (3, 3), (3, 7), (4, 2), (4, 6), (5, 3), (6, 2),
(7, 4), (7, 5), (8, 2), (9, 7), (10, 2), (10, 9), (11, 2), (12, 2), (13, 4), (14, 2),
(15, 3), (15, 7), (16, 3),
(17, 7), (17, 10), (18, 3), (19, 4), (19, 5), (20, 7),
(20, 9), (1, 6), (2, 10), (4, 9), (6, 4), (8, 5),
-- Nuevas entradas para los evaluadores reasignados (cod_rol = 4)
(91, 4), (92, 4), (93, 4), (94, 4), (95, 4);
-- Actualizaciones para establecer las claves foráneas en la tabla 'proyecto'
-- Esto debe ejecutarse DESPUÉS de que se hayan insertado los entregables, evaluaciones y reps.
UPDATE proyecto SET cod_entregable = 1, cod_evaluacion = 1, cod_rep = 1 WHERE cod_proyecto = 1;
UPDATE proyecto SET cod_entregable = 2, cod_evaluacion = 2, cod_rep = 2 WHERE cod_proyecto = 2;
UPDATE proyecto SET cod_entregable = 3, cod_evaluacion = 3, cod_rep = 3 WHERE cod_proyecto = 3;
UPDATE proyecto SET cod_entregable = 4, cod_evaluacion = 4, cod_rep = 4 WHERE cod_proyecto = 4;
UPDATE proyecto SET cod_entregable = 5, cod_evaluacion = 5, cod_rep = 5 WHERE cod_proyecto = 5;
UPDATE proyecto SET cod_entregable = 6, cod_evaluacion = 6, cod_rep = 6 WHERE cod_proyecto = 6;
UPDATE proyecto SET cod_entregable = 7, cod_evaluacion = 7, cod_rep = 7 WHERE cod_proyecto = 7;
UPDATE proyecto SET cod_entregable = 8, cod_evaluacion = 8, cod_rep = 8 WHERE cod_proyecto = 8;
UPDATE proyecto SET cod_entregable = 9, cod_evaluacion = 9, cod_rep = 9 WHERE cod_proyecto = 9;
UPDATE proyecto SET cod_entregable = 10, cod_evaluacion = 10, cod_rep = 10 WHERE cod_proyecto = 10;

-- Actualizaciones para establecer las claves foráneas en la tabla 'rep'
UPDATE rep SET cod_proyecto = 1 WHERE cod_rep = 1;
UPDATE rep SET cod_proyecto = 2 WHERE cod_rep = 2;
UPDATE rep SET cod_proyecto = 3 WHERE cod_rep = 3;
UPDATE rep SET cod_proyecto = 4 WHERE cod_rep = 4;
UPDATE rep SET cod_proyecto = 5 WHERE cod_rep = 5;
UPDATE rep SET cod_proyecto = 6 WHERE cod_rep = 6;
UPDATE rep SET cod_proyecto = 7 WHERE cod_rep = 7;
UPDATE rep SET cod_proyecto = 8 WHERE cod_rep = 8;
UPDATE rep SET cod_proyecto = 9 WHERE cod_rep = 9;
UPDATE rep SET cod_proyecto = 10 WHERE cod_rep = 10;

-- Restablecer el comportamiento de las restricciones después de la creación y carga de datos
SET CONSTRAINTS ALL IMMEDIATE;