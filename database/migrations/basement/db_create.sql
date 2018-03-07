# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases V9.1.3                     #
# Target DBMS:           MySQL 5                                         #
# Project file:          boilerplate_training_erd.dez         #
# Project name:          boilerplate_training                 #
# Author:                                                                #
# Script type:           Database creation script                        #
# Created on:            2017-07-28 01:24                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Add tables                                                             #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "notification_types"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `notification_types` (
    `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL,
    `default_on` BOOL NOT NULL,
    CONSTRAINT `PK_notification_types` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add table "medias"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `medias` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `thumbnail` VARCHAR(255) NULL,
    `full` VARCHAR(255) NOT NULL,
    `sequence` SMALLINT NULL,
    `mediable_id` INTEGER UNSIGNED NOT NULL,
    `mediable_type` VARCHAR(40) NOT NULL,
    CONSTRAINT `PK_medias` PRIMARY KEY (`id`)
);

CREATE INDEX `IDX_medias_mediable_id` ON `medias` (`mediable_id`,`mediable_type`,`sequence`);

# ---------------------------------------------------------------------- #
# Add table "roles"                                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `roles` (
    `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL,
    `slug` VARCHAR(40) NOT NULL,
    CONSTRAINT `PK_roles` PRIMARY KEY (`id`)
);

CREATE UNIQUE INDEX `IDX_roles_slug` ON `roles` (`slug`);

# ---------------------------------------------------------------------- #
# Add table "users"                                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `users` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(40) NOT NULL,
    `last_name` VARCHAR(40) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NULL,
    `gender` ENUM('Male', 'Female') NOT NULL,
    `facebook_id` VARCHAR(40) NULL,
    `instagram_id` VARCHAR(40) NULL,
    `avatar_url` VARCHAR(255) NULL,
    `role_id` TINYINT UNSIGNED NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    CONSTRAINT `PK_users` PRIMARY KEY (`id`)
);

CREATE UNIQUE INDEX `IDX_users_email_deleted_at` ON `users` (`email`,`deleted_at`);

# ---------------------------------------------------------------------- #
# Add table "preferences"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `preferences` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `notifications_push` BOOL NULL,
    `notifications_email` BOOL NULL,
    `updated_at` TIMESTAMP NULL,
    CONSTRAINT `PK_preferences` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add table "notification_settings"                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `notification_settings` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `notification_type_id` TINYINT UNSIGNED NOT NULL,
    `is_on` BOOL NOT NULL,
    CONSTRAINT `PK_notification_settings` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add table "notifications"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `notifications` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NULL,
    `notification_type_id` TINYINT UNSIGNED NULL,
    `subject` VARCHAR(40) NULL,
    `message` VARCHAR(500) NOT NULL,
    `is_viewed` BOOL NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `delivered_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    CONSTRAINT `PK_notifications` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add table "user_devices"                                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `user_devices` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `token` VARCHAR(40) NULL,
    `device_type` ENUM('ios', 'android') NULL,
    `created_at` DATETIME NOT NULL,
    CONSTRAINT `PK_user_devices` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `users` ADD CONSTRAINT `users_roles`
    FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

ALTER TABLE `preferences` ADD CONSTRAINT `preferences_users`
    FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `notification_settings` ADD CONSTRAINT `notification_settings_users`
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `notification_settings` ADD CONSTRAINT `notification_settings_notification_types`
    FOREIGN KEY (`notification_type_id`) REFERENCES `notification_types` (`id`);

ALTER TABLE `notifications` ADD CONSTRAINT `notifications_users`
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `notifications` ADD CONSTRAINT `notifications_notification_types`
    FOREIGN KEY (`notification_type_id`) REFERENCES `notification_types` (`id`);

ALTER TABLE `user_devices` ADD CONSTRAINT `user_devices_users`
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
