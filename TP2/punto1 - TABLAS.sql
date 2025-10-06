-- =============================================
-- TP2 - Ejercicio 1: Club Náutico
-- =============================================

-- Crear base de datos y seleccionarla
CREATE DATABASE IF NOT EXISTS club_nautico;
USE club_nautico;


-- Crear tablas
CREATE TABLE Socios (
    id_socio INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255)
);

CREATE TABLE Barcos (
    matricula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    numero_amarre INT,
    cuota DECIMAL(10,2),
    id_socio INT REFERENCES Socios(id_socio)
);

CREATE TABLE Salidas (
    id_salida INT PRIMARY KEY,
    matricula VARCHAR(20) REFERENCES Barcos(matricula),
    fecha_salidad DATE,
    hora_salida TIME,
    destino VARCHAR(100),
    patron_nombre VARCHAR(100),
    patron_direccion VARCHAR(255)
);

