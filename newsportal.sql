
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



--
-- Database: `newsportal`
--

-- --------------------------------------------------------

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) NOT NULL,
  `AdminPassword` varchar(255) NOT NULL,
  `AdminEmailId` varchar(255) NOT NULL,
  `Is_Active` int(11) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `Is_Active`, `CreationDate`, `UpdationDate`) VALUES
(1, 'admin', '$2y$12$i4LMfeFPQpGSNPTaccIkKuwxAkJ4PhBr3JND7FpXwWFjRvchQn17C', 'phpgurukulofficial@gmail.com', 1, '2018-05-27 17:51:00', '2018-10-24 18:21:07');

-- --------------------------------------------------------


CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` nvarchar(200) DEFAULT NULL,
  `Description`  nvarchar(400) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(2, 'ورزشی', 'اخبار ورزشی', '2018-06-06 10:28:09', '2018-06-30 18:41:07', 1),
(3, 'سیاسی', 'اخبار سیاسی', '2018-06-06 10:35:09', '2018-06-14 11:11:55', 1),
(5, 'اجتماعی', 'اخبار اجتماعی', '2018-06-14 05:32:58', '2018-06-14 05:33:41', 1),
(6, 'اقتصادی', 'اخبار اقتصادی', '2018-06-22 15:46:09', '0000-00-00 00:00:00', 1),
(7, 'فرهنگی', 'اخبار فرهنگی', '2018-06-22 15:46:22', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------


CREATE TABLE `tblcomments` (
  `id` int(11) NOT NULL,
  `postId` char(11) DEFAULT NULL,
  `name` nvarchar(120) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `comment` nvarchar(400) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------


CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` nvarchar(200) DEFAULT NULL,
  `PageTitle` nvarchar(400) DEFAULT NULL,
  `Description` nvarchar(4000) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
(1, 'aboutus', 'درباره ما', '<font color=\"#7b8898\" face=\"Mercury SSm A, Mercury SSm B, Georgia, Times, Times New Roman, Microsoft YaHei New, Microsoft Yahei, å¾®è½¯é›…é»‘, å®‹ä½“, SimSun, STXihei, åŽæ–‡ç»†é»‘, serif\"><span style=\"font-size: 26px;\"><br>سایت خبری وارا نیوز با هدف اطلاع رسانی دقیق اخبار  .به مردم وپوشش جدید ترین و مهم ترین اخبار سیاسی اقتصادی فرهنگی و ... فعالیت می کند</span></font><br>', '2018-06-30 18:01:03', '2018-06-30 19:19:51'),
(2, 'contactus', 'تماس با ما', '<p><br></p><p><b> آدرس: تهران-ایران</p><p><b>+98 88813212:تلفن </p><p><b> ghazal.k1999@gmail.com:ایمیل</p>', '2018-06-30 18:01:36', '2018-06-30 19:23:25');

-- --------------------------------------------------------


CREATE TABLE `tblposts` (
  `id` int(11) NOT NULL,
  `PostTitle` nvarchar(1000) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `PostDetails` nvarchar(4000) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` mediumtext DEFAULT NULL,
  `PostImage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`) VALUES
(7, 'رکوردهای بایرن‌مونیخ در هشتمین قهرمانی متوالی بوندس‌ لیگا', 2,3, '<h1 style=\"box-sizing: inherit; margin-top: 0px; padding: 0px; font-family: Roboto, sans-serif; font-size: 15px; line-height: normal; letter-spacing: 0.5px; color: rgb(51, 51, 51);\"><span itemprop=\"headline\" style=\"box-sizing: inherit;\">بایرن‌مونیخ در فصلی که به هشتمین قهرمانی متوالی‌اش در بوندس ‌لیگا رسیده،                      رکوردهای رنگارنگی ثبت کرده است</h4>', '2020-06-30 19:08:56', '2020-6-28 15:59:59', 1,'رکورد بوندسلیگا' ,'1.jpg');

-- --------------------------------------------------------


CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int(11) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Subcategory` nvarchar(255) DEFAULT NULL,
  `SubCatDescription` nvarchar(4000) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 2, 'فوتبال', 'اخبار پیرامون فوتبال', '2018-06-22 15:45:38', '0000-00-00 00:00:00', 1),
(4, 2, 'والیبال', 'اخبار پیرامون والیبال', '2018-06-30 09:00:43', '0000-00-00 00:00:00', 1);

ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`);

ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `tblposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
