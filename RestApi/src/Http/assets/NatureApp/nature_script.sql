-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema natureapi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema natureapi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `natureapi` DEFAULT CHARACTER SET utf8 ;
USE `natureapi` ;

-- -----------------------------------------------------
-- Table `natureapi`.`tb_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `natureapi`.`tb_user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `email_user` VARCHAR(45) NOT NULL,
  `password_user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `natureapi`.`tb_producer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `natureapi`.`tb_producer` (
  `id_producer` INT NOT NULL,
  `name_producer` VARCHAR(25) NOT NULL,
  `category_producer` INT(2) NOT NULL,
  `desc_producer` VARCHAR(45) NULL,
  `cpf_producer` VARCHAR(14) NOT NULL,
  `img_producer` VARCHAR(45) NULL,
  `id_user` INT NOT NULL,
  PRIMARY KEY (`id_producer`),
  INDEX `fk_tb_producer_tb_user_idx` (`id_user` ASC) VISIBLE,
  CONSTRAINT `fk_tb_producer_tb_user`
    FOREIGN KEY (`id_user`)
    REFERENCES `natureapi`.`tb_user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `natureapi`.`tb_client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `natureapi`.`tb_client` (
  `id_client` INT NOT NULL,
  `name_client` VARCHAR(25) NOT NULL,
  `cpf_client` VARCHAR(14) NOT NULL,
  `id_user` INT NOT NULL,
  PRIMARY KEY (`id_client`),
  INDEX `fk_tb_client_tb_user1_idx` (`id_user` ASC) VISIBLE,
  CONSTRAINT `fk_tb_client_tb_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `natureapi`.`tb_user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `natureapi`.`tb_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `natureapi`.`tb_product` (
  `id_product` INT NOT NULL AUTO_INCREMENT,
  `name_product` VARCHAR(25) NOT NULL,
  `desc_product` VARCHAR(45) NULL,
  `qtd_product` INT(3) NULL,
  `price_product` DECIMAL(5,2) NOT NULL,
  `img_product` VARCHAR(45) NULL,
  `id_producer` INT NOT NULL,
  PRIMARY KEY (`id_product`),
  INDEX `fk_tb_product_tb_producer1_idx` (`id_producer` ASC) VISIBLE,
  CONSTRAINT `fk_tb_product_tb_producer1`
    FOREIGN KEY (`id_producer`)
    REFERENCES `natureapi`.`tb_producer` (`id_producer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `natureapi`.`tb_fone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `natureapi`.`tb_fone` (
  `id_fone` INT NOT NULL AUTO_INCREMENT,
  `ddd_fone` INT(2) NOT NULL,
  `num_fone` INT(9) NOT NULL,
  `type_fone` INT(2) NOT NULL,
  `iswhats` INT(2) NOT NULL,
  `id_user` INT NOT NULL,
  PRIMARY KEY (`id_fone`),
  INDEX `fk_tb_fone_tb_user1_idx` (`id_user` ASC) VISIBLE,
  CONSTRAINT `fk_tb_fone_tb_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `natureapi`.`tb_user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `natureapi`.`tb_adress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `natureapi`.`tb_adress` (
  `id_adress` INT NOT NULL AUTO_INCREMENT,
  `street_adress` VARCHAR(65) NOT NULL,
  `num_adress` INT(5) NOT NULL,
  `district_adress` VARCHAR(25) NULL,
  `city_adress` VARCHAR(25) NOT NULL,
  `state_adress` VARCHAR(2) NOT NULL,
  `id_user` INT NOT NULL,
  PRIMARY KEY (`id_adress`),
  INDEX `fk_tb_adress_tb_user1_idx` (`id_user` ASC) VISIBLE,
  CONSTRAINT `fk_tb_adress_tb_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `natureapi`.`tb_user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `natureapi`.`tb_sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `natureapi`.`tb_sale` (
  `id_sale` INT NOT NULL AUTO_INCREMENT,
  `date_sale` DATETIME NOT NULL,
  `total_sale` DECIMAL(5,2) NOT NULL,
  `id_client` INT NOT NULL,
  PRIMARY KEY (`id_sale`),
  INDEX `fk_tb_sale_tb_client1_idx` (`id_client` ASC) VISIBLE,
  CONSTRAINT `fk_tb_sale_tb_client1`
    FOREIGN KEY (`id_client`)
    REFERENCES `natureapi`.`tb_client` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `natureapi`.`tb_saleitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `natureapi`.`tb_saleitems` (
  `id_sale` INT NOT NULL,
  `id_product` INT NOT NULL,
  `qtd_saleitems` INT(3) NOT NULL,
  `price_saleitems` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id_sale`, `id_product`),
  INDEX `fk_tb_sale_has_tb_product_tb_product1_idx` (`id_product` ASC) VISIBLE,
  INDEX `fk_tb_sale_has_tb_product_tb_sale1_idx` (`id_sale` ASC) VISIBLE,
  CONSTRAINT `fk_tb_sale_has_tb_product_tb_sale1`
    FOREIGN KEY (`id_sale`)
    REFERENCES `natureapi`.`tb_sale` (`id_sale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_sale_has_tb_product_tb_product1`
    FOREIGN KEY (`id_product`)
    REFERENCES `natureapi`.`tb_product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
