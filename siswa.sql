-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 13 Jan 2021 pada 06.35
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `nik` varchar(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`nik`, `nama`, `alamat`, `foto`, `username`, `password`, `level`) VALUES
('1532561257', 'admin', '\0', '', 'andi', 'andi', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `level_user`
--

CREATE TABLE `level_user` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `level_user`
--

INSERT INTO `level_user` (`id_level`, `nama_level`) VALUES
(1, 'admin'),
(2, 'guru'),
(3, 'siswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `Id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `bobot` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggaran`
--

INSERT INTO `pelanggaran` (`Id`, `nama`, `bobot`) VALUES
(1, 'PARAH', '30'),
(2, 'SEDANG', '20'),
(3, 'BIASA AJA', '5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `level` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `password`, `foto`, `level`, `nama`) VALUES
(1, 'admin', 'admin', 'admin', 1, 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian`
--

CREATE TABLE `penilaian` (
  `id_nilai` int(11) NOT NULL,
  `id_pelanggaran` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nis` varchar(30) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`id_nilai`, `id_pelanggaran`, `tanggal`, `nis`, `keterangan`) VALUES
(1, 2, '2018-05-13', '123456', 'anak anda sangat bangor'),
(2, 2, '2018-05-13', '123456', 'dsdsdsdsd');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `no_hp_ortu` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` int(11) NOT NULL,
  `kelas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `alamat`, `nik`, `no_hp_ortu`, `foto`, `username`, `password`, `level`, `kelas`) VALUES
('123', 'testing', 'testing', 'andi', 'sdsdsdsd', 'WIN_20170819_12_06_05_Pro.jpg', 'siswa', 'siswa', 3, '3'),
('123456', 'siswa', 'siswa', 'andi', '6767676766', 'WIN_20170819_12_05_59_Pro1.jpg', '123456', '123456', 3, '2'),
('14315136612', 'laura', 'padang', '1532561257', '081413256611', 'manager_keuangan.jpg', 'laura', 'laura', 3, 'IX');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai`
--
CREATE TABLE `v_nilai` (
`id_nilai` int(11)
,`alamat` varchar(30)
,`nama` varchar(30)
,`kelas` varchar(20)
,`tanggal` date
,`bobot` varchar(20)
,`nis` varchar(15)
,`keterangan` varchar(30)
,`no_hp_ortu` varchar(20)
,`tingakt_kenakalan` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_nilai`
--
DROP TABLE IF EXISTS `v_nilai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai`  AS  select `p`.`id_nilai` AS `id_nilai`,`s`.`alamat` AS `alamat`,`s`.`nama` AS `nama`,`s`.`kelas` AS `kelas`,`p`.`tanggal` AS `tanggal`,`pl`.`bobot` AS `bobot`,`s`.`nis` AS `nis`,`p`.`keterangan` AS `keterangan`,`s`.`no_hp_ortu` AS `no_hp_ortu`,`pl`.`nama` AS `tingakt_kenakalan` from ((`penilaian` `p` join `siswa` `s`) join `pelanggaran` `pl`) where ((`p`.`id_pelanggaran` = `pl`.`Id`) and (`p`.`nis` = `s`.`nis`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `level_user`
--
ALTER TABLE `level_user`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
