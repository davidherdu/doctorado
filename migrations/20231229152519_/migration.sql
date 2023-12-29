/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Tag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_Post_tags` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Post` DROP FOREIGN KEY `Post_author_fkey`;

-- DropForeignKey
ALTER TABLE `_Post_tags` DROP FOREIGN KEY `_Post_tags_A_fkey`;

-- DropForeignKey
ALTER TABLE `_Post_tags` DROP FOREIGN KEY `_Post_tags_B_fkey`;

-- DropTable
DROP TABLE `Post`;

-- DropTable
DROP TABLE `Tag`;

-- DropTable
DROP TABLE `_Post_tags`;

-- CreateTable
CREATE TABLE `Bibliografia` (
    `id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL DEFAULT '',
    `content` JSON NOT NULL,
    `author` VARCHAR(191) NULL,

    INDEX `Bibliografia_author_idx`(`author`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Nota` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL DEFAULT '',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_Bibliografia_tags` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_Bibliografia_tags_AB_unique`(`A`, `B`),
    INDEX `_Bibliografia_tags_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Bibliografia` ADD CONSTRAINT `Bibliografia_author_fkey` FOREIGN KEY (`author`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_Bibliografia_tags` ADD CONSTRAINT `_Bibliografia_tags_A_fkey` FOREIGN KEY (`A`) REFERENCES `Bibliografia`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_Bibliografia_tags` ADD CONSTRAINT `_Bibliografia_tags_B_fkey` FOREIGN KEY (`B`) REFERENCES `Nota`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
