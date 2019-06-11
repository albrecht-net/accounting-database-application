-- Datenbank Tabellen Vorlage für die Applikations-Datenbank
-- Gültig ab: Accounting v2.0.0-beta
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `databases`
--

CREATE TABLE `databases` (
  `dbID` INT(11) NOT NULL AUTO_INCREMENT,
  `created` DATETIME NOT NULL,
  `userID` INT(11) NOT NULL,
  `dbHost` VARCHAR(32) NOT NULL,
  `dbPort` INT(11) NOT NULL,
  `dbUsername` VARCHAR(64) NOT NULL,
  `dbPassword` VARCHAR(64) NOT NULL,
  `dbName` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`dbID`),
  KEY `userID` (`userID`)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------


--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(64) NOT NULL,
  `activation` ENUM('Y','N') NOT NULL DEFAULT 'N',
  `status` ENUM('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username` (`username`)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userconfig`
--

CREATE TABLE `userconfig` (
  `userID` INT(11) NOT NULL,
  `defaultDb` INT(11),
  PRIMARY KEY (`userID`),
  KEY `defaultDb` (`defaultDb`)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `version`
--

CREATE TABLE `version` (
    `versionID` INT(11) NOT NULL AUTO_INCREMENT,
    `major` INT(11) NOT NULL,
    `minor` INT(11) NOT NULL,
    `patch` INT(11) NOT NULL,
    `identifier` VARCHAR(16) NULL DEFAULT NULL,
    `versionString` VARCHAR(64) NULL DEFAULT NULL,
    PRIMARY KEY(`versionID`)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COMMENT = 'Version';

-- --------------------------------------------------------

--
-- Constraints der Tabelle `databases`
--
ALTER TABLE `databases`
  ADD CONSTRAINT `databases_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE;

-- --------------------------------------------------------

--
-- Constraints der Tabelle `userconfig`
--
ALTER TABLE `userconfig`
  ADD CONSTRAINT `userconfig_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE,
  ADD CONSTRAINT `userconfig_ibfk_2` FOREIGN KEY (`defaultDb`) REFERENCES `databases` (`dbID`) ON DELETE SET NULL;

-- --------------------------------------------------------

--
-- Trigger der Tabelle `version`
--

-- generate_versionString_insert
CREATE TRIGGER `generate_versionString_insert` BEFORE INSERT
ON
	`version` FOR EACH ROW
SET
	NEW.versionString = CONCAT('v', NEW.major, '.', NEW.minor, '.', NEW.patch, IF(ISNULL(NEW.identifier), '', '-'), IFNULL(NEW.identifier, ''));

-- generate_versionString_update
CREATE TRIGGER `generate_versionString_update` BEFORE UPDATE
ON
	`version` FOR EACH ROW
SET
	NEW.versionString = CONCAT('v', NEW.major, '.', NEW.minor, '.', NEW.patch, IF(ISNULL(NEW.identifier), '', '-'), IFNULL(NEW.identifier, ''));

-- --------------------------------------------------------

--
-- Versionsinformationen einfügen
--

INSERT INTO `version` (`versionID`, `major`, `minor`, `patch`, `identifier`, `versionString`) VALUES (NULL, '1', '2', '0', NULL, NULL);
