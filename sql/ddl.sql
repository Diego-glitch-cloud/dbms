-- =============================================================
-- DDL — Definición de tablas
-- Compatible con: MariaDB, MySQL, PostgreSQL
-- =============================================================

-- -------------------------------------------------------------
-- departamentos
-- -------------------------------------------------------------
CREATE TABLE departamentos (
    id          INT             PRIMARY KEY,
    nombre      VARCHAR(100)    NOT NULL,
    ubicacion   VARCHAR(100)    NOT NULL
);

-- -------------------------------------------------------------
-- empleados
-- jefe_id es autorreferencia (SELF JOIN)
-- -------------------------------------------------------------
CREATE TABLE empleados (
    id              INT             PRIMARY KEY,
    nombre          VARCHAR(100)    NOT NULL,
    apellido        VARCHAR(100)    NOT NULL,
    email           VARCHAR(150)    UNIQUE NOT NULL,
    salario         DECIMAL(10, 2)  NOT NULL,
    departamento_id INT,
    jefe_id         INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id),
    FOREIGN KEY (jefe_id)         REFERENCES empleados(id)
);

-- -------------------------------------------------------------
-- turnos
-- -------------------------------------------------------------
CREATE TABLE turnos (
    id          INT             PRIMARY KEY,
    nombre      VARCHAR(50)     NOT NULL,
    hora_inicio TIME            NOT NULL,
    hora_fin    TIME            NOT NULL
);

-- -------------------------------------------------------------
-- proyectos
-- -------------------------------------------------------------
CREATE TABLE proyectos (
    id              INT             PRIMARY KEY,
    nombre          VARCHAR(150)    NOT NULL,
    descripcion     TEXT,
    fecha_inicio    DATE            NOT NULL,
    fecha_fin       DATE
);

-- -------------------------------------------------------------
-- empleados_proyectos  (tabla intermedia)
-- -------------------------------------------------------------
CREATE TABLE empleados_proyectos (
    empleado_id     INT         NOT NULL,
    proyecto_id     INT         NOT NULL,
    rol             VARCHAR(100) NOT NULL,
    fecha_asignacion DATE        NOT NULL,
    PRIMARY KEY (empleado_id, proyecto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(id)
);
