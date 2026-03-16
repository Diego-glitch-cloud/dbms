# DBMS — Repositorio de Bases de Datos

Este repositorio contiene ejemplos prácticos para levantar distintos sistemas gestores de bases de datos (SGBD) de forma local usando Docker.

Cada base de datos vive en su propia rama con una configuración independiente (Dockerfile, Docker Compose y README).

## Ramas

| Rama | Base de datos | Descripción |
|------|---------------|-------------|
| [`01-mariadb`](../../tree/01-mariadb) | MariaDB | Base de datos relacional compatible con MySQL + Adminer |
| [`02-postgres`](../../tree/02-postgres) | PostgreSQL | Base de datos relacional avanzada de código abierto + Adminer |

## Cómo usar

1. Cambia a la rama de la base de datos que quieras explorar:
   ```bash
   git checkout 01-mariadb
   ```
2. Sigue las instrucciones en el `README.md` de esa rama.

## Dataset compartido

Todas las ramas usan el mismo dataset para que puedas ejecutar las mismas consultas en cualquier DBMS y comparar comportamiento y sintaxis.

El dataset está en la carpeta `sql/` en la raíz del repositorio:

| Archivo | Descripción |
|---------|-------------|
| [`sql/ddl.sql`](./sql/ddl.sql) | Crea la base de datos y las tablas |
| [`sql/dml.sql`](./sql/dml.sql) | Inserta datos de ejemplo |
| [`sql/queries.sql`](./sql/queries.sql) | Consultas de ejemplo (JOINs, agregaciones, etc.) |

### Esquema

El dataset modela una empresa con empleados, departamentos, proyectos y turnos:

- **`departamentos`** — áreas de la empresa
- **`empleados`** — personal con referencia a su departamento y jefe (autorreferencia)
- **`turnos`** — turnos de trabajo disponibles
- **`proyectos`** — proyectos activos e históricos
- **`empleados_proyectos`** — relación muchos a muchos entre empleados y proyectos

El esquema está diseñado para practicar todos los tipos de JOIN: INNER, LEFT, RIGHT, FULL OUTER, CROSS, SELF, NATURAL y USING.

## Comparación de DBMS

Ver [`COMPARISON.md`](./COMPARISON.md) para una tabla comparativa de los sistemas incluidos.

## Requisitos

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
