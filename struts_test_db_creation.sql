SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `struts_test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `struts_test` ;

-- -----------------------------------------------------
-- Table `struts_test`.`divisions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `struts_test`.`divisions` ;

CREATE TABLE IF NOT EXISTS `struts_test`.`divisions` (
  `division_id` INT NOT NULL AUTO_INCREMENT,
  `division_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`division_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `struts_test`.`persons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `struts_test`.`persons` ;

CREATE TABLE IF NOT EXISTS `struts_test`.`persons` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `person_name` VARCHAR(20) NOT NULL,
  `fk_division_id` INT NOT NULL,
  PRIMARY KEY (`person_id`, `fk_division_id`),
  INDEX `fk_division_id_idx` (`fk_division_id` ASC),
  CONSTRAINT `division_fk`
    FOREIGN KEY (`fk_division_id`)
    REFERENCES `struts_test`.`divisions` (`division_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
