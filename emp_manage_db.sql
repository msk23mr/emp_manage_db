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
  `prefecture_id` VARCHAR(2) NOT NULL,
  `prefecture_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`prefecture_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emp_manage_db`.`divisions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emp_manage_db`.`divisions` ;

CREATE TABLE IF NOT EXISTS `emp_manage_db`.`divisions` (
  `division_id` VARCHAR(4) NOT NULL,
  `division_name` VARCHAR(45) NOT NULL,
  `division_location` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`division_id`),
  INDEX `LOCASION_INDEX` (`division_location` ASC),
  CONSTRAINT `LOCASION_FOREIGN_KEY`
    FOREIGN KEY (`division_location`)
    REFERENCES `emp_manage_db`.`prefectures` (`prefecture_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emp_manage_db`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emp_manage_db`.`employees` ;

CREATE TABLE IF NOT EXISTS `emp_manage_db`.`employees` (
  `emp_id` VARCHAR(4) NOT NULL,
  `emp_password` VARCHAR(12) NOT NULL,
  `emp_name` VARCHAR(45) NOT NULL,
  `emp_gender` BIT NOT NULL,
  `emp_birth` DATE NOT NULL,
  `emp_from` VARCHAR(2) NULL,
  `emp_division` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`emp_id`, `emp_division`),
  INDEX `FROM_INDEX` (`emp_from` ASC),
  INDEX `DIVISION_INDEX` (`emp_division` ASC),
  CONSTRAINT `FROM_FOREIGN_KEY`
    FOREIGN KEY (`emp_from`)
    REFERENCES `emp_manage_db`.`prefectures` (`prefecture_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DIVISION_FOREIGN_KEY`
    FOREIGN KEY (`emp_division`)
    REFERENCES `emp_manage_db`.`divisions` (`division_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `emp_manage_db`.`prefectures`
-- -----------------------------------------------------
START TRANSACTION;
USE `emp_manage_db`;
INSERT INTO `emp_manage_db`.`prefectures` (`prefecture_id`, `prefecture_name`) VALUES ('01', '北海道');
INSERT INTO `emp_manage_db`.`prefectures` (`prefecture_id`, `prefecture_name`) VALUES ('02', '仙台県');
INSERT INTO `emp_manage_db`.`prefectures` (`prefecture_id`, `prefecture_name`) VALUES ('03', '東京都');
INSERT INTO `emp_manage_db`.`prefectures` (`prefecture_id`, `prefecture_name`) VALUES ('04', '神奈川県');
INSERT INTO `emp_manage_db`.`prefectures` (`prefecture_id`, `prefecture_name`) VALUES ('05', '愛知県');
INSERT INTO `emp_manage_db`.`prefectures` (`prefecture_id`, `prefecture_name`) VALUES ('06', '大阪府');
INSERT INTO `emp_manage_db`.`prefectures` (`prefecture_id`, `prefecture_name`) VALUES ('07', '広島県');
INSERT INTO `emp_manage_db`.`prefectures` (`prefecture_id`, `prefecture_name`) VALUES ('08', '福岡県');

COMMIT;


-- -----------------------------------------------------
-- Data for table `emp_manage_db`.`divisions`
-- -----------------------------------------------------
START TRANSACTION;
USE `emp_manage_db`;
INSERT INTO `emp_manage_db`.`divisions` (`division_id`, `division_name`, `division_location`) VALUES ('0101', '総務部', '01');
INSERT INTO `emp_manage_db`.`divisions` (`division_id`, `division_name`, `division_location`) VALUES ('0301', '総務部', '03');
INSERT INTO `emp_manage_db`.`divisions` (`division_id`, `division_name`, `division_location`) VALUES ('0102', '営業部', '01');
INSERT INTO `emp_manage_db`.`divisions` (`division_id`, `division_name`, `division_location`) VALUES ('0302', '営業部', '03');
INSERT INTO `emp_manage_db`.`divisions` (`division_id`, `division_name`, `division_location`) VALUES ('0103', '開発部', '01');
INSERT INTO `emp_manage_db`.`divisions` (`division_id`, `division_name`, `division_location`) VALUES ('0303', '開発部', '03');
INSERT INTO `emp_manage_db`.`divisions` (`division_id`, `division_name`, `division_location`) VALUES ('0503', '開発部', '05');
INSERT INTO `emp_manage_db`.`divisions` (`division_id`, `division_name`, `division_location`) VALUES ('0703', '開発部', '07');

COMMIT;


-- -----------------------------------------------------
-- Data for table `emp_manage_db`.`employees`
-- -----------------------------------------------------
START TRANSACTION;
USE `emp_manage_db`;
INSERT INTO `emp_manage_db`.`employees` (`emp_id`, `emp_password`, `emp_name`, `emp_gender`, `emp_birth`, `emp_from`, `emp_division`) VALUES ('0001', '1111aaaa', '佐藤拓哉', 0, '1990-08-05', '01', '0102');
INSERT INTO `emp_manage_db`.`employees` (`emp_id`, `emp_password`, `emp_name`, `emp_gender`, `emp_birth`, `emp_from`, `emp_division`) VALUES ('0002', '2222bbbb', '佐藤里奈', 1, '1992-01-03', '01', '0101');
INSERT INTO `emp_manage_db`.`employees` (`emp_id`, `emp_password`, `emp_name`, `emp_gender`, `emp_birth`, `emp_from`, `emp_division`) VALUES ('0003', '3333cccc', '小沢達也', 0, '1970-09-24', '03', '0303');
INSERT INTO `emp_manage_db`.`employees` (`emp_id`, `emp_password`, `emp_name`, `emp_gender`, `emp_birth`, `emp_from`, `emp_division`) VALUES ('0004', '4444dddd', '矢沢貴一', 0, '1988-03-11', '02', '0503');
INSERT INTO `emp_manage_db`.`employees` (`emp_id`, `emp_password`, `emp_name`, `emp_gender`, `emp_birth`, `emp_from`, `emp_division`) VALUES ('0005', '5555eeee', '麻倉信次', 0, '1980-11-09', '01', '0301');
INSERT INTO `emp_manage_db`.`employees` (`emp_id`, `emp_password`, `emp_name`, `emp_gender`, `emp_birth`, `emp_from`, `emp_division`) VALUES ('0006', '6666ffff', '加藤美希', 1, '1995-05-01', '04', '0303');
INSERT INTO `emp_manage_db`.`employees` (`emp_id`, `emp_password`, `emp_name`, `emp_gender`, `emp_birth`, `emp_from`, `emp_division`) VALUES ('0007', '7777gggg', '中島士郎', 0, '1975-12-23', '06', '0703');
INSERT INTO `emp_manage_db`.`employees` (`emp_id`, `emp_password`, `emp_name`, `emp_gender`, `emp_birth`, `emp_from`, `emp_division`) VALUES ('0008', '8888hhhh', '山本誌織', 1, '1989-09-17', '01', '0301');
INSERT INTO `emp_manage_db`.`employees` (`emp_id`, `emp_password`, `emp_name`, `emp_gender`, `emp_birth`, `emp_from`, `emp_division`) VALUES ('0009', '9999iiii', '橘一郎', 0, '1979-10-01', '03', '0503');

COMMIT;

