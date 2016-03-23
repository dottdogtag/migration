CREATE TABLE `DOTT_Device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `new_pet_id` bigint(11) DEFAULT NULL,
  `DOTT_No` varchar(20) NOT NULL,
  `Pet_ID` bigint(20) DEFAULT NULL,
  `UUID` varchar(50) NOT NULL,
  `Major` int(11) NOT NULL,
  `Minor` int(11) NOT NULL,
  `Remark` varchar(200) DEFAULT NULL,
  `Status` smallint(6) NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Last_Modify_Date` datetime NOT NULL,
  `Modified_By` bigint(20) NOT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DOTT_No`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `User_Profile` (
  `User_Profile_ID` bigint(20) NOT NULL,
  `User_ID` bigint(20) NOT NULL,
  `Avatar` varchar(80) DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Hometown` varchar(20) DEFAULT NULL,
  `District` varchar(100) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Mobile` varchar(30) DEFAULT NULL,
  `Birthday` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Language` varchar(10) DEFAULT NULL,
  `Accept_Ad` varchar(10) DEFAULT NULL,
  `Notification_Sound` varchar(10) DEFAULT NULL,
  `Notification_Vibrate` varchar(10) DEFAULT NULL,
  `Facebook_ID` varchar(50) DEFAULT NULL,
  `FollowAll` bit(1) DEFAULT NULL,
  `Create_Date` datetime NOT NULL,
  `Last_Modify_Date` datetime NOT NULL,
  `Modified_By` bigint(20) NOT NULL,
  PRIMARY KEY (`User_Profile_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Pet_Location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `new_pet_id` bigint(11) DEFAULT NULL,
  `new_user_id` bigint(11) DEFAULT NULL,
  `new_device_id` bigint(11) DEFAULT NULL,
  `Pet_Location_ID` bigint(20) NOT NULL,
  `Pet_ID` bigint(20) DEFAULT NULL,
  `Seen_User_ID` bigint(20) DEFAULT NULL,
  `Seen_Date` datetime NOT NULL,
  `Location_Addr` varchar(50) NOT NULL,
  `Location_Lng` varchar(20) DEFAULT NULL,
  `Location_Lat` varchar(20) DEFAULT NULL,
  `Proximity_Distance` decimal(9,0) NOT NULL,
  `Create_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Pet_Location_ID`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `Pet_LostFound` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `new_pet_id` bigint(20) DEFAULT NULL,
  `new_create_by_id` bigint(20) DEFAULT NULL,
  `Lost_ID` bigint(20) NOT NULL,
  `Pet_ID` bigint(20) NOT NULL,
  `Create_By` bigint(20) NOT NULL,
  `Contact` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Descript` tinytext,
  `Lost_Hometown` varchar(50) NOT NULL,
  `Status` int(11) NOT NULL,
  `Create_Date` datetime NOT NULL,
  PRIMARY KEY (`Lost_ID`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `Pet_Profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Pet_ID` bigint(20) NOT NULL,
  `Avatar` varchar(80) DEFAULT NULL,
  `Pet_Name` varchar(30) NOT NULL,
  `Species` varchar(20) DEFAULT NULL,
  `Breed` varchar(20) DEFAULT NULL,
  `MajorColour` varchar(50) DEFAULT NULL,
  `AnotherColour` varchar(50) DEFAULT NULL,
  `Sex` varchar(20) DEFAULT NULL,
  `Age` varchar(20) DEFAULT NULL,
  `Birthday` varchar(20) DEFAULT NULL,
  `FoodRequire` varchar(200) DEFAULT NULL,
  `OtherRequire` varchar(200) DEFAULT NULL,
  `MicrochipNo` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Is_Lost` bit(1) NOT NULL,
  `Status` smallint(6) NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Last_Modify_Date` datetime NOT NULL,
  `Modified_By` bigint(20) NOT NULL,
  PRIMARY KEY (`Pet_ID`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `User_Account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `User_ID` bigint(20) NOT NULL,
  `Account` varchar(80) NOT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Status` tinyint(1) NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Last_Modify_Date` datetime NOT NULL,
  `Modified_By` bigint(20) NOT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `User_Follow_Lost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `new_lost_id` bigint(11) DEFAULT NULL,
  `new_pet_id` bigint(11) DEFAULT NULL,
  `new_user_id` bigint(11) DEFAULT NULL,
  `User_Follow_ID` bigint(20) NOT NULL,
  `Lost_ID` bigint(20) NOT NULL,
  `Pet_ID` bigint(20) NOT NULL,
  `User_ID` bigint(20) NOT NULL,
  `Create_Date` datetime NOT NULL,
  `confirm_user_exist` bigint(11) DEFAULT NULL,
  `confirm_report_exist` bigint(11) DEFAULT NULL,
  `confirm_created_by_exist` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`User_Follow_ID`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `User_Pet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `User_Pet_ID` bigint(20) NOT NULL,
  `new_user_id` bigint(20) DEFAULT NULL,
  `new_pet_id` bigint(20) DEFAULT NULL,
  `User_ID` bigint(20) DEFAULT NULL,
  `Pet_ID` bigint(20) DEFAULT NULL,
  `Is_Master_Owner` bit(1) NOT NULL,
  `Status` smallint(6) NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Last_Modify_Date` datetime NOT NULL,
  `Modified_By` bigint(20) NOT NULL,
  PRIMARY KEY (`User_Pet_ID`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
