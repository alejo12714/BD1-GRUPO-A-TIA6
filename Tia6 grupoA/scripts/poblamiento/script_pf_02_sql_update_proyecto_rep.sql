-- Esto debe ejecutarse DESPUÉS de que se hayan insertado los entregables y reps.
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