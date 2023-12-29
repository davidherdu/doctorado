/*
  Warnings:

  - You are about to drop the column `author` on the `Bibliografia` table. All the data in the column will be lost.
  - You are about to drop the column `content` on the `Bibliografia` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Nota` table. All the data in the column will be lost.
  - You are about to drop the `_Bibliografia_tags` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Bibliografia` DROP FOREIGN KEY `Bibliografia_author_fkey`;

-- DropForeignKey
ALTER TABLE `_Bibliografia_tags` DROP FOREIGN KEY `_Bibliografia_tags_A_fkey`;

-- DropForeignKey
ALTER TABLE `_Bibliografia_tags` DROP FOREIGN KEY `_Bibliografia_tags_B_fkey`;

-- AlterTable
ALTER TABLE `Bibliografia` DROP COLUMN `author`,
    DROP COLUMN `content`;

-- AlterTable
ALTER TABLE `Nota` DROP COLUMN `name`,
    ADD COLUMN `nota` JSON NOT NULL,
    ADD COLUMN `pagina` INTEGER NULL;

-- DropTable
DROP TABLE `_Bibliografia_tags`;

-- CreateTable
CREATE TABLE `Tag` (
    `id` VARCHAR(191) NOT NULL,
    `nombre` VARCHAR(191) NOT NULL DEFAULT '',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_Bibliografia_notas` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_Bibliografia_notas_AB_unique`(`A`, `B`),
    INDEX `_Bibliografia_notas_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_Nota_tags` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_Nota_tags_AB_unique`(`A`, `B`),
    INDEX `_Nota_tags_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_Bibliografia_notas` ADD CONSTRAINT `_Bibliografia_notas_A_fkey` FOREIGN KEY (`A`) REFERENCES `Bibliografia`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_Bibliografia_notas` ADD CONSTRAINT `_Bibliografia_notas_B_fkey` FOREIGN KEY (`B`) REFERENCES `Nota`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_Nota_tags` ADD CONSTRAINT `_Nota_tags_A_fkey` FOREIGN KEY (`A`) REFERENCES `Nota`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_Nota_tags` ADD CONSTRAINT `_Nota_tags_B_fkey` FOREIGN KEY (`B`) REFERENCES `Tag`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
