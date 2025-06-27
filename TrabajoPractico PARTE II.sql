DROP DATABASE IF EXISTS  comercio_electrónico;
CREATE DATABASE  comercio_electrónico CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE comercio_electrónico;

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
/*
FALTA TOTAL_FACTURADO????
*/
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


ALTER TABLE productos
MODIFY COLUMN stock INTEGER;
