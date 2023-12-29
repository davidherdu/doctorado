/*
  Warnings:

  - You are about to drop the column `revista` on the `Bibliografia` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Bibliografia` DROP COLUMN `revista`,
    ADD COLUMN `fuente` VARCHAR(191) NOT NULL DEFAULT '';
