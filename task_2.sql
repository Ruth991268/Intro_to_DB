USE alx_book_store;

-- Table: Authors
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Table: Customers
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

-- Table: Books
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    CONSTRAINT fk_books_authors FOREIGN KEY (author_id)
        REFERENCES Authors(author_id)
);

-- Table: Orders
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

-- Table: Order_Details
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    CONSTRAINT fk_orderdetails_orders FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),
    CONSTRAINT fk_orderdetails_books FOREIGN KEY (book_id)
        REFERENCES Books(book_id)
);
