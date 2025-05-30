
SET CONSTRAINTS ALL DEFERRED;

-- 1. Tablas Independientes (o con dependencias ya satisfechas)
CREATE TABLE tipo_proyecto (
    cod_tipo_proyecto INT PRIMARY KEY,
    tipo_proyecto VARCHAR(10) NOT NULL
);

-- La tabla 'usuario' se asume que ya existe y es gestionada por Python.

CREATE TABLE rol (
    cod_rol INT PRIMARY KEY,
    nombre_rol VARCHAR(20) NOT NULL,
    descripcion_rol VARCHAR(100) NOT NULL
);

CREATE TABLE permiso (
    cod_permiso INT PRIMARY KEY,
    nombre_permiso VARCHAR(50) NOT NULL,
    descripcion_permiso VARCHAR(100) NOT NULL
);

CREATE TABLE era (
    cod_era INT PRIMARY KEY,
    numero_era INT NOT NULL,
    descripcion_era VARCHAR(500) NOT NULL
);

CREATE TABLE tipo_entregable (
    cod_tipo_entregable INT PRIMARY KEY,
    nombre_tipo_entregable VARCHAR(200) NOT NULL,
    descripcion_tipo_entregable VARCHAR(500) NOT NULL
);

CREATE TABLE orientacion_del_proyecto (
    cod_orientacion INT PRIMARY KEY,
    categoria_orientacion_pryecto VARCHAR(200) NOT NULL,
    descripcion_orientacion VARCHAR(500) NOT NULL
);

CREATE TABLE institucion (
    cod_institucion INT PRIMARY KEY,
    nombre_institucion VARCHAR(100) NOT NULL UNIQUE,
    tipo_institucion VARCHAR(100) NOT NULL
);

CREATE TABLE facultad (
    cod_facultad INT PRIMARY KEY,
    nombre_facultad VARCHAR(200) NOT NULL UNIQUE,
    institucion VARCHAR(10) NOT NULL DEFAULT 'IUPB'
);

-- 2. Tablas que dependen de las anteriores (ordenadas por dependencia)

CREATE TABLE departamento (
    cod_departamento INT PRIMARY KEY,
    nombre_departamento VARCHAR(200) NOT NULL UNIQUE,
    cod_facultad INT NOT NULL,
    FOREIGN KEY (cod_facultad) REFERENCES facultad(cod_facultad)
);

CREATE TABLE programa_academico (
    cod_programa INT PRIMARY KEY,
    nombre_programa_academico VARCHAR(100) NOT NULL,
    cod_departamento INT NOT NULL,
    FOREIGN KEY (cod_departamento) REFERENCES departamento(cod_departamento)
);

CREATE TABLE asignatura (
    cod_asignatura SERIAL PRIMARY KEY,
    nombre_asignatura VARCHAR(255) NOT NULL, -- Corregido a nombre_asignatura
    codigo VARCHAR(50) NOT NULL,
    creditos_asignatura INT NOT NULL, -- Corregido a creditos_asignatura
    descripcion TEXT,
    semestre INT,
    horas_clase INT,
    cod_programa INT NOT NULL,
    CONSTRAINT fk_asignatura_programa FOREIGN KEY (cod_programa) REFERENCES programa_academico(cod_programa) ON DELETE RESTRICT,
    CONSTRAINT uq_asignatura_codigo_programa UNIQUE (codigo, cod_programa)
);

CREATE TABLE docente (
    cod_docente INT PRIMARY KEY,
    cod_usuario INT NOT NULL,
    nombre1 VARCHAR(20) NOT NULL,
    nombre2 VARCHAR(20),
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20),
    telefono1 VARCHAR(20) NOT NULL,
    telefono2 VARCHAR(20),
    cod_departamento INT NOT NULL,
    genero CHAR(1) NOT NULL CHECK (genero IN ('M', 'F')),
    correo_electronico VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (cod_usuario) REFERENCES usuario(cod_usuario),
    FOREIGN KEY (cod_departamento) REFERENCES departamento(cod_departamento)
);

CREATE TABLE "usuario-rol" (
    cod_usuario INT NOT NULL,
    cod_rol INT NOT NULL,
    PRIMARY KEY (cod_usuario, cod_rol),
    FOREIGN KEY (cod_usuario) REFERENCES usuario(cod_usuario),
    FOREIGN KEY (cod_rol) REFERENCES rol(cod_rol)
);

CREATE TABLE "rol-permiso" (
    cod_rol INT NOT NULL,
    cod_permiso INT NOT NULL,
    PRIMARY KEY (cod_rol, cod_permiso),
    FOREIGN KEY (cod_rol) REFERENCES rol(cod_rol),
    FOREIGN KEY (cod_permiso) REFERENCES permiso(cod_permiso)
);

CREATE TABLE "programa_academico-asignatura" (
    cod_programa INT NOT NULL,
    cod_asignatura INT NOT NULL,
    PRIMARY KEY (cod_programa, cod_asignatura),
    FOREIGN KEY (cod_programa) REFERENCES programa_academico(cod_programa),
    FOREIGN KEY (cod_asignatura) REFERENCES asignatura(cod_asignatura)
);

CREATE TABLE ira (
    cod_ira INT PRIMARY KEY,
    descripcion_ira VARCHAR(500) NOT NULL,
    porcentaje_dominio_ira INT NOT NULL CHECK (porcentaje_dominio_ira >= 0 AND porcentaje_dominio_ira <= 100),
    cod_era INT NOT NULL,
    FOREIGN KEY (cod_era) REFERENCES era(cod_era)
);

CREATE TABLE evaluadores (
    cod_evaluador INT PRIMARY KEY,
    especialidad_evaluador VARCHAR(200) NOT NULL,
    cod_institucion INT NOT NULL,
    cod_usuario INT NOT NULL,
    nombre1 VARCHAR(20) NOT NULL,
    nombre2 VARCHAR(20),
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20),
    telefono1 VARCHAR(20) NOT NULL,
    telefono2 VARCHAR(20),
    genero CHAR(1) NOT NULL CHECK (genero IN ('M', 'F')),
    correo_electronico VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (cod_usuario) REFERENCES usuario(cod_usuario),
    FOREIGN KEY (cod_institucion) REFERENCES institucion(cod_institucion)
);

CREATE TABLE curso (
    cod_curso INT PRIMARY KEY,
    serie_curso VARCHAR(100) NOT NULL,
    cod_asignatura INT NOT NULL,
    cod_docente INT NOT NULL,
    FOREIGN KEY (cod_asignatura) REFERENCES asignatura(cod_asignatura),
    FOREIGN KEY (cod_docente) REFERENCES docente(cod_docente)
);

CREATE TABLE invitado (
    cod_invitado INT PRIMARY KEY,
    cod_usuario INT NOT NULL,
    cod_institucion INT NOT NULL,
    cod_departamento INT,
    nombre1 VARCHAR(20) NOT NULL,
    nombre2 VARCHAR(20),
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20),
    telefono1 VARCHAR(20) NOT NULL,
    telefono2 VARCHAR(20),
    genero CHAR(1) NOT NULL CHECK (genero IN ('M', 'F')),
    correo_electronico VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (cod_usuario) REFERENCES usuario(cod_usuario),
    FOREIGN KEY (cod_institucion) REFERENCES institucion(cod_institucion),
    FOREIGN KEY (cod_departamento) REFERENCES departamento(cod_departamento)
);

-- 3. Tablas con dependencias circulares, creadas con FKs opcionales (NULL) inicialmente.
-- Luego se añadirán las restricciones NOT NULL o se actualizarán los datos.

CREATE TABLE proyecto (
    cod_proyecto INT PRIMARY KEY,
    titulo_del_proyecto VARCHAR(255) NOT NULL,
    objetivo_proyecto TEXT NOT NULL,
    cod_tipo_proyecto INT NOT NULL,
    cod_entregable INT, -- Puede ser NULL al inicio
    cod_evaluacion INT, -- Puede ser NULL al inicio
    cod_rep INT,        -- Puede ser NULL al inicio
    fecha_inicio_proyecto DATE NOT NULL,
    fecha_fin_proyecto DATE NOT NULL,
    FOREIGN KEY (cod_tipo_proyecto) REFERENCES tipo_proyecto(cod_tipo_proyecto)
    -- Las FKs a entregable, evaluacion y rep se añadirán con ALTER TABLE
);

CREATE TABLE evaluacion (
    cod_evaluacion INT PRIMARY KEY,
    descripcion_evaluacion VARCHAR(500) NOT NULL,
    ponderacion_evaluacion DECIMAL(4,2) NOT NULL CHECK (ponderacion_evaluacion >= 0 AND ponderacion_evaluacion <= 5),
    cod_evaluador INT NOT NULL,
    cod_proyecto INT, -- Puede ser NULL al inicio
    c1 varchar(100),
    c2 varchar(100),
    c3 varchar(100),
    c4 varchar(100),
    c5 varchar(100),
    c6 varchar(100),
    c7 varchar(100),
    c8 varchar(100),
    c9 varchar(100),
    c10 varchar(100),
    FOREIGN KEY (cod_evaluador) REFERENCES evaluadores(cod_evaluador)
    -- La FK a proyecto se añadirá con ALTER TABLE
);

CREATE TABLE entregable (
    cod_entregable INT PRIMARY KEY,
    nombre_entregable VARCHAR(200) NOT NULL,
    cod_tipo_entregable INT NOT NULL,
    cod_evaluacion INT NOT NULL,
    descripcion_entregable VARCHAR(500) NOT NULL,
    cod_proyecto INT, -- Esta FK puede ser NULL inicialmente, se actualizará después
    FOREIGN KEY (cod_tipo_entregable) REFERENCES tipo_entregable(cod_tipo_entregable),
    FOREIGN KEY (cod_evaluacion) REFERENCES evaluacion(cod_evaluacion)
);

CREATE TABLE rep (
    cod_rep INT PRIMARY KEY,
    descripcion_rep VARCHAR(500) NOT NULL,
    cod_proyecto INT -- Esta FK puede ser NULL inicialmente, se actualizará después
);

CREATE TABLE estudiante (
    cod_estudiante INT PRIMARY KEY,
    cod_Proyecto INT, -- Puede ser NULL al inicio, se añadirá con ALTER TABLE
    cod_usuario INT NOT NULL,
    cod_programa_academico INT NOT NULL,
    nombre1 VARCHAR(20) NOT NULL,
    nombre2 VARCHAR(20),
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20),
    telefono1 VARCHAR(20) NOT NULL,
    telefono2 VARCHAR(20),
    genero CHAR(1) NOT NULL CHECK (genero IN ('M', 'F')),
    correo_electronico VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (cod_usuario) REFERENCES usuario(cod_usuario),
    FOREIGN KEY (cod_programa_academico) REFERENCES programa_academico(cod_programa)
    -- La FK a proyecto se añadirá con ALTER TABLE
);

-- 4. Añadir las claves foráneas que se hicieron NULL o se omitieron temporalmente, y las restantes
-- Asegúrate de que los datos insertados sean consistentes antes de intentar hacer NOT NULL si es el caso.

-- Añadir FK a proyecto en evaluacion
ALTER TABLE evaluacion
ADD CONSTRAINT fk_evaluacion_proyecto FOREIGN KEY (cod_proyecto) REFERENCES proyecto(cod_proyecto);
-- Si quieres que sea NOT NULL después de la creación y la inserción inicial de datos:
-- ALTER TABLE evaluacion ALTER COLUMN cod_proyecto SET NOT NULL;

-- Añadir FKs a entregable, evaluacion y rep en proyecto
ALTER TABLE proyecto
ADD CONSTRAINT fk_proyecto_entregable FOREIGN KEY (cod_entregable) REFERENCES entregable(cod_entregable) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE proyecto
ADD CONSTRAINT fk_proyecto_evaluacion FOREIGN KEY (cod_evaluacion) REFERENCES evaluacion(cod_evaluacion) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE proyecto
ADD CONSTRAINT fk_proyecto_rep FOREIGN KEY (cod_rep) REFERENCES rep(cod_rep) DEFERRABLE INITIALLY DEFERRED;

-- Si quieres que sean NOT NULL después de la creación y la inserción inicial de datos:
-- ALTER TABLE proyecto ALTER COLUMN cod_entregable SET NOT NULL;
-- ALTER TABLE proyecto ALTER COLUMN cod_evaluacion SET NOT NULL;
-- ALTER TABLE proyecto ALTER COLUMN cod_rep SET NOT NULL;

-- Añadir FK a proyecto en estudiante (ya que proyecto ya existe)
ALTER TABLE estudiante
ADD FOREIGN KEY (cod_Proyecto) REFERENCES proyecto(cod_proyecto);
-- Si quieres que sea NOT NULL después de la creación y la inserción inicial de datos:
-- ALTER TABLE estudiante ALTER COLUMN cod_Proyecto SET NOT NULL;

-- Añadir FK a proyecto en entregable (ya que proyecto ya existe)
ALTER TABLE entregable
ADD CONSTRAINT fk_entregable_proyecto FOREIGN KEY (cod_proyecto) REFERENCES proyecto(cod_proyecto) DEFERRABLE INITIALLY DEFERRED;
-- Si quieres que sea NOT NULL después de la creación y la inserción inicial de datos:
-- ALTER TABLE entregable ALTER COLUMN cod_proyecto SET NOT NULL;

-- Añadir FK a proyecto en rep (ya que proyecto ya existe)
ALTER TABLE rep
ADD CONSTRAINT fk_rep_proyecto FOREIGN KEY (cod_proyecto) REFERENCES proyecto(cod_proyecto) DEFERRABLE INITIALLY DEFERRED;
-- Si quieres que sea NOT NULL después de la creación y la inserción inicial de datos:
-- ALTER TABLE rep ALTER COLUMN cod_proyecto SET NOT NULL;

-- 5. Tablas de unión (muchos a muchos)
CREATE TABLE "proyecto-curso" (
    cod_proyecto INT NOT NULL,
    cod_curso INT NOT NULL,
    PRIMARY KEY (cod_proyecto, cod_curso),
    FOREIGN KEY (cod_proyecto) REFERENCES proyecto(cod_proyecto),
    FOREIGN KEY (cod_curso) REFERENCES curso(cod_curso)
);

CREATE TABLE "proyecto_orientacion_del_proyecto" (
    cod_proyecto INT NOT NULL,
    cod_orientacion INT NOT NULL,
    PRIMARY KEY (cod_proyecto, cod_orientacion),
    FOREIGN KEY (cod_proyecto) REFERENCES proyecto(cod_proyecto),
    FOREIGN KEY (cod_orientacion) REFERENCES orientacion_del_proyecto(cod_orientacion)
);

CREATE TABLE "proyecto-era" (
    cod_proyecto INT NOT NULL,
    cod_era INT NOT NULL,
    PRIMARY KEY (cod_proyecto, cod_era),
    FOREIGN KEY (cod_proyecto) REFERENCES proyecto(cod_proyecto),
    FOREIGN KEY (cod_era) REFERENCES era(cod_era)
);

CREATE TABLE "curso-estudiante" (
    cod_curso INT NOT NULL,
    cod_estudiante INT NOT NULL,
    PRIMARY KEY (cod_curso, cod_estudiante),
    FOREIGN KEY (cod_curso) REFERENCES curso(cod_curso),
    FOREIGN KEY (cod_estudiante) REFERENCES estudiante(cod_estudiante)
);

-- Restablecer el comportamiento de las restricciones después de la creación y carga de datos
SET CONSTRAINTS ALL IMMEDIATE;