SELECT 
M.music_name AS nome,
COUNT(H.id_musics) AS reproducoes
FROM SpotifyClone.user AS U
INNER JOIN SpotifyClone.history AS H ON H.id_user = U.id_user
INNER JOIN SpotifyClone.music AS M ON M.id_music = H.id_musics
WHERE U.id_plane = 1 OR U.id_plane = 4
GROUP BY nome
ORDER BY nome;