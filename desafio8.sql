SELECT 
AR.artist_name AS artista,
AL.album_name AS album
FROM SpotifyClone.artist AS AR 
INNER JOIN SpotifyClone.album AS AL ON AR.id_artist = AL.id_artist
GROUP BY artista, album
LIMIT 2 OFFSET 3
