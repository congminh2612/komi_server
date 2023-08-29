-- CreateTable
CREATE TABLE `Blog` (
    `id` VARCHAR(50) NOT NULL,
    `name` VARCHAR(250) NOT NULL,
    `seotitle` VARCHAR(250) NOT NULL,
    `status` BIT(1) NOT NULL,
    `image` VARCHAR(250) NOT NULL,
    `hot` DATETIME(0) NULL,
    `description` VARCHAR(500) NOT NULL,
    `detail` VARCHAR(250) NOT NULL,
    `viewCount` INTEGER NULL,
    `createBy` INTEGER NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `blogCategory_id` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BlogCategory` (
    `id` VARCHAR(50) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `seoTitle` VARCHAR(50) NOT NULL,
    `status` BIT(1) NOT NULL DEFAULT b'1',
    `parentId` INTEGER NOT NULL,
    `createBy` INTEGER NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NOT NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Brand` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `createBy` INTEGER NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NOT NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Category` (
    `category_id` VARCHAR(50) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `seoTitle` VARCHAR(50) NOT NULL,
    `status` BIT(1) NOT NULL DEFAULT b'1',
    `parentId` INTEGER NOT NULL,
    `createBy` INTEGER NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NOT NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`category_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Discounts` (
    `id` VARCHAR(50) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `voucher_start` DATETIME(0) NULL,
    `voucher_end` DATETIME(0) NULL,
    `createBy` INTEGER NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NOT NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DiscountProduct` (
    `id` VARCHAR(50) NOT NULL,
    `product_id` VARCHAR(50) NULL,
    `discount_id` VARCHAR(50) NOT NULL,
    `createBy` INTEGER NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NOT NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Vouchers` (
    `id` VARCHAR(50) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `voucher_start` DATETIME(0) NULL,
    `voucher_end` DATETIME(0) NULL,
    `createBy` INTEGER NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NOT NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `VoucherUser` (
    `id` VARCHAR(50) NOT NULL,
    `user_id` VARCHAR(50) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `voucher_id` VARCHAR(50) NOT NULL,
    `createBy` INTEGER NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NOT NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Orders` (
    `id` VARCHAR(50) NOT NULL,
    `orderDate` DATETIME(0) NOT NULL,
    `status` BIT(1) NOT NULL,
    `deliveryAddress` VARCHAR(100) NOT NULL,
    `delivered` BIT(1) NOT NULL,
    `deliveryDate` DATETIME(0) NULL,
    `user_id` VARCHAR(50) NULL,
    `createBy` INTEGER NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NOT NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderDetail` (
    `id` VARCHAR(50) NOT NULL,
    `order_id` VARCHAR(50) NOT NULL,
    `product_id` VARCHAR(45) NOT NULL,
    `productName` VARCHAR(45) NOT NULL,
    `price` DECIMAL(18, 0) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `createBy` INTEGER NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NOT NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `id` VARCHAR(50) NOT NULL,
    `name` VARCHAR(250) NOT NULL,
    `seotitle` VARCHAR(250) NOT NULL,
    `status` BIT(1) NOT NULL,
    `mainImage` VARCHAR(250) NOT NULL,
    `listImage` VARCHAR(250) NOT NULL,
    `price` DECIMAL(18, 0) NOT NULL DEFAULT 0,
    `promotionPrice` DECIMAL(18, 0) NOT NULL DEFAULT 0,
    `vat` BIT(1) NOT NULL DEFAULT b'0',
    `quantity` INTEGER NOT NULL DEFAULT 0,
    `warranty` INTEGER NOT NULL,
    `hot` DATETIME(0) NULL,
    `description` VARCHAR(500) NOT NULL,
    `detail` VARCHAR(250) NOT NULL,
    `viewCount` INTEGER NULL,
    `category_id` VARCHAR(50) NULL,
    `brand_id` VARCHAR(50) NULL,
    `supplier_id` VARCHAR(50) NULL,
    `createBy` INTEGER NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NOT NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Users` (
    `id` VARCHAR(50) NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `phone` VARCHAR(45) NOT NULL,
    `address` VARCHAR(250) NOT NULL,
    `createBy` INTEGER NOT NULL,
    `createAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateBy` INTEGER NOT NULL,
    `updateAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `Users_name_key`(`name`),
    UNIQUE INDEX `Users_email_key`(`email`),
    UNIQUE INDEX `Users_phone_key`(`phone`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Role` (
    `id` VARCHAR(50) NOT NULL,
    `roleName` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RoleUser` (
    `id` VARCHAR(50) NOT NULL,
    `role_id` VARCHAR(50) NOT NULL,
    `user_id` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Blog` ADD CONSTRAINT `Blog_blogCategory_id_fkey` FOREIGN KEY (`blogCategory_id`) REFERENCES `BlogCategory`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DiscountProduct` ADD CONSTRAINT `DiscountProduct_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DiscountProduct` ADD CONSTRAINT `DiscountProduct_discount_id_fkey` FOREIGN KEY (`discount_id`) REFERENCES `Discounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `VoucherUser` ADD CONSTRAINT `VoucherUser_voucher_id_fkey` FOREIGN KEY (`voucher_id`) REFERENCES `Vouchers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `VoucherUser` ADD CONSTRAINT `VoucherUser_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orders` ADD CONSTRAINT `Orders_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderDetail` ADD CONSTRAINT `OrderDetail_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Orders`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RoleUser` ADD CONSTRAINT `RoleUser_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `Role`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RoleUser` ADD CONSTRAINT `RoleUser_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
