-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Oefening9_examenBIT05
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Oefening9_examenBIT05
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Oefening9_examenBIT05` DEFAULT CHARACTER SET utf8 ;
USE `Oefening9_examenBIT05` ;

-- -----------------------------------------------------
-- Table `Oefening9_examenBIT05`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oefening9_examenBIT05`.`Syndrome` (
  `Syndrome_id` INT UNSIGNED NOT NULL,
  `Syndrome_descr` VARCHAR(345) NULL,
  `Syndrome_name` VARCHAR(100) NULL,
  PRIMARY KEY (`Syndrome_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Oefening9_examenBIT05`.`Genes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oefening9_examenBIT05`.`Genes` (
  `Gene_id` INT UNSIGNED NOT NULL,
  `Gene_descr` VARCHAR(345) NULL,
  PRIMARY KEY (`Gene_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Oefening9_examenBIT05`.`Mutations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oefening9_examenBIT05`.`Mutations` (
  `Mutation_id` INT UNSIGNED NOT NULL,
  `Gene_id` INT UNSIGNED NULL,
  `Start` VARCHAR(45) NULL,
  `End` VARCHAR(45) NULL,
  `Chromosome` INT UNSIGNED NULL,
  PRIMARY KEY (`Mutation_id`),
  INDEX `genemutation_idx` (`Gene_id` ASC),
  CONSTRAINT `genemutation`
    FOREIGN KEY (`Gene_id`)
    REFERENCES `Oefening9_examenBIT05`.`Genes` (`Gene_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Oefening9_examenBIT05`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oefening9_examenBIT05`.`Patient` (
  `Patient_id` INT UNSIGNED NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Syndrome_id` INT UNSIGNED NULL,
  `Gender` ENUM('M', 'V') NULL,
  `Age_at_diagnosis` INT UNSIGNED NULL,
  `Mutation_id` INT UNSIGNED NULL,
  PRIMARY KEY (`Patient_id`),
  INDEX `patsyndrome_idx` (`Syndrome_id` ASC),
  INDEX `patientmutation_idx` (`Mutation_id` ASC),
  CONSTRAINT `patsyndrome`
    FOREIGN KEY (`Syndrome_id`)
    REFERENCES `Oefening9_examenBIT05`.`Syndrome` (`Syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `patientmutation`
    FOREIGN KEY (`Mutation_id`)
    REFERENCES `Oefening9_examenBIT05`.`Mutations` (`Mutation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
