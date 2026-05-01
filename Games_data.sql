#Creating table 1
CREATE TABLE game_data (
    SL_NO INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Release_Date DATE,
    Team VARCHAR(255),
    Rating DECIMAL(3,2) CHECK (rating BETWEEN 0 AND 10),
    Times_Listed INT DEFAULT 0,
    Number_of_Reviews INT DEFAULT 0,
    Genres VARCHAR(255),
    Summary TEXT,
    Reviews TEXT,
    Plays INT DEFAULT 0,
    Playing INT DEFAULT 0,
    Backlogs INT DEFAULT 0,
    Wishlist INT DEFAULT 0
);


SELECT COUNT(*) AS total_rows
FROM game_data;

Select * from game_data;

SHOW DATABASES;
   Use game_data;
   
#creating table2    
Create TABLE game_sales (
    Rank_ INT,
    Name_ VARCHAR(255),
    Platform VARCHAR(50),
    Year_ INT,
    Genre VARCHAR(100),
    Publisher VARCHAR(150),
    Na_sales DECIMAL(10,2),
    Eu_sales DECIMAL(10,2),
    Jp_sales DECIMAL(10,2),
    Other_sales DECIMAL(10,2),
    Global_sales DECIMAL(10,2)
);
Select * from game_sales;

SELECT COUNT(*) AS total_rows
FROM game_sales;

#merging two tables
ALTER TABLE game_sales
ADD SL_NO INT;

UPDATE game_sales
SET SL_NO = 1
WHERE Rank_= 1;

ALTER TABLE game_sales
ADD CONSTRAINT fk_game_sales_game
FOREIGN KEY (SL_NO)
REFERENCES game_data(SL_NO)
ON DELETE CASCADE
ON UPDATE CASCADE;

SHOW CREATE TABLE game_sales;
