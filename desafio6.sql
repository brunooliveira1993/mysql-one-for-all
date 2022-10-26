SELECT
MIN(F.plane_value) AS faturamento_minimo,
MAX(F.plane_value) AS faturamento_maximo,
ROUND(AVG(F.plane_value), 2) AS faturamento_medio,
SUM(F.plane_value) AS faturamento_total
FROM SpotifyClone.plane AS F
INNER JOIN SpotifyClone.user AS U ON U.id_plane = F.id_plane;