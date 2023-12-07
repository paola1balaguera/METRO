# 1. Cantidad de Paradas por Ruta
SELECT COUNT(estacion_ruta.id_ruta) AS PARADAS, ruta.nombre
FROM ruta
LEFT JOIN estacion_ruta ON ruta.id_ruta = estacion_ruta.id_ruta
GROUP BY ruta.id_ruta;

# 2. Nombre de las Paradas de la Ruta Universidades

SELECT estacion.nombre
FROM ruta
JOIN estacion_ruta ON ruta.id_ruta = estacion_ruta.id_ruta
JOIN estacion ON estacion.id_estacion = estacion_ruta.id_estacion
WHERE ruta.id_ruta = 1;

# 3. Nombres de las Rutas No Programadas

SELECT ruta.nombre
FROM ruta
LEFT JOIN recorrido ON recorrido.id_ruta = ruta.id_ruta
WHERE recorrido.id_ruta IS NULL;

# 4. Rutas Programadas sin Conductor Asignado

SELECT ruta.nombre
FROM ruta
JOIN recorrido ON recorrido.id_ruta = ruta.id_ruta
WHERE recorrido.id_conductor IS NULL;

# 5. Conductores No Asignados a la Programación

SELECT conductor.nombre
FROM conductor
LEFT JOIN recorrido ON recorrido.id_conductor = conductor.id_conductor
WHERE recorrido.id_conductor IS NULL;

# 6. Buses No asignados a la Programación

SELECT buses.placa
FROM buses
LEFT JOIN recorrido ON recorrido.id_bus = buses.id_bus 
WHERE recorrido.id_bus IS NULL;

# 7. Zonas NO Programadas

SELECT zona.nombre
FROM zona
LEFT JOIN recorrido ON recorrido.id_zona = zona.id_zona
WHERE recorrido.id_zona IS NULL;

# 8. Programación asignada a cada conductor (Conductor, Ruta y Día)

SELECT conductor.nombre, ruta.nombre AS ruta,
	CASE
		WHEN recorrido.dia = 1 THEN "Lunes"
		WHEN recorrido.dia = 2 THEN "Martes"
		WHEN recorrido.dia = 3 THEN "Miercoles"
		WHEN recorrido.dia = 4 THEN "Jueves"
		WHEN recorrido.dia = 5 THEN "Viernes"
		WHEN recorrido.dia = 6 THEN "Sabao"
		ELSE "Domingo"
	END AS dia
FROM conductor
JOIN recorrido ON recorrido.id_conductor = conductor.id_conductor
JOIN ruta ON ruta.id_ruta = recorrido.id_ruta;

# 9. Programación asignada a conductores que hacen rutas de más de dos horas

SELECT DISTINCT conductor.nombre, zona.nombre, ruta.nombre, buses.placa, ruta.tiempo,
	CASE
		WHEN recorrido.dia = 1 THEN "Lunes"
		WHEN recorrido.dia = 2 THEN "Martes"
		WHEN recorrido.dia = 3 THEN "Miercoles"
		WHEN recorrido.dia = 4 THEN "Jueves"
		WHEN recorrido.dia = 5 THEN "Viernes"
		WHEN recorrido.dia = 6 THEN "Sabao"
		ELSE "Domingo"
	END AS dia
FROM conductor
JOIN recorrido ON recorrido.id_conductor = conductor.id_conductor
JOIN ruta ON ruta.id_ruta = recorrido.id_ruta
JOIN zona ON zona.id_zona = recorrido.id_zona
JOIN buses ON buses.id_bus = recorrido.id_bus
WHERE ruta.tiempo > CAST('02:00:00' AS TIME);

# 10. Nombres de Zonas y cantidad de rutas que tienen programadas (Contar)

SELECT zona.nombre AS zona, COUNT(recorrido.id_ruta) AS rutasProgramas
FROM zona
JOIN recorrido ON recorrido.id_zona = zona.id_zona
GROUP BY zona.id_zona;