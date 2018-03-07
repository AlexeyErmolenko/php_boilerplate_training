# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases V9.1.3                     #
# Target DBMS:           MySQL 5                                         #
# Project file:          boilerplate_training_erd.dez         #
# Project name:          boilerplate_training                 #
# Author:                                                                #
# Script type:           Database drop script                            #
# Created on:            2017-07-28 01:24                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Drop foreign key constraints                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `users` DROP FOREIGN KEY `users_roles`;

ALTER TABLE `preferences` DROP FOREIGN KEY `preferences_users`;

ALTER TABLE `notification_settings` DROP FOREIGN KEY `notification_settings_users`;

ALTER TABLE `notification_settings` DROP FOREIGN KEY `notification_settings_notification_types`;

ALTER TABLE `notifications` DROP FOREIGN KEY `notifications_users`;

ALTER TABLE `notifications` DROP FOREIGN KEY `notifications_notification_types`;

ALTER TABLE `user_devices` DROP FOREIGN KEY `user_devices_users`;

# ---------------------------------------------------------------------- #
# Drop table "user_devices"                                              #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `user_devices` MODIFY `id` INTEGER UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `user_devices` DROP PRIMARY KEY;

DROP TABLE `user_devices`;

# ---------------------------------------------------------------------- #
# Drop table "notifications"                                             #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `notifications` MODIFY `id` INTEGER UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `notifications` DROP PRIMARY KEY;

DROP TABLE `notifications`;

# ---------------------------------------------------------------------- #
# Drop table "notification_settings"                                     #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `notification_settings` MODIFY `id` INTEGER UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `notification_settings` DROP PRIMARY KEY;

DROP TABLE `notification_settings`;

# ---------------------------------------------------------------------- #
# Drop table "preferences"                                               #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `preferences` MODIFY `id` INTEGER UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `preferences` DROP PRIMARY KEY;

DROP TABLE `preferences`;

# ---------------------------------------------------------------------- #
# Drop table "users"                                                     #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `users` MODIFY `id` INTEGER UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `users` DROP PRIMARY KEY;

DROP TABLE `users`;

# ---------------------------------------------------------------------- #
# Drop table "roles"                                                     #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `roles` MODIFY `id` TINYINT UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `roles` DROP PRIMARY KEY;

DROP TABLE `roles`;

# ---------------------------------------------------------------------- #
# Drop table "medias"                                                    #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `medias` MODIFY `id` INTEGER UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `medias` DROP PRIMARY KEY;

DROP TABLE `medias`;

# ---------------------------------------------------------------------- #
# Drop table "notification_types"                                        #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `notification_types` MODIFY `id` TINYINT UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `notification_types` DROP PRIMARY KEY;

DROP TABLE `notification_types`;
