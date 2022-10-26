SELECT COUNT(DISTINCT M.music_name) AS cancoes,
COUNT(DISTINCT AR.artist_name) AS artistas,
COUNT(DISTINCT AB.album_name) AS albuns
FROM SpotifyClone.music AS M 
INNER JOIN SpotifyClone.artist AS AR ON M.id_artist = AR.id_artist
INNER JOIN SpotifyClone.album AS AB ON M.id_album = AB.id_album;