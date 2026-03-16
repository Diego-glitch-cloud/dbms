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

## Requisitos

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
