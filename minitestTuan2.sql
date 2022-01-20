CREATE SCHEMA `minitesttuan2` ;

CREATE TABLE `minitesttuan2`.`loai_tour` (
  `idloai_Tour` INT NOT NULL AUTO_INCREMENT,
   `ma_tour` VARCHAR(3) NOT NULL,
  `name_tour` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idloai_Tour`),
  UNIQUE INDEX `name_tour_UNIQUE` (`name_tour` ASC) VISIBLE);
  
  insert into loai_Tour (`ma_tour`,`name_tour`) values ('001','cao cap');
  insert into loai_Tour (`ma_tour`,`name_tour`) values ('002','binh dan');

  
  CREATE TABLE `minitesttuan2`.`thanhpho` (
  `idthanhpho` INT NOT NULL AUTO_INCREMENT,
  `name_thanhpho` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idthanhpho`),
  UNIQUE INDEX `name_thanhpho_UNIQUE` (`name_thanhpho` ASC) VISIBLE);
  
  insert into thanhpho (`name_thanhpho`) values ('Ha Noi');
  insert into thanhpho (`name_thanhpho`) values ('Hai Phong');
  insert into thanhpho (`name_thanhpho`) values ('Hue');
  insert into thanhpho (`name_thanhpho`) values ('Da Nang');
  insert into thanhpho (`name_thanhpho`) values ('Sai Gon');
  
  
  CREATE TABLE `minitesttuan2`.`tour` (
  `idtour` INT NOT NULL AUTO_INCREMENT,
  `ma_tour` CHAR(3) NULL,
  `idloai_Tour` INT NOT NULL,
  `price_tour` DOUBLE NOT NULL,
  `startDay` DATE NOT NULL,
  `endDay` DATE NOT NULL,
  PRIMARY KEY (`idtour`),
  UNIQUE INDEX `ma_tour_UNIQUE` (`ma_tour` ASC) VISIBLE,
    CONSTRAINT `tour_loaitour_fk`
    FOREIGN KEY (`idloai_Tour`)
    REFERENCES `minitesttuan2`.`loai_tour` (`idloai_Tour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    INSERT INTO `minitesttuan2`.`tour` (`ma_tour`, `idloai_Tour`, `price_tour`, `startDay`, `endDay`) VALUES 
    ('002', '1', '25000000', '2022/01/01', '2022/02/05');
    
  insert into tour (`ma_tour`,`idloai_Tour`,`price_tour`,`startDay`,`endDay`) values
  
  ('002','1','40000000','2021/01/02','2021/01/04'),
  ('003','2','20000000','2021/01/03','2021/01/07'),
  ('004','1','30000000','2021/01/05','2021/01/09'),
  ('005','2','2000000','2021/01/09','2021/01/16'),
  ('006','1','23000000','2021/01/14','2021/01/20'),
  ('007','2','3000000','2021/01/28','2021/02/04'),
  ('008','1','24000000','2021/02/01','2021/02/04'),
  ('009','2','4000000','2021/02/01','2021/02/04'),
  ('010','1','25000000','2021/03/01','2021/03/04'),
  ('011','2','5000000','2021/04/01','2021/04/04'),
  ('012','2','6000000','2021/05/01','2021/05/04'),
  ('013','1','26000000','2021/05/01','2021/05/04'),
  ('014','2','7000000','2021/01/01','2021/01/06'),
  ('015','1','27000000','2021/01/01','2021/01/08');
alter table tour 
add diadiem_id int ;

ALTER TABLE `minitesttuan2`.`tour` 
CHANGE COLUMN `diadiem_id` `diadiem_id` INT NOT NULL ,
ADD INDEX `diadiem_tour_fk_idx` (`diadiem_id` ASC) VISIBLE;
;
ALTER TABLE `minitesttuan2`.`tour` 
ADD CONSTRAINT `diadiem_tour_fk`
  FOREIGN KEY (`diadiem_id`)
  REFERENCES `minitesttuan2`.`diemdendulich` (`iddiemdendulich`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '1' WHERE (`idtour` = '1');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '1' WHERE (`idtour` = '17');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '2' WHERE (`idtour` = '18');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '2' WHERE (`idtour` = '19');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '5' WHERE (`idtour` = '20');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '7' WHERE (`idtour` = '21');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '5' WHERE (`idtour` = '22');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '2' WHERE (`idtour` = '23');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '7' WHERE (`idtour` = '24');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '6' WHERE (`idtour` = '25');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '5' WHERE (`idtour` = '26');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '7' WHERE (`idtour` = '27');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '7' WHERE (`idtour` = '28');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '1' WHERE (`idtour` = '29');
UPDATE `minitesttuan2`.`tour` SET `diadiem_id` = '2' WHERE (`idtour` = '30');

  
  CREATE TABLE `minitesttuan2`.`customer` (
  `idcustomer` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `socancuoc` VARCHAR(12) NOT NULL,
  `yearBrith` VARCHAR(4) NULL,
  `idthanhpho` INT NOT NULL,
  PRIMARY KEY (`idcustomer`),
  INDEX `thanhpho_customer_fk_idx` (`idthanhpho` ASC) VISIBLE,
  CONSTRAINT `thanhpho_customer_fk`
    FOREIGN KEY (`idthanhpho`)
    REFERENCES `minitesttuan2`.`thanhpho` (`idthanhpho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `minitesttuan2`.`customer` (`name`, `socancuoc`, `yearBrith`, `idthanhpho`) VALUES ('Mai', '0234567918', '1992', '2');
INSERT INTO `minitesttuan2`.`customer` (`name`, `socancuoc`, `yearBrith`, `idthanhpho`) VALUES ('Hoa', '0234569818', '1995', '1');
INSERT INTO `minitesttuan2`.`customer` (`name`, `socancuoc`, `yearBrith`, `idthanhpho`) VALUES ('Hai', '0234567919', '1997', '2');
INSERT INTO `minitesttuan2`.`customer` (`name`, `socancuoc`, `yearBrith`, `idthanhpho`) VALUES ('Tuan', '0234567911', '1999', '3');
INSERT INTO `minitesttuan2`.`customer` (`name`, `socancuoc`, `yearBrith`, `idthanhpho`) VALUES ('Thao', '0234567912', '1991', '5');
INSERT INTO `minitesttuan2`.`customer` (`name`, `socancuoc`, `yearBrith`, `idthanhpho`) VALUES ('Hoang', '0234567913', '1990', '5');
INSERT INTO `minitesttuan2`.`customer` (`name`, `socancuoc`, `yearBrith`, `idthanhpho`) VALUES ('Hanh', '0234567914', '2000', '2');
INSERT INTO `minitesttuan2`.`customer` (`name`, `socancuoc`, `yearBrith`, `idthanhpho`) VALUES ('Vu', '0234567915', '2001', '1');
INSERT INTO `minitesttuan2`.`customer` (`name`, `socancuoc`, `yearBrith`, `idthanhpho`) VALUES ('Long', '0234567916', '1999', '3');
INSERT INTO `minitesttuan2`.`customer` (`name`, `socancuoc`, `yearBrith`, `idthanhpho`) VALUES ('Hang', '0234567917', '1998', '2');

CREATE TABLE `minitesttuan2`.`diemdendulich` (
  `iddiemdendulich` INT NOT NULL AUTO_INCREMENT,
  `name_diadiem` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `price` DOUBLE NOT NULL,
  `id_thanhpho` INT NOT NULL,
  PRIMARY KEY (`iddiemdendulich`),
  UNIQUE INDEX `name_diadiem_UNIQUE` (`name_diadiem` ASC) VISIBLE,
  INDEX `thanhpho_diemdulich_fk_idx` (`id_thanhpho` ASC) VISIBLE,
  CONSTRAINT `thanhpho_diemdulich_fk`
    FOREIGN KEY (`id_thanhpho`)
    REFERENCES `minitesttuan2`.`thanhpho` (`idthanhpho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `minitesttuan2`.`diemdendulich` (`name_diadiem`, `description`, `price`, `id_thanhpho`) VALUES ('Dao Cat Hai', 'bai biet dep', '2000000', '2');
INSERT INTO `minitesttuan2`.`diemdendulich` (`name_diadiem`, `description`, `price`, `id_thanhpho`) VALUES ('Bà Nà Hills', 'canh dep', '100000', '4');
INSERT INTO `minitesttuan2`.`diemdendulich` (`name_diadiem`, `description`, `price`, `id_thanhpho`) VALUES ('Cù Lao Chàm','canh dep', '1000000','4');
INSERT INTO `minitesttuan2`.`diemdendulich` (`name_diadiem`,`description`, `price`, `id_thanhpho`) VALUES ('Asia Park','canh dep',  '100000','4');
INSERT INTO `minitesttuan2`.`diemdendulich` (`name_diadiem`, `description`, `price`, `id_thanhpho`) VALUES ('Đại Nội Huế', 'canh dep', '500000', '3');

    
CREATE TABLE `minitesttuan2`.`hoadontour` (
  `idhoadontour` INT NOT NULL AUTO_INCREMENT,
  `tour_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`idhoadontour`),
  INDEX `tour_hoadontour_fk_idx` (`tour_id` ASC) VISIBLE,
  CONSTRAINT `tour_hoadontour_fk`
    FOREIGN KEY (`tour_id`)
    REFERENCES `minitesttuan2`.`tour` (`idtour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_hoadontour_fk`
    FOREIGN KEY ( `customer_id`)
    REFERENCES `minitesttuan2`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `minitesttuan2`.`hoadontour` (`tour_id`, `customer_id`, `status`) VALUES ('1', '1', '1');
INSERT INTO `minitesttuan2`.`hoadontour` (`tour_id`, `customer_id`, `status`) VALUES ('17', '1', '1');
INSERT INTO `minitesttuan2`.`hoadontour` (`tour_id`, `customer_id`, `status`) VALUES ('18', '2', '0');
INSERT INTO `minitesttuan2`.`hoadontour` (`tour_id`, `customer_id`, `status`) VALUES ('19', '2', '1');
INSERT INTO `minitesttuan2`.`hoadontour` (`tour_id`, `customer_id`, `status`) VALUES ('20', '3', '1');
INSERT INTO `minitesttuan2`.`hoadontour` (`tour_id`, `customer_id`, `status`) VALUES ('20', '5', '1');
INSERT INTO `minitesttuan2`.`hoadontour` (`tour_id`, `customer_id`, `status`) VALUES ('20', '8', '1');
INSERT INTO `minitesttuan2`.`hoadontour` (`tour_id`, `customer_id`, `status`) VALUES ('20', '5', '1');
INSERT INTO `minitesttuan2`.`hoadontour` (`tour_id`, `customer_id`, `status`) VALUES ('20', '6', '1');
INSERT INTO `minitesttuan2`.`hoadontour` (`tour_id`, `customer_id`, `status`) VALUES ('20', '2', '1');
    
--    tinh so tour bat dau trong thang 1 nam 2021 
select count(*) as 'so tour bat dau trong thang 1/2021'from tour t where month(t.startDay) = 1 and year(t.startDay) = 2021;

--    tinh so tour ket thuc trong thang 2 nam 2021 
select count(*) as 'so tour ket thuc trong thang 2/2021'from tour t where month(t.endDay) = 2 and year(t.endDay) = 2021;
    