SET CONSTRAINTS ALL DEFERRED;

-- 1. Inserciones para tablas independientes
INSERT INTO permiso (cod_permiso, nombre_permiso, descripcion_permiso) VALUES
(1, 'GestionarUsuarios', 'Permite crear, editar y eliminar cuentas de usuario.'),
(2, 'VerProyectos', 'Permite la visualización de los detalles de todos los proyectos.'),
(3, 'CrearProyecto', 'Permite crear nuevos proyectos en el sistema.'),
(4, 'EditarMiProyecto', 'Permite editar la información de un proyecto del cual es miembro (estudiante/docente).'),
(5, 'EliminarProyecto', 'Permite eliminar proyectos del sistema.'),
(6, 'SubirEntregable', 'Permite a los usuarios cargar archivos o documentos como entregables de su proyecto.'),
(7, 'VerMisEvaluaciones', 'Permite a los estudiantes ver las evaluaciones de su proyecto.'),
(8, 'EvaluarProyectos', 'Otorga la capacidad de calificar y dejar comentarios en todos los proyectos y entregables.'),
(9, 'VerEvaluacionesAjenas', 'Permite a docentes/evaluadores ver evaluaciones de otros proyectos (no propios).'),
(10, 'GestionarCursos', 'Permite crear, editar y eliminar cursos.'),
(11, 'InscribirEstudiantes', 'Permite inscribir estudiantes a cursos o proyectos.'),
(12, 'VerEntregables', 'Permite ver los entregables subidos por cualquier proyecto.'),
(13, 'VerEvaluacionesPropias', 'Permite a docentes/evaluadores ver sus propias evaluaciones que han realizado.'),
(14, 'GestionarRolesPermisos', 'Permite la administración de roles y permisos del sistema.'),
(15, 'VerEventoPublico', 'Permite a espectadores o invitados ver información pública de un evento o proyectos.'),
(16, 'ComentarProyecto', 'Permite dejar comentarios no evaluativos en un proyecto (sin rol de evaluador).');


INSERT INTO tipo_proyecto(cod_tipo_proyecto, tipo_proyecto) VALUES
(100, 'PIA'),
(101, 'PA'),
(102, 'PE');


INSERT INTO era (cod_era, numero_era, descripcion_era) VALUES
(1, 1, 'Fase de Inicio: Definición y alcance del proyecto.'),
(2, 2, 'Fase de Planificación: Diseño y estructuración de la solución.'),
(3, 3, 'Fase de Ejecución: Implementación y desarrollo.'),
(4, 4, 'Fase de Monitoreo y Control: Seguimiento y ajuste.'),
(5, 5, 'Fase de Cierre: Entrega final y evaluación.');


INSERT INTO tipo_entregable (cod_tipo_entregable, nombre_tipo_entregable, descripcion_tipo_entregable) VALUES
(1, 'Poster', 'Representación visual y concisa de los objetivos, metodología y resultados clave del proyecto.'),
(2, 'Maqueta', 'Modelo físico o digital a escala que representa la estructura, diseño o prototipo de la solución.'),
(3, 'Programa/Codigo', 'Conjunto de instrucciones y archivos de código fuente que conforman la implementación del proyecto.'),
(4, 'Arduino', 'Dispositivo electrónico programable utilizado para prototipos o la implementación de soluciones de hardware.'),
(5, 'Presentación Final', 'Exposición oral y visual que resume el desarrollo, resultados y conclusiones del proyecto ante una audiencia.');


INSERT INTO orientacion_del_proyecto (cod_orientacion, categoria_orientacion_pryecto, descripcion_orientacion) VALUES
(1, 'Investigación Pura', 'Proyectos enfocados en la expansión del conocimiento teórico, sin un fin práctico inmediato, buscando entender principios fundamentales.'),
(2, 'Desarrollo Aplicado', 'Proyectos que buscan crear o mejorar productos, procesos o servicios existentes para resolver problemas específicos y satisfacer necesidades prácticas.'),
(3, 'Innovación Tecnológica', 'Proyectos orientados a la introducción de nuevas tecnologías, metodologías o modelos que generen un cambio disruptivo en un sector o área.'),
(4, 'Impacto Social y Comunitario', 'Proyectos diseñados para abordar y mitigar problemas sociales, mejorar la calidad de vida de comunidades o promover el bienestar colectivo.'),
(5, 'Educativo/Pedagógico', 'Proyectos dedicados a la mejora de los procesos de enseñanza-aprendizaje, el diseño de materiales didácticos o la implementación de nuevas estrategias educativas.');


INSERT INTO institucion (cod_institucion, nombre_institucion, tipo_institucion) VALUES
(1, 'Universidad Nacional', 'Educativa'),
(2, 'Empresa de Software S.A.S.', 'Tecnológica'),
(3, 'Centro Médico ABC', 'Salud');


INSERT INTO facultad (cod_facultad, nombre_facultad, institucion) VALUES
(1, 'Ingeniería', 'IUPB'),
(2, 'Producción y Diseño', 'IUPB'),
(3, 'Ciencias Económicas y Administrativas', 'IUPB');


INSERT INTO departamento (cod_departamento, nombre_departamento, cod_facultad) VALUES
(1, 'Departamento de Ingeniería Mecánica', 1), (2, 'Departamento de Ingeniería Eléctrica', 1), (3, 'Departamento de Ingeniería de Sistemas', 1),
(4, 'Departamento de Ingeniería de Producción', 1), (5, 'Departamento de Diseño Gráfico', 2), (6, 'Departamento de Diseño Industrial', 2),
(7, 'Departamento de Gestión de la Producción', 2), (8, 'Departamento de Administración de Empresas', 3), (9, 'Departamento de Contaduría Pública', 3),
(10, 'Departamento de Gestión Tecnológica', 3);


INSERT INTO programa_academico (cod_programa, nombre_programa_academico, cod_departamento) VALUES
(1, 'Ingeniería Mecánica', 1), (2, 'Tecnología en Gestión de Mantenimiento Aeronáutico', 1), (3, 'Ingeniería Eléctrica', 2),
(4, 'Tecnología en Electrónica', 2), (5, 'Ingeniería de Sistemas', 3), (6, 'Tecnología en Desarrollo de Software', 3),
(7, 'Ingeniería de Producción', 4), (8, 'Tecnología en Gestión de la Producción Industrial', 4), (9, 'Diseño Gráfico', 5),
(10, 'Diseño Industrial', 6), (11, 'Gestión de la Producción', 7), (12, 'Tecnología en Diseño de Vestuario', 7),
(13, 'Administración de Empresas', 8), (14, 'Contaduría Pública', 9), (15, 'Gestión Tecnológica', 10),
(16, 'Tecnología en Gestión Logística', 8), (17, 'Tecnología en Gestión Financiera', 9), (18, 'Profesional en Gestión del Talento Humano', 8);


INSERT INTO asignatura (cod_asignatura, nombre_asignatura, codigo, creditos_asignatura, descripcion, semestre, horas_clase, cod_programa) VALUES
(1, 'Bases de Datos I', 'BD101', 3, 'Introducción a los sistemas de gestión de bases de datos relacionales.', 3, 48, 5), -- Ingeniería de Sistemas
(2, 'Programación Orientada a Objetos', 'POO202', 4, 'Conceptos y aplicación de la programación orientada a objetos con Java.', 4, 64, 5), -- Ingeniería de Sistemas
(3, 'Análisis y Diseño de Sistemas', 'ADS303', 3, 'Metodologías para el análisis y diseño de sistemas de información.', 5, 48, 5), -- Ingeniería de Sistemas
(4, 'Redes de Computadores', 'RED404', 3, 'Fundamentos y protocolos de redes de computadores.', 6, 48, 3), -- Ingeniería Eléctrica
(5, 'Inteligencia Artificial', 'IA505', 4, 'Introducción a los principios y algoritmos de la inteligencia artificial.', 7, 64, 5), -- Ingeniería de Sistemas
(6, 'Desarrollo Web Avanzado', 'DWA606', 3, 'Desarrollo de aplicaciones web complejas con frameworks modernos.', 8, 48, 5), -- Ingeniería de Sistemas
(7, 'Cálculo Multivariable', 'CMV707', 4, 'Estudio de funciones de varias variables, derivadas parciales e integrales múltiples.', 3, 64, 1), -- Ingeniería Mecánica
(8, 'Estadística Aplicada', 'EST808', 3, 'Aplicación de métodos estadísticos para el análisis de datos en diferentes campos.', 4, 48, 13), -- Administración de Empresas
(9, 'Principios de Contabilidad', 'PCO909', 2, 'Conceptos básicos de contabilidad financiera y su aplicación.', 2, 32, 14), -- Contaduría Pública
(10, 'Gerencia de Proyectos', 'GPR1010', 3, 'Metodologías y herramientas para la planificación y ejecución de proyectos.', 5, 48, 15); -- Gestión Tecnológica


INSERT INTO ira (cod_ira, descripcion_ira, porcentaje_dominio_ira, cod_era) VALUES
(1, 'Comprensión profunda del problema de investigación.', 95, 1), (2, 'Diseño de la metodología y recolección de datos.', 80, 2),
(3, 'Análisis de datos y experimentación.', 75, 3), (4, 'Discusión de resultados y conclusiones.', 90, 4),
(5, 'Presentación de informes y defensa.', 88, 5), (6, 'Formulación de hipótesis iniciales', 70, 1),
(7, 'Elaboración de plan de trabajo detallado', 85, 2), (8, 'Desarrollo de prototipos funcionales', 65, 3),
(9, 'Validación y pruebas de usuario', 78, 4), (10, 'Redacción de artículo científico', 82, 5);


INSERT INTO rol (cod_rol, nombre_rol, descripcion_rol) VALUES
(1, 'Administrador', 'Control total del sistema.'),
(2, 'Docente', 'Gestiona cursos y proyectos.'),
(3, 'Estudiante', 'Participa en cursos y proyectos.'),
(4, 'Evaluador', 'Evalúa proyectos y entregables.'),
(5, 'Invitado', 'Acceso limitado para ver información.'),
(6, 'Coordinador', 'Gestiona programas académicos y asignaturas.'),
(7, 'Investigador', 'Participa en proyectos de investigación.'),
(8, 'Director', 'Supervisa departamentos y facultades.'),
(9, 'Asesor', 'Brinda soporte y consultoría.'),
(10, 'Colaborador', 'Contribuye en tareas específicas.');


INSERT INTO docente (cod_docente, cod_usuario, nombre1, nombre2, apellido1, apellido2, telefono1, telefono2, genero, correo_electronico, cod_departamento) VALUES
(1, 2, 'Maria', 'Isabel', 'Gómez', 'Pérez', '3001112233', NULL, 'F', 'maria.gomez@mail.com', 3), -- Ingeniería de Sistemas
(2, 4, 'Juan', 'Carlos', 'Rodríguez', 'López', '3002223344', NULL, 'M', 'juan.rodriguez@mail.com', 3), -- Ingeniería de Sistemas
(3, 6, 'Ana', 'Carolina', 'Martínez', 'Silva', '3003334455', NULL, 'F', 'ana.martinez@mail.com', 3), -- Ingeniería de Sistemas
(4, 8, 'Pedro', 'Antonio', 'Fernández', 'Ruiz', '3004445566', NULL, 'M', 'pedro.fernandez@mail.com', 1), -- Ingeniería Mecánica
(5, 10, 'Laura', 'Sofía', 'Díaz', 'Castro', '3005556677', NULL, 'F', 'laura.diaz@mail.com', 9), -- Contaduría Pública
(6, 11, 'Carlos', 'Andrés', 'Hernández', 'Vargas', '3006667788', NULL, 'M', 'carlos.hernandez@mail.com', 8), -- Administración de Empresas
(7, 12, 'Sofía', 'Valentina', 'Torres', 'Ramírez', '3007778899', NULL, 'F', 'sofia.torres@mail.com', 2), -- Ingeniería Eléctrica
(8, 13, 'Ricardo', 'José', 'Flores', 'Mora', '3008889900', NULL, 'M', 'ricardo.flores@mail.com', 1), -- Ingeniería Mecánica
(9, 14, 'Elena', 'Patricia', 'Benítez', 'Gutiérrez', '3009990011', NULL, 'F', 'elena.benitez@mail.com', 9), -- Contaduría Pública
(10, 15, 'Miguel', 'Ángel', 'Vargas', 'Cortés', '3001011122', NULL, 'M', 'miguel.vargas@mail.com', 10), -- Gestión Tecnológica
(11, 51, 'Roberto', 'Carlos', 'Paz', 'Sánchez', '3001230001', NULL, 'M', 'roberto.paz@mail.com', 3),
(12, 52, 'Diana', 'Carolina', 'Ramos', 'Vega', '3001230002', NULL, 'F', 'diana.ramos@mail.com', 4),
(13, 53, 'Fernando', 'José', 'Cruz', 'Méndez', '3001230003', NULL, 'M', 'fernando.cruz@mail.com', 5),
(14, 54, 'Gabriela', 'Andrea', 'Herrera', 'Bravo', '3001230004', NULL, 'F', 'gabriela.herrera@mail.com', 6),
(15, 55, 'Javier', 'Ignacio', 'García', 'Pinto', '3001230005', NULL, 'M', 'javier.garcia@mail.com', 7),
(16, 56, 'Laura', 'Valentina', 'Díaz', 'Morales', '3001230006', NULL, 'F', 'laura.diaz2@mail.com', 8),
(17, 57, 'Andrés', 'Felipe', 'Quintero', 'Reyes', '3001230007', NULL, 'M', 'andres.quintero@mail.com', 9),
(18, 58, 'Camila', 'Sofía', 'Vargas', 'Silva', '3001230008', NULL, 'F', 'camila.vargas@mail.com', 10),
(19, 59, 'Manuel', 'Alejandro', 'Castro', 'Guerrero', '3001230009', NULL, 'M', 'manuel.castro@mail.com', 1),
(20, 60, 'Valeria', 'Isabel', 'Torres', 'Benítez', '3001230010', NULL, 'F', 'valeria.torres@mail.com', 2);


INSERT INTO evaluadores (cod_evaluador, especialidad_evaluador, cod_institucion, cod_usuario, nombre1, nombre2, apellido1, apellido2, telefono1, telefono2, genero, correo_electronico) VALUES
(1, 'Experto en Bases de Datos', 1, 7, 'Martina', 'Lucía', 'Benavides', 'Ríos', '3011112233', NULL, 'F', 'martina.benavides@evaluador.com'),
(2, 'Especialista en IA y Machine Learning', 2, 19, 'Esteban', 'Gabriel', 'Quintana', 'Luna', '3012223344', NULL, 'M', 'esteban.quintana@evaluador.com'),
(3, 'Consultor de Proyectos de Software', 2, 1, 'Sofía', 'Eugenia', 'Montes', 'Pinto', '3013334455', NULL, 'F', 'sofia.montes@evaluador.com'),
(4, 'Metodólogo de Investigación', 1, 13, 'Alejandro', 'Daniel', 'Salazar', 'Mora', '3014445566', NULL, 'M', 'alejandro.salazar@evaluador.com'),
(5, 'Experto en Diseño UI/UX', 3, 15, 'Valentina', 'Andrea', 'Gutiérrez', 'Bravo', '3015556677', NULL, 'F', 'valentina.gutierrez@evaluador.com'),
(6, 'Experto en Seguridad Informática', 1, 96, 'Daniel', 'José', 'Vargas', 'Rojas', '3011233001', NULL, 'M', 'daniel.vargas@evaluador.com'),
(7, 'Especialista en Big Data', 2, 97, 'Lucía', 'Fernanda', 'Paredes', 'Soto', '3011233002', NULL, 'F', 'lucia.paredes@evaluador.com'),
(8, 'Consultor de Gestión de Proyectos', 3, 98, 'Roberto', 'Carlos', 'Molina', 'Vega', '3011233003', NULL, 'M', 'roberto.molina@evaluador.com'),
(9, 'Investigador de Inteligencia Artificial', 1, 99, 'Sofía', 'Isabel', 'Castañeda', 'Lara', '3011233004', NULL, 'F', 'sofia.castaneda@evaluador.com'),
(10, 'Experto en Desarrollo Web', 2, 100, 'Pablo', 'Andrés', 'Guerrero', 'Ortiz', '3011233005', NULL, 'M', 'pablo.guerrero@evaluador.com'),
(11, 'Consultor de Proyectos Educativos', 1, 91, 'Carolina', 'Isabel', 'Díaz', 'Martínez', '3011230011', NULL, 'F', 'carolina.diaz@evaluador.com'), -- Cambiado de 101 a 91
(12, 'Ingeniero Ambiental', 3, 92, 'Luis', 'Alberto', 'Fernández', 'Ramírez', '3011230012', NULL, 'M', 'luis.fernandez@evaluador.com'), -- Cambiado de 102 a 92
(13, 'Diseñador Industrial', 1, 93, 'María', 'Fernanda', 'Sánchez', 'Vargas', '3011230013', NULL, 'F', 'maria.sanchez@evaluador.com'), -- Cambiado de 103 a 93
(14, 'Desarrollador Web Fullstack', 2, 94, 'Sergio', 'Mauricio', 'Torres', 'Benítez', '3011230014', NULL, 'M', 'sergio.torres@evaluador.com'), -- Cambiado de 104 a 94
(15, 'Especialista en Marketing Digital', 3, 95, 'Andrea', 'Carolina', 'Herrera', 'Quintero', '3011230015', NULL, 'F', 'andrea.herrera@evaluador.com'); -- Cambiado de 105 a 95


INSERT INTO invitado (cod_invitado, cod_usuario, cod_institucion, cod_departamento, nombre1, nombre2, apellido1, apellido2, telefono1, telefono2, genero, correo_electronico) VALUES
(1, 9, 2, NULL, 'Fabiola', 'Andrea', 'Rojas', 'Gómez', '3201112233', NULL, 'F', 'fabiola.rojas@invitado.com'),
(2, 20, 1, 1, 'Jorge', 'Luis', 'Cabrera', 'Díaz', '3202223344', NULL, 'M', 'jorge.cabrera@invitado.com'),
(3, 17, 3, 5, 'Patricia', 'Lorena', 'Moreno', 'Ortiz', '3203334455', NULL, 'F', 'patricia.moreno@invitado.com'),
(4, 21, 1, 3, 'Daniela', 'Fernanda', 'Prieto', 'Pérez', '3204445566', NULL, 'F', 'daniela.prieto@invitado.com'),
(5, 22, 2, NULL, 'Luis', 'Fernando', 'Soto', 'Ruiz', '3205556677', NULL, 'M', 'luis.soto@invitado.com'),
(6, 23, 3, 8, 'Carolina', 'Andrea', 'Zapata', 'Quintero', '3206667788', NULL, 'F', 'carolina.zapata@invitado.com'),
(7, 24, 1, 2, 'Ricardo', 'Javier', 'Vargas', 'Marín', '3207778899', NULL, 'M', 'ricardo.vargas@invitado.com'),
(8, 25, 2, 6, 'María', 'José', 'Acevedo', 'Correa', '3208889900', NULL, 'F', 'maria.acevedo@invitado.com'),
(9, 26, 3, NULL, 'Pedro', 'Pablo', 'Granados', 'Méndez', '3209990011', NULL, 'M', 'pedro.granados@invitado.com'),
(10, 27, 1, 4, 'Laura', 'Victoria', 'Delgado', 'Cano', '3201011122', NULL, 'F', 'laura.delgado@invitado.com'),
(11, 28, 2, NULL, 'Andrés', 'Manuel', 'Reyes', 'Rojas', '3201122333', NULL, 'M', 'andres.reyes@invitado.com'),
(12, 29, 3, 9, 'Viviana', 'Carolina', 'Blanco', 'Salazar', '3202233444', NULL, 'F', 'viviana.blanco@invitado.com'),
(13, 30, 1, 10, 'Sergio', 'Alejandro', 'Linares', 'Castro', '3203344555', NULL, 'M', 'sergio.linares@invitado.com'),
(14, 31, 2, 7, 'Natalia', 'Sofía', 'Páez', 'Ospina', '3204455666', NULL, 'F', 'natalia.paez@invitado.com'),
(15, 32, 3, NULL, 'Mauricio', 'Alberto', 'Quintero', 'Pinzón', '3205566777', NULL, 'M', 'mauricio.quintero@invitado.com'),
(16, 33, 1, 1, 'Tatiana', 'Marcela', 'Rodríguez', 'Contreras', '3206677888', NULL, 'F', 'tatiana.rodriguez@invitado.com'),
(17, 34, 2, 2, 'Camilo', 'Ignacio', 'Gutiérrez', 'Sánchez', '3207788999', NULL, 'M', 'camilo.gutierrez@invitado.com'),
(18, 35, 3, 3, 'Adriana', 'Lucía', 'Peña', 'Gómez', '3208899000', NULL, 'F', 'adriana.pena@invitado.com'),
(19, 36, 1, 4, 'Diego', 'Armando', 'Serna', 'Pérez', '3209900111', NULL, 'M', 'diego.serna@invitado.com'),
(20, 37, 2, 5, 'Alejandra', 'Isabel', 'Vásquez', 'Ramírez', '3200011222', NULL, 'F', 'alejandra.vasquez@invitado.com'),
(21, 38, 3, 6, 'Fernando', 'David', 'Navarro', 'Silva', '3201020303', NULL, 'M', 'fernando.navarro@invitado.com'),
(22, 39, 1, 7, 'Paola', 'Alexandra', 'Carrillo', 'Torres', '3202030404', NULL, 'F', 'paola.carrillo@invitado.com'),
(23, 40, 2, 8, 'Héctor', 'Julián', 'Poveda', 'Jiménez', '3203040505', NULL, 'M', 'hector.poveda@invitado.com'),
(24, 41, 3, 9, 'Diana', 'Carolina', 'Méndez', 'Cortés', '3204050606', NULL, 'F', 'diana.mendez@invitado.com'),
(25, 42, 1, 10, 'Jorge', 'Esteban', 'Pardo', 'Salazar', '3205060707', NULL, 'M', 'jorge.pardo@invitado.com'),
(26, 43, 2, NULL, 'Silvia', 'Liliana', 'Rincón', 'Morales', '3206070808', NULL, 'F', 'silvia.rincon@invitado.com'),
(27, 44, 3, 1, 'Fabián', 'Ignacio', 'Castaño', 'Zapata', '3207080909', NULL, 'M', 'fabian.castano@invitado.com'),
(28, 45, 1, 2, 'Gloria', 'Estela', 'Ortega', 'León', '3208091010', NULL, 'F', 'gloria.ortega@invitado.com'),
(29, 46, 2, 3, 'Germán', 'Ricardo', 'Sierra', 'Díaz', '3209101112', NULL, 'M', 'german.sierra@invitado.com'),
(30, 47, 3, 4, 'Ana', 'María', 'Guerrero', 'Soto', '3200112233', NULL, 'F', 'ana.guerrero@invitado.com'),
(31, 48, 1, 5, 'Marcelo', 'Augusto', 'Pinzón', 'Cardona', '3201122344', NULL, 'M', 'marcelo.pinzon@invitado.com'),
(32, 49, 2, 6, 'Luisa', 'Fernanda', 'Parra', 'Cruz', '3202233455', NULL, 'F', 'luisa.parra@invitado.com'),
(33, 50, 3, 7, 'Roberto', 'Carlos', 'Carrillo', 'Pardo', '3203344566', NULL, 'M', 'roberto.carrillo@invitado.com'),
(34, 81, 1, 1, 'Julián', 'David', 'Pérez', 'Rojas', '3201232001', NULL, 'M', 'julian.perez@invitado.com'),
(35, 82, 2, 2, 'Natalia', 'Andrea', 'Gómez', 'Silva', '3201232002', NULL, 'F', 'natalia.gomez@invitado.com'),
(36, 83, 3, 3, 'Carlos', 'Alberto', 'Martínez', 'Díaz', '3201232003', NULL, 'M', 'carlos.martinez@invitado.com'),
(37, 84, 1, 4, 'Paola', 'Alexandra', 'López', 'Castro', '3201232004', NULL, 'F', 'paola.lopez@invitado.com'),
(38, 85, 2, 5, 'Juan', 'Manuel', 'Hernández', 'Vargas', '3201232005', NULL, 'M', 'juan.hernandez@invitado.com'),
(39, 86, 3, 6, 'Andrea', 'Carolina', 'Ramírez', 'Torres', '3201232006', NULL, 'F', 'andrea.ramirez@invitado.com'),
(40, 87, 1, 7, 'Ricardo', 'Javier', 'Flores', 'Mora', '3201232007', NULL, 'M', 'ricardo.flores2@invitado.com'),
(41, 88, 2, 8, 'Laura', 'Sofía', 'Benítez', 'Gutiérrez', '3201232008', NULL, 'F', 'laura.benitez2@invitado.com'),
(42, 89, 3, 9, 'Miguel', 'Ángel', 'Vargas', 'Cortés', '3201232009', NULL, 'M', 'miguel.vargas2@invitado.com'),
(43, 90, 1, 10, 'Elena', 'Patricia', 'Díaz', 'Castro', '3201232010', NULL, 'F', 'elena.diaz@invitado.com'),
(44, 91, 2, NULL, 'Felipe', 'Andrés', 'Sánchez', 'Pérez', '3201232011', NULL, 'M', 'felipe.sanchez@invitado.com'),
(45, 92, 3, 1, 'Sofía', 'Valentina', 'Rodríguez', 'López', '3201232012', NULL, 'F', 'sofia.rodriguez@invitado.com'),
(46, 93, 1, 2, 'Pedro', 'Antonio', 'Martínez', 'Silva', '3201232013', NULL, 'M', 'pedro.martinez@invitado.com'),
(47, 94, 2, 3, 'Ana', 'Carolina', 'Fernández', 'Ruiz', '3201232014', NULL, 'F', 'ana.fernandez@invitado.com'),
(48, 95, 3, 4, 'Juan', 'Carlos', 'Gómez', 'Pérez', '3201232015', NULL, 'M', 'juan.gomez2@invitado.com');


INSERT INTO curso (cod_curso, serie_curso, cod_asignatura, cod_docente) VALUES
(1, 'INF-BD-2024-1', 1, 1), (2, 'INF-POO-2024-1', 2, 2), (3, 'INF-ADS-2024-1', 3, 3),
(4, 'ELE-REDES-2024-1', 4, 7), (5, 'ING-IA-2024-1', 5, 4), (6, 'INF-WEB-2024-1', 6, 1),
(7, 'MECA-CALC-2024-1', 7, 8), (8, 'ADM-EST-2024-1', 8, 9), (9, 'CONT-PRIN-2024-1', 9, 5),
(10, 'ADM-GP-2024-1', 10, 6);


-- Inserciones para la tabla 'proyecto' (¡Estas eran las que faltaban!)
INSERT INTO proyecto (cod_proyecto, titulo_del_proyecto, objetivo_proyecto, cod_tipo_proyecto, fecha_inicio_proyecto, fecha_fin_proyecto) VALUES
(1, 'Plataforma de Gestión de Proyectos Académicos', 'Desarrollar una plataforma integral para la gestión y seguimiento de proyectos académicos.', 100, '2023-01-15', '2023-12-15'),
(2, 'Simulador de Redes Eléctricas', 'Crear un simulador interactivo para el análisis y diseño de redes eléctricas.', 101, '2023-02-01', '2023-11-30'),
(3, 'Sistema de Control de Inventario Inteligente', 'Implementar un sistema automatizado de inventario con predicción de demanda.', 100, '2023-03-10', '2024-01-31'),
(4, 'Aplicación Móvil de Orientación Universitaria', 'Diseñar y desarrollar una app para guiar a nuevos estudiantes en la universidad.', 102, '2023-04-01', '2023-10-31'),
(5, 'Prototipo de Brazo Robótico para Clasificación', 'Construir un brazo robótico capaz de clasificar objetos por tamaño y color.', 101, '2023-05-20', '2024-02-28'),
(6, 'Plataforma E-learning para Capacitación Empresarial', 'Desarrollar una plataforma de e-learning personalizada para la capacitación de empleados.', 100, '2023-06-01', '2024-03-31'),
(7, 'Sistema de Monitorización de Consumo Energético del Hogar', 'Crear un sistema para monitorear y optimizar el consumo de energía en hogares.', 101, '2023-07-15', '2024-04-15'),
(8, 'Diseño de Identidad Visual para Startup Tecnológica', 'Desarrollar una identidad visual completa y atractiva para una nueva startup.', 102, '2023-08-01', '2023-12-31'),
(9, 'Análisis Predictivo de Mercado con Big Data', 'Realizar un análisis predictivo de tendencias de mercado utilizando técnicas de Big Data.', 100, '2023-09-10', '2024-05-31'),
(10, 'Herramienta Interactiva de Aprendizaje de Matemáticas', 'Desarrollar una herramienta interactiva para mejorar el aprendizaje de conceptos matemáticos.', 102, '2023-10-01', '2024-06-30');


INSERT INTO evaluacion (cod_evaluacion, descripcion_evaluacion, ponderacion_evaluacion, cod_evaluador, cod_proyecto, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10) VALUES
(1, 'Evaluación de propuesta inicial de proyecto. Criterios: innovación, viabilidad, y alcance.', 4.20, 1, 1, 'Claridad Objetivo: Bueno', 'Viabilidad: Alta', 'Alcance: Correcto', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Evaluación del diseño arquitectónico del software y plan de desarrollo detallado.', 3.80, 2, 2, 'Coherencia Diseño: Buena', 'Plan Desarrollo: Detallado', 'Tecnologías: Apropiadas', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Evaluación de avance del prototipo funcional y cumplimiento de hitos parciales.', 4.50, 4, 3, 'Funcionalidad: Satisfactoria', 'Hitos: Cumplidos', 'Calidad Código: Regular', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Evaluación final del proyecto, incluyendo demostración, presentación y documentación.', 4.90, 3, 4, 'Demostración: Impecable', 'Presentación: Excelente', 'Documentación: Completa', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Revisión de calidad y buenas prácticas del código fuente, rendimiento y seguridad.', 4.00, 2, 5, 'Buenas Prácticas: Sí', 'Rendimiento: Bueno', 'Seguridad: Adecuada', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Evaluación del potencial de impacto social y sostenibilidad del proyecto a largo plazo.', 3.50, 5, 6, 'Impacto Social: Alto', 'Sostenibilidad: Media', 'Viabilidad: Baja', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Evaluación de la coherencia metodológica y recolección de datos.', 4.10, 1, 7, 'Metodología: Coherente', 'Recolección Datos: Adecuada', 'Análisis: Básico', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Evaluación de la presentación UI/UX y usabilidad del prototipo.', 4.30, 5, 8, 'UI/UX: Atractiva', 'Usabilidad: Intuitiva', 'Experiencia Usuario: Positiva', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Evaluación de la documentación técnica y manuales de usuario.', 3.70, 4, 9, 'Documentación Técnica: Completa', 'Manuales Usuario: Claros', 'Errores Tipográficos: Mínimos', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Evaluación de la originalidad de la solución y su contribución al campo.', 4.60, 3, 10, 'Originalidad: Alta', 'Contribución: Significativa', 'Innovación: Notable', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Evaluación de la fase de planificación del Proyecto de Gestión Académica.', 4.00, 4, 1, 'Planificación: Excelente', 'Cronograma: Realista', 'Recursos: Suficientes', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Evaluación de la interfaz de usuario del Proyecto de Gestión Académica.', 4.70, 5, 1, 'Diseño Visual: Excepcional', 'Navegación: Fluida', 'Accesibilidad: Buena', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Evaluación de la precisión de los cálculos del simulador de Redes Eléctricas.', 4.80, 1, 2, 'Precisión Cálculos: Alta', 'Rendimiento Simulación: Óptimo', 'Errores: Nulos', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Evaluación de la integración del sistema de inventario con módulos externos.', 3.90, 5, 3, 'Integración: Adecuada', 'API: Funcional', 'Seguridad: Media', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Evaluación de la usabilidad y experiencia de usuario de la App de Orientación.', 4.20, 2, 4, 'Usabilidad: Intuitiva', 'UX: Fluida', 'Carga: Rápida', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Evaluación del informe técnico del Poster Proyecto Gestión Académica.', 4.10, 1, 1, 'Calidad Redacción: Excelente', 'Profundidad Análisis: Buena', 'Conclusiones: Claras', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Evaluación de la documentación de usuario para Maqueta Interactiva Redes Eléctricas.', 3.70, 2, 2, 'Claridad Instrucciones: Media', 'Ejemplos: Suficientes', 'Formato: Coherente', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Evaluación de las pruebas unitarias del Código Fuente Sistema Inventario V1.', 4.40, 4, 3, 'Cobertura Pruebas: Alta', 'Casos Borde: Cubiertos', 'Reporte Errores: Detallado', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Evaluación de la documentación del Prototipo Arduino Orientación U.', 3.90, 3, 4, 'Organización: Buena', 'Detalle: Suficiente', 'Diagramas: Claros', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Evaluación del video demostrativo de Presentación Final Brazo Robótico.', 4.80, 5, 5, 'Calidad Video: Alta', 'Claridad Explicación: Excelente', 'Demostración: Efectiva', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Evaluación del diseño instruccional de la Plataforma E-learning.', 4.00, 11, 6, 'Objetivos: Claros', 'Actividades: Relevantes', 'Evaluación: Coherente', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Evaluación de la precisión de los sensores del Sistema de Monitorización de Consumo Energético.', 4.50, 7, 7, 'Calibración: Precisa', 'Fiabilidad: Alta', 'Mantenimiento: Bajo', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'Evaluación de la cohesión visual del Diseño de Identidad Visual.', 4.30, 13, 8, 'Paleta Colores: Armónica', 'Tipografía: Adecuada', 'Elementos: Coherentes', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Evaluación de la robustez del modelo predictivo de Análisis Predictivo de Mercado.', 4.60, 10, 9, 'Validación: Robusta', 'Errores: Bajos', 'Actualización: Flexible', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Evaluación de la interactividad y feedback de la Herramienta Interactiva Matemáticas.', 4.90, 11, 10, 'Interactividad: Excelente', 'Feedback: Inmediato', 'Motivación: Alta', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO entregable (cod_entregable, nombre_entregable, cod_tipo_entregable, cod_evaluacion, descripcion_entregable, cod_proyecto) VALUES
(1, 'Poster Proyecto Gestión Académica', 1, 1, 'Poster que resume los objetivos, metodología y resultados esperados de la Plataforma de Gestión de Proyectos Académicos.', 1),
(2, 'Maqueta Interactiva Redes Eléctricas', 2, 2, 'Maqueta digital interactiva del simulador de redes eléctricas para demostraciones.', 2),
(3, 'Código Fuente Sistema Inventario V1', 3, 3, 'Archivos de código fuente de la primera versión del sistema de control de inventario.', 3),
(4, 'Arduino Prototipo Orientación U', 4, 4, 'Prototipo de hardware Arduino para la aplicación de orientación universitaria (ej. sensores).', 4),
(5, 'Presentación Final Brazo Robótico', 5, 5, 'Diapositivas y material de apoyo para la exposición final del prototipo de brazo robótico.', 5),
(6, 'Poster Plataforma E-learning', 1, 6, 'Poster promocional y descriptivo de la Plataforma E-learning para Capacitación Empresarial.', 6),
(7, 'Maqueta Casa Autosostenible', 2, 7, 'Maqueta física o digital del diseño de la casa autosostenible con sus componentes.', 7),
(8, 'Programa/Codigo Diseño Identidad V', 3, 8, 'Archivos de diseño (vectores, fuentes) y código de ejemplos del proyecto de identidad visual.', 8),
(9, 'Poster Análisis Big Data', 1, 9, 'Poster con los hallazgos y conclusiones clave del análisis de datos de mercado.', 9),
(10, 'Arduino Herramienta Matemáticas', 4, 10, 'Placa Arduino con programación para la herramienta interactiva de aprendizaje de matemáticas (ej. para juegos de lógica).', 10),
(11, 'Informe Técnico Gestión Académica', 3, 16, 'Documento detallado sobre la arquitectura y la implementación técnica de la Plataforma de Gestión de Proyectos Académicos.', 1),
(12, 'Manual de Usuario Redes Eléctricas', 5, 17, 'Guía completa para el uso del simulador de redes eléctricas, incluyendo tutoriales y ejemplos.', 2),
(13, 'Documento de Requisitos Sistema Inventario', 3, 18, 'Especificación detallada de los requisitos funcionales y no funcionales para el sistema de control de inventario.', 3),
(14, 'Guía de Diseño UI/UX App Orientación', 5, 19, 'Documento que describe el proceso de diseño de interfaz de usuario y experiencia de usuario para la aplicación de orientación universitaria.', 4),
(15, 'Video Demostrativo Brazo Robótico', 5, 20, 'Video que muestra el funcionamiento y las capacidades del prototipo de brazo robótico en acción.',2);


INSERT INTO rep (cod_rep, descripcion_rep, cod_proyecto) VALUES
(1, 'Reporte de Avance Semanal del Proyecto de Gestión Académica.', 1),
(2, 'Informe de pruebas de simulación para el simulador de Redes Eléctricas.', 2),
(3, 'Documento de Especificación Técnica del Sistema de Inventario.', 3),
(4, 'Reporte de Usabilidad y Feedback de la App de Orientación Universitaria.', 4),
(5, 'Acta de Finalización del Prototipo de Brazo Robótico.', 5),
(6, 'Plan de Estudios y Contenido de la Plataforma E-learning.', 6),
(7, 'Resultados de Monitoreo de Consumo Energético del Hogar.', 7),
(8, 'Manual de Marca y Guía de Estilo del Proyecto de Identidad Visual.', 8),
(9, 'Análisis de Tendencias y Proyecciones del Mercado (Big Data).', 9),
(10, 'Resultados de Pruebas Pedagógicas de la Herramienta de Matemáticas.', 10);


INSERT INTO estudiante (cod_estudiante, cod_proyecto, cod_usuario, cod_programa_academico, nombre1, nombre2, apellido1, apellido2, telefono1, telefono2, genero, correo_electronico) VALUES
(1, 1, 3, 5, 'Alejandra', 'María', 'López', 'Ruiz', '3101234567', NULL, 'F', 'ale.lopez@estudiante.com'),
(2, 2, 5, 3, 'Daniel', 'Felipe', 'Pérez', 'González', '3102345678', NULL, 'M', 'daniel.perez@estudiante.com'),
(3, 3, 16, 5, 'Valeria', 'Camila', 'Sánchez', 'Díaz', '3103456789', NULL, 'F', 'valeria.sanchez@estudiante.com'),
(4, 4, 18, 9, 'Felipe', 'Andrés', 'Ramírez', 'Vargas', '3104567890', NULL, 'M', 'felipe.ramirez@estudiante.com'),
(5, 5, 41, 1, 'Isabella', 'Sofía', 'Gómez', 'Castro', '3105678901', NULL, 'F', 'isa.gomez@estudiante.com'),
(6, 6, 21, 6, 'Mateo', 'José', 'Hernández', 'Muñoz', '3106789012', NULL, 'M', 'mateo.hernandez@estudiante.com'),
(7, 7, 22, 4, 'Sofía', 'Alejandra', 'Resumen', 'Luna', '3107890123', NULL, 'F', 'sofia.jimenez@estudiante.com'),
(8, 8, 23, 10, 'Nicolás', 'David', 'Morales', 'Reyes', '3108901234', NULL, 'M', 'nicolas.morales@estudiante.com'),
(9, 9, 24, 13, 'Gabriela', 'Fernanda', 'Castro', 'Flores', '3109012345', NULL, 'F', 'gabriela.castro@estudiante.com'),
(10, 10, 25, 15, 'Sebastián', 'Andrés', 'Ortiz', 'Vega', '3100123456', NULL, 'M', 'sebastian.ortiz@estudiante.com'),
(11, 1, 26, 5, 'Paula', 'Andrea', 'Herrera', 'Guerrero', '3101122334', NULL, 'F', 'paula.herrera@estudiante.com'),
(12, 2, 27, 3, 'Diego', 'Alejandro', 'Ruiz', 'Quintero', '3102233445', NULL, 'M', 'diego.ruiz@estudiante.com'),
(13, 3, 28, 5, 'Maria', 'José', 'Montoya', 'Castaño', '3103344556', NULL, 'F', 'maria.montoya@estudiante.com'),
(14, 4, 29, 9, 'Juan', 'Pablo', 'García', 'Valencia', '3104455667', NULL, 'M', 'juan.garcia@estudiante.com'),
(15, 5, 30, 1, 'Laura', 'Camila', 'Silva', 'Duque', '3105566778', NULL, 'F', 'laura.silva@estudiante.com'),
(16, 6, 31, 6, 'Andrés', 'Felipe', 'Cárdenas', 'Giraldo', '3106677889', NULL, 'M', 'andres.cardenas@estudiante.com'),
(17, 7, 32, 4, 'Daniela', 'Fernanda', 'Rojas', 'Ospina', '3107788990', NULL, 'F', 'daniela.rojas@estudiante.com'),
(18, 8, 33, 10, 'Santiago', 'José', 'Mendoza', 'Soto', '3108899001', NULL, 'M', 'santiago.mendoza@estudiante.com'),
(19, 9, 34, 13, 'Camila', 'Andrea', 'Vega', 'Lara', '3109900112', NULL, 'F', 'camila.vega@estudiante.com'),
(20, 10, 35, 15, 'Martín', 'Felipe', 'Guerrero', 'Paz', '3100011223', NULL, 'M', 'martin.guerrero@estudiante.com'),
(21, 1, 36, 5, 'Lucía', 'María', 'Franco', 'Pineda', '3101020304', NULL, 'F', 'lucia.franco@estudiante.com'),
(22, 2, 37, 3, 'Javier', 'Eduardo', 'Salazar', 'Melo', '3102030405', NULL, 'M', 'javier.salazar@estudiante.com'),
(23, 3, 38, 5, 'Andrea', 'Carolina', 'Quevedo', 'Contreras', '3103040506', NULL, 'F', 'andrea.quevedo@estudiante.com'),
(24, 4, 39, 9, 'Oscar', 'David', 'Suárez', 'Herrera', '3104050607', NULL, 'M', 'oscar.suarez@estudiante.com'),
(25, 5, 40, 1, 'Viviana', 'Alexandra', 'Pinzón', 'Ramírez', '3105060708', NULL, 'F', 'viviana.pinzon@estudiante.com'),
(26, 1, 61, 5, 'Sofía', 'Lucía', 'Pineda', 'Soto', '3101231001', NULL, 'F', 'sofia.pineda@estudiante.com'),
(27, 2, 62, 3, 'Juan', 'David', 'Mendoza', 'Correa', '3101231002', NULL, 'M', 'juan.mendoza@estudiante.com'),
(28, 3, 63, 5, 'Mariana', 'Andrea', 'Ospina', 'Lara', '3101231003', NULL, 'F', 'mariana.ospina@estudiante.com'),
(29, 4, 64, 9, 'Diego', 'Fernando', 'Cárdenas', 'Duque', '3101231004', NULL, 'M', 'diego.cardenas@estudiante.com'),
(30, 5, 65, 1, 'Catalina', 'María', 'Rojas', 'Valencia', '3101231005', NULL, 'F', 'catalina.rojas@estudiante.com'),
(31, 6, 66, 6, 'Sebastián', 'Andrés', 'Franco', 'Paz', '3101231006', NULL, 'M', 'sebastian.franco@estudiante.com'),
(32, 7, 67, 4, 'Daniela', 'Sofía', 'Giraldo', 'Suárez', '3101231007', NULL, 'F', 'daniela.giraldo@estudiante.com'),
(33, 8, 68, 10, 'Felipe', 'José', 'Montoya', 'Herrera', '3101231008', NULL, 'M', 'felipe.montoya@estudiante.com'),
(34, 9, 69, 13, 'Valentina', 'Alexandra', 'Quintero', 'Castro', '3101231009', NULL, 'F', 'valentina.quintero@estudiante.com'),
(35, 10, 70, 15, 'Nicolás', 'Esteban', 'Sierra', 'Gutiérrez', '3101231010', NULL, 'M', 'nicolas.sierra@estudiante.com'),
(36, 1, 71, 5, 'Laura', 'Camila', 'Vásquez', 'Cruz', '3101231011', NULL, 'F', 'laura.vasquez@estudiante.com'),
(37, 2, 72, 3, 'Santiago', 'David', 'Pérez', 'Martínez', '3101231012', NULL, 'M', 'santiago.perez@estudiante.com'),
(38, 3, 73, 5, 'Isabella', 'Andrea', 'Ramírez', 'López', '3101231013', NULL, 'F', 'isabella.ramirez@estudiante.com'),
(39, 4, 74, 9, 'Alejandro', 'José', 'González', 'Díaz', '3101231014', NULL, 'M', 'alejandro.gonzalez@estudiante.com'),
(40, 5, 75, 1, 'Ana', 'María', 'Muñoz', 'Silva', '3101231015', NULL, 'F', 'ana.munoz@estudiante.com'),
(41, 6, 76, 6, 'Cristian', 'Andrés', 'Jiménez', 'Torres', '3101231016', NULL, 'M', 'cristian.jimenez@estudiante.com'),
(42, 7, 77, 4, 'María', 'Fernanda', 'Ortiz', 'Vargas', '3101231017', NULL, 'F', 'maria.ortiz@estudiante.com'),
(43, 8, 78, 10, 'Daniel', 'Esteban', 'Ruiz', 'Flores', '3101231018', NULL, 'M', 'daniel.ruiz@estudiante.com'),
(44, 9, 79, 13, 'Andrea', 'Carolina', 'Vega', 'Benítez', '3101231019', NULL, 'F', 'andrea.vega@estudiante.com'),
(45, 10, 80, 15, 'Miguel', 'Ángel', 'Gómez', 'Cortés', '3101231020', NULL, 'M', 'miguel.gomez@estudiante.com');


INSERT INTO "proyecto-curso" (cod_proyecto, cod_curso) VALUES
(1, 1), (1, 3), (1, 6), (2, 2), (2, 4), (2, 7), (3, 1), (3, 9), (3, 3), (4, 5), (4, 8),
(5, 2), (5, 7), (5, 4), (6, 3), (6, 10), (6, 1), (7, 7), (7, 4), (7, 2), (8, 8), (8, 9), (8, 3),
(9, 1), (9, 10), (9, 8), (10, 5), (10, 2), (10, 7);


INSERT INTO "proyecto_orientacion_del_proyecto" (cod_proyecto, cod_orientacion) VALUES
(1, 2), (1, 3), (1, 5), (2, 3), (2, 2), (2, 1), (3, 2), (3, 1), (3, 3), (4, 5), (4, 4), (4, 2),
(5, 2), (5, 3), (5, 1), (6, 2), (6, 5), (6, 4), (7, 2), (7, 3), (7, 4), (8, 2), (8, 4), (8, 5),
(9, 1), (9, 2), (9, 3), (10, 5), (10, 2), (10, 1);


INSERT INTO "proyecto-era" (cod_proyecto, cod_era) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (2, 1), (2, 2), (2, 3), (2, 4), (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
(4, 1), (4, 2), (4, 3), (5, 1), (5, 2), (6, 1), (6, 2), (6, 3), (6, 4), (6, 5), (7, 1), (7, 2), (7, 3), (7, 4),
(8, 1), (8, 2), (8, 3), (9, 1), (9, 2), (9, 3), (9, 4), (10, 1), (10, 2);


INSERT INTO "curso-estudiante" (cod_curso, cod_estudiante) VALUES
(1, 1), (1, 3), (1, 5), (1, 6), (1, 11), (1, 13), (1, 21), (2, 2), (2, 7), (2, 12), (2, 16), (2, 22),
(3, 1), (3, 8), (3, 11), (3, 18), (3, 23), (4, 2), (4, 9), (4, 12), (4, 19), (4, 24),
(5, 3), (5, 10), (5, 14), (5, 20), (5, 25), (6, 4), (6, 6), (6, 13), (6, 17), (6, 21),
(7, 5), (7, 7), (7, 10), (7, 15), (7, 22), (8, 8), (8, 14), (8, 19), (8, 23),
(9, 9), (9, 15), (9, 20), (9, 24), (10, 4), (10, 16), (10, 17), (10, 25);


INSERT INTO "usuario-rol" (cod_usuario, cod_rol) VALUES
(1, 1), (1, 8), (2, 2), (2, 4), (3, 3), (3, 7), (4, 2), (4, 6), (5, 3), (6, 2),
(7, 4), (7, 5), (8, 2), (9, 7), (10, 2), (10, 9), (11, 2), (12, 2), (13, 4), (14, 2),
(15, 3), (15, 7), (16, 3),
(17, 7), (17, 10), (18, 3), (19, 4), (19, 5), (20, 7),
(20, 9), (1, 6), (2, 10), (4, 9), (6, 4), (8, 5),
-- Nuevas entradas para los evaluadores reasignados (cod_rol = 4)
(91, 4), (92, 4), (93, 4), (94, 4), (95, 4);

INSERT INTO "programa_academico-asignatura" (cod_programa, cod_asignatura) VALUES
(5, 1), -- Ingeniería de Sistemas - Bases de Datos I
(5, 2), -- Ingeniería de Sistemas - Programación Orientada a Objetos
(5, 3), -- Ingeniería de Sistemas - Análisis y Diseño de Sistemas
(3, 4), -- Ingeniería Eléctrica - Redes de Computadores
(5, 5), -- Ingeniería de Sistemas - Inteligencia Artificial
(5, 6), -- Ingeniería de Sistemas - Desarrollo Web Avanzado
(1, 7), -- Ingeniería Mecánica - Cálculo Multivariable
(13, 8), -- Administración de Empresas - Estadística Aplicada
(14, 9), -- Contaduría Pública - Principios de Contabilidad
(15, 10), -- Gestión Tecnológica - Gerencia de Proyectos
(6, 1), -- Tecnología en Desarrollo de Software - Introducción al Desarrollo Web (nueva)
(6, 2), -- Tecnología en Desarrollo de Software - Bases de Datos para Desarrolladores (nueva)
(6, 3), -- Tecnología en Desarrollo de Software - Desarrollo Móvil Multiplataforma (nueva)
(10, 10), -- Diseño Industrial - Fundamentos del Diseño Industrial (nueva)
(10, 9); -- Diseño Industrial - Modelado 3D para Diseño (nueva)


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