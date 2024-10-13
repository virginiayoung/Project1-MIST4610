-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cs_ajr70185
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cs_ajr70185
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs_ajr70185` DEFAULT CHARACTER SET utf8 ;
USE `cs_ajr70185` ;

-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Director` (
  `idDirector` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  PRIMARY KEY (`idDirector`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Genre` (
  `idGenre` INT NOT NULL,
  `genreName` VARCHAR(45) NULL,
  PRIMARY KEY (`idGenre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Movie` (
  `idMovie` INT NOT NULL,
  `movieName` VARCHAR(45) NULL,
  `releaseDate` DATE NULL,
  `duration` INT NULL,
  `idDirector` INT NOT NULL,
  `idGenre` INT NOT NULL,
  PRIMARY KEY (`idMovie`),
  INDEX `fk_Movie_Director_idx` (`idDirector` ASC) VISIBLE,
  INDEX `fk_Movie_Genre1_idx` (`idGenre` ASC) VISIBLE,
  CONSTRAINT `fk_Movie_Director`
    FOREIGN KEY (`idDirector`)
    REFERENCES `cs_ajr70185`.`Director` (`idDirector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_Genre1`
    FOREIGN KEY (`idGenre`)
    REFERENCES `cs_ajr70185`.`Genre` (`idGenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Actor` (
  `idActor` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `idMentor` INT NOT NULL,
  PRIMARY KEY (`idActor`),
  INDEX `fk_Actor_Actor1_idx` (`idMentor` ASC) VISIBLE,
  CONSTRAINT `fk_Actor_Actor1`
    FOREIGN KEY (`idMentor`)
    REFERENCES `cs_ajr70185`.`Actor` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Actor_has_Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Actor_has_Movie` (
  `idMovieActor` VARCHAR(45) NOT NULL,
  `roleName` VARCHAR(45) NULL,
  `idMovie` INT NOT NULL,
  `idActor` INT NOT NULL,
  PRIMARY KEY (`idMovieActor`),
  INDEX `fk_Actor_has_Movie_Movie1_idx` (`idMovie` ASC) VISIBLE,
  INDEX `fk_Actor_has_Movie_Actor1_idx` (`idActor` ASC) VISIBLE,
  CONSTRAINT `fk_Actor_has_Movie_Movie1`
    FOREIGN KEY (`idMovie`)
    REFERENCES `cs_ajr70185`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actor_has_Movie_Actor1`
    FOREIGN KEY (`idActor`)
    REFERENCES `cs_ajr70185`.`Actor` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Worker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Worker` (
  `idWorkers` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  `idDirector` INT NOT NULL,
  PRIMARY KEY (`idWorkers`),
  INDEX `fk_Worker_Director1_idx` (`idDirector` ASC) VISIBLE,
  CONSTRAINT `fk_Worker_Director1`
    FOREIGN KEY (`idDirector`)
    REFERENCES `cs_ajr70185`.`Director` (`idDirector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Rating` (
  `idRating` INT NOT NULL,
  `Source` VARCHAR(45) NULL,
  `Score` INT NULL,
  `idMovie` INT NOT NULL,
  PRIMARY KEY (`idRating`),
  INDEX `fk_Rating_Movie1_idx` (`idMovie` ASC) VISIBLE,
  CONSTRAINT `fk_Rating_Movie1`
    FOREIGN KEY (`idMovie`)
    REFERENCES `cs_ajr70185`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Revenue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Revenue` (
  `idRevenue` INT NOT NULL,
  `ticketsSold` VARCHAR(45) NULL,
  `ticketPrice` VARCHAR(45) NULL,
  PRIMARY KEY (`idRevenue`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Box_Office`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Box_Office` (
  `idBox_Office` INT NOT NULL,
  `Country` VARCHAR(45) NULL,
  `noTheaters` INT NULL,
  `idMovie` INT NOT NULL,
  `idRevenue` INT NOT NULL,
  PRIMARY KEY (`idBox_Office`),
  INDEX `fk_Box_Office_Movie1_idx` (`idMovie` ASC) VISIBLE,
  INDEX `fk_Box_Office_Revenue1_idx` (`idRevenue` ASC) VISIBLE,
  CONSTRAINT `fk_Box_Office_Movie1`
    FOREIGN KEY (`idMovie`)
    REFERENCES `cs_ajr70185`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Box_Office_Revenue1`
    FOREIGN KEY (`idRevenue`)
    REFERENCES `cs_ajr70185`.`Revenue` (`idRevenue`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Reviews` (
  `idReviews` INT NOT NULL,
  `reviewerName` VARCHAR(45) NULL,
  `reviewerRating` INT NULL,
  `reviewDate` DATE NULL,
  `Movie_idMovie` INT NOT NULL,
  PRIMARY KEY (`idReviews`),
  INDEX `fk_Reviews_Movie1_idx` (`Movie_idMovie` ASC) VISIBLE,
  CONSTRAINT `fk_Reviews_Movie1`
    FOREIGN KEY (`Movie_idMovie`)
    REFERENCES `cs_ajr70185`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Streaming_Platform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Streaming_Platform` (
  `idStreamingPlatform` INT NOT NULL,
  `platformName` VARCHAR(45) NULL,
  PRIMARY KEY (`idStreamingPlatform`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_ajr70185`.`Movie_Platform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Movie_Platform` (
  `idMovie` INT NOT NULL,
  `idStreamingPlatform` INT NOT NULL,
  PRIMARY KEY (`idMovie`, `idStreamingPlatform`),
  INDEX `fk_Movie_has_Streaming_Platform_Streaming_Platform1_idx` (`idStreamingPlatform` ASC) VISIBLE,
  INDEX `fk_Movie_has_Streaming_Platform_Movie1_idx` (`idMovie` ASC) VISIBLE,
  CONSTRAINT `fk_Movie_has_Streaming_Platform_Movie1`
    FOREIGN KEY (`idMovie`)
    REFERENCES `cs_ajr70185`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_Streaming_Platform_Streaming_Platform1`
    FOREIGN KEY (`idStreamingPlatform`)
    REFERENCES `cs_ajr70185`.`Streaming_Platform` (`idStreamingPlatform`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
