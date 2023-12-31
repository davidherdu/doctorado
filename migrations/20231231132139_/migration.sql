/*
  Warnings:

  - You are about to drop the column `nombre` on the `Tag` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Tag" DROP COLUMN "nombre",
ADD COLUMN     "palabra" TEXT NOT NULL DEFAULT '';
