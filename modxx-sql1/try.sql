




ALTER TABLE Songs
  MODIFY album_id NOT NULL

CREATE TABLE songs_playlist(
  id INT AUTO_INCREMENT NOT NULL,
  song
)



CREATE TABLE TBcategory(
  id INT AUTO_INCREMENT NOT NULL,
  MenuCategoryName VARCHAR(64),
  PRIMARY KEY(id)
);

CREATE TABLE TBaccountrole(
  id INT AUTO_INCREMENT NOT NULL,
  AccountRoleName VARCHAR(32),
  PRIMARY KEY(id)
);

CREATE TABLE TBusername(
  id INT AUTO_INCREMENT NOT NULL,
  Username VARCHAR(32),
  PRIMARY KEY(id)
)

CREATE TABLE TBorder(
  OrderID INT NOT NULL,
  CustomerID INT NOT NULL,
  FoodID INT NOT NULL,
  FOREIGN KE
);

CREATE TABLE TBmenu(
  FoodID INT AUTO_INCREMENT NOT NULL,
  FoodName VARCHAR(64) NOT NULL,
  MenuCategoryID INT NOT NULL,
  FoodPrice MONEY NOT NULL,
  PRIMARY KEY(FoodID),
  FOREIGN KEY(MenuCategoryID)
    REFERENCES TBcategory(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

