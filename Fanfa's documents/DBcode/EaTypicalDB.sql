-- MySQL Script generated by MySQL Workbench
-- Wed Jan  6 14:11:46 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema progettoispwfinaledb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema progettoispwfinaledb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `progettoispwfinaledatabase` DEFAULT CHARACTER SET utf8 ;
USE `progettoispwfinaledatabase` ;

-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`Proprietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`Proprietario` (
  `Cognome` VARCHAR(45) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
   PRIMARY KEY(`Username`)
  -- PRIMARY KEY (`Cognome`, `Nome`),
  -- UNIQUE INDEX `Username_UNIQUE` (`Username` ASC) VISIBLE)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`Ristorante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`Ristorante` (
  `Nome` VARCHAR(45) NOT NULL,
  `Indirizzo` VARCHAR(45) NOT NULL,
  `Citta` VARCHAR(45) NOT NULL,
  `UsernameProprietario` VARCHAR(45) NOT NULL,  
  -- `NomeProprietario` VARCHAR(45) NOT NULL,
  -- `CognomeProprietario` VARCHAR(45) NOT NULL,
  `VotoMedio` DOUBLE NOT NULL,
  PRIMARY KEY (`Nome`),
  INDEX `fk_nomeP_idx` (`UsernameProprietario` ASC) VISIBLE, 
  CONSTRAINT `fk_nomeP`
    FOREIGN KEY (`UsernameProprietario`)
    REFERENCES `progettoispwfinaledatabase`.`Proprietario` (`Username`)
    ON DELETE cascade
    ON UPDATE cascade
 )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`Turista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`Turista` (
  `Nome` VARCHAR(45) NOT NULL,
  `Cognome` VARCHAR(45) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  PRIMARY KEY(`Username`)
  -- PRIMARY KEY (`Nome`, `Cognome`),
  -- UNIQUE INDEX `Username_UNIQUE` (`Username` ASC) VISIBLE)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`Preferiti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`Preferiti` (
  `NomeRistorante` VARCHAR(45) NOT NULL,
  `UsernameTurista` VARCHAR(45) NOT NULL,
  -- `NomeTurista` VARCHAR(45) NOT NULL,
  -- `CognomeTurista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NomeRistorante`, `UsernameTurista`),
  INDEX `fk_nomeTur_idx` (`UsernameTurista` ASC) VISIBLE,  
  CONSTRAINT `fk_nomeRist`
    FOREIGN KEY (`NomeRistorante`)
    REFERENCES `progettoispwfinaledatabase`.`Ristorante` (`Nome`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_nomeTur`
    FOREIGN KEY (`UsernameTurista`)
    REFERENCES `progettoispwfinaledatabase`.`Turista` (`Username`)
    ON DELETE cascade
    ON UPDATE cascade
  )
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`PiattoTipico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`PiattoTipico` (
  `NomePiatto` VARCHAR(45) NOT NULL,
  
  PRIMARY KEY (`NomePiatto`),
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`Piatto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`Piatto` (
  `NomeRistorante` VARCHAR(45) NOT NULL,
  `NomePiatto` VARCHAR(45) NOT NULL,
  `Contenuto` VARCHAR(10000) NOT NULL,
  `Prezzo` DOUBLE NOT NULL,
  `Vegano` TINYINT NOT NULL,
  `Celiaco` TINYINT NOT NULL,
  PRIMARY KEY (`NomeRistorante`, `NomePiatto`),
  CONSTRAINT `fk_nomeRisPiat`
    FOREIGN KEY (`NomeRistorante`)
    REFERENCES `progettoispwfinaledatabase`.`Ristorante` (`Nome`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_nomePiatPiat`
	FOREIGN KEY (`NomePiatto`)
    REFERENCES `progettoispwfinaledatabase`.`PiattoTipico` (`NomePiatto`)
    ON DELETE cascade
    ON UPDATE cascade,
	)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`NotificaScheduling`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`NotificaScheduling` (
  `UsernameProprietario` VARCHAR(45) NOT NULL,
  -- `NomeProprietario` VARCHAR(45) NOT NULL,
  -- `CognomeProprietario` VARCHAR(45) NOT NULL,
  `UsernameTurista` VARCHAR(45) NOT NULL,
  -- `NomeTurista` VARCHAR(45) NOT NULL,
  -- `CognomeTurista` VARCHAR(45) NOT NULL,
  `NomeRistorante` VARCHAR(45) NOT NULL,
  `Data` DATE NULL,
  `PranzoVsCena` TINYINT NULL,
  `Vista` TINYINT NULL,
  PRIMARY KEY (`UsernameProprietario`,`UsernameTurista`, `NomeRistorante`),
  INDEX `fNotifica2_idx` (`UsernameProprietario` ASC) VISIBLE,
  INDEX `fNotifica3_idx` (`UsernameTurista` ASC) VISIBLE, 
  INDEX `fNotifica5_idx` (`NomeRistorante` ASC) VISIBLE,
  CONSTRAINT `fNotifica1`
    FOREIGN KEY (`UsernameProprietario`)
    REFERENCES `progettoispwfinaledatabase`.`Proprietario` (`Username`)
    ON DELETE cascade
    ON UPDATE cascade,  
  CONSTRAINT `fNotifica3`
    FOREIGN KEY (`UsernameTurista`)
    REFERENCES `progettoispwfinaledatabase`.`Turista` (`Username`)
    ON DELETE cascade
    ON UPDATE cascade,  
  CONSTRAINT `fNotifica5`
    FOREIGN KEY (`NomeRistorante`)
    REFERENCES `progettoispwfinaledatabase`.`Ristorante` (`Nome`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`GiornoSett`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`GiornoSett` (
  `Ristorante` VARCHAR(45) NOT NULL,
  `Giorno` INT NOT NULL,
  `ApertoCena` BOOLEAN NOT NULL,
  `ApertoPranzo` VARCHAR(45) NOT NULL,
  
  primary key(`Ristorante`,`Giorno`),
  
  PRIMARY KEY (`NomePiatto`),
  CONSTRAINT `fNotifica543`
    FOREIGN KEY (`Ristorante`)
    REFERENCES `progettoispwfinaledatabase`.`Ristorante` (`Nome`)
    ON DELETE cascade
    ON UPDATE cascade
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`Recensione`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`Recensione` (
  `UsernameTurista` VARCHAR(45) NOT NULL,
  -- `NomeTurista` VARCHAR(45) NOT NULL,
  -- `CognomeTurista` VARCHAR(45) NOT NULL,
  `NomeRistorante` VARCHAR(45) NOT NULL,
  `Contenuto` VARCHAR(10000) NOT NULL,
  `Voto` INT NOT NULL,
  PRIMARY KEY (`UsernameTurista`, `NomeRistorante`),
  INDEX `fRec2_idx` (`UsernameTurista` ASC) VISIBLE,
  INDEX `fRec3_idx` (`NomeRistorante` ASC) VISIBLE,
  CONSTRAINT `fRec1`
    FOREIGN KEY (`UsernameTurista`)
    REFERENCES `progettoispwfinaledatabase`.`Turista` (`Username`)
    ON DELETE cascade
    ON UPDATE cascade, 
  CONSTRAINT `fRec3`
    FOREIGN KEY (`NomeRistorante`)
    REFERENCES `progettoispwfinaledatabase`.`Ristorante` (`Nome`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`NotificaRecensione`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`NotificaRecensione` (
  `UsernameTurista` VARCHAR(45) NOT NULL,
  -- `NomeTurista` VARCHAR(45) NOT NULL,
  -- `CognomeTurista` VARCHAR(45) NOT NULL,
  `NomeRistorante` VARCHAR(45) NOT NULL,
  `Visualizzata` TINYINT NULL,
  PRIMARY KEY (`UsernameTurista`, `NomeRistorante`),
  INDEX `fNotR2_idx` (`UsernameTurista` ASC) VISIBLE,
  INDEX `fNotR3_idx` (`NomeRistorante` ASC) VISIBLE,
  CONSTRAINT `fNotR1`
    FOREIGN KEY (`UsernameTurista`)
    REFERENCES `progettoispwfinaledatabase`.`Turista` (`Username`)
    ON DELETE cascade
    ON UPDATE cascade, 
  CONSTRAINT `fNotR3`
    FOREIGN KEY (`NomeRistorante`)
    REFERENCES `progettoispwfinaledatabase`.`Ristorante` (`Nome`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`RistorantiSponsorizzati`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`RistorantiSponsorizzati` (
  `UsernameProprietario` VARCHAR(45) NOT NULL,
  -- `NomeProprietario` VARCHAR(45) NOT NULL,
  -- `CognomeProprietario` VARCHAR(45) NOT NULL,
  `NomeRistorante` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`UsernameProprietario`, `NomeRistorante`),
  INDEX `fRS2_idx` (`UsernameProprietario` ASC) VISIBLE,
  INDEX `fRS3_idx` (`NomeRistorante` ASC) VISIBLE,
  CONSTRAINT `fRS1`
    FOREIGN KEY (`UsernameProprietario`)
    REFERENCES `progettoispwfinaledatabase`.`Proprietario` (`Username`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fRS3`
    FOREIGN KEY (`NomeRistorante`)
    REFERENCES `progettoispwfinaledatabase`.`Ristorante` (`Nome`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`NotificaMenuAggiornato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`NotificaMenuAggiornato` (
  `UsernameTurista` VARCHAR(45) NOT NULL,
  -- `NomeTurista` VARCHAR(45) NOT NULL,
  -- `CognomeTurista` VARCHAR(45) NOT NULL,
  `NomeRistorante` VARCHAR(45) NOT NULL,
  `TIpoModifica` VARCHAR(45) NOT NULL,
  `NomePiatto` VARCHAR(45) NOT NULL,
  `Vista` TINYINT NOT NULL,
  PRIMARY KEY (`UsernameTurista`, `NomeRistorante`, `NomePiatto`),
  INDEX `fMA2_idx` (`UsernameTurista` ASC) VISIBLE,
  INDEX `fMA3_idx` (`NomeRistorante` ASC) VISIBLE,
  INDEX `fMA4_idx` (`NomePiatto` ASC) VISIBLE,
  CONSTRAINT `fMA1`
    FOREIGN KEY (`UsernameTurista`)
    REFERENCES `progettoispwfinaledatabase`.`Turista` (`Username`)
    ON DELETE cascade
    ON UPDATE cascade,
  -- CONSTRAINT `fMA3`
  --   FOREIGN KEY (`NomeRistorante`,`NomePiatto`)
  --   REFERENCES `progettoispwfinaledatabase`.`Piatto` (`NomeRistorante`,`NomePiatto`)
  --   ON DELETE cascade
  --   ON UPDATE cascade
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`Menu` (
  `NomeRistorante` VARCHAR(45) NOT NULL,
  `Totale` DOUBLE NOT NULL,
  PRIMARY KEY (`NomeRistorante`),
  CONSTRAINT `fM1`
    FOREIGN KEY (`NomeRistorante`)
    REFERENCES `progettoispwfinaledatabase`.`Ristorante` (`Nome`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `progettoispwfinaledb`.`DettaglioMenu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `progettoispwfinaledatabase`.`DettaglioMenu` (
  `NomeRistorante` VARCHAR(45) NOT NULL,
  `NomePiatto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NomeRistorante`, `NomePiatto`),
  INDEX `fDM1_idx` (`NomePiatto` ASC) VISIBLE,
  CONSTRAINT `fDM1`
    FOREIGN KEY (`NomeRistorante`,`NomePiatto`)
    REFERENCES `progettoispwfinaledatabase`.`Piatto` (`NomeRistorante`,`NomePiatto`)
    ON DELETE cascade
    ON UPDATE cascade
    )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;