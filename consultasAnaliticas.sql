--  promedio de los productos --
SELECT categoria, AVG(precio) as precio_promedio
FROM productos
GROUP BY categoria;

-- cantidad total -- 
SELECT categoria, SUM(cantidad) as cantidad_total
FROM productos
GROUP BY categoria;

-- Calcular el total de ventas por sucursal --
SELECT sucursal, SUM(total) as total_ventas
FROM ordenes
GROUP BY sucursal;

-- Obtener el cliente que ha realizado el mayor monto de compras --
SELECT cliente_id, nombre_cliente, SUM(total) as monto_total_compras
FROM (
    SELECT o.cliente_id, c.nombre as nombre_cliente, o.total
    FROM ordenes o
    JOIN clientes c ON o.cliente_id = c.id
) as compras_cliente
GROUP BY cliente_id, nombre_cliente
ORDER BY monto_total_compras DESC
LIMIT 1;
