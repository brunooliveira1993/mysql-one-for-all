DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plane (
  id_plane INT NOT NULL AUTO_INCREMENT,
  plane_type VARCHAR(45) NOT NULL,
  plane_value DECIMAL NOT NULL,
  PRIMARY KEY (id_plane))
  ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.user (
  id_user INT NOT NULL AUTO_INCREMENT,
  user VARCHAR(45) NOT NULL,
  user_age INT NOT NULL,
  id_plane INT NOT NULL,
  PRIMARY KEY (id_user),
  INDEX plane_id_idx (id_plane ASC) VISIBLE,
  CONSTRAINT plane_id
    FOREIGN KEY (id_plane)
    REFERENCES SpotifyClone.plane (id_plane)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.artist (
  id_artist INT NOT NULL AUTO_INCREMENT,
  artist_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_artist),
  INDEX id_album_idx (id_albuns ASC) VISIBLE,
  CONSTRAINT id_album
    FOREIGN KEY (id_albuns)
    REFERENCES SpotifyClone.album (id_album)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.album (
  id_album INT NOT NULL AUTO_INCREMENT,
  album_name VARCHAR(100) NOT NULL,
  id_artist INT NOT NULL,
  realease_date INT NOT NULL,
  PRIMARY KEY (id_album),
  INDEX id_artist_idx (id_artist ASC) VISIBLE,
  CONSTRAINT id_artist
    FOREIGN KEY (id_artist)
    REFERENCES SpotifyClone.artist (id_artist)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.music (
  id_music INT NOT NULL,
  music_name VARCHAR(45) NOT NULL,
  size_time INT NOT NULL,
  id_artist INT NOT NULL,
  id_album INT NOT NULL,
  PRIMARY KEY (id_music),
  INDEX album_idx (id_album ASC) VISIBLE,
  INDEX artistista_idx (id_artist ASC) VISIBLE,
  CONSTRAINT album
    FOREIGN KEY (id_album)
    REFERENCES SpotifyClone.album (id_album)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT artistista
    FOREIGN KEY (id_artist)
    REFERENCES SpotifyClone.artist (id_artist)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.follow_artist (
  id_follower INT NOT NULL AUTO_INCREMENT,
  id_user INT NOT NULL,
  id_artist INT,
  PRIMARY KEY (id_follower),
  INDEX Id_user_idx (id_user ASC) VISIBLE,
  INDEX fk_follow_artist_1_idx (id_artist ASC) VISIBLE,
  CONSTRAINT Id_user
    FOREIGN KEY (id_user)
    REFERENCES SpotifyClone.user (id_user)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_follow_artist_1
    FOREIGN KEY (id_artist)
    REFERENCES SpotifyClone.artist (id_artist)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.history (
  id_history INT NOT NULL AUTO_INCREMENT,
  id_user INT NOT NULL,
  id_musics INT NOT NULL,
  history_date DATETIME NOT NULL,
  PRIMARY KEY (id_history),
  INDEX fk_history_1_idx (id_musics ASC) VISIBLE,
  INDEX Id_user2_idx (id_user ASC) VISIBLE,
  CONSTRAINT fk_history_1
    FOREIGN KEY (id_musics)
    REFERENCES SpotifyClone.music (id_music)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  CONSTRAINT Id_user2
    FOREIGN KEY (id_user)
    REFERENCES SpotifyClone.user (id_user)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ENGINE = InnoDB;

  INSERT INTO SpotifyClone.plane (id_plane, plane_type, plane_value)
  VALUES
    (1, 'gratuito', 0,00),
    (2, 'familiar', 7,99),
    (3, 'universitário', 5,99),
    (4, 'pessoal', 6,99);

  INSERT INTO SpotifyClone.user (id_user, user, user_age, id_plane, join_date)
  VALUES
    (1, 'Barbara Liskov', 82, 1, '2019-10-20'),
    (2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
    (3, 'Ada Lovelace', 37, 2, '2017-12-30'),
    (4, 'Martin Fowler', 46, 2, '2017-01-17'),
    (5, 'Sandi Metz', 58, 2, '2018-04-29'),
    (6, 'Paulo Freire', 19, 3, '2018-02-14'),
    (7, 'Bell Hooks', 26, 3, '2018-01-05'),
    (8, 'Christopher Alexander', 85, 4, '2019-06-05'),
    (9, 'Judith Butler', 45, 4, '2020-05-13'),
    (10, 'Jorge Amado', 58, 4, '2017-02-17');

      INSERT INTO SpotifyClone.artist (id_artist, artist_name)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');

    INSERT INTO SpotifyClone.album (id_album, album_name, id_artist, realease_date)
  VALUES
    (1, 'Renaissance', 1, 2022),
    (2, 'Jazz', 2, 1978),
    (3, 'Hot Space', 2, 1982),
    (4, 'Falso Brilhante', 3, 1998),
    (5, 'Vento de Maio', 3, 2001),
    (6, 'QVVJFA?', 4, 2003),
    (7, 'Somewhere Far Beyond', 5, 2007),
    (8, 'I Put A Spell On You', 6, 2012);

    INSERT INTO SpotifyClone.music (id_music, music_name, size_time, id_artist, id_album)
  VALUES
    (1, 'BREAK MY SOUL', 279, 1, 1),
    (2, 'VIRGO’S GROOVE', 369, 1, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1, 1),
    (4, 'Don’t Stop Me Now', 203, 2, 2),
    (5, 'Under Pressure', 152, 2, 3),
    (6, 'Como Nossos Pais', 105, 3, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 3, 5),
    (8, 'Samba em Paris', 267, 4, 6),
    (9, 'The Bard’s Song', 244, 5, 7),
    (10, 'Feeling Good', 100, 6, 8);

  INSERT INTO SpotifyClone.follow_artist  (id_follower, id_user, id_artist)
  VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 2, 1),
    (5, 2, 3),
    (6, 3, 2),
    (7, 4, 4),
    (8, 5, 5),
    (9, 5, 6),
    (10, 6, NULL),
    (11, 7, 6),
    (12, 8, NULL),
    (13, 9, 3),
    (14, 10, NULL);

      INSERT INTO SpotifyClone.follow_artist  (id_history, id_user, id_musics, history_date)
  VALUES
    (1, 1, 8, '2022-02-28 10:45:55'),
    (2, 1, 2, '2020-05-02 05:30:35'),
    (3, 1, 10, '2020-03-06 11:22:33'),
    (4, 2, 10, '2022-08-05 08:05:17'),
    (5, 2, 7, '2020-01-02 07:40:33'),
    (6, 3, 10, '2020-11-13 16:55:13'),
    (7, 3, 2, '2020-12-05 18:38:30'),
    (8, 4, 8, '2021-08-15 17:10:10'),
    (9, 5, 8, '2022-01-09 01:44:33'),
    (10, 5, 5, '2020-08-06 15:23:43'),
    (11, 6, 7, '2017-01-24 00:31:17'),
    (12, 6, 1, '2017-10-12 12:35:20'),
    (13, 7, 4, '2011-12-15 22:30:49'),
    (14, 8, 4, '2012-03-17 14:56:41'),
    (15, 9, 9, '2022-02-24 21:14:22'),
    (16, 10, 3, '2015-12-13 08:30:22');
