-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 13, 2009 at 04:45 PM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bugtracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bugnote_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bugnote_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bugnote_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `date_submitted` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `last_modified` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `note_type` int(11) DEFAULT '0',
  `note_attr` varchar(250) DEFAULT '',
  `time_tracking` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bug` (`bug_id`),
  KEY `idx_last_mod` (`last_modified`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mantis_bugnote_table`
--

INSERT INTO `mantis_bugnote_table` (`id`, `bug_id`, `reporter_id`, `bugnote_text_id`, `view_state`, `date_submitted`, `last_modified`, `note_type`, `note_attr`, `time_tracking`) VALUES
(1, 1, 2, 1, 10, '2008-10-04 11:02:47', '2008-10-04 17:04:40', 0, '', 0),
(3, 2, 2, 3, 10, '2008-10-04 17:06:06', '2008-10-04 17:06:06', 0, '', 0),
(4, 9, 2, 4, 10, '2008-10-04 22:31:49', '2008-10-04 22:31:49', 0, '', 0),
(5, 10, 2, 5, 10, '2008-10-06 01:41:17', '2008-10-06 01:41:17', 0, '', 0),
(6, 6, 2, 6, 10, '2008-10-06 21:45:17', '2008-10-06 21:45:17', 0, '', 0),
(7, 4, 2, 7, 10, '2008-10-06 22:40:11', '2008-10-06 22:40:11', 0, '', 0),
(8, 8, 2, 8, 10, '2008-10-06 23:38:43', '2008-10-06 23:38:43', 0, '', 0),
(9, 12, 2, 9, 10, '2008-10-13 16:48:48', '2008-10-13 16:48:48', 0, '', 0),
(10, 14, 2, 10, 10, '2008-10-13 17:03:40', '2008-10-13 17:03:40', 0, '', 0),
(11, 13, 2, 11, 10, '2008-10-18 16:33:46', '2008-10-18 16:33:46', 0, '', 0),
(12, 15, 2, 12, 10, '2008-10-18 16:44:07', '2008-10-18 16:44:07', 0, '', 0),
(13, 11, 2, 13, 10, '2009-04-20 03:58:50', '2009-04-20 12:07:07', 0, '', 0),
(15, 21, 2, 15, 10, '2009-07-10 10:32:10', '2009-07-10 10:32:10', 0, '', 0),
(16, 10, 2, 16, 10, '2009-07-10 11:54:35', '2009-07-10 11:54:35', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bugnote_text_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bugnote_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mantis_bugnote_text_table`
--

INSERT INTO `mantis_bugnote_text_table` (`id`, `note`) VALUES
(1, 'Solution implemented: In frameops.py, OnFrameShow, username box logic has name shown always reset to name saved in config, which is updated every time a sign in succeeds.\n\n'),
(3, 'Solution implemented: Removed config setting from configops.py, and removed frame setting from frameops.py.'),
(4, 'Signing in is easier for user to do than copying the user ID, it involves fewer steps.'),
(5, 'Changed twirlpaper/engine/lib/users.php function generate_user_password and netops.py.'),
(6, 'Added ~wx.RESIZE_BORDER & ~wx.MAXIMIZE_BOX to frameops.py''s FrameOps class''s wx.Frame.__init__''s style.\r\n\r\nThis not only stops window resizing by dragging window corners, it stops maximizing by clicking the maximize corner button or right clicking on the left corner icon or taskbar icon.'),
(7, 'Code in tloginreq.php now generates and saves the user ID, and sends it to the client.  Code in netops.py now parses the response for user ID, and shows sign in status on frame.'),
(8, 'Created new nonce table and added nonce addition and deletion code in tloginreq.php.'),
(9, 'frameops.py edited to send only updated values to netops.py'),
(10, 'From [wxpython-users]:\r\n\r\nIf you are not worried about portability to Mac then you can probably \r\nstill handle the mouse events yourself in the taskbar icon, and then \r\npopup the menu yourself.  Then you''ll know when it is active or not. \r\nThis is how the taskbar icon used to work, but because that model didn''t \r\nfit with the dock icons on Mac it had to be adjusted to use the \r\nCreatePopupMenu interface instead.'),
(11, 'Set flagimage to false in TimerOps when new image loads.'),
(12, 'Client pops up error message and closes frame.'),
(13, 'http://stackoverflow.com/questions/638124/cron-like-system-for-windows\r\n\r\n1. Write a PHP file which performs the task of import, export or whatever interaction you want to perform, and make sure you can execute the PHP from command line, similar to >php phptaskname.php\r\n2. Schedule the task in Windows Task Scheduler, may be you want to create a .bat file with the command line as in point 1 and Task Scheduler can call your batch file at the scheduled time.\r\nhttp://www.sitepoint.com/print/php-command-line-1/\n\n'),
(15, 'Research has found Coppermine to be a good replacement. View attached file for details.'),
(16, 'Coppermine has this issue as well');

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_file_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `idx_bug_file_bug_id` (`bug_id`),
  KEY `idx_diskfile` (`diskfile`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mantis_bug_file_table`
--

INSERT INTO `mantis_bug_file_table` (`id`, `bug_id`, `title`, `description`, `diskfile`, `filename`, `folder`, `filesize`, `file_type`, `date_added`, `content`) VALUES
(1, 21, '', '', '6cdba69c125218579e6dc24ff9c8c19d', 'image gallery select.txt', '', 2976, 'text/plain', '2009-07-10 10:28:36', 0x4261736564206f6e0d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f436f6d70617269736f6e5f6f665f70686f746f5f67616c6c6572795f736f6674776172650d0a4920656c696d696e617465642063686f6963657320746861742077657265206e6f74204f535320616e6420636f737420667265652c20616e642074686f736520776974686f75740d0a726174696e67206f72206d756c7469706c652075736572206361706162696c69746965732e0d0a0d0a5468652072656d61696e696e672063686f69636573206172650d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f436f707065726d696e655f50686f746f5f47616c6c6572790d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f50697769676f0d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f54696e7957656247616c6c6572790d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f5a656e70686f746f0d0a0d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f54696e7957656247616c6c6572790d0a656c696d696e617465642062656361757365206d6f73742073657474696e67732061726520646f6e652062792065646974696e67207478742066696c6573206f6e20746865207365727665722c206e6f742061636365737369626c6520746f2067656e6572616c2075736572730d0a0d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f5a656e70686f746f0d0a656c696d696e6174656420626563617573652067756573742075736572732061726520666f722076696577696e67206f6e6c792c206e6f2075706c6f6164206361706162696c69746965730d0a0d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f50697769676f0d0a6b696e64206f6620776f726b732c206275742074686572652773206e6f2068617368696e67206f662066696c6573206e616d657320746f2070726576656e7420636f6c6c6973696f6e732c2065766572797468696e672069732064756d70656420696e206f6e65206469726563746f72792077686963682068617320746f2062652063726561746564206279207468652061646d696e0d0a2d2043686f6b6573206f6e2066696c656e616d65732077697468207370616365730d0a2d20576f756c64206861766520746f20616c74657220636f646520666f72206175746f206469726563746f72792067656e65726174696f6e20616e64206175746f2075706c6f616420617574686f72697a6174696f6e3a205573657244697220706c7567696e0d0a2d20576f756c64206e65656420746f206c696d69742075706c6f616420746f20757365722773206469726563746f7279206f6e6c793a205573657244697220706c7567696e0d0a2d20576f756c64206e65656420746f206769766520757365727320746865206162696c69747920746f20637265617465207375622d63617465676f726965733f0d0a2d20576f756c64207468656e206e65656420746f2064697361626c6520704c6f61646572206361706162696c69746965730d0a2d20576f756c64206e65656420746f2068617665206d656469756d207468756d626e61696c20666f72207765622076696577696e670d0a2d20436f756c6420696e636f72706f726174652075706c6f6164696e6720696e746f20636c69656e740d0a2d20576f756c64206265206e69636520746f2068617665207765622075706c6f616420696e746572666163652061732077656c6c0d0a2d20576f756c64206e65656420746f206c696d6974206e756d626572206f662075706c6f6164733f0d0a2d20496e7374616c6c696e672055736572446972206f6e2076322e302e322062726f6b652074686520736f667477617265210d0a2b204d7953514c207461626c6520666f7220696d6167657320616c726561647920636f6e7461696e207061746820746f20696d6167652c207573652072617465207461626c6520746f2063616c63756c61746520696d6167652073656c656374696f6e2c2067657420656c656d656e742069642c207468656e207265666572656e636520656c656d656e7420696420746f20696d616765207461626c650d0a2b20496e7465726661636520746f20666f72756d733a2052656769737465725f466c757842422052656769737465725f50687042422052656769737465725f50756e4242204c696e6b557365723250756e424220706c7567696e0d0a0d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f436f707065726d696e655f50686f746f5f47616c6c6572790d0a2d20526174696e6720766f746573206e6f7420657370656369616c6c7920636c65617220696e204d7953514c207461626c650d0a2b20416c6c6f777320757365727320746f2075706c6f6164207669612077656220696e746572666163650d0a2b20416c6c6f77732066696c65206e616d65732077697468207370616365730d0a2b20496e7465726661636520746f20666f72756d733a0d0a202020202020202020206f20496e766973696f6e20506f77657220426f6172640d0a202020202020202020206f204d616d626f0d0a202020202020202020206f204d7942420d0a202020202020202020206f20706870424220320d0a202020202020202020206f2050686f72756d0d0a202020202020202020206f2050756e42420d0a202020202020202020206f20534d4620312e780d0a202020202020202020206f20534d4620322e780d0a202020202020202020206f207642756c6c6574696e0d0a202020202020202020206f20584d420d0a202020202020202020206f20586f6f7073320d0a2b204d7953514c207461626c6520666f7220696d6167657320616c726561647920636f6e7461696e207061746820746f20696d6167650d0a0d0a0d0a436f707065726d696e652077696e7320627920617474726974696f6e2e0d0a0d0a466f72756d20736f6674776172653a0d0a202020202020202020206f20496e766973696f6e20506f77657220426f6172640d0a09094e6f74204f53530d0a202020202020202020206f204d616d626f0d0a090946756c6c20434d530d0a202020202020202020206f20706870424220320d0a0909446576656c6f706d656e742073746f707065642c2050485035206e6f74206f6666696369616c6c7920737570706f727465640d0a202020202020202020206f20534d4620312e780d0a09094e6f74204f53530d0a202020202020202020206f20534d4620322e780d0a09094e6f74204f53530d0a202020202020202020206f207642756c6c6574696e0d0a09094e6f74204f53530d0a202020202020202020206f20586f6f7073320d0a090946756c6c20434d530d0a0d0a202020202020202020206f204d7942420d0a202020202020202020206f2050686f72756d0d0a202020202020202020206f2050756e42420d0a202020202020202020206f20584d420d0a687474703a2f2f7777772e666f72756d6d61747269782e6f72672f636f6d706172652f4d7942422b50686f72756d2b70756e42422b584d420d0a687474703a2f2f7777772e666f72756d2d736f6674776172652e6f72672f666f72756d2d636f6d70617261746f722f65787472656d652d6d6573736167652d626f6172642d76732d6d7962622d76732d70686f72756d2d76732d70756e62620d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f436f6d70617269736f6e5f6f665f496e7465726e65745f666f72756d5f736f6674776172655f28504850290d0a0d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f4d7942420d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f50686f72756d0d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f50756e42420d0a687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f584d425f28666f72756d290d0a);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_history_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_history_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_modified` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `field_name` varchar(64) NOT NULL,
  `old_value` varchar(255) NOT NULL,
  `new_value` varchar(255) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bug_history_bug_id` (`bug_id`),
  KEY `idx_history_user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `mantis_bug_history_table`
--

INSERT INTO `mantis_bug_history_table` (`id`, `user_id`, `bug_id`, `date_modified`, `field_name`, `old_value`, `new_value`, `type`) VALUES
(1, 2, 1, '2008-10-02 23:37:24', '', '', '', 1),
(2, 2, 2, '2008-10-02 23:47:19', '', '', '', 1),
(3, 2, 3, '2008-10-02 23:58:25', '', '', '', 1),
(4, 2, 4, '2008-10-03 20:03:52', '', '', '', 1),
(5, 2, 5, '2008-10-04 10:17:55', '', '', '', 1),
(6, 2, 2, '2008-10-04 10:49:16', 'status', '10', '80', 0),
(7, 2, 2, '2008-10-04 10:49:16', 'resolution', '10', '20', 0),
(8, 2, 2, '2008-10-04 10:49:16', 'handler_id', '0', '2', 0),
(9, 2, 2, '2008-10-04 10:50:04', 'status', '80', '90', 0),
(10, 2, 1, '2008-10-04 11:02:47', '', '0000001', '', 2),
(11, 2, 1, '2008-10-04 11:02:47', 'status', '10', '80', 0),
(12, 2, 1, '2008-10-04 11:02:47', 'resolution', '10', '20', 0),
(13, 2, 1, '2008-10-04 11:02:47', 'handler_id', '0', '2', 0),
(14, 2, 1, '2008-10-04 11:03:04', 'status', '80', '90', 0),
(15, 2, 5, '2008-10-04 14:41:17', '', '0000002', '', 2),
(16, 2, 6, '2008-10-04 16:58:17', '', '', '', 1),
(17, 2, 4, '2008-10-04 16:59:10', 'severity', '10', '60', 0),
(18, 2, 3, '2008-10-04 17:00:01', 'severity', '10', '50', 0),
(19, 2, 2, '2008-10-04 17:00:50', 'severity', '10', '50', 0),
(20, 2, 5, '2008-10-04 17:02:37', 'severity', '10', '50', 0),
(21, 2, 5, '2008-10-04 17:03:15', '', '', '', 7),
(22, 2, 5, '2008-10-04 17:03:28', '', '0000002', '', 4),
(23, 2, 1, '2008-10-04 17:04:40', '', '0000001', '', 3),
(24, 2, 2, '2008-10-04 17:06:06', '', '0000003', '', 2),
(25, 2, 3, '2008-10-04 17:07:25', 'severity', '50', '10', 0),
(26, 2, 7, '2008-10-04 17:11:35', '', '', '', 1),
(27, 2, 8, '2008-10-04 18:45:14', '', '', '', 1),
(28, 2, 9, '2008-10-04 22:30:07', '', '', '', 1),
(29, 2, 9, '2008-10-04 22:31:49', '', '0000004', '', 2),
(30, 2, 9, '2008-10-04 22:31:49', 'status', '10', '90', 0),
(31, 2, 9, '2008-10-04 22:31:49', 'resolution', '10', '90', 0),
(32, 2, 10, '2008-10-05 23:39:46', '', '', '', 1),
(33, 2, 10, '2008-10-06 01:41:17', '', '0000005', '', 2),
(34, 2, 10, '2008-10-06 01:41:17', 'status', '10', '80', 0),
(35, 2, 10, '2008-10-06 01:41:17', 'resolution', '10', '20', 0),
(36, 2, 10, '2008-10-06 01:41:17', 'handler_id', '0', '2', 0),
(37, 2, 10, '2008-10-06 01:41:51', 'status', '80', '90', 0),
(38, 2, 6, '2008-10-06 21:45:17', '', '0000006', '', 2),
(39, 2, 6, '2008-10-06 21:45:17', 'status', '10', '80', 0),
(40, 2, 6, '2008-10-06 21:45:17', 'resolution', '10', '20', 0),
(41, 2, 6, '2008-10-06 21:45:17', 'handler_id', '0', '2', 0),
(42, 2, 6, '2008-10-06 21:45:33', 'status', '80', '90', 0),
(43, 2, 9, '2008-10-06 21:49:02', 'category', 'Client', 'Client/Server', 0),
(44, 2, 10, '2008-10-06 21:49:29', 'category', 'Server', 'Client/Server', 0),
(45, 2, 4, '2008-10-06 21:51:00', 'category', 'Client', 'Client/Server', 0),
(46, 2, 4, '2008-10-06 21:51:00', '', '', '', 6),
(47, 2, 4, '2008-10-06 22:40:11', '', '0000007', '', 2),
(48, 2, 4, '2008-10-06 22:40:11', 'status', '10', '80', 0),
(49, 2, 4, '2008-10-06 22:40:11', 'resolution', '10', '20', 0),
(50, 2, 4, '2008-10-06 22:40:11', 'handler_id', '0', '2', 0),
(51, 2, 4, '2008-10-06 22:40:47', 'status', '80', '90', 0),
(52, 2, 11, '2008-10-06 23:37:48', '', '', '', 1),
(53, 2, 8, '2008-10-06 23:38:43', '', '0000008', '', 2),
(54, 2, 8, '2008-10-06 23:38:43', 'status', '10', '80', 0),
(55, 2, 8, '2008-10-06 23:38:44', 'resolution', '10', '20', 0),
(56, 2, 8, '2008-10-06 23:38:44', 'handler_id', '0', '2', 0),
(57, 2, 12, '2008-10-07 23:51:57', '', '', '', 1),
(58, 2, 13, '2008-10-08 20:54:17', '', '', '', 1),
(59, 2, 5, '2008-10-08 20:54:59', 'reproducibility', '100', '10', 0),
(60, 2, 12, '2008-10-13 16:48:48', '', '0000009', '', 2),
(61, 2, 12, '2008-10-13 16:48:48', 'status', '10', '80', 0),
(62, 2, 12, '2008-10-13 16:48:48', 'resolution', '10', '20', 0),
(63, 2, 12, '2008-10-13 16:48:48', 'handler_id', '0', '2', 0),
(64, 2, 14, '2008-10-13 17:00:19', '', '', '', 1),
(65, 2, 14, '2008-10-13 17:03:40', '', '0000010', '', 2),
(66, 2, 15, '2008-10-14 09:04:06', '', '', '', 1),
(67, 2, 15, '2008-10-14 20:37:48', 'severity', '50', '60', 0),
(68, 2, 15, '2008-10-14 20:37:48', '', '', '', 7),
(69, 2, 15, '2008-10-14 20:38:24', 'reproducibility', '70', '10', 0),
(70, 2, 16, '2008-10-18 12:07:05', '', '', '', 1),
(71, 2, 16, '2008-10-18 15:15:44', '', '', '', 7),
(72, 2, 17, '2008-10-18 15:17:21', '', '', '', 1),
(73, 2, 13, '2008-10-18 16:33:46', '', '0000011', '', 2),
(74, 2, 13, '2008-10-18 16:33:46', 'status', '10', '80', 0),
(75, 2, 13, '2008-10-18 16:33:46', 'resolution', '10', '20', 0),
(76, 2, 13, '2008-10-18 16:33:46', 'handler_id', '0', '2', 0),
(77, 2, 18, '2008-10-18 16:36:18', '', '', '', 1),
(78, 2, 15, '2008-10-18 16:44:07', '', '0000012', '', 2),
(79, 2, 15, '2008-10-18 16:44:07', 'status', '10', '80', 0),
(80, 2, 15, '2008-10-18 16:44:07', 'resolution', '10', '20', 0),
(81, 2, 15, '2008-10-18 16:44:07', 'handler_id', '0', '2', 0),
(82, 2, 17, '2008-12-27 13:11:23', '', '', '', 7),
(83, 2, 19, '2008-12-27 13:15:26', '', '', '', 1),
(84, 2, 20, '2009-01-03 12:21:42', '', '', '', 1),
(85, 2, 11, '2009-04-20 03:58:50', '', '0000013', '', 2),
(86, 2, 11, '2009-04-20 12:07:07', '', '0000013', '', 3),
(87, 2, 21, '2009-07-10 10:23:53', '', '', '', 1),
(88, 2, 21, '2009-07-10 10:28:36', '', 'image gallery select.txt', '', 9),
(89, 2, 21, '2009-07-10 10:29:38', '', '0000014', '', 2),
(90, 2, 21, '2009-07-10 10:31:18', '', '0000014', '', 4),
(91, 2, 21, '2009-07-10 10:31:34', '', '2', '', 12),
(92, 2, 21, '2009-07-10 10:32:10', '', '0000015', '', 2),
(93, 2, 21, '2009-07-10 10:32:10', 'status', '10', '80', 0),
(94, 2, 21, '2009-07-10 10:32:10', 'resolution', '10', '20', 0),
(95, 2, 21, '2009-07-10 10:32:10', 'handler_id', '0', '2', 0),
(96, 2, 10, '2009-07-10 11:54:35', '', '0000016', '', 2),
(97, 2, 10, '2009-07-10 11:54:35', 'status', '90', '20', 0),
(98, 2, 10, '2009-07-10 11:54:35', 'resolution', '20', '30', 0),
(99, 2, 10, '2009-07-13 16:44:33', 'handler_id', '2', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_monitor_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_monitor_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mantis_bug_monitor_table`
--

INSERT INTO `mantis_bug_monitor_table` (`user_id`, `bug_id`) VALUES
(2, 21);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_relationship_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_relationship_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `destination_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `relationship_type` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_relationship_source` (`source_bug_id`),
  KEY `idx_relationship_destination` (`destination_bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mantis_bug_relationship_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `handler_id` int(10) unsigned NOT NULL DEFAULT '0',
  `duplicate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` smallint(6) NOT NULL DEFAULT '30',
  `severity` smallint(6) NOT NULL DEFAULT '50',
  `reproducibility` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `resolution` smallint(6) NOT NULL DEFAULT '10',
  `projection` smallint(6) NOT NULL DEFAULT '10',
  `category` varchar(64) NOT NULL DEFAULT '',
  `date_submitted` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `last_updated` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `eta` smallint(6) NOT NULL DEFAULT '10',
  `bug_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '',
  `fixed_in_version` varchar(64) NOT NULL DEFAULT '',
  `build` varchar(32) NOT NULL DEFAULT '',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `summary` varchar(128) NOT NULL DEFAULT '',
  `sponsorship_total` int(11) NOT NULL DEFAULT '0',
  `sticky` tinyint(4) NOT NULL DEFAULT '0',
  `target_version` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_bug_sponsorship_total` (`sponsorship_total`),
  KEY `idx_bug_fixed_in_version` (`fixed_in_version`),
  KEY `idx_bug_status` (`status`),
  KEY `idx_project` (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `mantis_bug_table`
--

INSERT INTO `mantis_bug_table` (`id`, `project_id`, `reporter_id`, `handler_id`, `duplicate_id`, `priority`, `severity`, `reproducibility`, `status`, `resolution`, `projection`, `category`, `date_submitted`, `last_updated`, `eta`, `bug_text_id`, `os`, `os_build`, `platform`, `version`, `fixed_in_version`, `build`, `profile_id`, `view_state`, `summary`, `sponsorship_total`, `sticky`, `target_version`) VALUES
(1, 1, 2, 2, 0, 40, 60, 10, 90, 20, 10, 'Client', '2008-10-02 23:37:24', '2008-10-04 11:03:04', 10, 1, '', '', '', '', '', '', 0, 10, 'Username stored in variable different from username displayed', 0, 0, ''),
(2, 1, 2, 2, 0, 30, 50, 100, 90, 20, 10, 'Client', '2008-10-02 23:47:19', '2008-10-04 17:06:06', 10, 2, '', '', '', '', '', '', 0, 10, 'Remove "Remember me" from sign in menu', 0, 0, ''),
(3, 1, 2, 0, 0, 30, 10, 100, 10, 10, 10, 'Server', '2008-10-02 23:58:25', '2008-10-04 17:07:25', 10, 3, '', '', '', '', '', '', 0, 10, 'Confirm that login page hashes password so it''s not sent in cleartext', 0, 0, ''),
(4, 1, 2, 2, 0, 30, 60, 100, 90, 20, 10, 'Client/Server', '2008-10-03 20:03:52', '2008-10-06 22:40:47', 10, 4, '', '', '', '', '', '', 0, 10, 'Indicate success or failure of login', 0, 0, ''),
(5, 1, 2, 0, 0, 30, 50, 10, 10, 10, 10, 'Client', '2008-10-04 10:17:55', '2008-10-08 20:54:59', 10, 5, '', '', '', '', '', '', 0, 10, 'Have only one instance run', 0, 0, ''),
(6, 1, 2, 2, 0, 30, 40, 100, 90, 20, 10, 'Client', '2008-10-04 16:58:17', '2008-10-06 21:45:33', 10, 6, '', '', '', '', '', '', 0, 10, 'Make frame unresizeable', 0, 0, ''),
(7, 1, 2, 0, 0, 30, 10, 100, 10, 10, 10, 'Server', '2008-10-04 17:11:35', '2008-10-04 17:11:35', 10, 7, '', '', '', '', '', '', 0, 10, 'Confirm that files sent from server are gzipped', 0, 0, ''),
(8, 1, 2, 2, 0, 30, 10, 100, 80, 20, 10, 'Server', '2008-10-04 18:45:14', '2008-10-06 23:38:44', 10, 8, '', '', '', '', '', '', 0, 10, 'Implement nonce storage to prevent replay', 0, 0, ''),
(9, 1, 2, 0, 0, 30, 10, 100, 90, 90, 10, 'Client/Server', '2008-10-04 22:30:07', '2008-10-06 21:49:02', 10, 9, '', '', '', '', '', '', 0, 10, 'Have user copy user ID from account page on website instead of signing in', 0, 0, ''),
(10, 1, 2, 0, 0, 30, 10, 100, 20, 30, 10, 'Client/Server', '2008-10-05 23:39:46', '2009-07-13 16:44:33', 10, 10, '', '', '', '', '', '', 0, 10, 'Change salt from realm to username plus realm', 0, 0, ''),
(11, 1, 2, 0, 0, 30, 50, 100, 10, 10, 10, 'Server', '2008-10-06 23:37:48', '2009-04-20 03:58:50', 10, 11, '', '', '', '', '', '', 0, 10, 'Periodically clear out stale nonce from database', 0, 0, ''),
(12, 1, 2, 2, 0, 30, 40, 100, 80, 20, 10, 'Client', '2008-10-07 23:51:57', '2008-10-13 16:48:48', 10, 12, '', '', '', '', '', '', 0, 10, 'Change response to OK click from sending all metadata to sending changed metadata only', 0, 0, ''),
(13, 1, 2, 2, 0, 30, 50, 10, 80, 20, 10, 'Client', '2008-10-08 20:54:17', '2008-10-18 16:33:46', 10, 13, '', '', '', '', '', '', 0, 10, 'In taskbar menu, "Flag As Inappropriate" doesn''t go away when new wallpaper loaded', 0, 0, ''),
(14, 1, 2, 0, 0, 30, 50, 10, 10, 10, 10, 'Client', '2008-10-13 17:00:19', '2008-10-13 17:03:40', 10, 14, '', '', '', '', '', '', 0, 10, 'Stop wallpaper changes when taskbar icon popup menu open', 0, 0, ''),
(15, 1, 2, 2, 0, 30, 60, 10, 80, 20, 10, 'Client', '2008-10-14 09:04:06', '2008-10-18 16:44:07', 10, 15, '', '', '', '', '', '', 0, 10, 'Check response if client cannot connect to server', 0, 0, ''),
(16, 1, 2, 0, 0, 30, 10, 100, 10, 10, 10, 'Client', '2008-10-18 12:07:05', '2008-10-18 15:15:44', 10, 16, '', '', '', '', '', '', 0, 10, 'Automatically translate text based on operating system locale', 0, 0, ''),
(17, 1, 2, 0, 0, 30, 10, 100, 10, 10, 10, 'Client/Server', '2008-10-18 15:17:21', '2008-12-27 13:11:23', 10, 17, '', '', '', '', '', '', 0, 10, 'Display info returned from server in popup message', 0, 0, ''),
(18, 1, 2, 0, 0, 30, 50, 10, 10, 10, 10, 'Client/Server', '2008-10-18 16:36:18', '2008-10-18 16:36:18', 10, 18, '', '', '', '', '', '', 0, 10, 'Images with %20 or space in filename not transmitted properly', 0, 0, ''),
(19, 1, 2, 0, 0, 30, 50, 10, 10, 10, 10, 'Client', '2008-12-27 13:15:26', '2008-12-27 13:15:26', 10, 19, '', '', '', '', '', '', 0, 10, 'Image request should be repeated twice if downloaded image cannot be displayed', 0, 0, ''),
(20, 1, 2, 0, 0, 30, 60, 10, 10, 10, 10, 'Server', '2009-01-03 12:21:42', '2009-01-03 12:21:42', 10, 20, '', '', '', '', '', '', 0, 10, 'If login request fails, image requests also fail', 0, 0, ''),
(21, 1, 2, 2, 0, 30, 60, 100, 80, 20, 10, 'Server', '2009-07-10 10:23:53', '2009-07-10 10:32:10', 10, 21, '', '', '', '', '', '', 0, 10, 'Elgg has a content directory structure that''s not suitable for file retrieval', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_tag_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_tag_table` (
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_attached` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  PRIMARY KEY (`bug_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mantis_bug_tag_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_bug_text_table`
--

CREATE TABLE IF NOT EXISTS `mantis_bug_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `steps_to_reproduce` longtext NOT NULL,
  `additional_information` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `mantis_bug_text_table`
--

INSERT INTO `mantis_bug_text_table` (`id`, `description`, `steps_to_reproduce`, `additional_information`) VALUES
(1, 'Go to sign in screen, successfully sign in with one username, then enter another username, and cancel.  If the window is reopened, the second username is displayed, but if it''s not changed, the first username is sent with a sign in attempt.', '', ''),
(2, 'Let user sign in once upon program install or getting an account, nobody wants to have to sign into a wallpaper changer program every time they turn on the computer.', '', ''),
(3, 'Increase security by confirming the hashing of password for transmission.  If not, MD5 the password with a salt then transmit.', '', ''),
(4, 'Server sends response indicating sign in success and user ID, or indicating failure and failure reason.  Client parses the response from server and indicate whether sign in succeeded or not.', '', ''),
(5, 'Check if client is already running, if so, shutdown.', '', 'http://mail.python.org/pipermail/python-win32/2003-June/001089.html [^]\r\n\r\nAt least on NT4 this works. I get various and unpredictable responses on\r\nWin 2K.:\r\n\r\n    cmd = os.popen(''query process'')\r\n    x = cmd.readlines()\r\n    for y in x:\r\n        p = y.find(''openoffice'')\r\n        if p >= 0: # process running\r\n\r\nIf you want the one line version:\r\n\r\n    if ''''.join(os.popen(''query process'').readlines()).find(''openoffice'') >= 0:\r\n\r\n\r\nThanks for the response. I''ve also figured out another way :\r\n\r\n    office=FindWindow("SALFRAME", "" )\r\n    if soffice :\r\n        fatalError ( "blah, blah" ) '),
(6, 'Frame resize is not useful, and it sticks until program execution stops.', '', ''),
(7, 'Reduce amount of data sent', '', ''),
(8, 'Currently http digest authentication code blindly accepts nonce from client.  Instead, store nonce in database and check to see if incoming nonce is valid.', '', 'Storing only sent but unused nonce should decrease storage needs.  If returned nonce not in database, then it''s invalid.  Once received, nonce removed from database.  Have periodic cleansing of old nonce values from database.'),
(9, 'Eliminate the need for digest authentication, and having to hash the password on the server with a sitewide salt.  There is no secret data being transferred between client and server.', '', ''),
(10, 'This makes salt different for each user, which prevents attacker from discovering that two users have the same password.', '', ''),
(11, 'Control database size.  Low priority cron job.', '', ''),
(12, 'No need to send all metadata if only a few values have changed.  Send changed values only to reduce amount of data transmitted and processing needed.', '', ''),
(13, 'If "Flag As Inappropriate" is checked in the taskbar menu, it does not get cleared until program is restarted', '', ''),
(14, 'If wallpaper changes while menu open, updates to values could be applied to wrong image.  Storing the image ID when the popup opens can avoid this issue, but is inelegant.', '', 'From [wxpython-users]:\r\n\r\nI had a similar problem and managed to get it to work by using a flag. I \r\ndid something like this from the event handler inside my class:\r\n \r\nself.popup_is_shown = True\r\nself.PopupMenu(my_menu)\r\nmy_menu.Destroy()\r\nself.popup_is_shown = False\r\n \r\n''self'' refers to your class that must inherit from something that has \r\nthe function PopupMenu.'),
(15, 'Client should not hang.  Perhaps client can resend request.', '', 'No notification to user that connection has failed.  Sign in displays last state, and pressing OK does nothing if there are changes.'),
(16, 'Have all text be localized\r\nhttp://www.python.org/doc/2.5.2/lib/i18n.html', '', 'Can get some translations from Launchpad projects.  A starting point could be:\r\nhttps://translations.launchpad.net/elgg/trunk/+pots/elgg'),
(17, 'Use server reply to send messages to user such as new version available.', '', 'Messages include:\r\n1. Cannot connect to internet\r\n2. Cannot connect to server\r\n3. New version available\r\n'),
(18, 'These filenames would fail to be transmitted:\r\ngoing%20home.jpg\r\nBlatt 1 1024.jpg', '', ''),
(19, 'Currently if downloaded image cannot be displayed, no extra action is taken after display fails, and client continues no differently than if display succeeded.  Proper action would be to attempt another request after failure.  If after two more attempts there is still display failures, then stop requests and perhaps report display failures to the user.', '', ''),
(20, 'Image requests should default to guest user if login request fails', '', ''),
(21, 'Elgg stores uploaded content in a hash created by splitting each user''s name into separate characters and using the characters as a directory tree.  This added to the fact that elgg chokes on filenames with spaces makes it an unsuitable platform to be the server software.', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mantis_config_table`
--

CREATE TABLE IF NOT EXISTS `mantis_config_table` (
  `config_id` varchar(64) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `access_reqd` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '90',
  `value` longtext NOT NULL,
  PRIMARY KEY (`config_id`,`project_id`,`user_id`),
  KEY `idx_config` (`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mantis_config_table`
--

INSERT INTO `mantis_config_table` (`config_id`, `project_id`, `user_id`, `access_reqd`, `type`, `value`) VALUES
('database_version', 0, 0, 90, 1, '63');

-- --------------------------------------------------------

--
-- Table structure for table `mantis_custom_field_project_table`
--

CREATE TABLE IF NOT EXISTS `mantis_custom_field_project_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mantis_custom_field_project_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_custom_field_string_table`
--

CREATE TABLE IF NOT EXISTS `mantis_custom_field_string_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`bug_id`),
  KEY `idx_custom_field_bug` (`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mantis_custom_field_string_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_custom_field_table`
--

CREATE TABLE IF NOT EXISTS `mantis_custom_field_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `possible_values` varchar(255) NOT NULL DEFAULT '',
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `access_level_r` smallint(6) NOT NULL DEFAULT '0',
  `access_level_rw` smallint(6) NOT NULL DEFAULT '0',
  `length_min` int(11) NOT NULL DEFAULT '0',
  `length_max` int(11) NOT NULL DEFAULT '0',
  `advanced` tinyint(4) NOT NULL DEFAULT '0',
  `require_report` tinyint(4) NOT NULL DEFAULT '0',
  `require_update` tinyint(4) NOT NULL DEFAULT '0',
  `display_report` tinyint(4) NOT NULL DEFAULT '1',
  `display_update` tinyint(4) NOT NULL DEFAULT '1',
  `require_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_closed` tinyint(4) NOT NULL DEFAULT '0',
  `require_closed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_custom_field_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mantis_custom_field_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_email_table`
--

CREATE TABLE IF NOT EXISTS `mantis_email_table` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `submitted` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `metadata` longtext NOT NULL,
  `body` longtext NOT NULL,
  PRIMARY KEY (`email_id`),
  KEY `idx_email_id` (`email_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mantis_email_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_filters_table`
--

CREATE TABLE IF NOT EXISTS `mantis_filters_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `is_public` tinyint(4) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `filter_string` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mantis_filters_table`
--

INSERT INTO `mantis_filters_table` (`id`, `user_id`, `project_id`, `is_public`, `name`, `filter_string`) VALUES
(1, 2, -1, 0, '', 'v8#a:40:{s:8:"_version";s:2:"v8";s:10:"_view_type";s:6:"simple";s:13:"show_category";a:1:{i:0;s:1:"0";}s:13:"show_severity";a:1:{i:0;i:0;}s:11:"show_status";a:1:{i:0;i:0;}s:8:"per_page";i:50;s:17:"highlight_changed";i:6;s:11:"reporter_id";a:1:{i:0;i:0;}s:10:"handler_id";a:1:{i:0;i:0;}s:10:"project_id";a:1:{i:0;i:-3;}s:4:"sort";s:6:"status";s:3:"dir";s:3:"ASC";s:11:"start_month";i:7;s:9:"start_day";i:1;s:10:"start_year";i:2009;s:9:"end_month";i:7;s:7:"end_day";i:10;s:8:"end_year";i:2009;s:6:"search";s:0:"";s:11:"hide_status";a:1:{i:0;i:-2;}s:16:"and_not_assigned";b:0;s:15:"show_resolution";a:1:{i:0;i:0;}s:10:"show_build";a:1:{i:0;s:1:"0";}s:12:"show_version";a:1:{i:0;s:1:"0";}s:17:"do_filter_by_date";b:0;s:16:"fixed_in_version";a:1:{i:0;s:1:"0";}s:14:"target_version";a:1:{i:0;s:1:"0";}s:13:"show_priority";a:1:{i:0;i:0;}s:12:"user_monitor";a:1:{i:0;i:0;}s:10:"view_state";i:0;s:13:"custom_fields";a:0:{}s:13:"sticky_issues";s:3:"off";s:17:"relationship_type";i:-1;s:16:"relationship_bug";i:0;s:12:"show_profile";a:1:{i:0;i:0;}s:8:"platform";a:1:{i:0;i:0;}s:2:"os";a:1:{i:0;i:0;}s:8:"os_build";a:1:{i:0;i:0;}s:10:"tag_string";s:0:"";s:10:"tag_select";i:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `mantis_news_table`
--

CREATE TABLE IF NOT EXISTS `mantis_news_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_posted` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `last_modified` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `announcement` tinyint(4) NOT NULL DEFAULT '0',
  `headline` varchar(64) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mantis_news_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_project_category_table`
--

CREATE TABLE IF NOT EXISTS `mantis_project_category_table` (
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category` varchar(64) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`,`category`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mantis_project_category_table`
--

INSERT INTO `mantis_project_category_table` (`project_id`, `category`, `user_id`) VALUES
(1, 'Client', 0),
(1, 'Server', 0),
(1, 'Client/Server', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mantis_project_file_table`
--

CREATE TABLE IF NOT EXISTS `mantis_project_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `content` longblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mantis_project_file_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_project_hierarchy_table`
--

CREATE TABLE IF NOT EXISTS `mantis_project_hierarchy_table` (
  `child_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mantis_project_hierarchy_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_project_table`
--

CREATE TABLE IF NOT EXISTS `mantis_project_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `access_min` smallint(6) NOT NULL DEFAULT '10',
  `file_path` varchar(250) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_name` (`name`),
  KEY `idx_project_id` (`id`),
  KEY `idx_project_view` (`view_state`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mantis_project_table`
--

INSERT INTO `mantis_project_table` (`id`, `name`, `status`, `enabled`, `view_state`, `access_min`, `file_path`, `description`) VALUES
(1, 'Twirlpaper bug tracker', 10, 1, 50, 10, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mantis_project_user_list_table`
--

CREATE TABLE IF NOT EXISTS `mantis_project_user_list_table` (
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `idx_project_user` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mantis_project_user_list_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_project_version_table`
--

CREATE TABLE IF NOT EXISTS `mantis_project_version_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `version` varchar(64) NOT NULL DEFAULT '',
  `date_order` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `description` longtext NOT NULL,
  `released` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_version` (`project_id`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mantis_project_version_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_sponsorship_table`
--

CREATE TABLE IF NOT EXISTS `mantis_sponsorship_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(128) NOT NULL DEFAULT '',
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `date_submitted` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `last_updated` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `idx_sponsorship_bug_id` (`bug_id`),
  KEY `idx_sponsorship_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mantis_sponsorship_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_tag_table`
--

CREATE TABLE IF NOT EXISTS `mantis_tag_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `date_updated` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mantis_tag_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_tokens_table`
--

CREATE TABLE IF NOT EXISTS `mantis_tokens_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `expiry` datetime DEFAULT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_typeowner` (`type`,`owner`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `mantis_tokens_table`
--

INSERT INTO `mantis_tokens_table` (`id`, `owner`, `type`, `timestamp`, `expiry`, `value`) VALUES
(26, 2, 3, '2009-07-13 16:44:26', '2009-07-14 16:44:35', '10'),
(25, 2, 4, '2009-07-13 16:44:14', '2009-07-13 16:49:14', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mantis_user_pref_table`
--

CREATE TABLE IF NOT EXISTS `mantis_user_pref_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_profile` int(10) unsigned NOT NULL DEFAULT '0',
  `default_project` int(10) unsigned NOT NULL DEFAULT '0',
  `advanced_report` tinyint(4) NOT NULL DEFAULT '0',
  `advanced_view` tinyint(4) NOT NULL DEFAULT '0',
  `advanced_update` tinyint(4) NOT NULL DEFAULT '0',
  `refresh_delay` int(11) NOT NULL DEFAULT '0',
  `redirect_delay` tinyint(4) NOT NULL DEFAULT '0',
  `bugnote_order` varchar(4) NOT NULL DEFAULT 'ASC',
  `email_on_new` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_assigned` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_feedback` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_closed` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_reopened` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_bugnote` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_status` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_status_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_bugnote_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_reopened_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_closed_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_resolved_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_feedback_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_assigned_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_new_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_bugnote_limit` smallint(6) NOT NULL DEFAULT '0',
  `language` varchar(32) NOT NULL DEFAULT 'english',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mantis_user_pref_table`
--

INSERT INTO `mantis_user_pref_table` (`id`, `user_id`, `project_id`, `default_profile`, `default_project`, `advanced_report`, `advanced_view`, `advanced_update`, `refresh_delay`, `redirect_delay`, `bugnote_order`, `email_on_new`, `email_on_assigned`, `email_on_feedback`, `email_on_resolved`, `email_on_closed`, `email_on_reopened`, `email_on_bugnote`, `email_on_status`, `email_on_priority`, `email_on_priority_min_severity`, `email_on_status_min_severity`, `email_on_bugnote_min_severity`, `email_on_reopened_min_severity`, `email_on_closed_min_severity`, `email_on_resolved_min_severity`, `email_on_feedback_min_severity`, `email_on_assigned_min_severity`, `email_on_new_min_severity`, `email_bugnote_limit`, `language`) VALUES
(1, 2, 0, 0, 1, 0, 0, 0, 30, 2, 'ASC', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'english');

-- --------------------------------------------------------

--
-- Table structure for table `mantis_user_print_pref_table`
--

CREATE TABLE IF NOT EXISTS `mantis_user_print_pref_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `print_pref` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mantis_user_print_pref_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_user_profile_table`
--

CREATE TABLE IF NOT EXISTS `mantis_user_profile_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mantis_user_profile_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `mantis_user_table`
--

CREATE TABLE IF NOT EXISTS `mantis_user_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `realname` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `last_visit` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `lost_password_request_count` smallint(6) NOT NULL DEFAULT '0',
  `failed_login_count` smallint(6) NOT NULL DEFAULT '0',
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_cookie_string` (`cookie_string`),
  UNIQUE KEY `idx_user_username` (`username`),
  KEY `idx_enable` (`enabled`),
  KEY `idx_access` (`access_level`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mantis_user_table`
--

INSERT INTO `mantis_user_table` (`id`, `username`, `realname`, `email`, `password`, `date_created`, `last_visit`, `enabled`, `protected`, `access_level`, `login_count`, `lost_password_request_count`, `failed_login_count`, `cookie_string`) VALUES
(2, 'shard', '', 'shard@ugcs.caltech.edu', '3541c75fd24df42fbb68e549b16dfa90', '2008-09-26 21:15:34', '2009-07-13 16:44:40', 1, 0, 90, 12, 0, 0, '43dbddd0923d23170d62cacaa787da02c5092d8637b04512275757510e32a3e2');
