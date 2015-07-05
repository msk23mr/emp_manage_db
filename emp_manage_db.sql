SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `emp_manage_db` ;
CREATE SCHEMA IF NOT EXISTS `emp_manage_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `emp_manage_db` ;

-- -----------------------------------------------------
-- Table `emp_manage_db`.`prefectures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emp_manage_db`.`prefectures` ;

CREATE TABLE IF NOT EXISTS `emp_manage_db`.`prefectures` (
  `prefecture_id` INT NOT NULL AUTO_INCREMENT,
  `prefecture_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`prefecture_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emp_manage_db`.`divisions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emp_manage_db`.`divisions` ;

CREATE TABLE IF NOT EXISTS `emp_manage_db`.`divisions` (
  `division_id` INT NOT NULL AUTO_INCREMENT,
  `division_name` VARCHAR(45) NOT NULL,
  `divition_location` INT NOT NULL,
  PRIMARY KEY (`division_id`),
  INDEX `PREFECTURE_INDEX` (`divition_location` ASC),
  CONSTRAINT `PREFECTURE_FOREIGN_KE`
    FOREIGN KEY (`divition_location`)
    REFERENCES `emp_manage_db`.`prefectures` (`prefecture_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emp_manage_db`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emp_manage_db`.`employees` ;

CREATE TABLE IF NOT EXISTS `emp_manage_db`.`employees` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `emp_password` VARCHAR(16) NOT NULL,
  `emp_name` VARCHAR(45) NOT NULL,
  `emp_gender` BIT NOT NULL,
  `emp_birth` DATE NOT NULL,
  `emp_from` INT NULL,
  `emp_division` INT NOT NULL,
  PRIMARY KEY (`emp_id`, `emp_division`),
  INDEX `DIVISION_INDEX` (`emp_division` ASC),
  INDEX `PERECTURE_INDEX` (`emp_from` ASC),
  CONSTRAINT `DIVISION_FOREIGN_KEY`
    FOREIGN KEY (`emp_division`)
    REFERENCES `emp_manage_db`.`divisions` (`division_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PREFECTURE_FOREIGN_KEY`
    FOREIGN KEY (`emp_from`)
    REFERENCES `emp_manage_db`.`prefectures` (`prefecture_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
