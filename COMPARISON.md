# Comparación de DBMS

| Característica         | MariaDB                        | PostgreSQL                        |
|------------------------|--------------------------------|-----------------------------------|
| **Puerto por defecto** | 3306                           | 5432                              |
| **Puerto en este repo**| 33066                          | 54326                             |
| **Usuario por defecto**| `root`                         | `postgres`                        |
| **Contraseña**         | `root`                         | `root`                            |
| **Base de datos**      | `dbms`                         | `dbms`                            |
| **Directorio de datos**| `/var/lib/mysql`               | `/var/lib/postgresql/data`        |
| **Adminer — Sistema**  | MySQL                          | PostgreSQL                        |
| **Adminer — Servidor** | `mariadb`                      | `postgres`                        |
| **Motor de almacenamiento** | InnoDB (por defecto)      | —                                 |
| **FULL OUTER JOIN**    | No soportado nativamente (emular con UNION) | Soportado |
| **Tipo JSON**          | Soportado                      | Soportado (con operadores avanzados `->`, `->>`) |
| **Secuencias / Auto-increment** | `AUTO_INCREMENT`    | `SERIAL` / `GENERATED ALWAYS AS IDENTITY` |
| **Cadenas entre comillas** | Dobles o simples          | Solo comillas simples para strings |
| **Case sensitivity**   | Depende del collation          | Sensible por defecto              |
| **Licencia**           | GPL v2                         | PostgreSQL License (estilo MIT)   |

## Cuándo usar cada uno

**MariaDB** es una buena elección si:
- Tienes experiencia previa con MySQL
- Necesitas compatibilidad con ecosistemas PHP / WordPress / LAMP
- Buscas una opción familiar y ampliamente documentada

**PostgreSQL** es una buena elección si:
- Necesitas tipos de datos avanzados (arrays, JSON, rangos, geométricos)
- Requieres cumplimiento estricto del estándar SQL
- Trabajas con consultas analíticas complejas o cargas de trabajo pesadas
