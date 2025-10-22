create DATABASE ecommerce;
USE ecommerce;

-- ======================================================
-- TABELA: CLIENTS
-- ======================================================
DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
  IdClient INT NOT NULL AUTO_INCREMENT,
  TipoCliente ENUM('PF','PJ') NOT NULL,
  Fname VARCHAR(10) DEFAULT NULL,
  Minit CHAR(3) DEFAULT NULL,
  Lname VARCHAR(20) DEFAULT NULL,
  Gender ENUM('M','F','O') DEFAULT NULL,
  CPF CHAR(11) DEFAULT NULL,
  CNPJ CHAR(14) DEFAULT NULL,
  Rua VARCHAR(15) NOT NULL,
  Bairro VARCHAR(15) NOT NULL,
  Complemento VARCHAR(30) DEFAULT NULL,
  Cidade VARCHAR(10) NOT NULL,
  Estado CHAR(2) NOT NULL,
  PRIMARY KEY (IdClient),
  UNIQUE KEY unique_cpf_client (CPF),
  UNIQUE KEY unique_cnpj_client (CNPJ),
  CHECK (
    (TipoCliente = 'PF' AND CPF IS NOT NULL AND CNPJ IS NULL) OR
    (TipoCliente = 'PJ' AND CNPJ IS NOT NULL AND CPF IS NULL)
  )
);
ALTER TABLE clients AUTO_INCREMENT = 1;

-- ======================================================
-- TABELA: SELLER
-- ======================================================
DROP TABLE IF EXISTS seller;
CREATE TABLE seller (
  Id_Seller INT NOT NULL AUTO_INCREMENT,
  Social_Name VARCHAR(45) DEFAULT NULL,
  CNPJ VARCHAR(15) DEFAULT NULL,
  CPF VARCHAR(9) DEFAULT NULL,
  Name_Fantasy VARCHAR(45) DEFAULT NULL,
  Location VARCHAR(255) DEFAULT NULL,
  CellNumber VARCHAR(11) DEFAULT NULL,
  PRIMARY KEY (Id_Seller),
  UNIQUE KEY unique_cnpj_seller (CNPJ),
  UNIQUE KEY unique_cpf_seller (CPF)
);
ALTER TABLE seller AUTO_INCREMENT = 1;

-- ======================================================
-- TABELA: SUPPLIER
-- ======================================================
DROP TABLE IF EXISTS supplier;
CREATE TABLE supplier (
  IdSupplier INT NOT NULL AUTO_INCREMENT,
  SocialName VARCHAR(255) NOT NULL,
  CNPJ CHAR(15) NOT NULL,
  CellNumber CHAR(11) NOT NULL,
  PRIMARY KEY (IdSupplier),
  UNIQUE KEY unique_supplier (CNPJ)
);
ALTER TABLE supplier AUTO_INCREMENT = 1;

-- ======================================================
-- TABELA: PRODUCT
-- ======================================================
DROP TABLE IF EXISTS product;
CREATE TABLE product (
  IdProduct INT NOT NULL AUTO_INCREMENT,
  Product VARCHAR(10) DEFAULT NULL,
  Classification_Kids TINYINT(1) DEFAULT 0,
  Category ENUM('eletronics','clothes','toys','food') NOT NULL,
  Price DECIMAL(10,2) NOT NULL,
  Assessment FLOAT DEFAULT 0,
  Size VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (IdProduct)
);
ALTER TABLE product AUTO_INCREMENT = 1;

-- ======================================================
-- TABELA: STOCK (agora ligada a PRODUCT)
-- ======================================================
DROP TABLE IF EXISTS stock;
CREATE TABLE stock (
  Id_Prod_Stock INT NOT NULL AUTO_INCREMENT,
  IdProduct INT NOT NULL,
  StockLocation VARCHAR(255) DEFAULT NULL,
  Quanty INT DEFAULT 0,
  Category ENUM('eletronics','clothes','toys','food') DEFAULT NULL,
  PRIMARY KEY (Id_Prod_Stock),
  CONSTRAINT fk_stock_product FOREIGN KEY (IdProduct)
    REFERENCES product(IdProduct)
);
ALTER TABLE stock AUTO_INCREMENT = 1;

-- ======================================================
-- TABELA: ORDERS
-- ======================================================
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  IdOrder INT NOT NULL AUTO_INCREMENT,
  Id_OrderClient INT DEFAULT NULL,
  OrderStatus ENUM('cancel','confirmed','delivered','in separation') DEFAULT 'in separation',
  OrderDescription VARCHAR(255) DEFAULT NULL,
  SendValue FLOAT DEFAULT 10,
  PaymentCash DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  OrderDate DATE NOT NULL,
  ShippingDate DATE DEFAULT NULL,
  DeliveryDate DATE DEFAULT NULL,
  TrackingCode VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (IdOrder),
  KEY fk_orders_client (Id_OrderClient),
  CONSTRAINT fk_orders_client FOREIGN KEY (Id_OrderClient)
    REFERENCES clients (IdClient)
);
ALTER TABLE orders AUTO_INCREMENT = 1;

-- ======================================================
-- TABELA: ORDER_PRODUCT
-- ======================================================
CREATE TABLE order_product (
  IdOrder INT NOT NULL,
  IdProduct INT NOT NULL,
  Quantity INT NOT NULL DEFAULT 1,
  PRIMARY KEY (IdOrder, IdProduct),
  FOREIGN KEY (IdOrder) REFERENCES orders(IdOrder),
  FOREIGN KEY (IdProduct) REFERENCES product(IdProduct)
);

-- ======================================================
-- TABELA: PAYMENTS
-- ======================================================
DROP TABLE IF EXISTS payments;
CREATE TABLE payments (
  IdClient INT NOT NULL,
  Id_Payment INT NOT NULL AUTO_INCREMENT,
  TypePayment ENUM('pix','credit_card','bitcoin') DEFAULT NULL,
  LimitAvailable FLOAT DEFAULT NULL,
  PRIMARY KEY (Id_Payment),
  CONSTRAINT fk_client_payment FOREIGN KEY (IdClient)
    REFERENCES clients (IdClient)
);
ALTER TABLE payments AUTO_INCREMENT = 1;

-- ======================================================
-- TABELA: PRODUCT_FOR_SELLER
-- ======================================================
DROP TABLE IF EXISTS product_for_seller;
CREATE TABLE product_for_seller (
  Id_Product_Seller INT NOT NULL,
  IdPproduct INT NOT NULL,
  Product_Quantity INT DEFAULT 1,
  PRIMARY KEY (Id_Product_Seller, IdPproduct),
  FOREIGN KEY (IdPproduct) REFERENCES product(IdProduct),
  FOREIGN KEY (Id_Product_Seller) REFERENCES seller(Id_Seller)
);

-- ======================================================
-- TABELA: PRODUCTSUPPLIER
-- ======================================================
DROP TABLE IF EXISTS productsupplier;
CREATE TABLE productsupplier (
  IdPsSupplier INT NOT NULL,
  IdPsProduct INT NOT NULL,
  Quantity INT NOT NULL,
  PRIMARY KEY (IdPsSupplier, IdPsProduct),
  FOREIGN KEY (IdPsProduct) REFERENCES product(IdProduct),
  FOREIGN KEY (IdPsSupplier) REFERENCES supplier(IdSupplier)
);

-- ======================================================
-- TABELA: STOCKLOCATION
-- ======================================================
DROP TABLE IF EXISTS stocklocation;
CREATE TABLE stocklocation (
  IdLocproduct INT NOT NULL,
  IdLocStock INT NOT NULL,
  Location VARCHAR(255) NOT NULL,
  PRIMARY KEY (IdLocproduct, IdLocStock),
  FOREIGN KEY (IdLocStock) REFERENCES orders (IdOrder),
  FOREIGN KEY (IdLocproduct) REFERENCES product (IdProduct)
);

-- ======================================================
-- TABELA: REVIEW
-- ======================================================
CREATE TABLE review (
  IdReview INT NOT NULL AUTO_INCREMENT,
  IdClient INT NOT NULL,
  IdProduct INT NOT NULL,
  Rating INT CHECK (Rating BETWEEN 1 AND 5),
  Comment TEXT DEFAULT NULL,
  ReviewDate DATE,
  PRIMARY KEY (IdReview),
  FOREIGN KEY (IdClient) REFERENCES clients (IdClient),
  FOREIGN KEY (IdProduct) REFERENCES product (IdProduct)
);

-- ======================================================
-- TABELA: PAYMENT_TRANSACTION
-- ======================================================
CREATE TABLE payment_transaction (
  IdTransaction INT NOT NULL AUTO_INCREMENT,
  IdOrder INT NOT NULL,
  IdClient INT NOT NULL,
  PaymentMethod ENUM('pix','credit_card','bitcoin') NOT NULL,
  AmountPaid DECIMAL(10,2) NOT NULL,
  PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (IdTransaction),
  FOREIGN KEY (IdOrder) REFERENCES orders (IdOrder),
  FOREIGN KEY (IdClient) REFERENCES clients (IdClient)
);

-- ======================================================
-- TRIGGER: Atualizar estoque (versão antiga baseada em descrição)
-- ======================================================
DELIMITER $$

CREATE TRIGGER atualizar_estoque
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
  -- Eletrônicos
  IF NEW.OrderDescription LIKE '%SmartTV%' OR
     NEW.OrderDescription LIKE '%Notebook%' OR
     NEW.OrderDescription LIKE '%Tablet%' OR
     NEW.OrderDescription LIKE '%Drone%' OR
     NEW.OrderDescription LIKE '%Smartphone%' OR
     NEW.OrderDescription LIKE '%Caixa de Som%' THEN
    UPDATE stock
    SET Quanty = Quanty - 1
    WHERE Category = 'eletronics' AND Quanty > 0;

  -- Roupas
  ELSEIF NEW.OrderDescription LIKE '%T-Shirt%' OR
         NEW.OrderDescription LIKE '%Vestido%' OR
         NEW.OrderDescription LIKE '%Blusa%' OR
         NEW.OrderDescription LIKE '%Sandália%' THEN
    UPDATE stock
    SET Quanty = Quanty - 1
    WHERE Category = 'clothes' AND Quanty > 0;

  -- Alimentos
  ELSEIF NEW.OrderDescription LIKE '%Chocolate%' OR
         NEW.OrderDescription LIKE '%Biscoito%' OR
         NEW.OrderDescription LIKE '%Sucrilhos%' OR
         NEW.OrderDescription LIKE '%Cereal%' THEN
    UPDATE stock
    SET Quanty = Quanty - 1
    WHERE Category = 'food' AND Quanty > 0;

  -- Brinquedos
  ELSEIF NEW.OrderDescription LIKE '%boneca%' OR
         NEW.OrderDescription LIKE '%brinquedo%' THEN
    UPDATE stock
    SET Quanty = Quanty - 1
    WHERE Category = 'toys' AND Quanty > 0;
  END IF;
END$$

DELIMITER ;






