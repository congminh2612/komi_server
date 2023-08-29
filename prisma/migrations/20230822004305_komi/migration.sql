/*
  Warnings:

  - You are about to drop the `RoleDetail` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[roleName]` on the table `Role` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `role` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `RoleDetail` DROP FOREIGN KEY `RoleDetail_role_id_fkey`;

-- DropForeignKey
ALTER TABLE `RoleDetail` DROP FOREIGN KEY `RoleDetail_user_id_fkey`;

-- AlterTable
ALTER TABLE `Role` MODIFY `roleName` VARCHAR(50) NOT NULL DEFAULT 'user';

-- AlterTable
ALTER TABLE `Users` ADD COLUMN `role` VARCHAR(50) NOT NULL;

-- DropTable
DROP TABLE `RoleDetail`;

-- CreateIndex
CREATE UNIQUE INDEX `Role_roleName_key` ON `Role`(`roleName`);

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_role_fkey` FOREIGN KEY (`role`) REFERENCES `Role`(`roleName`) ON DELETE RESTRICT ON UPDATE CASCADE;
