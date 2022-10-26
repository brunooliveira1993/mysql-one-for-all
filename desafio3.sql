SELECT
U.user AS usuario,
COUNT(H.id_user) AS qt_de_musicas_ouvidas,
ROUND(SUM(M.size_time / 60), 2) AS total_minutos
FROM SpotifyClone.user AS U 
INNER JOIN SpotifyClone.history AS H ON H.id_user = U.id_user
INNER JOIN SpotifyClone.music AS M ON M.id_music = id_musics
GROUP BY H.id_user
ORDER BY U.user;