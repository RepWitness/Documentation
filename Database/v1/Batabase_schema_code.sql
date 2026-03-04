CREATE TABLE `User`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL,
    `Username` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    `PasswordHash` VARCHAR(255) NOT NULL,
    `PasswordSalt` VARCHAR(255) NOT NULL,
    `Gender` ENUM('') NOT NULL,
    `DateOfBirth` DATE NOT NULL,
    `Height` BIGINT NOT NULL,
    `Weight` FLOAT(53) NOT NULL,
    `RoleId` BIGINT NOT NULL,
    `IsDeleted` BOOLEAN NOT NULL
);
CREATE TABLE `Exercises`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Description` VARCHAR(255) NOT NULL,
    `CategoryId` BIGINT NOT NULL,
    `CreatedById` BIGINT NOT NULL,
    `IsDeleted` BOOLEAN NOT NULL
);
CREATE TABLE `Category`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Description` VARCHAR(255) NOT NULL,
    `IsDeleted` BOOLEAN NOT NULL
);
CREATE TABLE `Role`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Description` VARCHAR(255) NOT NULL,
    `IsDeleted` BOOLEAN NOT NULL
);
ALTER TABLE
    `Exercises` ADD CONSTRAINT `exercises_categoryid_foreign` FOREIGN KEY(`CategoryId`) REFERENCES `Category`(`id`);
ALTER TABLE
    `Exercises` ADD CONSTRAINT `exercises_isdeleted_foreign` FOREIGN KEY(`IsDeleted`) REFERENCES `User`(`id`);
ALTER TABLE
    `User` ADD CONSTRAINT `user_roleid_foreign` FOREIGN KEY(`RoleId`) REFERENCES `Role`(`id`);