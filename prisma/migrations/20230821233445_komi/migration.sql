/*
  Warnings:

  - You are about to drop the column `usersId` on the `Role` table. All the data in the column will be lost.
  - Added the required column `role_id` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Role` DROP FOREIGN KEY `Role_usersId_fkey`;

-- AlterTable
ALTER TABLE `Role` DROP COLUMN `usersId`;

-- AlterTable
ALTER TABLE `Users` ADD COLUMN `role_id` VARCHAR(50) NOT NULL;

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `Role`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
