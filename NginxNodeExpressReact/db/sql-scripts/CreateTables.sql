 
CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    username VARCHAR(255),
    email VARCHAR(128),
    phone VARCHAR(20),
    pass VARCHAR(100),
    buildingNum VARCHAR(20),
    street VARCHAR(100),
    city VARCHAR(100),
    states VARCHAR(100),
    zip VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    orderUserId INT NOT NULL,
    FOREIGN KEY (orderUserId) REFERENCES customer(id) 
        ON DELETE CASCADE,
    orderAmount FLOAT,
    orderShipName VARCHAR(100),
    orderShipAddress VARCHAR(100),
    orderShipCity VARCHAR(100),
    orderShipState VARCHAR(100),
    orderShipZip VARCHAR(20),
    orderCountry VARCHAR(40),
    orderPhone VARCHAR(20),
    orderFax VARCHAR(20),
    orderShipping FLOAT,
    orderTax FLOAT,
    orderEmail VARCHAR(100),
    orderTime TIMESTAMP,
    orderShipped TINYINT(1),
    orderTrackingNo VARCHAR(255)
);

CREATE TABLE productCategories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(50)
);

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    productSKU VARCHAR(50),
    productName VARCHAR(100),
    productPrice FLOAT,
    productWeight FLOAT,
    productImage VARCHAR(100),
    categoryId INT NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES productCategories(category_id) 
        ON DELETE CASCADE,
    productUpdateDate TIMESTAMP,
    productStock FLOAT
);

CREATE TABLE orderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT NOT NULL,
    productId INT NOT NULL,
    FOREIGN KEY (orderId) REFERENCES orders(order_id)  
        ON DELETE CASCADE,
    FOREIGN KEY (productId) REFERENCES product(product_id) 
        ON DELETE CASCADE,
    detailName VARCHAR(250),
    detailPrice FLOAT,
    detailQuantity INT(11)
);