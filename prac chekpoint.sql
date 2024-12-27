USE `checkpoint_m2`;

SELECT MIN(cantidad)
FROM canal_venta
where Canal ;

select month(Fecha), count(*) as ventas 
from venta 
where IdSucursal=13 and fecha between '2015/1/1' and '2015/12/31'
group by month(fecha)
order by ventas desc ;
SELECT YEAR(fecha) AS Año, ROUND(AVG(timestampdiff(day, Fecha, Fecha_Entrega)),2) AS dias
FROM Venta
GROUP BY YEAR(fecha)
ORDER BY dias DESC
;
SELECT p.Tipo, sum(v.precio*v.cantidad) AS cantidadTotal
FROM venta AS v JOIN producto AS p ON v.IdProducto = p.IdProducto
WHERE YEAR(v.Fecha) = 2020
GROUP BY p.Tipo
ORDER BY cantidadTotal DESC
;
select year(fecha), month(fecha), sum(cantidad) as cantidad_ventas
from venta
group by Fecha
order by cantidad_ventas desc
;

SELECT concepto, count(*)
FROM producto
WHERE concepto LIKE '%DVD%'
;
SELECT Tipo, (MAX(Precio)-MIN(Precio)) AS Diferencia
FROM producto
GROUP BY Tipo
ORDER BY Diferencia desc
;
select count(*)
from (select Fecha, date_format(Fecha, 'Y%m%') as fecha_real_compra, Fecha_Entrega, date_format(Fecha_Entrega, 'Y%m%') as Fecha_Entrega_2
from venta
where date_format(Fecha,'Y%m%') != date_format(Fecha_Entrega, 'Y%m%')) as Table1
;
select idEmpleado, sum(cantidad) as cantidad_productos
from venta
group by idEmpleado
order by cantidad_productos desc
;
