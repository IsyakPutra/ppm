-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2017 at 05:12 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ppm`
--

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE IF NOT EXISTS `fakultas` (
  `id_fakultas` int(3) NOT NULL,
  `fakultas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE IF NOT EXISTS `guru` (
`id_guru` int(3) NOT NULL,
  `nama_lengkap` varchar(25) NOT NULL,
  `nama_panggilan` int(10) NOT NULL,
  `jenis_kelamin` enum('laki - laki','perempuan','','') NOT NULL,
  `tempat_lahir` int(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_asal` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id_guru`, `nama_lengkap`, `nama_panggilan`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `tempat_asal`) VALUES
(2, 'uhu', 0, 'laki - laki', 0, '0000-00-00', 'njn');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE IF NOT EXISTS `jurusan` (
`id_jurusan` int(11) NOT NULL,
  `jurusan` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `jurusan`) VALUES
(1, 'teknik informatika'),
(2, 'teknik mesin'),
(3, 'teknik otomotif'),
(4, 'Teknik kimia'),
(5, 'Ilmu Komputer'),
(6, 'Pendidikan Dokter'),
(7, 'Kedokteran Gigi'),
(8, 'Ilmu Hukum'),
(9, 'Fisika'),
(10, 'Kimia'),
(11, 'Matematika'),
(12, 'Pendidikan Olahraga'),
(13, 'Bahasa Inggris'),
(14, 'Bahasa Korea'),
(15, 'Bahasa Indonesia'),
(16, 'Fisika');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
`id_kelas` int(3) NOT NULL,
  `kelas` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`) VALUES
(1, 'Dasar'),
(3, 'Lanjut');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_parent` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`, `icon`, `is_active`, `is_parent`) VALUES
(29, 'Jurusan Kuliah', 'jurusan', 'fa fa-graduation-cap', 1, 30),
(30, 'Edit Kategori Siswa', 'siswa', 'fa fa-edit', 1, 0),
(32, 'Daftar Siswa', 'siswa', 'fa fa-mortar-board', 1, 0),
(35, 'Daftar Guru', 'guru', 'fa fa-user', 1, 0),
(37, 'KELOLA MANAJEMEN', 'menu', 'fa fa-gears', 1, 0),
(39, 'UNIVERSITAS', 'universitas', 'fa fa-gears', 1, 30),
(40, 'Kelas', 'kelas', 'fa fa-gears', 1, 30),
(42, 'Fakultas', 'fakultas', 'fa fa-gears', 1, 30);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE IF NOT EXISTS `nilai` (
  `id_siswa` int(3) NOT NULL,
  `nama_siswa` varchar(25) NOT NULL,
  `kelas` varchar(15) NOT NULL,
  `membaca` int(2) NOT NULL,
  `memaknai` int(2) NOT NULL,
  `menerangkan` int(2) NOT NULL,
  `uas1` int(2) NOT NULL,
  `uas2` int(2) NOT NULL,
  `uas3` int(22) NOT NULL,
  `uas4` int(2) NOT NULL,
  `uas5` int(2) NOT NULL,
  `uas6` int(2) NOT NULL,
  `uas7` int(2) NOT NULL,
  `uas8` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
`idreport` int(11) NOT NULL,
  `bulan` varchar(50) DEFAULT NULL,
  `nilai` int(2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`idreport`, `bulan`, `nilai`) VALUES
(1, 'mei', 30),
(2, 'juni', 40),
(3, 'agustus', 40),
(4, 'september', 90),
(5, 'desember', 70);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
`id` int(11) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `nama_panggilan` varchar(10) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `umur` int(2) NOT NULL,
  `jenis_kelamnin` enum('laki_laki','perempuan','','') NOT NULL,
  `golongan_darah` enum('A','B','AB','O','belum_tahu') NOT NULL,
  `alamat` text NOT NULL,
  `provinsi` varchar(25) NOT NULL,
  `kabupaten` varchar(25) NOT NULL,
  `kecamatan` varchar(25) NOT NULL,
  `nama_ayah` varchar(25) NOT NULL,
  `pekerjaan_ayah` varchar(25) NOT NULL,
  `nama_ibu` varchar(25) NOT NULL,
  `pekerjaan_ibu` varchar(25) NOT NULL,
  `jumlah_saudara` int(2) NOT NULL,
  `urutan` int(2) NOT NULL,
  `universitas` varchar(25) NOT NULL,
  `fakultas` varchar(30) NOT NULL,
  `prodi` varchar(50) NOT NULL,
  `id_jurusan` int(3) NOT NULL,
  `angkatan_universitas` year(4) NOT NULL,
  `tahun_masuk_universitas` year(4) NOT NULL,
  `angkatan_ppm` year(4) NOT NULL,
  `tahun_masuk_ppm` year(4) NOT NULL,
  `kelas` enum('pegon_bacaaan','lambatan','cepatan','pra_saringan') NOT NULL,
  `id_kelas` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nama_lengkap`, `nama_panggilan`, `tempat_lahir`, `tanggal_lahir`, `umur`, `jenis_kelamnin`, `golongan_darah`, `alamat`, `provinsi`, `kabupaten`, `kecamatan`, `nama_ayah`, `pekerjaan_ayah`, `nama_ibu`, `pekerjaan_ibu`, `jumlah_saudara`, `urutan`, `universitas`, `fakultas`, `prodi`, `id_jurusan`, `angkatan_universitas`, `tahun_masuk_universitas`, `angkatan_ppm`, `tahun_masuk_ppm`, `kelas`, `id_kelas`) VALUES
(1, 'tes', 'cb', 'jnk', '0000-00-00', 20, 'perempuan', 'O', 'njbj', 'mknk', 'nn', 'njnj', 'njn', 'njnj', 'njn', 'njnj', 3, 2, '', 'njn', 'njn', 0, 2014, 2014, 2014, 2014, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `universitas`
--

CREATE TABLE IF NOT EXISTS `universitas` (
`id_universitas` int(3) NOT NULL,
  `universitas` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `universitas`
--

INSERT INTO `universitas` (`id_universitas`, `universitas`) VALUES
(1, 'UGM'),
(2, 'kldfkv'),
(3, 'UNY');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(25) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` enum('admin','kepala','petugas','') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `email`, `password`, `level`) VALUES
(1, 'admin', 'admin@admin.com', 'admin', 'admin'),
(2, 'kepala', 'kepala@kepala.com', 'kepala', 'kepala'),
(3, 'petugas', 'petugas@petugas.com', 'petugas', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
 ADD PRIMARY KEY (`id_fakultas`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
 ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
 ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
 ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
 ADD PRIMARY KEY (`idreport`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universitas`
--
ALTER TABLE `universitas`
 ADD PRIMARY KEY (`id_universitas`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
MODIFY `id_guru` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
MODIFY `id_kelas` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
MODIFY `idreport` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `universitas`
--
ALTER TABLE `universitas`
MODIFY `id_universitas` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
