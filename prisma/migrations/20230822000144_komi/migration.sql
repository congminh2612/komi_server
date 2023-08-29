/*
  Warnings:

  - You are about to drop the column `user_id` on the `Role` table. All the data in the column will be lost.
  - You are about to drop the `Permisson` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Permisson` DROP FOREIGN KEY `Permisson_role_id_fkey`;

-- DropForeignKey
ALTER TABLE `Role` DROP FOREIGN KEY `Role_user_id_fkey`;

-- AlterTable
ALTER TABLE `Role` DROP COLUMN `user_id`;

-- DropTable
DROP TABLE `Permisson`;

-- CreateTable
CREATE TABLE `RoleDetail` (
    `id` VARCHAR(50) NOT NULL,
    `role_id` VARCHAR(50) NOT NULL,
    `user_id` VARCHAR(50) NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `RoleDetail` ADD CONSTRAINT `RoleDetail_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `Role`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RoleDetail` ADD CONSTRAINT `RoleDetail_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
