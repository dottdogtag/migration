DROP TABLE IF EXISTS `Geo_Location`;

CREATE TABLE `Geo_Location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `new_lost_id` bigint(11) DEFAULT NULL,
  `new_pet_id` bigint(11) DEFAULT NULL,
  `new_user_id` bigint(11) DEFAULT NULL,
  `new_device_id` bigint(11) DEFAULT NULL,
  `Seen_Date` datetime DEFAULT NULL,
  `Location_Addr` varchar(50) DEFAULT NULL,
  `Location_Lng` varchar(20) DEFAULT NULL,
  `Location_Lat` varchar(20) DEFAULT NULL,
  `Proximity_Distance` decimal(9,0) DEFAULT NULL,
  `Create_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


INSERT INTO `Geo_Location` (`new_lost_id`, `new_pet_id`, `new_user_id`)
SELECT `id`, `new_pet_id`, `new_create_by_id`
FROM `Pet_LostFound`;


UPDATE `Geo_Location`
INNER JOIN `DOTT_Device` ON `Geo_Location`.`new_pet_id` = `DOTT_Device`.`new_pet_id`
SET `Geo_Location`.`new_device_id` = `DOTT_Device`.`id`;

UPDATE `Geo_Location`
INNER JOIN `Pet_Location` ON `Geo_Location`.`new_device_id` = `Pet_Location`.`new_device_id`
SET `Geo_Location`.`Seen_Date` = `Pet_Location`.`Seen_Date`,
`Geo_Location`.`Location_Addr` = `Pet_Location`.`Location_Addr`,
`Geo_Location`.`Location_Lng` = `Pet_Location`.`Location_Lng`,
`Geo_Location`.`Location_Lat` = `Pet_Location`.`Location_Lat`,
`Geo_Location`.`Proximity_Distance` = `Pet_Location`.`Proximity_Distance`,
`Geo_Location`.`Create_Date` = `Pet_Location`.`Create_Date`;
