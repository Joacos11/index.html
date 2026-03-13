sistema de Electrodomésticos "ABC"
USE master;
GO

-- Esto desconecta a la fuerza cualquier pestaña que esté usando la BD
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'ElectrodomesticosABC')
BEGIN
    ALTER DATABASE ElectrodomesticosABC SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ElectrodomesticosABC;
END
GO

CREATE DATABASE ElectrodomesticosABC;
GO

USE ElectrodomesticosABC;
GO

CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(150)
);

CREATE TABLE Electrodomestico (
    id_electrodomestico INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    descripcion VARCHAR(200),
    marca VARCHAR(50), 
    precio_compra DECIMAL(10,2),
    precio_venta DECIMAL(10,2)
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(150)
);

CREATE TABLE OrdenCompra (
    id_orden INT PRIMARY KEY IDENTITY(1,1),
    fecha DATE,
    hora TIME,
    monto_total DECIMAL(10,2),
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

CREATE TABLE Comprobante (
    id_comprobante INT PRIMARY KEY IDENTITY(1,1),
    fecha DATE,
    total DECIMAL(10,2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE DetalleMovimiento (
    id_detalle INT PRIMARY KEY IDENTITY(1,1),
    cantidad INT,
    subtotal DECIMAL(10,2),
    id_electrodomestico INT,
    id_orden INT,
    id_comprobante INT,
    FOREIGN KEY (id_electrodomestico) REFERENCES Electrodomestico(id_electrodomestico),
    FOREIGN KEY (id_orden) REFERENCES OrdenCompra(id_orden),
    FOREIGN KEY (id_comprobante) REFERENCES Comprobante(id_comprobante)
);

-- Proveedores
INSERT INTO Proveedor (nombre, telefono, direccion) 
VALUES 
('Importaciones InpeCable', '984123456', 'Av. La Cultura, Cusco'),
('ElectroGlobal SAC', '987654321', 'Lima');

-- Electrodomésticos 
INSERT INTO Electrodomestico (nombre, descripcion, marca, precio_compra, precio_venta) 
VALUES 
('Smart TV 55', 'Televisor 4K Ultra HD', 'Samsung', 1200.00, 1800.00),
('Refrigeradora', 'No Frost 300 Litros', 'LG', 1500.00, 2200.00),
('Microondas', 'Microondas 20L con Grill', 'Panasonic', 250.00, 400.00);

-- Clientes
INSERT INTO Cliente (nombre, telefono, direccion) 
VALUES 
('Jairo Valdez', '999888777', 'San Jeronimo, Cusco'),
('Maria Mendoza', '999111222', 'Wanchaq, Cusco');

-- Creamos la Orden de Compra 1 (Compramos TVs y Microondas)
INSERT INTO OrdenCompra (fecha, hora, monto_total, id_proveedor) 
VALUES ('2026-03-13', '08:30:00', 13250.00, 1);

-- Detalle de Entrada (Cantidades POSITIVAS)
INSERT INTO DetalleMovimiento (cantidad, subtotal, id_electrodomestico, id_orden, id_comprobante) 
VALUES 
(10, 12000.00, 1, 1, NULL),
(5, 1250.00, 3, 1, NULL);

-- Creamos el Comprobante 1 para Jairo (Compró 1 TV)
INSERT INTO Comprobante (fecha, total, id_cliente) 
VALUES ('2026-03-13', 1800.00, 1);

-- Detalle de Salida (Cantidades NEGATIVAS)
INSERT INTO DetalleMovimiento (cantidad, subtotal, id_electrodomestico, id_orden, id_comprobante) 
VALUES 
(-1, 1800.00, 1, NULL, 1);

SELECT * from Proveedor;
SELECT * from Cliente;
SELECT * from Electrodomestico;
SELECT * from OrdenCompra;
SELECT * from DetalleMovimiento;
SELECT * from Comprobante;
