CREATE SCHEMA `bai5_baitapviewindexstoreprocedure` ;

CREATE TABLE `bai5_baitapviewindexstoreprocedure`.`products` (
  `idProducts` INT NOT NULL AUTO_INCREMENT,
  `productCode` CHAR(3) NOT NULL,
  `productName` VARCHAR(45) NOT NULL,
  `productPrice` DOUBLE NOT NULL,
  `productAmount` INT NOT NULL,
  `productDescription` VARCHAR(45) NULL,
  `productStatus` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idProducts`));
  
INSERT INTO `bai5_baitapviewindexstoreprocedure`.`products` (`productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) VALUES ('AA1', 'máy tinh', '15000000', '39', 'mới', '1');
INSERT INTO `bai5_baitapviewindexstoreprocedure`.`products` (`productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) VALUES ('AA2', 'màn hình', '4000000', '5', 'cũ', '0');
INSERT INTO `bai5_baitapviewindexstoreprocedure`.`products` (`productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) VALUES ('AB1', 'bàn phím', '500000', '28', 'mới', '1');
INSERT INTO `bai5_baitapviewindexstoreprocedure`.`products` (`productCode`, `productName`, `productPrice`, `productAmount`, `productStatus`) VALUES ('AB2', 'chuột', '300000', '40', '1');


  ALTER TABLE products ADD UNIQUE INDEX idx_productCode(productCode);
  
  ALTER TABLE products ADD INDEX idx_composite(productName, productPrice);
  EXPLAIN SELECT * FROM products WHERE productName = 'màn hình' or productPrice = '4000000';
  
  create view product_view as
  select productCode, productName
  from products;
  
  create or replace view product_view as
  select productCode, productName, productPrice,productStatus
  from products;
  
  DELIMITER //
  create PROCEDURE findAllProduct()
  begin
  select * from products;
  end//
  DELIMITER ;
  
  call findAllProduct();
  
   DELIMITER //
	drop PROCEDURE if exists addNewProduct;
  create PROCEDURE addNewProduct(in productCode char(3), in productName varchar(45), in productPrice double,in productAmount int,in productDescription varchar(45), in productStatus TINYINT )
  begin
  insert into products (`productCode`,`productName`,`productPrice`,`productAmount`, `productDescription`,`productStatus`) values
  (productCode, productName, productPrice, productAmount,productDescription,productStatus);
  end//
  DELIMITER ;
  
  call addNewProduct('AC1','macbook','45000000','10','moi', '0');
  
DELIMITER //
  create PROCEDURE editProductById(in id int)
  begin
  update products set productName = 'iPhone' where idProducts = id; 
  end//
  DELIMITER ;
  
  call editProductById(2);
  
  DELIMITER //
  create PROCEDURE deleteProductById(in id int)
  begin
  delete from products where idProducts = id; 
  end//
  DELIMITER ;
  
  call deleteProductById(3);