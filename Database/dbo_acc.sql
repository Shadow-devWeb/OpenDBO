;
CREATE TABLE `accounts` (
  `AccountID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Password_hash` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'password in md5',
  `acc_status` enum('pending','block','active') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'active',
  `email` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'test@mail.com',
  `mallpoints` int(10) unsigned NOT NULL DEFAULT '10000000',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NULL DEFAULT NULL,
  `reg_ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `admin` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'value from 0 to 10',
  `isGm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = normal user / 1 = game master or people with who can login in testing phase',
  `lastServerFarmId` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT 'default: INVALID_SERVERFARMID ( 255 )',
  `founder` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 = no founder / 1 = first founder / 2 = second / 3 = third',
  `founder_recv` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 = founder not received / 1 = founder received',
  `last_ip` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0.0.0.0',
  `del_char_pw` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '25f9e794323b453885f5181f1b624d0b',
  `PremiumSlots` tinyint(1) unsigned NOT NULL DEFAULT '4',
  `EventCoins` int(10) unsigned DEFAULT '0' COMMENT 'coins used to play on HLS event machine',
  `WaguCoins` int(10) unsigned DEFAULT '0' COMMENT 'coins used to play on HLS slot machine',
  `web_ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`AccountID`,`Username`),
  UNIQUE KEY `AccountID` (`AccountID`) USING BTREE,
  UNIQUE KEY `Username` (`Username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for accounts_banned
-- ----------------------------
DROP TABLE IF EXISTS `accounts_banned`;
CREATE TABLE `accounts_banned` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `GM_AccId` int(16) unsigned NOT NULL DEFAULT '0',
  `Banned_AccId` int(16) unsigned NOT NULL DEFAULT '0',
  `DateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reason` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Duration` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Value in days. 255 = permanent',
  `Active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = true, 0 = false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cashshop_storage
-- ----------------------------
DROP TABLE IF EXISTS `cashshop_storage`;
CREATE TABLE `cashshop_storage` (
  `ProductId` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `AccountID` int(10) unsigned NOT NULL,
  `HLSitemTblidx` int(10) unsigned NOT NULL,
  `StackCount` tinyint(3) unsigned NOT NULL,
  `giftCharId` int(10) unsigned DEFAULT NULL,
  `IsRead` tinyint(1) NOT NULL DEFAULT '0',
  `SenderName` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `year` int(4) unsigned NOT NULL,
  `month` tinyint(2) unsigned NOT NULL,
  `day` tinyint(2) unsigned NOT NULL,
  `hour` tinyint(2) unsigned NOT NULL,
  `minute` tinyint(2) unsigned NOT NULL,
  `second` tinyint(2) unsigned NOT NULL,
  `millisecond` int(4) unsigned NOT NULL,
  `isMoved` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'BOOL. Did the player move the item to his inventory',
  `Buyer` int(10) unsigned DEFAULT '0' COMMENT 'account id from the buyer',
  `price` int(10) unsigned DEFAULT '0',
  `ItemID` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`ProductId`),
  UNIQUE KEY `ProductId` (`ProductId`,`AccountID`) USING BTREE,
  KEY `AccountID` (`AccountID`,`isMoved`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for event_reward
-- ----------------------------
DROP TABLE IF EXISTS `event_reward`;
CREATE TABLE `event_reward` (
  `AccountID` int(15) unsigned DEFAULT NULL,
  `rewardTblidx` int(15) unsigned DEFAULT NULL,
  `CharID` int(15) unsigned DEFAULT '0',
  `CharName` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  UNIQUE KEY `AccountID` (`AccountID`,`rewardTblidx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for shortcuts
-- ----------------------------
DROP TABLE IF EXISTS `shortcuts`;
CREATE TABLE `shortcuts` (
  `AccountID` int(10) unsigned NOT NULL,
  `ActionID` int(10) unsigned NOT NULL DEFAULT '0',
  `wKey` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AccountID`,`ActionID`),
  UNIQUE KEY `AccountID` (`AccountID`,`ActionID`) USING BTREE,
  KEY `AccountID_2` (`AccountID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
```sql
CREATE TABLE `shortcuts` (
  `AccountID` INT UNSIGNED NOT NULL,
  `ActionID` INT UNSIGNED NOT NULL DEFAULT 0,
  `wKey` INT UNSIGNED NOT NULL DEFAULT 0,
  `IsGMCommand` TINYINT(1) NOT NULL DEFAULT 0,  -- Champ ajouté pour la commande GM
  PRIMARY KEY (`AccountID`, `ActionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```
Table "accounts":
```sql
CREATE TABLE `accounts` (
  `AccountID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `Username` VARCHAR(16) NOT NULL,
  `Password_hash` VARCHAR(32) NOT NULL,
  `acc_status` ENUM('pending', 'block', 'active') NOT NULL DEFAULT 'active',
  `email` VARCHAR(80) NOT NULL DEFAULT 'test@mail.com',
  `mallpoints` INT UNSIGNED NOT NULL DEFAULT 10000000,
  `reg_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` TIMESTAMP NULL,
  `reg_ip` VARCHAR(15),
  `admin` TINYINT NOT NULL DEFAULT 0 COMMENT 'value from 0 to 10',
  `isGm` TINYINT NOT NULL DEFAULT 0 COMMENT '0 = normal user / 1 = game master or people with who can login in testing phase',
  `lastServerFarmId` TINYINT UNSIGNED NOT NULL DEFAULT 255 COMMENT 'default: INVALID_SERVERFARMID (255)',
  `founder` SMALLINT NOT NULL DEFAULT 0 COMMENT '0 = no founder / 1 = first founder / 2 = second / 3 = third',
  `founder_recv` SMALLINT NOT NULL DEFAULT 0 COMMENT '0 = founder not received / 1 = founder received',
  `last_ip` VARCHAR(16) NOT NULL DEFAULT '0.0.0.0',
  `del_char_pw` VARCHAR(32) NOT NULL DEFAULT '25f9e794323b453885f5181f1b624d0b',
  `PremiumSlots` TINYINT UNSIGNED NOT NULL DEFAULT 4,
  `EventCoins` INT UNSIGNED DEFAULT 0 COMMENT 'coins used to play on HLS event machine',
  `WaguCoins` INT UNSIGNED DEFAULT 0 COMMENT 'coins used to play on HLS slot machine',
  `web_ip` VARCHAR(15)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

Table "accounts_banned":
```sql
CREATE TABLE `accounts_banned` (
  `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `GM_AccId` INT UNSIGNED NOT NULL DEFAULT 0,
  `Banned_AccId` INT UNSIGNED NOT NULL DEFAULT 0,
  `DateTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reason` VARCHAR(1024) NOT NULL,
  `Duration` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Value in days. 255 = permanent',
  `Active` TINYINT NOT NULL DEFAULT 1 COMMENT '1 = true, 0 = false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

Table "cashshop_storage":
```sql
CREATE TABLE `cashshop_storage` (
  `ProductId` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `AccountID` INT UNSIGNED NOT NULL,
  `HLSitemTblidx` INT UNSIGNED NOT NULL,
  `StackCount` TINYINT UNSIGNED NOT NULL,
  `giftCharId` INT UNSIGNED,
  `IsRead` TINYINT NOT NULL DEFAULT 0,
  `SenderName` VARCHAR(16),
  `year` INT UNSIGNED NOT NULL,
  `month` TINYINT UNSIGNED NOT NULL,
  `day` TINYINT UNSIGNED NOT NULL,
  `hour` TINYINT UNSIGNED NOT NULL,
  `minute` TINYINT UNSIGNED NOT NULL,
  `second` TINYINT UNSIGNED NOT NULL,
  `millisecond` INT UNSIGNED NOT NULL,
  `isMoved` TINYINT NOT NULL DEFAULT 0 COMMENT 'BOOL. Did the player move the item to his inventory',
  `Buyer` INT UNSIGNED DEFAULT 0 COMMENT 'account id from the buyer',
  `price` INT UNSIGNED DEFAULT 0,
  `ItemID` BIGINT UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

Table "event_reward":
```sql
CREATE TABLE `event_reward` (
  `AccountID` INT UNSIGNED DEFAULT NULL,
  `rewardTblidx` INT UNSIGNED DEFAULT NULL,
  `CharID` INT UNSIGNED DEFAULT 0,
  `CharName` VARCHAR(15),
  UNIQUE KEY `AccountID` (`AccountID`, `rewardTblidx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

Table "shortcuts":
```sql
CREATE TABLE `shortcuts` (
  `AccountID` INT UNSIGNED NOT NULL,
  `ActionID` INT UNSIGNED NOT NULL DEFAULT 0,
  `wKey` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`AccountID`, `ActionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```