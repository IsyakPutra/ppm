-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2017 at 08:33 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
`id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE IF NOT EXISTS `guru` (
`id_guru` int(3) NOT NULL,
  `nama_lengkap` varchar(25) NOT NULL,
  `nama_panggilan` int(10) NOT NULL,
  `tempat_lahir` int(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_asal` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id_guru`, `nama_lengkap`, `nama_panggilan`, `tempat_lahir`, `tanggal_lahir`, `tempat_asal`) VALUES
(2, 'uhu', 0, 0, '0000-00-00', 'njn');

-- --------------------------------------------------------

--
-- Table structure for table `jadwalku`
--

CREATE TABLE IF NOT EXISTS `jadwalku` (
`jadwal_id` int(10) NOT NULL,
  `tgl1` datetime NOT NULL,
  `tgl2` datetime NOT NULL,
  `judul` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwalku`
--

INSERT INTO `jadwalku` (`jadwal_id`, `tgl1`, `tgl2`, `judul`) VALUES
(1, '2017-05-01 11:26:25', '2017-05-03 08:23:24', 'Latihan '),
(9, '2017-04-30 08:23:23', '2017-04-30 18:35:23', 'Tes');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE IF NOT EXISTS `jurusan` (
`id_jurusan` int(11) NOT NULL,
  `jurusan` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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
(12, 'Pendidikan Olahraga');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
`id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`, `icon`, `is_active`, `is_parent`) VALUES
(29, 'Jurusan Kuliah', 'jurusan', 'fa fa-graduation-cap', 1, 30),
(30, 'Edit Kategori Siswa', 'siswa', 'fa fa-edit', 1, 0),
(32, 'Daftar Siswa', 'siswa', 'fa fa-child', 1, 0),
(35, 'Daftar Guru', 'guru', 'fa fa-child', 1, 0),
(37, 'Edit Data Siswa', 'menu', 'fa fa-gears', 1, 0),
(38, 'KELOLA NILAI AKADEMIK', 'nilai', 'fa fa-gears', 1, 0),
(39, 'UNIVERSITAS', 'universitas', 'fa fa-gears', 1, 30);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE IF NOT EXISTS `nilai` (
  `id_siswa` int(3) NOT NULL,
  `nama_siswa` varchar(25) NOT NULL,
  `kelas` varchar(15) NOT NULL,
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
-- Table structure for table `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
`id` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
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
  `universitas` varchar(30) NOT NULL,
  `fakultas` varchar(30) NOT NULL,
  `prodi` varchar(50) NOT NULL,
  `angkatan_universitas` year(4) NOT NULL,
  `tahun_masuk_universitas` year(4) NOT NULL,
  `angkatan_ppm` year(4) NOT NULL,
  `tahun_masuk_ppm` year(4) NOT NULL,
  `kelas` enum('pegon_bacaaan','lambatan','cepatan','pra_saringan') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `id_jurusan`, `nama_lengkap`, `nama_panggilan`, `tempat_lahir`, `tanggal_lahir`, `umur`, `jenis_kelamnin`, `golongan_darah`, `alamat`, `provinsi`, `kabupaten`, `kecamatan`, `nama_ayah`, `pekerjaan_ayah`, `nama_ibu`, `pekerjaan_ibu`, `jumlah_saudara`, `urutan`, `universitas`, `fakultas`, `prodi`, `angkatan_universitas`, `tahun_masuk_universitas`, `angkatan_ppm`, `tahun_masuk_ppm`, `kelas`) VALUES
(1, 1, 'tes', 'cb', 'jnk', '0000-00-00', 20, 'perempuan', 'O', 'njbj', 'mknk', 'nn', 'njnj', 'njn', 'njnj', 'njn', 'njnj', 3, 2, 'njn', 'njn', 'njn', 2014, 2014, 2014, 2014, '');

-- --------------------------------------------------------

--
-- Table structure for table `universitas`
--

CREATE TABLE IF NOT EXISTS `universitas` (
  `id_universitas` int(10) NOT NULL,
  `universitas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'isyak', '', NULL, NULL, '09L5vWsGO0aPYzcVtPcUe.', 1268889823, 1495261383, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '127.0.0.1', 'ojan', 'password', 'ojan', 'member', '7aa3364c2fa236a37cd98ab713ab5aa7297e85b3', '123', 12, '12', 12, 12, 0, 'ojan', 'ojan', 'ojan', '0843855859');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
`id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
 ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `jadwalku`
--
ALTER TABLE `jadwalku`
 ADD PRIMARY KEY (`jadwal_id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
 ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`), ADD KEY `fk_users_groups_users1_idx` (`user_id`), ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
MODIFY `id_guru` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jadwalku`
--
ALTER TABLE `jadwalku`
MODIFY `jadwal_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
