-- =========================================================
-- DATABASE: alx_book_store
-- SCHEMA FOR: Books, Authors, Customers, Orders, Order_Details
-- NOTE: All SQL keywords are UPPERCASE as requested.
-- =========================================================

CREATE DATABASE IF NOT EXISTS `alx_book_store`;
USE `alx_book_store`;

-- ======================
-- TABLE: Authors
-- ======================
CREATE TABLE `Authors` (
  `author_id` INT AUTO_INCREMENT PRIMARY KEY,
  `author_name` VARCHAR(215) NOT NULL
) ENGINE=INNODB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- ======================
-- TABLE: Customers
-- ======================
CREATE TABLE `Customers` (
  `customer_id` INT AUTO_INCREMENT PRIMARY KEY,
  `customer_name` VARCHAR(215) NOT NULL,
  `email` VARCHAR(215) NOT NULL,
  `address` TEXT,
  UNIQUE KEY `uk_customers_email` (`email`)
) ENGINE=INNODB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- ======================
-- TABLE: Books
-- ======================
CREATE TABLE `Books` (
  `book_id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(130) NOT NULL,
  `author_id` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  `publication_date` DATE,
  CONSTRAINT `fk_books_authors`
    FOREIGN KEY (`author_id`)
    REFERENCES `Authors` (`author_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  INDEX `idx_books_author_id` (`author_id`)
) ENGINE=INNODB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- ======================
-- TABLE: Orders
-- ======================
CREATE TABLE `Orders` (
  `order_id` INT AUTO_INCREMENT PRIMARY KEY,
  `customer_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Customers` (`customer_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  INDEX `idx_orders_customer_id` (`customer_id`)
) ENGINE=INNODB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- ======================
-- TABLE: Order_Details
-- ======================
CREATE TABLE `Order_Details` (
  `orderdetailid` INT AUTO_INCREMENT PRIMARY KEY,
  `order_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `quantity` DOUBLE NOT NULL,
  CONSTRAINT `fk_orderdetails_orders`
    FOREIGN KEY (`order_id`)
    REFERENCES `Orders` (`order_id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT `fk_orderdetails_books`
    FOREIGN KEY (`book_id`)
    REFERENCES `Books` (`book_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  UNIQUE KEY `uk_orderdetails_order_book` (`order_id`, `book_id`),
  INDEX `idx_orderdetails_book_id` (`book_id`)
) ENGINE=INNODB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- OPTIONAL (MYSQL 8+): ENFORCE NON-NEGATIVE VALUES
ALTER TABLE `Books`
  ADD CONSTRAINT `chk_books_price_nonnegative` CHECK (`price` >= 0);

ALTER TABLE `Order_Details`
  ADD CONSTRAINT `chk_orderdetails_quantity_positive` CHECK (`quantity` > 0);
