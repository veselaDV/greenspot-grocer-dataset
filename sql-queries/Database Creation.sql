-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Greenspot Dataset
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Greenspot Dataset
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Greenspot Dataset` DEFAULT CHARACTER SET utf8 ;
USE `Greenspot Dataset` ;

-- -----------------------------------------------------
-- Table `Greenspot Dataset`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Greenspot Dataset`.`products` (
  `productID` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(100) NOT NULL,
  `vendor` VARCHAR(100) NOT NULL,
  `productType` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `unit` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`productID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Greenspot Dataset`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Greenspot Dataset`.`orders` (
  `orderID` INT NOT NULL,
  `salePrice` DECIMAL(4,2) NOT NULL,
  `saleDate` DATE NOT NULL,
  `quantitySold` INT NOT NULL,
  `customerID` INT NOT NULL,
  `productNumOrd` INT NOT NULL,
  PRIMARY KEY (`orderID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Greenspot Dataset`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Greenspot Dataset`.`customers` (
  `customerID` INT NOT NULL,
  `customerName` VARCHAR(100) NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Greenspot Dataset`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Greenspot Dataset`.`inventory` (
  `inventoryNum` INT NOT NULL,
  `productNumber` INT NOT NULL,
  `quantityInStock` VARCHAR(45) NOT NULL,
  `purchaseDate` DATE NOT NULL,
  `purchaseCost` DECIMAL(4,2) NULL,
  PRIMARY KEY (`inventoryNum`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
