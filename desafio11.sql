SELECT 
music_name AS nome_musica,
CASE
	WHEN music_name LIKE '%Bard%' THEN REPLACE(music_name, 'Bard', 'QA')
	WHEN music_name LIKE '%Amar%' THEN REPLACE(music_name, 'Amar', 'Code Review')
	WHEN music_name LIKE '%Pais%' THEN REPLACE(music_name, 'Pais', 'Pull Requests')
	WHEN music_name LIKE '%SOUL%' THEN REPLACE(music_name, 'SOUL', 'CODE')
	WHEN music_name LIKE '%SUPERSTAR%' THEN REPLACE(music_name, 'SUPERSTAR', 'SUPERDEV')
    END AS novo_nome
FROM SpotifyClone.music
WHERE music_name IN ('ALIEN SUPERSTAR', 'BREAK MY SOUL', 'Como Nossos Pais',
'O Medo de Amar é o Medo de Ser Livre', 'The Bard’s Song')
ORDER BY music_name DESC;