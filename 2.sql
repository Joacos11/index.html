CREATE TABLE Banco (
    idBanco INT AUTO_INCREMENT PRIMARY KEY,
    nombreBanco VARCHAR(100)
);

CREATE TABLE Cliente (
    nroDocumC VARCHAR(15) PRIMARY KEY,
    tipoDocumC VARCHAR(20),
    nombresC VARCHAR(100),
    paternoC VARCHAR(100),
    maternoC VARCHAR(100),
    celularC VARCHAR(15)
);

CREATE TABLE Cuenta (
    idCuenta INT AUTO_INCREMENT PRIMARY KEY,
    nroCuenta VARCHAR(30),
    saldoCuenta DECIMAL(10,2),
    idBanco INT,
    nroDocumC VARCHAR(15),
    FOREIGN KEY (idBanco) REFERENCES Banco(idBanco),
    FOREIGN KEY (nroDocumC) REFERENCES Cliente(nroDocumC)
);

CREATE TABLE Empleado (
    nroDocumE VARCHAR(15) PRIMARY KEY,
    tipoDocumE VARCHAR(20),
    nombresE VARCHAR(100),
    paternoE VARCHAR(100),
    maternoE VARCHAR(100)
);

CREATE TABLE Operacion (
    idOperacion INT AUTO_INCREMENT PRIMARY KEY,
    tipoOperacion VARCHAR(50),
    montoOperacion DECIMAL(10,2),
    comisionOp DECIMAL(10,2),
    idCuenta INT,
    nroDocumE VARCHAR(15),
    FOREIGN KEY (idCuenta) REFERENCES Cuenta(idCuenta),
    FOREIGN KEY (nroDocumE) REFERENCES Empleado(nroDocumE)
);
