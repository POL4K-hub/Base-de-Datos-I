-- =======================================
-- TP2 - EJERCICIO 2
-- Base de datos para un gabinete de abogados
-- =======================================

-- =========================
-- Consultas con JOIN
-- =========================

-- 1. Nombre y dirección de los procuradores que han trabajado en un asunto abierto
SELECT DISTINCT p.nombre, p.direccion
FROM Procuradores p
JOIN Asuntos_Procuradores ap ON p.id_procurador = ap.id_procurador
JOIN Asuntos a ON ap.numero_expediente = a.numero_expediente
WHERE a.estado = 'Abierto';

-- 2. Clientes que han tenido asuntos en los que participó el procurador Carlos López
SELECT DISTINCT c.nombre, c.direccion
FROM Clientes c
JOIN Asuntos a ON c.dni = a.dni_cliente
JOIN Asuntos_Procuradores ap ON a.numero_expediente = ap.numero_expediente
JOIN Procuradores p ON ap.id_procurador = p.id_procurador
WHERE p.nombre = 'Carlos López';

-- 3. ¿Cuántos asuntos ha gestionado cada procurador?
SELECT p.nombre, COUNT(ap.numero_expediente) AS cantidad_asuntos
FROM Procuradores p
JOIN Asuntos_Procuradores ap ON p.id_procurador = ap.id_procurador
GROUP BY p.nombre;

-- 4. Números de expediente y fechas de inicio de asuntos de clientes que viven en Buenos Aires
SELECT a.numero_expediente, a.fecha_inicio
FROM Asuntos a
JOIN Clientes c ON a.dni_cliente = c.dni
WHERE c.direccion LIKE '%Buenos Aires%';
