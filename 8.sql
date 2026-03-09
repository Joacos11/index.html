CREATE TABLE Cliente (
    nroDocumC VARCHAR(15) PRIMARY KEY,
    tipoDocumC VARCHAR(20),
    nombresC VARCHAR(100),
    paternoC VARCHAR(100),
    maternoC VARCHAR(100),
    genero VARCHAR(20),
    enfermedades VARCHAR(200),
    celularC VARCHAR(15)
);

CREATE TABLE Grupo (
    idGrupo INT AUTO_INCREMENT PRIMARY KEY,
    nombreGrupo VARCHAR(100),
    fechaInicio DATE,
    fechaFin DATE
);

CREATE TABLE Disciplina (
    idDisciplina INT AUTO_INCREMENT PRIMARY KEY,
    nombreDisciplina VARCHAR(100),
    descripcion VARCHAR(200)
);

CREATE TABLE Asistencia (
    idAsistencia INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    dia VARCHAR(20),
    horaEntrada TIME,
    esFeriado BOOLEAN,
    asistio BOOLEAN,
    nroDocumC VARCHAR(15),
    idGrupo INT,
    idDisciplina INT,
    FOREIGN KEY (nroDocumC) REFERENCES Cliente(nroDocumC),
    FOREIGN KEY (idGrupo) REFERENCES Grupo(idGrupo),
    FOREIGN KEY (idDisciplina) REFERENCES Disciplina(idDisciplina)
);
