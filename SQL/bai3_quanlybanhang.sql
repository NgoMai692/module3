create database quanlybanhang;

CREATE TABLE `quanlybanhang`.`customer` (
  `cID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(25) NULL,
  `cAge` TINYINT(3) NULL,
  PRIMARY KEY (`cID`));

CREATE TABLE `quanlybanhang`.`order` (
  `oID` INT NOT NULL AUTO_INCREMENT,
  `cID` INT NULL,
  `oDate` DATETIME NULL,
  `oTotalPrice` INT NULL,
  PRIMARY KEY (`oID`),
  INDEX `customerID_idx` (`cID` ASC) VISIBLE,
  CONSTRAINT `customerID`
    FOREIGN KEY (`cID`)
    REFERENCES `quanlybanhang`.`customer` (`cID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `quanlybanhang`.`product` (
  `pID` INT NOT NULL AUTO_INCREMENT,
  `pName` VARCHAR(25) NULL,
  `pPrice` INT NULL,
  PRIMARY KEY (`pID`));

CREATE TABLE `quanlybanhang`.`orderdetail` (
  `oID` INT NOT NULL,
  `pID` INT NOT NULL,
  `odQTY` INT NOT NULL,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`oID`)
    REFERENCES `quanlybanhang`.`order` (`oID`),
  CONSTRAINT `ProductID`
    FOREIGN KEY (`pID`)
    REFERENCES `quanlybanhang`.`product` (`pID`)
    );

    
INSERT INTO `quanlybanhang`.`order` (`cID`, `oDate`) VALUES ('1', '2006-3-21');
INSERT INTO `quanlybanhang`.`order` (`cID`, `oDate`) VALUES ('2', '2006-3-23');
INSERT INTO `quanlybanhang`.`order` (`cID`, `oDate`) VALUES ('1', '2006-3-16');

INSERT INTO `quanlybanhang`.`product` (`pName`, `pPrice`) VALUES ('May Giat', '3');
INSERT INTO `quanlybanhang`.`product` (`pName`, `pPrice`) VALUES ('Tu Lanh', '5');
INSERT INTO `quanlybanhang`.`product` (`pName`, `pPrice`) VALUES ('Dieu Hoa', '7');
INSERT INTO `quanlybanhang`.`product` (`pName`, `pPrice`) VALUES ('Quat', '1');


INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`,`odQTY`) VALUES ('1', '1','3');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`,`odQTY`) VALUES ('1', '3','7');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`,`odQTY`) VALUES ('1', '4','2');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`,`odQTY`) VALUES ('2', '1','1');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`,`odQTY`) VALUES ('3', '1','8');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`,`odQTY`) VALUES ('2', '5','4');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`,`odQTY`) VALUES ('2', '3','3');

-- Hi???n th??? c??c th??ng tin  g???m oID, oDate, oPrice c???a t???t c??? c??c h??a ????n trong b???ng Order
select oID, oDate, oTotalPrice from quanlybanhang.order;

-- Hi???n th??? danh s??ch c??c kh??ch h??ng ???? mua h??ng, v?? danh s??ch s???n ph???m ???????c mua b???i c??c kh??ch
select c.cID,c.Name,p.pName from customer c
join quanlybanhang.order o on c.cID = o.cID
join orderdetail od on od.oID = o.oID
join product p on p.pID = od.pID;

-- Hi???n th??? t??n nh???ng kh??ch h??ng kh??ng mua b???t k??? m???t s???n ph???m n??o
select c.cID, c.Name , c.cAge from customer c
left join quanlybanhang.order o on c.cID = o.cID
where o.cID is null;

-- Hi???n th??? m?? h??a ????n, ng??y b??n v?? gi?? ti???n c???a t???ng h??a ????n (gi?? m???t h??a ????n ???????c t??nh b???ng t???ng gi?? b??n c???a t???ng lo???i m???t h??ng xu???t hi???n trong h??a ????n.
--  Gi?? b??n c???a t???ng lo???i ???????c t??nh = odQTY*pPrice)
select o.oID, o.oDate, sum(od.odQTY * p.pPrice) as oToTalPrice from quanlybanhang.order o
join orderdetail od on o.oID = od.oID
join product p on od.pID = p.pID
group by o.oID;