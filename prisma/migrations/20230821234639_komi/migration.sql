/*
  Warnings:

  - You are about to drop the column `role_id` on the `Users` table. All the data in the column will be lost.
  - Added the required column `user_id` to the `Role` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Users` DROP FOREIGN KEY `Users_role_id_fkey`;

-- AlterTable
ALTER TABLE `Role` ADD COLUMN `user_id` VARCHAR(50) NOT NULL;

-- AlterTable
ALTER TABLE `Users` DROP COLUMN `role_id`;

-- AddForeignKey
ALTER TABLE `Role` ADD CONSTRAINT `Role_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
