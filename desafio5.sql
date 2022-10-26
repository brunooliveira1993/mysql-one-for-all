SELECT 
M.music_name AS cancao,
COUNT(H.id_musics) AS reproducoes
FROM SpotifyClone.music AS M
INNER JOIN SpotifyClone.history AS H ON M.id_music = H.id_musics
GROUP BY M.music_name
ORDER BY reproducoes DESC, cancao
LIMIT 2;