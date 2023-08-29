/*
  Warnings:

  - You are about to drop the column `createBy` on the `Blog` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `Blog` table. All the data in the column will be lost.
  - You are about to drop the column `createBy` on the `BlogCategory` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `BlogCategory` table. All the data in the column will be lost.
  - You are about to drop the column `createBy` on the `Brand` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `Brand` table. All the data in the column will be lost.
  - You are about to drop the column `createBy` on the `Category` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `Category` table. All the data in the column will be lost.
  - You are about to drop the column `createBy` on the `DiscountProduct` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `DiscountProduct` table. All the data in the column will be lost.
  - You are about to drop the column `createBy` on the `Discounts` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `Discounts` table. All the data in the column will be lost.
  - You are about to drop the column `createBy` on the `OrderDetail` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `OrderDetail` table. All the data in the column will be lost.
  - You are about to drop the column `createBy` on the `Orders` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `Orders` table. All the data in the column will be lost.
  - You are about to drop the column `createBy` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `createBy` on the `Users` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `Users` table. All the data in the column will be lost.
  - You are about to drop the column `createBy` on the `VoucherUser` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `VoucherUser` table. All the data in the column will be lost.
  - You are about to drop the column `createBy` on the `Vouchers` table. All the data in the column will be lost.
  - You are about to drop the column `updateBy` on the `Vouchers` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Blog` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;

-- AlterTable
ALTER TABLE `BlogCategory` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;

-- AlterTable
ALTER TABLE `Brand` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;

-- AlterTable
ALTER TABLE `Category` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;

-- AlterTable
ALTER TABLE `DiscountProduct` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;

-- AlterTable
ALTER TABLE `Discounts` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;

-- AlterTable
ALTER TABLE `OrderDetail` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;

-- AlterTable
ALTER TABLE `Orders` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;

-- AlterTable
ALTER TABLE `Product` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;

-- AlterTable
ALTER TABLE `Role` ADD COLUMN `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    ADD COLUMN `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0);

-- AlterTable
ALTER TABLE `RoleUser` ADD COLUMN `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    ADD COLUMN `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0);

-- AlterTable
ALTER TABLE `Users` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;

-- AlterTable
ALTER TABLE `VoucherUser` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;

-- AlterTable
ALTER TABLE `Vouchers` DROP COLUMN `createBy`,
    DROP COLUMN `updateBy`;
