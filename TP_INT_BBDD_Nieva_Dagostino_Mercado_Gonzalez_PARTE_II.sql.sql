DROP DATABASE IF EXISTS  comercio_electrónico;
CREATE DATABASE  comercio_electrónico CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE comercio_electrónico;


DROP TABLE IF EXISTS seguimiento_envio;
DROP TABLE IF EXISTS detalle_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS facturacion;
DROP TABLE IF EXISTS pagos;
DROP TABLE IF EXISTS metodo_pago;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS proveedores;
DROP TABLE IF EXISTS clientes; 
DROP TABLE IF EXISTS color;
DROP TABLE IF EXISTS producto_color;  

CREATE TABLE clientes(
id_cliente int AUTO_INCREMENT PRIMARY KEY,
nombre varchar(50) not null,
apellido varchar(50) not null,
dni int,
direccion varchar(50)
);

CREATE TABLE productos(
id_producto int AUTO_INCREMENT PRIMARY KEY,
nombre_producto varchar(50) not null,
fecha_vencimiento DATE,
stock int,
precio_producto int
);

CREATE TABLE metodo_pago(
id_eleccion int AUTO_INCREMENT PRIMARY KEY,
tipo_eleccion varchar(50) not null
);

CREATE TABLE pagos(
id_pago int AUTO_INCREMENT PRIMARY KEY,
fecha_pago date,
id_eleccion int,
FOREIGN key (id_eleccion) references metodo_pago(id_eleccion)
);


CREATE TABLE facturacion(
id_factura int AUTO_INCREMENT PRIMARY KEY,
id_pago int,
foreign key (id_pago) references pagos(id_pago)
);

CREATE TABLE pedidos(
id_pedido int AUTO_INCREMENT PRIMARY KEY,
fecha date,
id_cliente int,
id_producto int,
id_factura int,
foreign key (id_cliente) references clientes(id_cliente),
FOREIGN KEY (id_producto) references productos(id_producto),
foreign key (id_factura) references facturacion(id_factura)
);


CREATE TABLE proveedores(
id_proveedor int AUTO_INCREMENT PRIMARY KEY,
cuit int,
direccion varchar(50)
); 

CREATE TABLE detalle_pedido(
id_detalle int AUTO_INCREMENT PRIMARY KEY,
cantida INTEGER,
id_producto int,
FOREIGN KEY (id_producto) references productos(id_producto)
);

CREATE TABLE seguimiento_envio(
id_seguimiento int AUTO_INCREMENT PRIMARY KEY,
fecha_seguimiento DATE,
estado VARCHAR(50) not null,
id_cliente int,
id_pedido int,
foreign key (id_cliente) references clientes(id_cliente),
foreign key (id_pedido) references pedidos(id_pedido)
);

CREATE TABLE colores (
  id_color INT AUTO_INCREMENT PRIMARY KEY,
  nombre_color VARCHAR(50) NOT NULL
);

CREATE TABLE producto_color (
  id_producto INT,
  id_color INT,
  PRIMARY KEY (id_producto, id_color),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
  FOREIGN KEY (id_color) REFERENCES colores(id_color)
);

ALTER TABLE productos
MODIFY COLUMN stock INTEGER;

ALTER TABLE detalle_pedido CHANGE cantida cantidad INT;

ALTER TABLE productos MODIFY COLUMN precio_producto DECIMAL(10,2);

ALTER TABLE detalle_pedido ADD COLUMN id_pedido INT, ADD FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido);

ALTER TABLE proveedores MODIFY COLUMN cuit varchar(12);

INSERT INTO clientes (nombre, apellido, dni, direccion) VALUES
('Juan', 'Pérez', 30110001, 'Calle Falsa 123'),
('María', 'Gómez', 30110002, 'Av. Siempre Viva 742'),
('Carlos', 'López', 30110003, 'Calle Real 555'),
('Laura', 'Fernández', 30110004, 'Pasaje 9 de Julio 1000'),
('Ana', 'Martínez', 30110005, 'Boulevard Central 50'),
('Pedro', 'Ramírez', 30110006, 'Av. Libertad 800'),
('Sofía', 'García', 30110007, 'Calle Jardín 234'),
('Luis', 'Díaz', 30110008, 'Paseo del Sol 999'),
('Marta', 'Rojas', 30110009, 'Ruta 3 Km 45'),
('Diego', 'Vega', 30110010, 'Calle Luna 12'),
('Lucía', 'Morales', 30110011, 'Calle Naranja 34'),
('Jorge', 'Silva', 30110012, 'Av. Verde 90'),
('Patricia', 'Castro', 30110013, 'Calle Azul 22'),
('Ricardo', 'Romero', 30110014, 'Paseo Rojo 55'),
('Carolina', 'Herrera', 30110015, 'Boulevard Amarillo 18'),
('Andrés', 'Molina', 30110016, 'Calle Violeta 67'),
('Valeria', 'Fernández', 30110017, 'Av. Lila 8'),
('Gonzalo', 'Sánchez', 30110018, 'Pasaje Gris 3'),
('Verónica', 'Alvarez', 30110019, 'Calle Turquesa 12'),
('Sebastián', 'Paz', 30110020, 'Ruta 7 Km 98'),
('Claudia', 'Ruiz', 30110021, 'Calle Celeste 101'),
('Martín', 'Ortega', 30110022, 'Av. Marrón 200'),
('Gabriela', 'Vargas', 30110023, 'Pasaje Fucsia 44'),
('Eduardo', 'Ortiz', 30110024, 'Calle Oro 12'),
('Natalia', 'Campos', 30110025, 'Paseo Plata 56'),
('Fernando', 'Guerrero', 30110026, 'Boulevard Bronce 78'),
('Marcela', 'Torres', 30110027, 'Calle Rosa 9'),
('Rafael', 'Cruz', 30110028, 'Av. Coral 7'),
('Liliana', 'Jiménez', 30110029, 'Ruta 9 Km 123'),
('Alberto', 'Domínguez', 30110030, 'Calle Marfil 88'),
('Silvia', 'Méndez', 30110031, 'Pasaje Cobre 25'),
('Javier', 'Castillo', 30110032, 'Av. Granate 66'),
('Beatriz', 'Paredes', 30110033, 'Calle Jade 13'),
('Santiago', 'Núñez', 30110034, 'Boulevard Ámbar 34'),
('Rosa', 'Salinas', 30110035, 'Paseo Turmalina 17'),
('Víctor', 'Reyes', 30110036, 'Calle Cian 41'),
('Teresa', 'Moreno', 30110037, 'Av. Esmeralda 91'),
('Joaquín', 'Soto', 30110038, 'Ruta 11 Km 111'),
('Rocío', 'Sandoval', 30110039, 'Calle Rubí 44'),
('Héctor', 'Flores', 30110040, 'Pasaje Zafiro 52'),
('Mónica', 'Herrera', 30110041, 'Boulevard Ópalo 16'),
('Emilio', 'Lara', 30110042, 'Calle Cuarzo 3'),
('Lorena', 'Ibarra', 30110043, 'Av. Topacio 88'),
('Roberto', 'Mora', 30110044, 'Paseo Ónix 78'),
('Daniela', 'Rivas', 30110045, 'Ruta 14 Km 74'),
('Óscar', 'Vega', 30110046, 'Calle Citrino 55'),
('Sabrina', 'Mendoza', 30110047, 'Av. Esmeralda 24'),
('Guillermo', 'Velasco', 30110048, 'Pasaje Zafiro 91'),
('Adriana', 'Montes', 30110049, 'Boulevard Jade 50'),
('Ezequiel', 'Cardozo', 30110050, 'Calle Amatista 33'),
('Fabiana', 'Medina', 30110051, 'Av. Coral 72'),
('Mauricio', 'León', 30110052, 'Paseo Rubí 15'),
('Natalia', 'Ramos', 30110053, 'Ruta 19 Km 67'),
('Andrés', 'Guerrero', 30110054, 'Calle Perla 87'),
('Silvina', 'Salazar', 30110055, 'Av. Granate 11'),
('Esteban', 'Durán', 30110056, 'Pasaje Cuarzo 39'),
('Lorena', 'Blanco', 30110057, 'Boulevard Topacio 44'),
('Ricardo', 'Navarro', 30110058, 'Calle Citrino 25'),
('Gabriela', 'Santana', 30110059, 'Av. Esmeralda 66'),
('Julio', 'Molina', 30110060, 'Paseo Zafiro 8'),
('Clara', 'Vargas', 30110061, 'Ruta 21 Km 78'),
('Sergio', 'Bravo', 30110062, 'Calle Ópalo 49'),
('Daniel', 'López', 30110063, 'Pasaje Ónix 67'),
('Carla', 'Santos', 30110064, 'Boulevard Citrino 38'),
('Matías', 'Rojas', 30110065, 'Av. Amatista 10'),
('Florencia', 'Márquez', 30110066, 'Calle Coral 59'),
('Diego', 'Pérez', 30110067, 'Paseo Rubí 73'),
('Marina', 'Sierra', 30110068, 'Ruta 23 Km 101'),
('Javier', 'Vega', 30110069, 'Calle Perla 22'),
('Lorena', 'Sosa', 30110070, 'Av. Granate 90'),
('Hugo', 'Pinto', 30110071, 'Pasaje Cuarzo 77'),
('Verónica', 'Cruz', 30110072, 'Boulevard Topacio 18'),
('Fernando', 'Mora', 30110073, 'Calle Citrino 44'),
('Elena', 'Flores', 30110074, 'Av. Esmeralda 31'),
('Marcos', 'Salinas', 30110075, 'Paseo Zafiro 50'),
('Silvia', 'Morales', 30110076, 'Ruta 25 Km 85'),
('Ricardo', 'Castro', 30110077, 'Calle Ópalo 11'),
('Verónica', 'Soto', 30110078, 'Pasaje Ónix 29'),
('José', 'Paredes', 30110079, 'Boulevard Citrino 62'),
('Natalia', 'Ortega', 30110080, 'Av. Amatista 53'),
('Gustavo', 'Méndez', 30110081, 'Calle Coral 19'),
('Luciana', 'Ramos', 30110082, 'Paseo Rubí 37'),
('Raúl', 'Guerrero', 30110083, 'Ruta 27 Km 112'),
('Silvia', 'Salazar', 30110084, 'Calle Perla 84'),
('Ramón', 'Durán', 30110085, 'Av. Granate 69'),
('Laura', 'Blanco', 30110086, 'Pasaje Cuarzo 5'),
('Mariano', 'Navarro', 30110087, 'Boulevard Topacio 9'),
('Patricia', 'Santana', 30110088, 'Calle Citrino 27'),
('Francisco', 'Molina', 30110089, 'Av. Esmeralda 47'),
('Verónica', 'Vargas', 30110090, 'Paseo Zafiro 32'),
('Martín', 'Bravo', 30110091, 'Ruta 29 Km 90'),
('Claudia', 'López', 30110092, 'Calle Ópalo 6'),
('Daniela', 'Santos', 30110093, 'Pasaje Ónix 40'),
('Pablo', 'Rojas', 30110094, 'Boulevard Citrino 17'),
('Gabriela', 'Márquez', 30110095, 'Av. Amatista 84'),
('Luis', 'Pérez', 30110096, 'Calle Coral 70'),
('Mónica', 'Sierra', 30110097, 'Paseo Rubí 41'),
('Raúl', 'Vega', 30110098, 'Ruta 31 Km 100'),
('Silvina', 'Sosa', 30110099, 'Calle Perla 12'),
('Roberto', 'Pinto', 30110100, 'Av. Granate 74');

INSERT INTO productos (nombre_producto, fecha_vencimiento, stock, precio_producto) VALUES
('Remera', '2026-12-31', 150, 1200.50),
('Pantalón Jeans', '2027-01-15', 80, 2500.00),
('Camisa', '2025-11-30', 60, 1800.75),
('Zapatillas Running', '2028-06-20', 40, 5000.00),
('Chaqueta Cuero', '2026-03-10', 25, 7200.90),
('Sombrero', '2029-08-05', 100, 800.00),
('Bufanda', '2027-09-12', 200, 400.00),
('Medias', '2027-05-25', 300, 200.00),
('Cinturón', '2028-12-01', 90, 1500.00),
('Mochila', '2030-01-01', 50, 3500.00),
('Campera Impermeable', '2026-07-22', 70, 6200.00),
('Pantalón Corto', '2027-03-14', 120, 1300.00),
('Vestido Verano', '2027-11-18', 90, 2700.00),
('Zapatos Cuero', '2026-10-30', 45, 5400.00),
('Gorra Deportiva', '2028-04-15', 140, 900.00),
('Sweater Lana', '2026-09-10', 110, 3300.00),
('Pollera', '2027-12-20', 80, 1500.00),
('Buzo Algodón', '2027-01-10', 200, 2200.00),
('Ojotas', '2029-02-28', 100, 900.00),
('Cartera Cuero', '2028-05-05', 30, 4200.00),
('Remera', '2026-11-11', 150, 1200.00),
('Pantalón Deportivo', '2027-06-14', 100, 2100.00),
('Camisa Rayada', '2025-12-30', 60, 1900.00),
('Zapatillas Casual', '2028-07-20', 40, 4800.00),
('Chaqueta Jean', '2026-04-10', 30, 7100.00),
('Sombrero Panamá', '2029-09-05', 110, 950.00),
('Bufanda Lana', '2027-10-12', 190, 450.00),
('Medias Algodón', '2027-06-25', 310, 210.00),
('Cinturón Cuero', '2028-11-01', 80, 1600.00),
('Mochila Escolar', '2030-02-01', 45, 3600.00),
('Campera Jean', '2026-08-22', 60, 6000.00),
('Pantalón Chino', '2027-04-14', 130, 1400.00),
('Vestido Fiesta', '2027-10-18', 85, 2800.00),
('Zapatos Deportivos', '2026-11-30', 50, 5300.00),
('Gorra Beisbol', '2028-05-15', 130, 920.00),
('Sweater Algodón', '2026-10-10', 115, 3350.00),
('Pollera Larga', '2027-11-20', 75, 1550.00),
('Buzo Polar', '2027-02-10', 210, 2250.00),
('Ojotas Playa', '2029-03-28', 95, 880.00),
('Cartera Tela', '2028-06-05', 35, 4000.00),
('Remera', '2026-12-11', 160, 1250.00),
('Pantalón Cargo', '2027-07-14', 90, 2150.00),
('Camisa Larga', '2026-01-30', 55, 1850.00),
('Zapatillas Trekking', '2028-08-20', 45, 4900.00),
('Chaqueta Plumas', '2026-05-10', 28, 7300.00),
('Sombrero Fedora', '2029-10-05', 115, 980.00),
('Bufanda Seda', '2027-11-12', 195, 470.00),
('Medias Largas', '2027-07-25', 320, 230.00),
('Cinturón Tela', '2028-10-01', 85, 1700.00),
('Mochila Viaje', '2030-03-01', 40, 3700.00),
('Campera Softshell', '2026-09-22', 65, 6400.00),
('Pantalón Pijama', '2027-05-14', 125, 1200.00),
('Vestido Casual', '2027-09-18', 95, 2600.00),
('Zapatos Niños', '2026-12-30', 48, 5200.00),
('Gorra Invierno', '2028-06-15', 120, 930.00),
('Sweater Niño', '2026-11-10', 118, 3400.00),
('Pollera Niña', '2027-12-20', 78, 1580.00),
('Buzo Niño', '2027-03-10', 220, 2300.00),
('Ojotas Niños', '2029-04-28', 105, 870.00),
('Cartera Niña', '2028-07-05', 32, 4100.00),
('Remera', '2026-11-11', 170, 1230.00),
('Pantalón Jeans', '2027-08-14', 95, 2200.00),
('Camisa Cuadros', '2026-02-10', 57, 1870.00),
('Zapatillas Baloncesto', '2028-09-20', 43, 4950.00),
('Chaqueta Softshell', '2026-06-10', 27, 7350.00),
('Sombrero Lana', '2029-11-05', 120, 990.00),
('Bufanda Invierno', '2027-12-12', 185, 480.00),
('Medias Cortas', '2027-08-25', 315, 225.00),
('Cinturón Niños', '2028-09-01', 88, 1750.00),
('Mochila Escolar', '2030-04-01', 38, 3750.00),
('Campera Invierno', '2026-10-22', 68, 6500.00),
('Pantalón Formal', '2027-06-14', 130, 1500.00),
('Vestido Invierno', '2027-10-18', 88, 2900.00),
('Zapatos Niñas', '2026-01-30', 49, 5250.00),
('Gorra Casual', '2028-07-15', 125, 940.00),
('Sweater Lana', '2026-12-10', 120, 3450.00),
('Pollera Corta', '2027-01-20', 80, 1600.00),
('Buzo Niñas', '2027-04-10', 225, 2350.00),
('Ojotas Playa', '2029-05-28', 110, 880.00),
('Cartera Cuero', '2028-08-05', 37, 4200.00),
('Remera Blanca', '2026-10-11', 175, 1240.00),
('Pantalón Tela', '2027-09-14', 98, 2300.00),
('Camisa Manga Larga', '2026-03-30', 59, 1900.00),
('Zapatillas Outdoor', '2028-10-20', 44, 5050.00),
('Chaqueta Cordero', '2026-07-10', 30, 7400.00),
('Sombrero Verano', '2029-12-05', 125, 1000.00),
('Bufanda Lana', '2027-01-12', 180, 490.00),
('Medias Invierno', '2027-09-25', 330, 240.00),
('Cinturón Hombre', '2028-08-01', 90, 1800.00),
('Mochila Trekking', '2030-05-01', 35, 3800.00),
('Bufanda Pardo', '2025-04-22', 5, 1500.00),
('Zapato Deportivo', '2026-11-15', 25, 3200.00),
('Campera Invierno', '2027-08-10', 12, 7800.00),
('Remera Estampada', '2026-05-30', 40, 1300.00),
('Pantalón Jeans', '2028-01-12', 18, 4500.00),
('Gorra Trucker', '2025-12-05', 60, 900.00),
('Cinturón Cuero', '2027-03-20', 22, 2100.00),
('Zapato Formal', '2026-09-25', 15, 6700.00),
('Medias Algodón', '2025-10-15', 100, 350.00),
('Buzo Friza', '2027-07-01', 30, 2900.00);

INSERT INTO metodo_pago (tipo_eleccion) VALUES
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Mercado Pago'),
('Efectivo');


INSERT INTO pagos (fecha_pago, id_eleccion) VALUES
('2025-06-01', 1),
('2025-06-02', 2),
('2025-06-03', 3),
('2025-06-04', 4),
('2025-06-05', 1),
('2025-06-06', 2),
('2025-06-07', 3),
('2025-06-08', 4),
('2025-06-09', 1),
('2025-06-10', 2),
('2025-06-11', 3),
('2025-06-12', 4),
('2025-06-13', 1),
('2025-06-14', 2),
('2025-06-15', 3),
('2025-06-16', 4),
('2025-06-17', 1),
('2025-06-18', 2),
('2025-06-19', 3),
('2025-06-20', 4),
('2025-06-21', 1),
('2025-06-22', 2),
('2025-06-23', 3),
('2025-06-24', 4),
('2025-06-25', 1),
('2025-06-26', 2),
('2025-06-27', 3),
('2025-06-28', 4),
('2025-06-29', 1),
('2025-06-30', 2);


INSERT INTO facturacion (id_pago) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(1), -- Esto crea id_factura = 31
(2),-- = 32
(3),--  = 33
(4),
(1),
(2);

INSERT INTO pedidos (fecha, id_cliente, id_producto, id_factura) VALUES
('2025-06-01', 1, 5, 1),
('2025-06-02', 2, 10, 2),
('2025-06-03', 3, 15, 3),
('2025-06-04', 4, 20, 4),
('2025-06-05', 5, 25, 5),
('2025-06-06', 6, 30, 6),
('2025-06-07', 7, 35, 7),
('2025-06-08', 8, 40, 8),
('2025-06-09', 9, 45, 9),
('2025-06-10', 10, 50, 10),
('2025-06-11', 11, 55, 11),
('2025-06-12', 12, 60, 12),
('2025-06-13', 13, 65, 13),
('2025-06-14', 14, 70, 14),
('2025-06-15', 15, 75, 15),
('2025-06-16', 16, 80, 16),
('2025-06-17', 17, 85, 17),
('2025-06-18', 18, 90, 18),
('2025-06-19', 19, 95, 19),
('2025-06-20', 20, 100, 20),
('2025-06-21', 21, 1, 21),
('2025-06-22', 22, 6, 22),
('2025-06-23', 23, 11, 23),
('2025-06-24', 24, 16, 24),
('2025-06-25', 25, 21, 25),
('2025-06-26', 26, 26, 26),
('2025-06-27', 27, 31, 27),
('2025-06-28', 28, 36, 28),
('2025-06-29', 29, 41, 29),
('2025-06-30', 30, 46, 30),
('2025-07-02', 31, 5, 31),
('2025-07-03', 32, 10, 32),
('2025-07-04', 33, 15, 33),
('2025-07-05', 34, 1, 34),
('2025-07-06', 35, 25, 35),
('2025-07-07', 36, 46, 36);


INSERT INTO detalle_pedido (cantidad, id_producto, id_pedido) VALUES
(2, 5, 1),
(1, 12, 1),
(3, 10, 2),
(1, 22, 2),
(2, 15, 3),
(2, 19, 3),
(1, 20, 4),
(1, 24, 4),
(4, 25, 5),
(2, 28, 5),
(1, 30, 6),
(2, 33, 6),
(3, 35, 7),
(1, 38, 7),
(2, 40, 8),
(1, 42, 8),
(1, 45, 9),
(2, 48, 9),
(3, 50, 10),
(1, 52, 10),
(2, 55, 11),
(1, 57, 11),
(1, 60, 12),
(3, 62, 12),
(2, 65, 13),
(1, 67, 13),
(4, 70, 14),
(1, 72, 14),
(1, 75, 15),
(2, 77, 15),
(3, 80, 16),
(1, 82, 16),
(1, 85, 17),
(2, 87, 17),
(2, 90, 18),
(1, 92, 18),
(1, 95, 19),
(3, 97, 19),
(2, 100, 20),
(1, 3, 20),
(2, 1, 21),
(1, 4, 21),
(3, 6, 22),
(1, 9, 22),
(2, 11, 23),
(1, 14, 23),
(1, 16, 24),
(2, 18, 24),
(3, 21, 25),
(1, 23, 25),
(1, 26, 26),
(2, 29, 26),
(2, 31, 27),
(1, 34, 27),
(3, 36, 28),
(1, 39, 28),
(1, 41, 29),
(2, 44, 29),
(3, 46, 30),
(1, 49, 30),
(2, 5, 31),
(2, 10, 32),
(2, 15, 33),
(2, 1, 34),
(2, 25, 35),
(2, 46, 36);


INSERT INTO proveedores (cuit, direccion) VALUES
(20300111222, 'Av. Proveedor 123'),(20300122333, 'Calle Comercio 456'),(20300133444, 'Ruta 5 Km 12'),
(20300144555, 'Boulevard Industrial 7'),(20300155666, 'Pasaje Logístico 99'),(20300166777, 'Av. Central 22'),
(20300177888, 'Calle Mercado 14'),(20300188999, 'Zona Franca 33'),(20300199000, 'Parque Industrial 66'),
(20300200111, 'Av. Comercio Exterior 88'),(20300211222, 'Calle Almacén 55');

INSERT INTO seguimiento_envio (fecha_seguimiento, estado, id_cliente, id_pedido) VALUES
('2025-06-02', 'Preparando', 1, 1),('2025-06-03', 'Enviado', 2, 2),('2025-06-04', 'Entregado', 3, 3),('2025-06-05', 'Pendiente', 4, 4),('2025-06-06', 'Preparando', 5, 5),
('2025-06-07', 'Enviado', 6, 6),('2025-06-08', 'Entregado', 7, 7),('2025-06-09', 'Pendiente', 8, 8),('2025-06-10', 'Preparando', 9, 9),('2025-06-11', 'Enviado', 10, 10),
('2025-06-12', 'Entregado', 11, 11),('2025-06-13', 'Pendiente', 12, 12),('2025-06-14', 'Preparando', 13, 13),('2025-06-15', 'Enviado', 14, 14),('2025-06-16', 'Entregado', 15, 15),
('2025-06-17', 'Pendiente', 16, 16),('2025-06-18', 'Preparando', 17, 17),('2025-06-19', 'Enviado', 18, 18),('2025-06-20', 'Entregado', 19, 19),('2025-06-21', 'Pendiente', 20, 20),
('2025-06-22', 'Preparando', 21, 21),('2025-06-23', 'Enviado', 22, 22),('2025-06-25', 'Pendiente', 24, 24),('2025-06-26', 'Preparando', 25, 25),('2025-06-27', 'Enviado', 26, 26),
('2025-06-28', 'Entregado', 27, 27),('2025-06-29', 'Pendiente', 28, 28),('2025-06-30', 'Preparando', 29, 29),('2025-07-01', 'Enviado', 30, 30);

INSERT INTO colores (nombre_color) VALUES ('Rojo'), ('Verde'), ('Blanco');

INSERT INTO producto_color (id_producto, id_color) VALUES
(1, 1), (1, 2),
(2, 1), (2, 2), (2, 3),
(3, 1), (3, 2), (3, 3),
(4, 1), (4, 3),
(5, 1), (5, 2), (5, 3),
(6, 1), (6, 3),
(7, 1), (7, 2), (7, 3),
(8, 1), (8, 2), (8, 3),
(9, 2), (9, 3),
(10, 1), (10, 2), (10, 3),
(11, 1), (11, 2), (11, 3),
(12, 2), (12, 3),
(13, 1), (13, 2), (13, 3),
(14, 1), (14, 2),
(15, 1), (15, 2),
(16, 1), (16, 2), (16, 3),
(17, 1), (17, 3),
(18, 2), (18, 3),
(19, 2), (19, 3),
(20, 1), (20, 2), (20, 3),
(21, 1), (21, 3),
(22, 1), (22, 3),
(23, 1), (23, 2), (23, 3),
(24, 1), (24, 2), (24, 3),
(25, 1), (25, 2), (25, 3),
(26, 1), (26, 3),
(27, 1), (27, 2), (27, 3),
(28, 1),
(29, 1),
(30, 1), (30, 2), (30, 3),
(31, 1), (31, 2), (31, 3),
(32, 1),
(33, 1), (33, 2), (33, 3),
(34, 1), (34, 2),
(35, 1), (35, 2),
(36, 1), (36, 2),
(37, 1), (37, 2), (37, 3),
(38, 1), (38, 2), (38, 3),
(39, 1),
(40, 1),
(41, 1), (41, 2), (41, 3),
(42, 1), (42, 2), (42, 3),
(43, 1), (43, 2), (43, 3),
(44, 1), (44, 2), (44, 3),
(45, 1), (45, 2), (45, 3),
(46, 1), (46, 2), (46, 3),
(47, 1),
(48, 1),
(49, 1),
(50, 1), (50, 2), (50, 3),
(51, 1), (51, 2), (51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 1), (55, 2), (55, 3),
(56, 1), (56, 2), (56, 3),
(57, 1), (57, 2), (57, 3),
(58, 1),
(59, 1),
(60, 1), (60, 2), (60, 3),
(61, 1), (61, 2), (61, 3),
(62, 1),
(63, 1), (63, 2),
(64, 1), (64, 2),
(65, 1), (65, 2), (65, 3),
(66, 1), (66, 2), (66, 3),
(67, 1), (67, 2), (67, 3),
(68, 1), (68, 2), (68, 3),
(69, 1), (69, 2), (69, 3),
(70, 1), (70, 2), (70, 3),
(71, 1), (71, 2), (71, 3),
(72, 1), (72, 2), (72, 3),
(73, 1), (73, 2), (73, 3),
(74, 1), (74, 2), (74, 3),
(75, 1), (75, 2), (75, 3),
(76, 1), (76, 2), (76, 3),
(77, 1), (77, 2), (77, 3),
(78, 1), (78, 2), (78, 3),
(79, 1), (79, 2), (79, 3),
(80, 1), (80, 2), (80, 3),
(81, 1), (81, 2), (81, 3),
(82, 1), (82, 2), (82, 3),
(83, 1), (83, 2), (83, 3),
(84, 1), (84, 2), (84, 3),
(85, 1), (85, 2), (85, 3),
(86, 1), (86, 2), (86, 3),
(87, 1), (87, 2), (87, 3),
(88, 1), (88, 2), (88, 3),
(89, 1), (89, 2), (89, 3),
(90, 1), (90, 2), (90, 3),
(91, 1), (91, 2), (91, 3),
(92, 1), (92, 2), (92, 3),
(93, 1), (93, 2), (93, 3),
(94, 1), (94, 2), (94, 3),
(95, 1), (95, 2), (95, 3),
(96, 1), (96, 2), (96, 3),
(97, 1), (97, 2), (97, 3),
(98, 1), (98, 2), (98, 3),
(99, 1), (99, 2), (99, 3),
(100, 1), (100, 2), (100, 3);

-- EJERCICIO 3
-- 3 a 
-- Consulta 1: Usamos dos INNER JOIN para 
-- mostrar el nombre y apellido del cliente, el nombre del producto y la fecha del pedido

SELECT 
	c.nombre as nombre_cliente,
    c.apellido as apellido_cliente,
    p.nombre_producto,
    pe.fecha
FROM pedidos as pe
	INNER JOIN clientes as c on pe.id_cliente = c.id_cliente 	
	INNER JOIN productos as p on pe.id_producto = p.id_producto;
    
-- Consulta 2 
-- Seguimiento del estado del envío con nombre del cliente
SELECT
    c.nombre as nombre_cliente,
    c.apellido as apellido_cliente,
    p.id_pedido,
    s.estado as estado_pedido
FROM pedidos as p
	INNER JOIN clientes as c on p.id_cliente = c.id_cliente
    INNER JOIN seguimiento_envio  as s on p.id_pedido = s.id_pedido;
    
-- EJERCICIO 3
-- 3 b
-- Consulta 1
-- Clientes sin pedidos 

SELECT 
	c.nombre as nombre_cliente,
    c.apellido as apellido_cliente,
    p.id_pedido
FROM clientes as c
	LEFT JOIN pedidos as p on c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;

-- Consulta 2
SELECT 
  pr.nombre_producto,
  p.id_pedido
FROM productos pr
	LEFT JOIN pedidos p ON pr.id_producto = p.id_producto;
    
-- EJERCICIO 3
-- 3 c
-- Consulta 1 Total gastado por cada cliente

SELECT 
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    SUM(dp.cantidad * pr.precio_producto) AS total_gastado
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
JOIN productos pr ON dp.id_producto = pr.id_producto
GROUP BY c.id_cliente, c.nombre, c.apellido
ORDER BY total_gastado DESC;

-- Consulta 2 productos más pedidos usando HAVING
SELECT 
    pr.nombre_producto,
    COUNT(p.id_pedido) AS cantidad_pedidos
FROM productos pr
JOIN pedidos p ON pr.id_producto = p.id_producto
GROUP BY pr.id_producto
HAVING COUNT(p.id_pedido) > 1;

-- EJERCICIO 3
-- 3 d

-- Consulta 1 clientes que realizaron pedidos de productos mas caros que el precio promedio
-- de todos los productos vendidos
SELECT 	
	c.nombre, c.apellido
FROM clientes AS c
JOIN pedidos AS p ON c.id_cliente = p.id_cliente
JOIN productos AS pr ON p.id_producto = pr.id_producto
WHERE pr.precio_producto > (
	SELECT AVG(pr2.precio_producto)
    FROM pedidos AS p2
    JOIN productos AS pr2 ON p2.id_producto = pr2.id_producto
);


-- Consulta 2- clinetes que hicieron pedidos con mas de 2 productos distintos
SELECT
	pr.nombre_producto,
    pr.precio_producto
FROM productos AS pr
WHERE pr.precio_producto > (
	SELECT
		avg(pr2.precio_producto)
	FROM pedidos AS p2
    JOIN productos AS pr2 ON p2.id_producto = pr2.id_producto
    WHERE p2.fecha BETWEEN '2025-06-01' AND '2025-06-30'
);

-- EJERCICIO 4 --------------------------------------------------------
-- Procedimientos almacenados: inserción, actualización y cálculo de total
-- 1) InsertarNuevoProducto
-- Descripción: Inserta un nuevo producto en la tabla productos con sus datos básicos.

DELIMITER //
CREATE PROCEDURE InsertarNuevoProducto (
    IN p_nombre VARCHAR(50),
    IN p_fecha_vencimiento DATE,
    IN p_stock INT,
    IN p_precio DECIMAL(10,2)
)
BEGIN
    INSERT INTO productos (nombre_producto, fecha_vencimiento, stock, precio_producto)
    VALUES (p_nombre, p_fecha_vencimiento, p_stock, p_precio);
END //

-- Ejemplo de uso:
CALL InsertarNuevoProducto('Zapatilla Running', '2027-09-15', 20, 5300.00);


-- 2) ActualizarEstadoEnvio
-- Descripción: Actualiza el estado actual de envío de un pedido en la tabla seguimiento_envio.

DELIMITER //
CREATE PROCEDURE ActualizarEstadoEnvio (
    IN p_id_pedido INT,
    IN p_nuevo_estado VARCHAR(50)
)
BEGIN
    UPDATE seguimiento_envio
    SET estado = p_nuevo_estado
    WHERE id_pedido = p_id_pedido;
END //

-- Ejemplo de uso:
CALL ActualizarEstadoEnvio(10, 'Pendiente');


-- 3) CalcularTotalPedido
-- Descripción: Calcula el monto total de un pedido sumando los precios unitarios * cantidad 
-- de cada producto en el detalle del pedido.

DELIMITER //
CREATE PROCEDURE CalcularTotalPedido (
    IN p_id_pedido INT,
    OUT total DECIMAL(10,2)
)
BEGIN
    SELECT SUM(dp.cantidad * pr.precio_producto)
    INTO total
    FROM detalle_pedido as dp
    INNER JOIN productos as pr ON dp.id_producto = pr.id_producto
    WHERE dp.id_pedido = p_id_pedido;
END //

-- Ejemplo de uso:
CALL CalcularTotalPedido(5, @total);
SELECT @total;