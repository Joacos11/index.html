USE master;
GO

-- Borrado seguro para evitar errores si la base de datos ya existe
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'ComercioElectronicoABC')
BEGIN
    ALTER DATABASE ComercioElectronicoABC SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ComercioElectronicoABC;
END
GO

CREATE DATABASE ComercioElectronicoABC;
GO

USE ComercioElectronicoABC;
GO

-- 1. Crear tabla Categoría [cite: 29]
CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    descripcion VARCHAR(255)
);

-- 2. Crear tabla Marca [cite: 30, 31]
CREATE TABLE Marca (
    id_marca INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    pais_origen VARCHAR(100)
);

-- 3. Crear tabla Cliente (Correo único) 
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre_completo VARCHAR(150),
    email VARCHAR(150) UNIQUE,
    contrasena VARCHAR(255)
);

-- 4. Crear tabla Direcciones de Envío (Múltiples por cliente) 
CREATE TABLE DireccionEnvio (
    id_direccion INT PRIMARY KEY IDENTITY(1,1),
    direccion_completa VARCHAR(255),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- 5. Crear tabla Producto [cite: 20, 21]
CREATE TABLE Producto (
    id_producto INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(150),
    descripcion VARCHAR(255),
    precio DECIMAL(10,2),
    stock INT,
    id_categoria INT, -- Un producto pertenece a una única categoría [cite: 22]
    id_marca INT,     -- Un producto tiene una marca [cite: 21]
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_marca) REFERENCES Marca(id_marca)
);

-- 6. Crear tabla Pedido 
CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY IDENTITY(1,1),
    fecha DATE,
    estado VARCHAR(50) CHECK (estado IN ('Pendiente', 'Enviado', 'Entregado')),
    id_cliente INT, -- Asociado a un único cliente 
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- 7. Crear tabla Ítem de Pedido [cite: 26, 27]
CREATE TABLE ItemPedido (
    id_item INT PRIMARY KEY IDENTITY(1,1),
    cantidad INT,
    id_pedido INT,
    id_producto INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- 8. Crear tabla Opinión 
CREATE TABLE Opinion (
    id_opinion INT PRIMARY KEY IDENTITY(1,1),
    calificacion INT CHECK (calificacion >= 1 AND calificacion <= 5), -- De 1 a 5 estrellas 
    comentario TEXT,
    fecha DATE,
    id_cliente INT,  -- Asociada a un único cliente [cite: 33]
    id_producto INT, -- Asociada a un único producto [cite: 33]
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

--DATOS

--  Categorías y Marcas
INSERT INTO Categoria (nombre, descripcion) VALUES 
('Teléfonos Móviles', 'Smartphones y accesorios celulares'),
('Laptops', 'Computadoras portátiles para trabajo y gaming');

INSERT INTO Marca (nombre, pais_origen) VALUES 
('Apple', 'Estados Unidos'),
('Lenovo', 'China');

--  Clientes 
INSERT INTO Cliente (nombre_completo, email, contrasena) VALUES 
('Alejandro Eduardo Carpio Delgado', 'alejandro.carpio@email.com', 'pwd_segura123'),
('Jairo Valdez', 'jairo.v@email.com', 'pwd_jairo456');

--  Direcciones de Envío
INSERT INTO DireccionEnvio (direccion_completa, id_cliente) VALUES 
('Av. Sol 123, Cusco, Perú', 1),
('Calle Universidad Andina s/n, Cusco', 1), -- Alejandro tiene 2 direcciones
('San Jerónimo MZ A Lote 3, Cusco', 2);

--  Productos
INSERT INTO Producto (nombre, descripcion, precio, stock, id_categoria, id_marca) VALUES 
('iPhone 15 Pro', 'Teléfono móvil de última generación', 4500.00, 15, 1, 1),
('ThinkPad T14', 'Laptop ideal para programación y bases de datos', 3800.00, 8, 2, 2);

-- Registrar un Pedido
INSERT INTO Pedido (fecha, estado, id_cliente) VALUES 
('2026-03-13', 'Pendiente', 1);

-- Agregar Ítems al Pedido (Alejandro compra 1 Laptop y 2 iPhones)
INSERT INTO ItemPedido (cantidad, id_pedido, id_producto) VALUES 
(1, 1, 2), -- 1 ThinkPad
(2, 1, 1); -- 2 iPhones

-- Dejar una Opinión
INSERT INTO Opinion (calificacion, comentario, fecha, id_cliente, id_producto) VALUES 
(5, 'Excelente laptop para mis clases de ingeniería, compila súper rápido.', '2026-03-14', 1, 2);

--Consultar los datos

SELECT *from Categoria;
SELECT *from Marca;
SELECT *from Cliente;
SELECT *from DireccionEnvio;
SELECT *from Producto;
SELECT *from Pedido;
SELECT *from ItemPedido ;
SELECT *from Opinion;
