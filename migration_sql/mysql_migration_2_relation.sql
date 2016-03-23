UPDATE `User_Account`
INNER JOIN `User_Profile` ON `User_Account`.`User_ID` = `User_Profile`.`User_ID`
SET `User_Account`.`first_name` = `User_Profile`.`First_Name`, `User_Account`.`last_name` = `User_Profile`.`Last_Name`

UPDATE `User_Pet`
INNER JOIN `User_Account` ON `User_Pet`.`User_ID` = `User_Account`.`User_ID`
SET `User_Pet`.`new_user_id` = `User_Account`.`id`

UPDATE `User_Pet`
INNER JOIN `Pet_Profile` ON `User_Pet`.`Pet_ID` = `Pet_Profile`.`Pet_ID`
SET `User_Pet`.`new_pet_id` = `Pet_Profile`.`id`

UPDATE `Pet_LostFound`
INNER JOIN `Pet_Profile` ON `Pet_LostFound`.`Pet_ID` = `Pet_Profile`.`Pet_ID`
SET `Pet_LostFound`.`new_pet_id` = `Pet_Profile`.`id`

UPDATE `Pet_LostFound`
INNER JOIN `User_Account` ON `Pet_LostFound`.`Create_By` = `User_Account`.`User_ID`
SET `Pet_LostFound`.`new_create_by_id` = `User_Account`.`id`

UPDATE `User_Follow_Lost`
INNER JOIN `User_Account` ON `User_Follow_Lost`.`User_ID` = `User_Account`.`User_ID`
SET `User_Follow_Lost`.`new_user_id` = `User_Account`.`id`

UPDATE `User_Follow_Lost`
INNER JOIN `Pet_Profile` ON `User_Follow_Lost`.`Pet_ID` = `Pet_Profile`.`Pet_ID`
SET `User_Follow_Lost`.`new_pet_id` = `Pet_Profile`.`id`

UPDATE `User_Follow_Lost`
INNER JOIN `Pet_LostFound` ON `User_Follow_Lost`.`Lost_ID` = `Pet_LostFound`.`Lost_ID`
SET `User_Follow_Lost`.`new_lost_id` = `Pet_LostFound`.`id`

UPDATE `DOTT_Device`
INNER JOIN `Pet_Profile` ON `DOTT_Device`.`Pet_ID` = `Pet_Profile`.`Pet_ID`
SET `Pet_Location`.`new_pet_id` = `Pet_Profile`.`id`

UPDATE `Pet_Location`
INNER JOIN `Pet_Profile` ON `Pet_Location`.`Pet_ID` = `Pet_Profile`.`Pet_ID`
SET `Pet_Location`.`new_pet_id` = `Pet_Profile`.`id`

UPDATE `Pet_Location`
INNER JOIN `User_Account` ON `Pet_Location`.`Seen_User_ID` = `User_Account`.`User_ID`
SET `Pet_Location`.`new_user_id` = `User_Account`.`id`

UPDATE `Pet_Location`
INNER JOIN `DOTT_Device` ON `Pet_Location`.`Pet_ID` = `DOTT_Device`.`Pet_ID`
SET `Pet_Location`.`new_device_id` = `DOTT_Device`.`id`

UPDATE `DOTT_Device`
INNER JOIN `Pet_Location` ON `Pet_Location`.`new_pet_id` = `DOTT_Device`.`new_pet_id`
SET `DOTT_Device`.`latitude` = `Pet_Location`.`Location_Lat`, `DOTT_Device`.`longitude` = `Pet_Location`.`Location_Lng`

UPDATE `User_Follow_Lost`
INNER JOIN `User_Account` ON `User_Follow_Lost`.`new_user_id` = `User_Account`.`id`
SET `User_Follow_Lost`.`confirm_user_exist` = `User_Account`.`id`

UPDATE `User_Follow_Lost`
INNER JOIN `Pet_LostFound` ON `User_Follow_Lost`.`new_lost_id` = `Pet_LostFound`.`id`
SET `User_Follow_Lost`.`confirm_report_exist` = `Pet_LostFound`.`id`

UPDATE `User_Follow_Lost`
INNER JOIN `Pet_LostFound` ON `User_Follow_Lost`.`new_lost_id` = `Pet_LostFound`.`id`
SET `User_Follow_Lost`.`confirm_created_by_exist` = `Pet_LostFound`.`new_create_by_id`


