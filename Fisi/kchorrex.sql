-- Funciones de agregación con condiciones
-- Calcula el promedio de ventas por categoría y muestra solo aquellas donde el promedio supere $200

SELECT 
    categoria,
    AVG(ventas) AS promedio_ventas,
    COUNT(*) AS total_productos,
    SUM(ventas) AS total_ventas
FROM 
    productos
GROUP BY 
    categoria
HAVING 
    AVG(ventas) > 200
ORDER BY 
    promedio_ventas DESC;


-- Ejemplo alternativo con JOIN si tienes tablas separadas para productos y ventas:

SELECT 
    p.categoria,
    AVG(v.monto) AS promedio_ventas,
    COUNT(DISTINCT p.producto_id) AS total_productos,
    COUNT(v.venta_id) AS total_transacciones,
    SUM(v.monto) AS ventas_totales
FROM 
    productos p
INNER JOIN 
    ventas v ON p.producto_id = v.producto_id
GROUP BY 
    p.categoria
HAVING 
    AVG(v.monto) > 200
ORDER BY 
    promedio_ventas DESC;


-- Ejemplo con datos de prueba (para crear y probar):

-- Crear tabla de ejemplo
CREATE TABLE productos (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    ventas DECIMAL(10, 2)
);

-- Insertar datos de ejemplo
INSERT INTO productos (producto_id, nombre, categoria, ventas) VALUES
(1, 'Laptop HP', 'Electrónica', 850.00),
(2, 'Mouse Logitech', 'Electrónica', 45.00),
(3, 'Teclado Mecánico', 'Electrónica', 120.00),
(4, 'Camisa Polo', 'Ropa', 35.00),
(5, 'Pantalón Jean', 'Ropa', 60.00),
(6, 'Zapatillas Nike', 'Calzado', 180.00),
(7, 'Botas Timberland', 'Calzado', 250.00),
(8, 'Monitor Samsung', 'Electrónica', 320.00),
(9, 'Chaqueta North Face', 'Ropa', 150.00),
(10, 'Sandalias Adidas', 'Calzado', 80.00);

-- Ejecutar la consulta con HAVING
SELECT 
    categoria,
    AVG(ventas) AS promedio_ventas,
    COUNT(*) AS total_productos,
    MIN(ventas) AS venta_minima,
    MAX(ventas) AS venta_maxima
FROM 
    productos
GROUP BY 
    categoria
HAVING 
    AVG(ventas) > 200
ORDER BY 
    promedio_ventas DESC;

-- Resultado esperado: Solo mostrará "Electrónica" con promedio ~333.75