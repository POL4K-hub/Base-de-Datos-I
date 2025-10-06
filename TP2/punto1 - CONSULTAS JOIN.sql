-- =============================================
-- TP2 - Ejercicio 1: Club Náutico
-- =============================================

-- ===============================
-- Consultas CON JOIN
-- ===============================

-- 1. Socios con barcos en amarre mayor que 10
SELECT s.nombre FROM Socios s
JOIN Barcos b ON s.id_socio = b.id_socio
WHERE b.numero_amarre > 10;

-- 2. Nombres y cuotas de barcos cuyo socio es Juan Pérez
SELECT b.nombre, b.cuota FROM Barcos b
JOIN Socios s ON s.id_socio = b.id_socio
WHERE s.nombre = 'Juan Pérez';

-- 3. Cantidad de salidas del barco con matrícula 'ABC123'
SELECT COUNT(*) FROM Salidas WHERE matricula = 'ABC123';

-- 4. Barcos con cuota mayor a 500 y sus socios
SELECT b.nombre, s.nombre FROM Barcos b
JOIN Socios s ON s.id_socio = b.id_socio
WHERE b.cuota > 500;

-- 5. Barcos con destino Mallorca
SELECT DISTINCT b.nombre FROM Barcos b
JOIN Salidas sa ON sa.matricula = b.matricula
WHERE sa.destino = 'Mallorca';

-- 6. Patrones de barcos cuyos socios viven en Barcelona
SELECT sa.patron_nombre, sa.patron_direccion FROM Salidas sa
JOIN Barcos b ON sa.matricula = b.matricula
JOIN Socios s ON s.id_socio = b.id_socio
WHERE s.direccion LIKE '%Barcelona%';