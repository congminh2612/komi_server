/*
  Warnings:

  - You are about to drop the `RoleUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `RoleUser` DROP FOREIGN KEY `RoleUser_role_id_fkey`;

-- DropForeignKey
ALTER TABLE `RoleUser` DROP FOREIGN KEY `RoleUser_user_id_fkey`;

-- AlterTable
ALTER TABLE `Role` ADD COLUMN `usersId` VARCHAR(50) NULL;

-- DropTable
DROP TABLE `RoleUser`;

-- CreateTable
CREATE TABLE `Permisson` (
    `id` VARCHAR(50) NOT NULL,
    `action` VARCHAR(50) NOT NULL,
    `entity` VARCHAR(50) NOT NULL,
    `role_id` VARCHAR(50) NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Role` ADD CONSTRAINT `Role_usersId_fkey` FOREIGN KEY (`usersId`) REFERENCES `Users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Permisson` ADD CONSTRAINT `Permisson_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `Role`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
