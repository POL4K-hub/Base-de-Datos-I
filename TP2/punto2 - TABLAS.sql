-- =======================================
-- TP2 - EJERCICIO 2
-- Base de datos para un gabinete de abogados
-- =======================================

-- Borrado previo y creación
DROP DATABASE IF EXISTS tp2;
CREATE DATABASE tp2;
USE tp2;

-- ====================
-- Tabla Clientes
-- ====================
CREATE TABLE Clientes (
    dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255)
);

-- ====================
-- Tabla Asuntos
-- ====================
CREATE TABLE Asuntos (
    numero_expediente INT PRIMARY KEY AUTO_INCREMENT,
    dni_cliente VARCHAR(20) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    estado ENUM('Abierto', 'Cerrado') NOT NULL,
    FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni)
);

-- ====================
-- Tabla Procuradores
-- ====================
CREATE TABLE Procuradores (
    id_procurador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255)
);

-- ====================
-- Tabla Asuntos_Procuradores
-- ====================
CREATE TABLE Asuntos_Procuradores (
    numero_expediente INT NOT NULL,
    id_procurador INT NOT NULL,
    PRIMARY KEY (numero_expediente, id_procurador),
    FOREIGN KEY (numero_expediente) REFERENCES Asuntos(numero_expediente),
    FOREIGN KEY (id_procurador) REFERENCES Procuradores(id_procurador)
);

