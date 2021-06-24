-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 24, 2021 at 09:57 AM
-- Server version: 8.0.22
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uda_water`
--

-- --------------------------------------------------------

--
-- Table structure for table `drink`
--

CREATE TABLE `drink` (
  `id` int NOT NULL,
  `ml` int NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `drink`
--

INSERT INTO `drink` (`id`, `ml`, `date`, `time`) VALUES
(1, 0, '2021-06-24', '00:39:21'),
(2, 250, '2021-06-24', '00:42:27'),
(3, 500, '2021-06-24', '00:42:38'),
(4, 1000, '2021-06-24', '00:42:53'),
(5, 250, '2021-06-24', '00:43:01'),
(6, 0, '2021-06-24', '02:50:44'),
(7, 750, '2021-06-19', '07:40:18');

--
-- Triggers `drink`
--
DELIMITER $$
CREATE TRIGGER `add_log_drink` AFTER INSERT ON `drink` FOR EACH ROW BEGIN
    IF new.date not in 
    (
        select log.date 
        from log_drink log 
        where new.date = log.date
    )
    THEN
        INSERT INTO log_drink SET 
            ml = new.ml,
            date = new.date,
            last_update = new.time;
    END IF;
    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_log_drink` BEFORE INSERT ON `drink` FOR EACH ROW BEGIN

	IF new.date in 
    (
        SELECT lg.date
        from log_drink lg
        WHERE lg.date = new.date
    ) 
    THEN
        UPDATE log_drink SET
        log_drink.ml = log_drink.ml + new.ml,
        log_drink.last_update = new.time
        WHERE log_drink.date = new.date;
    END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_drink`
--

CREATE TABLE `log_drink` (
  `id` int NOT NULL,
  `ml` int NOT NULL,
  `date` date NOT NULL,
  `last_update` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `log_drink`
--

INSERT INTO `log_drink` (`id`, `ml`, `date`, `last_update`) VALUES
(1, 2000, '2021-06-24', '02:50:44'),
(2, 750, '2021-06-19', '07:40:18');

--
-- Triggers `log_drink`
--
DELIMITER $$
CREATE TRIGGER `delete_drink` BEFORE DELETE ON `log_drink` FOR EACH ROW BEGIN

	delete from drink where 
    date = old.date;

END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drink`
--
ALTER TABLE `drink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_drink`
--
ALTER TABLE `log_drink`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drink`
--
ALTER TABLE `drink`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `log_drink`
--
ALTER TABLE `log_drink`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
