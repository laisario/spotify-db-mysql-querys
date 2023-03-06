DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE  IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos (
    planos_id INT AUTO_INCREMENT PRIMARY KEY,
    plano VARCHAR(25) NOT NULL,
    valor_plano DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas (
    artista_id INT AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    PRIMARY KEY (artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario (
    pessoa_usuaria_id INT AUTO_INCREMENT,
    nome_pessoa_usuaria VARCHAR(30) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
    PRIMARY KEY (pessoa_usuaria_id),
    FOREIGN KEY (plano_id) REFERENCES planos(planos_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns (
    album_id INT AUTO_INCREMENT,
    album VARCHAR(30) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes (
    cancoes_id INT AUTO_INCREMENT,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    cancao VARCHAR(45) NOT NULL,
    duracao_segundos INT,
    PRIMARY KEY (cancoes_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico (
    historico_id INT  AUTO_INCREMENT,
    user_id INT NOT NULL,
    cancao_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    PRIMARY KEY(historico_id, user_id, cancao_id),
    FOREIGN KEY (user_id) REFERENCES usuario(pessoa_usuaria_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancoes_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artista_seguidores (
    user_id INT,
    artista_id INT ,
    PRIMARY KEY(user_id, artista_id),
    FOREIGN KEY (user_id) REFERENCES usuario(pessoa_usuaria_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos(plano, valor_plano)
	VALUES('gratuito', 0),
			('familiar', 7.99),
			('universitário', 5.99),
			('pessoal', 6.99);

INSERT INTO SpotifyClone.artistas (name) VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

INSERT INTO SpotifyClone.albuns (album, ano_lancamento, artista_id) VALUES
('Renaissance', 2022, 1),
('Jazz', 1978, 2),
('Hot Space', 1982, 2),
('Falso Brilhante', 1998, 3),
('Vento de Maio', 2001, 3),
('QVVJFA?', 2003, 4),
('Somewhere Far Beyond', 2007, 5),
('I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.cancoes (album_id, artista_id, cancao, duracao_segundos) VALUES
(1, 1, 'BREAK MY SOUL', 279),
(1, 1, "VIRGO'S GROOVE", 369),
(1, 1, "ALIEN SUPERSTAR", 116),
(2, 2, "Don't Stop Me Now", 203),
(3, 2, 'Under Pressure', 152),
(4, 3, 'Como Nossos Pais', 105),
(5, 3, 'O Medo de Amar é o Medo de Ser Livre', 207),
(6, 4, 'Samba em Paris', 267),
(7, 5, "The Bard's Song", 244),
(8, 6, 'Feeling Good', 100);

INSERT INTO SpotifyClone.usuario (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES
('Barbara Liskov', 82, 1,	'2019-10-20'),
('Robert Cecil Martin',	58,	1, '2017-01-06'),
('Ada Lovelace',	37,	2,	'2017-12-30'),
('Martin Fowler',	46,	2,	'2017-01-17'),
('Sandi Metz',	58,	2,	'2018-04-29'),
('Paulo Freire',	19, 3, '2018-02-14'),
('Bell Hooks',	26,	3, '2018-01-05'),
('Christopher Alexander',	85,	4,	'2019-06-05'),
('Judith Butler',	45,	4,	'2020-05-13'),
('Jorge Amado',	58,	4,	'2017-02-17');



INSERT INTO SpotifyClone.historico (user_id, data_reproducao, cancao_id) VALUES
(1, "2022-02-28 10:45:55", 8),
(1, "2020-05-02 05:30:35", 2),
(1, "2020-03-06 11:22:33", 10),
(2, "2022-08-05 08:05:17", 10),
(2, "2020-01-02 07:40:33", 7),
(3, "2020-11-13 16:55:13", 10),
(3, "2020-12-05 18:38:30", 2),
(4, "2021-08-15 17:10:10", 8),
(5, "2022-01-09 01:44:33", 8),
(5, "2020-08-06 15:23:43", 5),
(6, "2017-01-24 00:31:17", 7),
(6, "2017-10-12 12:35:20", 1),
(7, "2011-12-15 22:30:49", 4),
(8, "2012-03-17 14:56:41", 4),
(9, "2022-02-24 21:14:22", 9),
(10, "2015-12-13 08:30:22", 3);


INSERT INTO SpotifyClone.artista_seguidores (user_id, artista_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 1),
(7, 6),
(9, 3),
(10, 2);

