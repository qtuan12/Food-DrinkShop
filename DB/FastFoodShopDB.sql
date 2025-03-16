-- Xóa cơ sở dữ liệu nếu đã tồn tại
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'FastFoodShopDB3')
    DROP DATABASE FastFoodShopDB3;
GO

-- Tạo cơ sở dữ liệu mới
CREATE DATABASE FastFoodShopDB3;
GO

USE FastFoodShopDB3;
GO

-- Tạo bảng Categories
CREATE TABLE Categories (
    id INT IDENTITY (1, 1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
GO

-- Tạo bảng Drinks
CREATE TABLE Drinks (
    id INT IDENTITY (1, 1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(MAX),
    image NVARCHAR(MAX) NULL,
    price INT NOT NULL,
    categoryID INT NOT NULL,
    quantity INT NULL,
    FOREIGN KEY (categoryID) REFERENCES Categories(id) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- Tạo bảng Accounts
CREATE TABLE Accounts (
    id INT IDENTITY (1, 1) PRIMARY KEY,
    fullname NVARCHAR(50),
    phone NVARCHAR(50),
    email NVARCHAR(250),
    username NVARCHAR(50) NOT NULL UNIQUE,
    password NVARCHAR(50) NOT NULL,
    isSeller INT NULL,
    isAdmin INT NULL
);
GO

-- Tạo bảng Orders
CREATE TABLE Orders (
    id INT IDENTITY (1, 1) PRIMARY KEY,
    aid INT,
    status TINYINT NOT NULL,  -- Trạng thái đơn hàng: 1 = Đang chờ; 2 = Đang xử lý; 3 = Bị từ chối; 4 = Hoàn thành
    date DATE NOT NULL,
    totalMoney FLOAT NOT NULL,
    FOREIGN KEY (aid) REFERENCES Accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- Tạo bảng OrderDetail
CREATE TABLE OrderDetail (
    oid INT NOT NULL,
    did INT NOT NULL,
    quantity FLOAT NOT NULL,
    price FLOAT NOT NULL,
    FOREIGN KEY (oid) REFERENCES Orders(id),
    FOREIGN KEY (did) REFERENCES Drinks(id)
);
GO

-- Nhập dữ liệu vào bảng Categories
INSERT INTO Categories (name) VALUES 
('Soda'),
('Juice'),
('Pizza'),
('Burger'),
('Trà Sữa');
GO

-- Nhập dữ liệu vào bảng Drinks cho từng danh mục

-- Món Soda
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Coca-Cola', 'Classic Coca-Cola soft drink.', 'https://t4.ftcdn.net/jpg/02/84/65/61/360_F_284656117_sPF8gVWaX627bq5qKrlrvCz1eFfowdBf.jpg', 20, 100, (SELECT id FROM Categories WHERE name='Soda'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Pepsi', 'Popular Pepsi cola soft drink.', 'https://product.hstatic.net/1000166699/product/16568750047262_1__a06cae5281e14da68881f7c87b67116e_master.jpg', 20, 100, (SELECT id FROM Categories WHERE name='Soda'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Sprite', 'Lemon-lime flavored soft drink.', 'https://product.hstatic.net/1000141988/product/nuoc_ngot_sprite_330_ml_36218b2593804919860644198e59fa1c.jpg', 20, 100, (SELECT id FROM Categories WHERE name='Soda'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Fanta', 'Fruit-flavored carbonated soft drink.', 'https://www.coca-cola.com/content/dam/onexp/vn/home-image/fanta/Fanta_Orange_RCG_320ml_Desktop.png', 20, 100, (SELECT id FROM Categories WHERE name='Soda'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Dr Pepper', 'Unique blend of 23 flavors.', 'https://admin.strawberrycstore.com/storage/2023/12/cgncRMUyELqZuYxf9laTnz0FqWpBe0eo2cV9I9hA.jpg', 20, 100, (SELECT id FROM Categories WHERE name='Soda'));

-- Món Juice
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Orange Juice', 'Freshly squeezed orange juice.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_k3dmXxGhAIYtpo1VDWy8SJi30wQqJ5J9Ig&s', 30, 100, (SELECT id FROM Categories WHERE name='Juice'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Apple Juice', 'Refreshing apple juice.', 'https://www.indianhealthyrecipes.com/wp-content/uploads/2022/02/apple-juice-recipe.jpg', 30, 100, (SELECT id FROM Categories WHERE name='Juice'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Grape Juice', 'Sweet grape juice.', 'https://www.alphafoodie.com/wp-content/uploads/2022/03/How-to-Make-Grape-Juice-Square.jpeg', 30, 100, (SELECT id FROM Categories WHERE name='Juice'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Carrot Juice', 'Nutritious carrot juice.', 'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/10/carrot-juice-1296x728-header.jpg?w=1155&h=1528', 30, 100, (SELECT id FROM Categories WHERE name='Juice'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Pineapple Juice', 'Delicious pineapple juice.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF35VImhgL3wlI1wqXu5QGfwf8JQ9JQrFZIg&s', 30, 100, (SELECT id FROM Categories WHERE name='Juice'));

-- Món Pizza
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Hawaiian pizza',N'Hawaiian pizza is a pizza originating in Canada, traditionally topped with pineapple, tomato sauce, mozzarella cheese, and either ham or bacon.', N'https://lygiavien.com/cdn/shop/articles/suc-hap-dan-ngo-pizza-hawaii-mon-an-nhat-dinh-phai-thu.webp?v=1728709414&width=1920', 10, 100, (SELECT id FROM Categories WHERE name='Pizza'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Pepperoni pizza',N'Pepperoni is a US-made version of Italian sausage, made from chopped pork and beef with Paprika or other chili powders. Characteristics are soft, breathy and bright red in color. Sliced ​​pepperoni is the most popular pizza topping in the United States.', N'https://i0.wp.com/www.amysrecipebook.com/wp-content/uploads/2021/01/pepperonipizza-8-web.jpg?resize=1024%2C683&ssl=1', 10, 100, (SELECT id FROM Categories WHERE name='Pizza'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('New York–style pizza',N'New York–style pizza is a pizza made with a characteristically large hand-tossed thin crust, often sold in wide slices to go. The crust is thick and crisp only along its edge, yet soft, thin, and pliable enough beneath its toppings to be folded to eat. Traditional toppings are simply tomato sauce and shredded mozzarella cheese. This was a popular meal among poor Italians due to the ratio of product from the limited produce.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiKxCwZsA1Qig8GWZsW1ROPSvTpqvF7uz7cg&s',10, 100, (SELECT id FROM Categories WHERE name='Pizza'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Neapolitan pizza',N'Napoli pizza, also known as Neapolitan-style pizza (Italian: pizza napoletana), is a type of pizza whose main ingredients are tomatoes and mozzarella cheese. This dish is often prepared with San Marzano or Pomodorino del Piennolo del Vesuvio tomatoes grown on the volcanic plains south of Mount Vesuvius.', N'https://www.vincenzosplate.com/wp-content/uploads/2023/08/1500x1500-Photo-18_2983-Neapolitan-Pizza-with-Dry-Yeast-V1.jpg' , 10, 100, (SELECT id FROM Categories WHERE name='Pizza'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Pizza cheese',N'Cheese pizza is a type of pizza made from cheese and sauce (usually tomato sauce), characterized by a fatty flavor, the inner layer is doubled or tripled with yellow cheese, and has a chewy texture. and spinning, bringing an "explosive" taste experience.', N'https://everydayease.site/wp-content/uploads/2023/08/Cheese-Pizza-2-1200.jpg' , 10, 100, (SELECT id FROM Categories WHERE name='Pizza'));

-- Món Burger
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Cheeseburger',N'Cheese Hamburger or Cheese Burger is a type of hamburger with cheese topping. Traditionally, the cheese is placed on top of the meat. People often add cheese to the cooked ground beef for a short time, this allows the cheese to melt.', N'https://recipes.net/wp-content/uploads/2023/05/hardees-double-cheeseburger-recipe_d48b79ef43b714e98a3ad95a7ab9e12e-768x768.jpeg' , 50, 100, (SELECT id FROM Categories WHERE name='Burger'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Bacon Cheeseburger',N'In a large bowl, combine the ground chuck, chopped bacon, onion, and Worcestershire sauce. Using your fingertips, gently combine the ingredients with the meat.', N'https://www.sargento.com/assets/Uploads/Recipe/Image/GreatAmericanBurger__FillWzExNzAsNTgzXQ.jpg' , 150, 100, (SELECT id FROM Categories WHERE name='Burger'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Turkey burger',N'Turkey burgers are much leaner than hamburgers, but they can be dry and dull. Moisten them by adding ketchup and a bit of grated onion to the ground turkey — or mayonnaise and a bit of mustard. The idea is to emphasize condiments, and keep the turkey moist.', N'https://www.cookingclassy.com/wp-content/uploads/2019/05/turkey-burger-12.jpg' , 150, 100, (SELECT id FROM Categories WHERE name='Burger'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Veggie burger',N'A veggie burger or meatless burger is a type of hamburger made with a meatless patty or the patty of such a hamburger. The patty can be made from ingredients such as beans, nuts, grains, seeds or fungi such as mushrooms or mycoproteins.', N'https://www.thespruceeats.com/thmb/d4-3wLGWdWQrdsYmcgOgokNDOxg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/vegan-tofu-veggie-burgers-recipe-3377169-hero-01-a2dd40a53b1c4d3ba21625925cc9e28b.jpg' ,200, 100, (SELECT id FROM Categories WHERE name='Burger'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Australian burger',N'This loaded Australian Burger is a mile-high burger with egg, bacon, cheddar cheese, pineapple, pickled beets, and more.', N'https://www.simplotfoods.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2F0dkgxhks0leg%2F2tMhj4b1nVVbdpYXWCxWJA%2F37ace9fb6451608d2d77a1d335dd9e9f%2FThe-Great-Aussie-Burger-P-3140.jpg%3Ffm%3Dwebp&w=3840&q=75' , 200, 100, (SELECT id FROM Categories WHERE name='Burger'));

-- Món Trà Sữa
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Classic Milk Tea', 'Traditional milk tea with tapioca pearls.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUnXnS5hpgSVcMmMPz_P0KeYkEy2aqvqryhw&s', 40, 100, (SELECT id FROM Categories WHERE name='Trà Sữa'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Taro Milk Tea', 'Creamy taro flavored milk tea.', 'https://tyberrymuch.com/wp-content/uploads/2022/07/taro-milk-tea-recipe-1-720x720.jpg', 45, 100, (SELECT id FROM Categories WHERE name='Trà Sữa'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Matcha Milk Tea', 'Delicious matcha flavored milk tea.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxWXBAf_1WOpkG5VrbHg23hjAHcg8qBsJXiw&s', 50, 100, (SELECT id FROM Categories WHERE name='Trà Sữa'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Brown Sugar Milk Tea', 'Sweet brown sugar milk tea.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdbLegL-qInEqcmmVFemPKY6d3atIy3LLh0w&s', 55, 100, (SELECT id FROM Categories WHERE name='Trà Sữa'));
INSERT INTO Drinks (name, description, image, price, quantity, categoryID) VALUES ('Fruit Tea', 'Refreshing fruit tea with milk.', 'https://www.thespruceeats.com/thmb/ZWW--hzfGI7DxtH2ynlMm6v97CY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/southern-style-sweet-fruit-tea-3051552-hero-01-0db8e820485842b29702ac983c3fa89a.jpg', 50, 100, (SELECT id FROM Categories WHERE name='Trà Sữa'));

SET IDENTITY_INSERT Accounts OFF;  
INSERT INTO Accounts (fullname, phone, email, username, password, isSeller, isAdmin) VALUES ('Admin','0123456789','admin@gmail.com','admin','123', 1, 1)
INSERT INTO Accounts (fullname, phone, email, username, password, isSeller, isAdmin) VALUES ('Seller','0123456789','seller@gmail.com','seller','123', 1, 0)
INSERT INTO Accounts (fullname, phone, email, username, password, isSeller, isAdmin) VALUES ('Customer','0123456789','customer@gmail.com','customer','123', 0, 0)
GO
