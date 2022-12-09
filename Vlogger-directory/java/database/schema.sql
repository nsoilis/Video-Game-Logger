BEGIN TRANSACTION;
DROP TABLE IF EXISTS users, games, gamelist;

--TABLE CREATION--

CREATE TABLE users 
(
    user_id serial NOT NULL PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    username varchar(50) UNIQUE NOT NULL,
    password_hash varchar(200),
    email_address varchar(250) NOT NULL,

    gamelist_id int NOT NULL,
    constraint fk_gamelist_id FOREIGN KEY (gamelist_id) references gamelist (gamelist_id)    
);
CREATE TABLE games
(
    game_id serial NOT NULL PRIMARY KEY,
    game_name varchar(50) NOT NULL,
    description varchar(500) NOT NULL,
    console varchar(50) NOT NULL,
    date_played date NOT NULL,
    game_release_date date NOT NULL

);
CREATE TABLE gamelist
(
    gamelist_id serial NOT NULL PRIMARY KEY,
    user_id int NOT NULL,
    game_id int NOT NULL,
    date_added date NOT NULL,

    constraint fk_user_id FOREIGN KEY (user_id) references users (user_id),
    constraint fk_game_id FOREIGN KEY (game_id) references games (game_id)
)