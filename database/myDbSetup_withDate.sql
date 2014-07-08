-- phpMyAdmin SQL Dump
-- version 4.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jul 08, 2014 at 05:00 PM
-- Server version: 5.5.36
-- PHP Version: 5.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `habtm`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `created`, `modified`) VALUES
(2, 'post two', '2014-07-08 04:29:31', '2014-07-08 06:29:19'),
(3, 'post three', '2014-07-08 04:29:42', '2014-07-08 06:40:15'),
(4, 'post 4', '2014-07-08 04:29:51', '2014-07-08 06:40:06'),
(5, 'post 5', '2014-07-08 04:29:59', '2014-07-08 04:29:59'),
(6, 'post 6', '2014-07-08 04:30:09', '2014-07-08 07:00:28'),
(7, 'post 7', '2014-07-08 04:30:19', '2014-07-08 04:30:19'),
(8, 'post 8', '2014-07-08 04:30:28', '2014-07-08 04:30:28'),
(9, 'post 9', '2014-07-08 04:30:38', '2014-07-08 04:30:38'),
(10, 'post 10', '2014-07-08 04:30:47', '2014-07-08 04:30:47'),
(11, 'post 11', '2014-07-08 04:30:58', '2014-07-08 04:30:58'),
(12, 'post 12', '2014-07-08 04:31:13', '2014-07-08 04:31:13'),
(13, 'post 13', '2014-07-08 04:34:28', '2014-07-08 04:34:28'),
(14, 'post 13', '2014-07-08 04:35:50', '2014-07-08 04:35:50'),
(15, 'post 14', '2014-07-08 04:35:50', '2014-07-08 04:35:50'),
(16, 'post 15', '2014-07-08 04:35:50', '2014-07-08 04:35:50'),
(17, 'post 16', '2014-07-08 04:35:50', '2014-07-08 04:35:50'),
(18, 'post 17', '2014-07-08 04:35:50', '2014-07-08 04:35:50'),
(19, 'post 18', '2014-07-08 04:35:50', '2014-07-08 04:35:50'),
(20, 'post 19', '2014-07-08 04:35:50', '2014-07-08 04:35:50'),
(21, 'post 20', '2014-07-08 04:35:50', '2014-07-08 04:35:50'),
(22, 'post 21', '2014-07-08 04:35:51', '2014-07-08 04:35:51'),
(23, 'post 22', '2014-07-08 04:35:51', '2014-07-08 04:35:51'),
(24, 'post 23', '2014-07-08 04:35:51', '2014-07-08 04:35:51');

-- --------------------------------------------------------

--
-- Table structure for table `posts_tags`
--

CREATE TABLE IF NOT EXISTS `posts_tags` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_tags`
--

INSERT INTO `posts_tags` (`post_id`, `tag_id`) VALUES
(2, 1),
(4, 1),
(8, 1),
(11, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(3, 2),
(2, 3),
(3, 3),
(4, 3),
(9, 3),
(10, 3),
(12, 3),
(5, 4),
(6, 4),
(7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
`id` int(11) NOT NULL,
  `label` varchar(45) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `label`, `created`, `modified`) VALUES
(1, 'Music', '2013-02-06 06:27:44', '2013-02-06 06:27:44'),
(2, 'Economy', '2013-02-06 06:27:44', '2013-02-06 06:27:44'),
(3, 'Politics', '2013-02-06 06:27:59', '2013-02-06 06:27:59'),
(4, 'World', '2013-02-06 06:27:59', '2013-02-06 06:27:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts_tags`
--
ALTER TABLE `posts_tags`
 ADD PRIMARY KEY (`post_id`,`tag_id`), ADD KEY `fk_posts_has_tags_tags1` (`tag_id`), ADD KEY `fk_posts_has_tags_posts` (`post_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts_tags`
--
ALTER TABLE `posts_tags`
ADD CONSTRAINT `fk_posts_has_tags_posts` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_posts_has_tags_tags1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
