-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "email" TEXT NOT NULL DEFAULT '',
    "password" TEXT NOT NULL,
    "isAdmin" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bibliografia" (
    "id" TEXT NOT NULL,
    "autor" TEXT NOT NULL DEFAULT '',
    "titulo" TEXT NOT NULL DEFAULT '',
    "anio" INTEGER,
    "fuente" TEXT NOT NULL DEFAULT '',
    "paginas" TEXT NOT NULL DEFAULT '',
    "tipo" TEXT NOT NULL DEFAULT 'draft',
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Bibliografia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Nota" (
    "id" TEXT NOT NULL,
    "pagina" INTEGER,
    "bibliografia" TEXT,
    "nota" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Nota_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tag" (
    "id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL DEFAULT '',
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Tag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_Nota_tags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "Nota_bibliografia_idx" ON "Nota"("bibliografia");

-- CreateIndex
CREATE UNIQUE INDEX "_Nota_tags_AB_unique" ON "_Nota_tags"("A", "B");

-- CreateIndex
CREATE INDEX "_Nota_tags_B_index" ON "_Nota_tags"("B");

-- AddForeignKey
ALTER TABLE "Nota" ADD CONSTRAINT "Nota_bibliografia_fkey" FOREIGN KEY ("bibliografia") REFERENCES "Bibliografia"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Nota_tags" ADD CONSTRAINT "_Nota_tags_A_fkey" FOREIGN KEY ("A") REFERENCES "Nota"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Nota_tags" ADD CONSTRAINT "_Nota_tags_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;
