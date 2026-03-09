CREATE TABLE Area (
    idArea INT AUTO_INCREMENT PRIMARY KEY,
    nombreArea VARCHAR(100)
);

CREATE TABLE Empleado (
    nroDocumE VARCHAR(15) PRIMARY KEY,
    tipoDocumE VARCHAR(20),
    nombresE VARCHAR(100),
    paternoE VARCHAR(100),
    maternoE VARCHAR(100),
    idArea INT,
    FOREIGN KEY (idArea) REFERENCES Area(idArea)
);

CREATE TABLE Turno (
    idTurno INT AUTO_INCREMENT PRIMARY KEY,
    horaInicio TIME,
    horaFin TIME
);

CREATE TABLE Asistencia (
    idAsistencia INT AUTO_INCREMENT PRIMARY KEY,
    fechaA DATE,
    horaEntrada TIME,
    horaSalida TIME,
    tardanza BOOLEAN,
    nroDocumE VARCHAR(15),
    idTurno INT,
    FOREIGN KEY (nroDocumE) REFERENCES Empleado(nroDocumE),
    FOREIGN KEY (idTurno) REFERENCES Turno(idTurno)
);
