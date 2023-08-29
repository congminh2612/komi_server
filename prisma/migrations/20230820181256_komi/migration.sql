/*
  Warnings:

  - A unique constraint covering the columns `[password]` on the table `Users` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Users_password_key` ON `Users`(`password`);
