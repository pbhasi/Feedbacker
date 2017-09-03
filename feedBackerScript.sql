-- MySQL Script generated by MySQL Workbench
-- Sat Aug 26 17:34:50 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema feedBacker
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema feedBacker
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `feedBacker` DEFAULT CHARACTER SET utf8 ;
USE `feedBacker` ;

-- -----------------------------------------------------
-- Table `feedBacker`.`eventMaster`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feedBacker`.`eventMaster` (
  `eventID` INT(3) NOT NULL,
  `startDate` DATETIME NULL,
  `finishDate` DATETIME NULL,
  `eventDescription` VARCHAR(120) NULL,
  PRIMARY KEY (`eventID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feedBacker`.`employeeMaster`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feedBacker`.`employeeMaster` (
  `employeeEmail` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`employeeEmail`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feedBacker`.`feedbackRatingMaster`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feedBacker`.`feedbackRatingMaster` (
  `rating` INT(1) NOT NULL,
  `comment` VARCHAR(120) NULL,
  PRIMARY KEY (`rating`, `comment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feedBacker`.`feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feedBacker`.`feedback` (
  `eventID` INT(3) NOT NULL,
  `rating` INT(1) NULL,
  `comment` VARCHAR(120) NULL,
  PRIMARY KEY (`eventID`, `rating`),
  INDEX `rating_idx` (`rating` ASC),
  CONSTRAINT `eventID`
    FOREIGN KEY (`eventID`)
    REFERENCES `feedBacker`.`eventMaster` (`eventID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rating`
    FOREIGN KEY (`rating`)
    REFERENCES `feedBacker`.`feedbackRatingMaster` (`rating`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;