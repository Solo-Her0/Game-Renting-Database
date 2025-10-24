CREATE database GameLibrary;

USE GameLibrary;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    role ENUM('user','admin') DEFAULT 'user'
);

CREATE TABLE Publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE Studios (
    studio_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    headquarters VARCHAR(100)
);

CREATE TABLE Consoles (
    console_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(50)
);

CREATE TABLE Games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    overview TEXT,
    rating DECIMAL(2,1),
    release_date DATE,
    publisher_id INT,
    studio_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id),
    FOREIGN KEY (studio_id) REFERENCES Studios(studio_id)
);

CREATE TABLE GameConsoles (
    game_id INT,
    console_id INT,
    PRIMARY KEY (game_id, console_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (console_id) REFERENCES Consoles(console_id)
);

CREATE TABLE Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    rented_on DATE NOT NULL,
    due_date DATE NOT NULL,
    returned_on DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);