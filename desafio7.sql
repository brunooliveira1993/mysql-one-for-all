SELECT 
AR.artist_name AS artista,
AL.album_name AS album,
COUNT(F.id_artist) AS seguidores
FROM SpotifyClone.artist AS AR 
INNER JOIN SpotifyClone.album AS AL ON AR.id_artist = AL.id_artist
INNER JOIN SpotifyClone.follow_artist AS F ON AR.id_artist = F.id_artist
GROUP BY artista, album
ORDER BY seguidores DESC , artista , album;