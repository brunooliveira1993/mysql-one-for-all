SELECT 
U.user AS usuario,
IF(MAX(H.history_date) BETWEEN '2021-01-01' AND '2023-01-01', 'Usuário ativo', 'Usuário inativo')
AS status_usuario
FROM SpotifyClone.user AS U 
INNER JOIN SpotifyClone.history AS H ON H.id_user = U.id_user
GROUP BY U.user
ORDER BY U.user;