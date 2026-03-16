-- =============================================================
-- DML — Datos de ejemplo
-- =============================================================

-- -------------------------------------------------------------
-- departamentos (algunos sin empleados para RIGHT/FULL OUTER)
-- -------------------------------------------------------------
INSERT INTO departamentos (id, nombre, ubicacion) VALUES
(1,  'Tecnología',        'Edificio A - Piso 3'),
(2,  'Recursos Humanos',  'Edificio B - Piso 1'),
(3,  'Finanzas',          'Edificio B - Piso 2'),
(4,  'Marketing',         'Edificio C - Piso 1'),
(5,  'Operaciones',       'Edificio A - Piso 1'),
(6,  'Legal',             'Edificio D - Piso 4'),
(7,  'Investigación',     'Edificio E - Piso 2'),
(8,  'Ventas',            'Edificio C - Piso 2'),
-- Departamentos sin empleados (útil para RIGHT JOIN / FULL OUTER JOIN)
(9,  'Diseño',            'Edificio F - Piso 1'),
(10, 'Logística',         'Edificio A - Piso 2');

-- -------------------------------------------------------------
-- empleados
-- jefe_id NULL = no tiene jefe (es el CEO o nivel superior)
-- departamento_id NULL = sin departamento asignado
-- -------------------------------------------------------------
INSERT INTO empleados (id, nombre, apellido, email, salario, departamento_id, jefe_id) VALUES
-- Nivel directivo (sin jefe)
(1,  'Carlos',    'Mendoza',   'c.mendoza@empresa.com',    95000.00, 1,    NULL),
(2,  'Ana',       'Ríos',      'a.rios@empresa.com',       90000.00, 2,    NULL),
(3,  'Roberto',   'Fuentes',   'r.fuentes@empresa.com',    88000.00, 3,    NULL),
(4,  'Lucía',     'Vargas',    'l.vargas@empresa.com',     87000.00, 4,    NULL),
(5,  'Miguel',    'Torres',    'm.torres@empresa.com',     85000.00, 5,    NULL),
-- Tecnología (jefe: Carlos Mendoza id=1)
(6,  'Sofía',     'Herrera',   's.herrera@empresa.com',   72000.00, 1,    1),
(7,  'Diego',     'Castillo',  'd.castillo@empresa.com',  68000.00, 1,    1),
(8,  'Valentina', 'Mora',      'v.mora@empresa.com',      65000.00, 1,    6),
(9,  'Andrés',    'Pérez',     'a.perez@empresa.com',     63000.00, 1,    6),
(10, 'Camila',    'Rojas',     'c.rojas@empresa.com',     61000.00, 1,    6),
(11, 'Felipe',    'Soto',      'f.soto@empresa.com',      60000.00, 1,    7),
(12, 'Martina',   'Navarro',   'm.navarro@empresa.com',   58000.00, 1,    7),
-- RRHH (jefe: Ana Ríos id=2)
(13, 'Pablo',     'Guerrero',  'p.guerrero@empresa.com',  55000.00, 2,    2),
(14, 'Isidora',   'Muñoz',     'i.munoz@empresa.com',     53000.00, 2,    2),
(15, 'Tomás',     'Salinas',   't.salinas@empresa.com',   52000.00, 2,    13),
(16, 'Javiera',   'Ortiz',     'j.ortiz@empresa.com',     51000.00, 2,    13),
-- Finanzas (jefe: Roberto Fuentes id=3)
(17, 'Nicolás',   'Vega',      'n.vega@empresa.com',      70000.00, 3,    3),
(18, 'Daniela',   'Pizarro',   'd.pizarro@empresa.com',   67000.00, 3,    3),
(19, 'Sebastián', 'Ibáñez',    's.ibanez@empresa.com',    64000.00, 3,    17),
(20, 'Francisca', 'Contreras', 'f.contreras@empresa.com', 62000.00, 3,    17),
-- Marketing (jefe: Lucía Vargas id=4)
(21, 'Constanza', 'Espinoza',  'c.espinoza@empresa.com',  58000.00, 4,    4),
(22, 'Matías',    'Bravo',     'm.bravo@empresa.com',     56000.00, 4,    4),
(23, 'Florencia', 'Reyes',     'f.reyes@empresa.com',     54000.00, 4,    21),
-- Operaciones (jefe: Miguel Torres id=5)
(24, 'Rodrigo',   'Álvarez',   'r.alvarez@empresa.com',   60000.00, 5,    5),
(25, 'Catalina',  'Jiménez',   'c.jimenez@empresa.com',   58000.00, 5,    5),
(26, 'Ignacio',   'Flores',    'i.flores@empresa.com',    56000.00, 5,    24),
(27, 'Amanda',    'Medina',    'a.medina@empresa.com',    55000.00, 5,    24),
-- Legal
(28, 'Hernán',    'Castro',    'h.castro@empresa.com',    75000.00, 6,    NULL),
(29, 'Beatriz',   'León',      'b.leon@empresa.com',      71000.00, 6,    28),
-- Investigación
(30, 'Renata',    'Pacheco',   'r.pacheco@empresa.com',   80000.00, 7,    NULL),
(31, 'Emilio',    'Sandoval',  'e.sandoval@empresa.com',  76000.00, 7,    30),
(32, 'Trinidad',  'Morales',   't.morales@empresa.com',   73000.00, 7,    30),
-- Ventas
(33, 'Marcelo',   'Aguilar',   'm.aguilar@empresa.com',   62000.00, 8,    NULL),
(34, 'Paola',     'Ramírez',   'p.ramirez@empresa.com',   59000.00, 8,    33),
(35, 'Cristóbal', 'Silva',     'cris.silva@empresa.com',  57000.00, 8,    33),
(36, 'Lorena',    'Gutiérrez', 'l.gutierrez@empresa.com', 55000.00, 8,    34),
(37, 'Esteban',   'Acosta',    'e.acosta@empresa.com',    53000.00, 8,    34),
-- Sin departamento asignado (útil para LEFT JOIN)
(38, 'Valeria',   'Núñez',     'v.nunez@empresa.com',     50000.00, NULL, NULL),
(39, 'Mauricio',  'Campos',    'm.campos@empresa.com',    48000.00, NULL, NULL),
(40, 'Alejandra', 'Benítez',   'a.benitez@empresa.com',  47000.00, NULL, NULL);

-- -------------------------------------------------------------
-- turnos
-- -------------------------------------------------------------
INSERT INTO turnos (id, nombre, hora_inicio, hora_fin) VALUES
(1, 'Mañana',   '08:00:00', '16:00:00'),
(2, 'Tarde',    '14:00:00', '22:00:00'),
(3, 'Noche',    '22:00:00', '06:00:00'),
(4, 'Completo', '09:00:00', '18:00:00');

-- -------------------------------------------------------------
-- proyectos (algunos sin empleados para RIGHT/FULL OUTER JOIN)
-- -------------------------------------------------------------
INSERT INTO proyectos (id, nombre, descripcion, fecha_inicio, fecha_fin) VALUES
(1,  'Migración Cloud',         'Migración de infraestructura on-premise a la nube',          '2024-01-15', '2024-12-31'),
(2,  'App Móvil v2',            'Rediseño completo de la aplicación móvil',                   '2024-03-01', '2024-09-30'),
(3,  'ERP Corporativo',         'Implementación de nuevo sistema ERP',                        '2024-02-01', NULL),
(4,  'Portal de Clientes',      'Desarrollo del portal self-service para clientes',           '2024-04-01', '2024-10-31'),
(5,  'Auditoría ISO 27001',     'Proceso de certificación de seguridad de la información',    '2024-05-01', NULL),
(6,  'Campaña Verano 2024',     'Campaña de marketing digital para la temporada de verano',  '2024-11-01', '2025-02-28'),
(7,  'BI & Analytics',          'Implementación de plataforma de inteligencia de negocios',  '2024-06-01', NULL),
(8,  'Automatización RRHH',     'Automatización de procesos de selección y onboarding',      '2024-07-01', '2024-12-31'),
(9,  'Rediseño Web Corporativa','Actualización del sitio web institucional',                  '2024-08-01', '2025-01-31'),
(10, 'Gestión Documental',      'Sistema centralizado de gestión de documentos legales',     '2024-09-01', NULL),
-- Proyectos sin empleados asignados
(11, 'Expansión LATAM',         'Estudio de factibilidad para expansión regional',           '2025-01-01', NULL),
(12, 'Plan de Continuidad',     'Diseño del plan de continuidad del negocio',                '2025-02-01', NULL);

-- -------------------------------------------------------------
-- empleados_proyectos
-- -------------------------------------------------------------
INSERT INTO empleados_proyectos (empleado_id, proyecto_id, rol, fecha_asignacion) VALUES
-- Migración Cloud
(1,  1, 'Sponsor',               '2024-01-15'),
(6,  1, 'Tech Lead',             '2024-01-15'),
(7,  1, 'Arquitecto Cloud',      '2024-01-15'),
(8,  1, 'Desarrollador',         '2024-02-01'),
(9,  1, 'Desarrollador',         '2024-02-01'),
(24, 1, 'Infraestructura',       '2024-02-15'),
-- App Móvil v2
(6,  2, 'Tech Lead',             '2024-03-01'),
(10, 2, 'Desarrollador iOS',     '2024-03-01'),
(11, 2, 'Desarrollador Android', '2024-03-01'),
(12, 2, 'QA Engineer',           '2024-03-15'),
(21, 2, 'Product Owner',         '2024-03-01'),
-- ERP Corporativo
(3,  3, 'Sponsor',               '2024-02-01'),
(17, 3, 'Líder Financiero',      '2024-02-01'),
(18, 3, 'Analista',              '2024-02-01'),
(6,  3, 'Arquitecto',            '2024-02-15'),
(13, 3, 'Gestión del Cambio',    '2024-03-01'),
-- Portal de Clientes
(6,  4, 'Tech Lead',             '2024-04-01'),
(8,  4, 'Desarrollador Backend', '2024-04-01'),
(9,  4, 'Desarrollador Frontend','2024-04-01'),
(22, 4, 'UX Designer',           '2024-04-01'),
-- Auditoría ISO 27001
(5,  5, 'Responsable',           '2024-05-01'),
(28, 5, 'Asesor Legal',          '2024-05-01'),
(29, 5, 'Apoyo Legal',           '2024-05-15'),
(7,  5, 'Seguridad TI',          '2024-05-01'),
-- Campaña Verano 2024
(4,  6, 'Sponsor',               '2024-11-01'),
(21, 6, 'Líder de Campaña',      '2024-11-01'),
(22, 6, 'Diseño',                '2024-11-01'),
(23, 6, 'Contenidos',            '2024-11-01'),
-- BI & Analytics
(1,  7, 'Sponsor',               '2024-06-01'),
(6,  7, 'Arquitecto de Datos',   '2024-06-01'),
(30, 7, 'Data Scientist',        '2024-06-01'),
(31, 7, 'Data Engineer',         '2024-06-15'),
(17, 7, 'Analista BI',           '2024-07-01'),
-- Automatización RRHH
(2,  8, 'Sponsor',               '2024-07-01'),
(13, 8, 'Líder de Proyecto',     '2024-07-01'),
(14, 8, 'Analista RRHH',         '2024-07-01'),
(6,  8, 'Desarrollador',         '2024-07-15'),
-- Rediseño Web Corporativa
(4,  9, 'Sponsor',               '2024-08-01'),
(21, 9, 'Líder de Marketing',    '2024-08-01'),
(22, 9, 'Diseño Web',            '2024-08-01'),
(10, 9, 'Desarrollador',         '2024-08-15'),
-- Gestión Documental
(28, 10, 'Líder Legal',          '2024-09-01'),
(29, 10, 'Analista Legal',       '2024-09-01'),
(6,  10, 'Desarrollador',        '2024-09-15');
