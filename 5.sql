CREATE TABLE Cliente (
    nroDocumC VARCHAR(15) PRIMARY KEY,
    tipoDocumC VARCHAR(20),
    nombresC VARCHAR(100),
    paternoC VARCHAR(100),
    maternoC VARCHAR(100),
    celularC VARCHAR(15)
);

CREATE TABLE Electrodomestico (
    idElectro INT AUTO_INCREMENT PRIMARY KEY,
    nombreElectro VARCHAR(100),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    precioVenta DECIMAL(10,2)
);

CREATE TABLE Comprobante (
    idComprobante INT AUTO_INCREMENT PRIMARY KEY,
    fechaHora DATETIME,
    total DECIMAL(10,2),
    nroDocumC VARCHAR(15),
    FOREIGN KEY (nroDocumC) REFERENCES Cliente(nroDocumC)
);

CREATE TABLE DetalleComprobante (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT,
    subtotal DECIMAL(10,2),
    idElectro INT,
    idComprobante INT,
    FOREIGN KEY (idElectro) REFERENCES Electrodomestico(idElectro),
    FOREIGN KEY (idComprobante) REFERENCES Comprobante(idComprobante)
);
