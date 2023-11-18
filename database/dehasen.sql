-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Nov 2023 pada 15.52
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dehasen`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `nidn` int(10) NOT NULL,
  `tmpt_lahir` varchar(12) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `email` varchar(20) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `matkul` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `user_id`, `nama`, `nidn`, `tmpt_lahir`, `tgl_lahir`, `email`, `no_hp`, `matkul`) VALUES
(1, 1, 'muhammad', 124544544, 'riau', '1982-05-12', 'muhammad@gmail.com', '085645784574', 'pemograman terstrukt'),
(3, 1, 'hendra', 55421454, 'pekanbaru', '1977-05-04', 'hendra@gmail.com', '085366598745', 'metode numerik'),
(4, 1, 'selena', 55465874, 'batam', '1986-06-20', 'selena@gmail.com', '085854787784', 'kewirausahaan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_user`
--

CREATE TABLE `login_user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `login_user`
--

INSERT INTO `login_user` (`user_id`, `username`, `password`) VALUES
(1, 'dosen', 'dosen12'),
(2, 'mahasiswa', 'mahasiswa12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahsiswa`
--

CREATE TABLE `mahsiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `npm` int(10) NOT NULL,
  `tmpt_lahir` varchar(12) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `email` varchar(20) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahsiswa`
--

INSERT INTO `mahsiswa` (`id_mahasiswa`, `user_id`, `nama`, `npm`, `tmpt_lahir`, `tgl_lahir`, `email`, `no_hp`) VALUES
(1, 2, 'wendry saputra', 21010126, 'bengkulu', '1999-01-12', 'wendrysaputra93@gmai', '081541554818'),
(2, 2, 'johan', 12455512, 'johor', '1995-05-22', 'johan@gmail.com', '0844575545115'),
(3, 2, 'selina', 44541245, 'kota baru', '2000-04-25', 'selina@gmail.com', '08524457451542');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `login_user`
--
ALTER TABLE `login_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `mahsiswa`
--
ALTER TABLE `mahsiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `login_user`
--
ALTER TABLE `login_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `mahsiswa`
--
ALTER TABLE `mahsiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mahsiswa`
--
ALTER TABLE `mahsiswa`
  ADD CONSTRAINT `mahsiswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
