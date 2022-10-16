-- CreateTable
CREATE TABLE "Kelas" (
    "id_kelas" SERIAL NOT NULL,
    "tingkat" TEXT NOT NULL,
    "jurusan" TEXT NOT NULL,
    "nomor" TEXT NOT NULL,

    CONSTRAINT "Kelas_pkey" PRIMARY KEY ("id_kelas")
);

-- CreateTable
CREATE TABLE "User" (
    "id_user" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "name" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id_user")
);

-- CreateTable
CREATE TABLE "Siswa" (
    "id_siswa" SERIAL NOT NULL,
    "id_user" INTEGER NOT NULL,
    "id_kelas" INTEGER,

    CONSTRAINT "Siswa_pkey" PRIMARY KEY ("id_siswa")
);

-- CreateTable
CREATE TABLE "Admin" (
    "id_admin" SERIAL NOT NULL,
    "id_user" INTEGER NOT NULL,
    "tingkat" TEXT NOT NULL,

    CONSTRAINT "Admin_pkey" PRIMARY KEY ("id_admin")
);

-- CreateTable
CREATE TABLE "Kontrak" (
    "id_kontrak" SERIAL NOT NULL,
    "nama_pelanggaran" TEXT NOT NULL,
    "poin" INTEGER NOT NULL,

    CONSTRAINT "Kontrak_pkey" PRIMARY KEY ("id_kontrak")
);

-- CreateTable
CREATE TABLE "Pelanggaran" (
    "id_pelanggaran" SERIAL NOT NULL,
    "id_siswa" INTEGER NOT NULL,
    "id_admin" INTEGER NOT NULL,
    "id_kontrak" INTEGER NOT NULL,
    "bukti_foto" TEXT NOT NULL,
    "status" SMALLINT NOT NULL,

    CONSTRAINT "Pelanggaran_pkey" PRIMARY KEY ("id_pelanggaran")
);

-- CreateIndex
CREATE UNIQUE INDEX "Siswa_id_user_key" ON "Siswa"("id_user");

-- CreateIndex
CREATE UNIQUE INDEX "Admin_id_user_key" ON "Admin"("id_user");

-- AddForeignKey
ALTER TABLE "Siswa" ADD CONSTRAINT "Siswa_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "User"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Siswa" ADD CONSTRAINT "Siswa_id_kelas_fkey" FOREIGN KEY ("id_kelas") REFERENCES "Kelas"("id_kelas") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Admin" ADD CONSTRAINT "Admin_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "User"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pelanggaran" ADD CONSTRAINT "Pelanggaran_id_siswa_fkey" FOREIGN KEY ("id_siswa") REFERENCES "Siswa"("id_siswa") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pelanggaran" ADD CONSTRAINT "Pelanggaran_id_admin_fkey" FOREIGN KEY ("id_admin") REFERENCES "Admin"("id_admin") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pelanggaran" ADD CONSTRAINT "Pelanggaran_id_kontrak_fkey" FOREIGN KEY ("id_kontrak") REFERENCES "Kontrak"("id_kontrak") ON DELETE RESTRICT ON UPDATE CASCADE;
