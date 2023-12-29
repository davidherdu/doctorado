/*
  Warnings:

  - You are about to drop the column `title` on the `Bibliografia` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Bibliografia` DROP COLUMN `title`,
    ADD COLUMN `anio` INTEGER NULL,
    ADD COLUMN `autor` VARCHAR(191) NOT NULL DEFAULT '',
    ADD COLUMN `paginas` VARCHAR(191) NOT NULL DEFAULT '',
    ADD COLUMN `revista` VARCHAR(191) NOT NULL DEFAULT '',
    ADD COLUMN `tipo` VARCHAR(191) NOT NULL DEFAULT 'draft',
    ADD COLUMN `titulo` VARCHAR(191) NOT NULL DEFAULT '';
