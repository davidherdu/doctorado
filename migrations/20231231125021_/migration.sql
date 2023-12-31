/*
  Warnings:

  - You are about to drop the column `pagina` on the `Nota` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Nota" DROP COLUMN "pagina",
ADD COLUMN     "paginas" TEXT NOT NULL DEFAULT '';
