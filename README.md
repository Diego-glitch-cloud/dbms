# DBMS — Repositorio de Bases de Datos

Repositorio para levantar **sistemas gestores de bases de datos (DBMS)** en local con **Docker** y **Docker Compose**. Cada motor va en su propia rama, con su `docker-compose` (y demás archivos) listos para usar.

Por ahora están disponibles:

| Rama | Motor | Interfaz web |
|------|--------|--------------|
| [`01-mariadb`](https://github.com/Diego-glitch-cloud/dbms/tree/01-mariadb) | MariaDB | Adminer |
| [`02-postgresql`](https://github.com/Diego-glitch-cloud/dbms/tree/02-postgresql) | PostgreSQL | pgAdmin |

## Cómo usar

1. Clona el repositorio (si aún no lo tienes).
2. Cambia a la rama del motor que quieras:
   ```bash
   git checkout 01-mariadb
   ```
   o
   ```bash
   git checkout 02-postgresql
   ```
3. En esa rama, abre el `README.md` correspondiente y sigue los pasos (puertos, usuarios y acceso a Adminer o pgAdmin).

## Requisitos

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
