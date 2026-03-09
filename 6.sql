CREATE TABLE Enfermera (
    nroDocumE VARCHAR(15) PRIMARY KEY,
    tipoDocumE VARCHAR(20),
    nombresE VARCHAR(100),
    paternoE VARCHAR(100),
    maternoE VARCHAR(100),
    fechaNacimiento DATE
);

CREATE TABLE Ambiente (
    nroAmb INT PRIMARY KEY,
    ubicacion VARCHAR(100)
);

CREATE TABLE Asistencia (
    idAsistencia INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    dia VARCHAR(20),
    horaEntrada TIME,
    horaSalida TIME,
    tardo BOOLEAN,
    justificacion VARCHAR(200),
    esDescanso BOOLEAN,
    nroDocumE VARCHAR(15),
    nroAmb INT,
    FOREIGN KEY (nroDocumE) REFERENCES Enfermera(nroDocumE),
    FOREIGN KEY (nroAmb) REFERENCES Ambiente(nroAmb)
);
