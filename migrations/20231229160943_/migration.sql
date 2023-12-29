/*
  Warnings:

  - You are about to drop the `_Bibliografia_notas` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_Bibliografia_notas` DROP FOREIGN KEY `_Bibliografia_notas_A_fkey`;

-- DropForeignKey
ALTER TABLE `_Bibliografia_notas` DROP FOREIGN KEY `_Bibliografia_notas_B_fkey`;

-- AlterTable
ALTER TABLE `Nota` ADD COLUMN `bibliografia` VARCHAR(191) NULL;

-- DropTable
DROP TABLE `_Bibliografia_notas`;

-- CreateIndex
CREATE INDEX `Nota_bibliografia_idx` ON `Nota`(`bibliografia`);

-- AddForeignKey
ALTER TABLE `Nota` ADD CONSTRAINT `Nota_bibliografia_fkey` FOREIGN KEY (`bibliografia`) REFERENCES `Bibliografia`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
