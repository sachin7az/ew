-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2023 at 07:49 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(2, 'Aditya', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(9, 2, 16, 'Choco Almond Ice Cream', 89, 4, 'product_image_6524c7b2b54ba.png');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 3, 'admin', 'user01@gmail.com', '6546534534', 'Who are you\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(3, 3, 'aditya gupta', '4564646575', 'soham@gmail.com', 'Cash on Delivery', 'flat no. 54 A, Digha, Mumbai, Maharashtra, India, 400706', 'Nutty Choco Ice Cream (97 x 1) - ', 97, '2023-10-14', 'completed'),
(4, 3, 'aditya', '3453443453', 'aditya@gmail.com', 'Cash on Delivery', 'flat no. A4, Digha, Mumbai, Maharashtra, India, 453453', 'Watermelon Ice Cream (89 x 1) - ', 89, '2023-10-14', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `category` varchar(255) NOT NULL,
  `image_01` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `category`, `image_01`) VALUES
(9, 'Anjeer Ice Cream', 'Ingredients: Anjeer, Milk, Sugar ', 89, 'YEAR AROUND', 'product_image_6524c3ff0911a.png'),
(10, 'Chickoo Ice Cream', 'Ingredients: Chickoo pulp, Milk, Sugar syrup', 89, 'YEAR AROUND', 'product_image_6524c49182306.png'),
(11, 'Kesar Pista Ice Cream', 'Ingredients: Kesar, Pista, Milk, Sugar', 89, 'YEAR AROUND', 'product_image_6524c5202ee8d.png'),
(12, 'Coconut bite Ice Cream', 'Ingredients: Milk, Tender coconut pulp, Sugar syrup', 89, 'YEAR AROUND', 'product_image_6524c5aa8dc94.png'),
(14, 'Watermelon Ice Cream', 'Ingredients: Milk, Watermelon pulp, Sugar syrup', 89, 'YEAR AROUND', 'product_image_6524c7294174c.png'),
(15, 'Muskmelon Ice Cream ', 'Ingredients: Milk, Muskmelon pulp, Sugar syrup', 89, 'YEAR AROUND', 'product_image_6524c7581f8af.png'),
(16, 'Choco Almond Ice Cream', 'Ingredients: Milk, Chocolate, Almond, Sugar syrup', 89, 'YEAR AROUND', 'product_image_6524c7b2b54ba.png'),
(17, 'Coffee bite Ice Cream', 'Ingredients: Coffee, Chocolate, Milk, Sugar syrup', 89, 'YEAR AROUND', 'product_image_6524c7f7592e5.png'),
(18, 'Choco Almond Ice Cream', 'Ingredients: Chocolate, Almond, Milk, Sugar syrup', 79, 'CHOCOLATE', 'product_image_6526c33648aa2.png'),
(19, 'Choco Bite Ice Cream', 'Ingredients: Chocolate, Condensed Milk, Sugar syrup', 79, 'CHOCOLATE', 'product_image_6526c36e84a95.png'),
(20, 'Choco Cream Ice Cream', 'Ingredients: Chocolate, Milk, Sugar syrup', 79, 'YEAR AROUND', 'product_image_6526c3aac913e.png'),
(21, 'Nutty Choco Ice Cream', 'Ingredients: Chocolate, Almond, Cashew, Walnut, Milk, Sugar syrup', 97, 'CHOCOLATE', 'product_image_6526c47b59ca1.png'),
(22, 'Hazelnut Chocolate Ice Cream', 'Ingredients:Hazelnut, Chocolate, Milk, Sugar syrup', 89, 'CHOCOLATE', 'product_image_6526c4e44409d.png'),
(23, 'Chocolate Orange Ice Cream', 'Ingredients: Orange, Chocolate, Milk, Sugar syrup', 69, 'CHOCOLATE', 'product_image_6526c51d96b0b.png'),
(24, 'Raspberry Chocolate Ice Cream', 'Ingredients: Chocolate, Raspberry, Milk, Sugar syrup', 99, 'CHOCOLATE', 'product_image_6526c5854e161.png'),
(25, 'Modak Ice Cream', 'Ingredients: Milk, Tender Coconut Pulp, Banana Pulp, Sugar Syrup, Kismis, Cardamom Powder', 69, 'FEST SPECIAL', 'product_image_6526c5e44cebc.png'),
(26, 'Tilgul Ice Cream', 'Ingredients: Milk, Sugar, Peanut, Cashew, Sesame seeds, Jaggery, Cardamom Powder', 99, 'FEST SPECIAL', 'product_image_6526c638103fb.png'),
(27, 'Gulkand Ice Cream', 'Ingredients: Milk, Rose petals, Sugar syrup', 79, 'FEST SPECIAL', 'product_image_6526c66f64a61.png'),
(28, 'Persian Delight Ice Cream ', 'Ingredients: Milk, Sugar, Dates, Honey, Pishori Pista, Cinnamon', 112, 'YEAR AROUND', 'product_image_6526c6b2408f3.png'),
(29, 'Thandai Ice Cream', 'Ingredients: Milk, Sugar, Fenel Seeds, Pista, Roasted Almond, Ginger Powder, Sugar - Cardamom Powder, Saffron', 100, 'FEST SPECIAL', 'product_image_6526c7179efec.png'),
(30, 'Shrikhand Ice Cream', 'Ingredients: Milk, Sugar, Shrikhand, Roasted Almond, Pista', 113, 'FEST SPECIAL', 'product_image_6526c75686ab1.png'),
(31, 'Jamun chilli Popsicles', 'Ingredients: Jamun pulp, Chilli, Sugar, Water', 59, 'POPSICLES', 'product_image_6526c7d417fc6.png'),
(32, 'Watermelon Ice Cream', 'Ingredients; Watermelon, Lemon, Sugar, Water', 59, 'POPSICLES', 'product_image_6526c81a3d263.png'),
(33, 'Kiwi Popsicles', 'Ingredients: Kiwi, Sugar, Water ', 89, 'POPSICLES', 'product_image_6526c86384c75.png'),
(34, 'Melon Burst Popsicles', 'Ingredients: Watermelon, Muskmelon, Water, Lemon, Sugar', 79, 'POPSICLES', 'product_image_6526c896ee146.png'),
(35, 'Lemon Popsicles', 'Ingredients; Lemon, Sugar, Mint, Water', 49, 'POPSICLES', 'product_image_6526c8cf1c63a.png'),
(36, 'Cookie Cream Popsicles', 'Ingredients: Cookies, Cream, Milk, Sugar', 89, 'POPSICLES', 'product_image_6526c8fa84637.png'),
(37, 'Mango Popsicles', 'Ingredients; Mango, Water, Sugar', 70, 'POPSICLES', 'product_image_6526c91ca312f.png'),
(38, 'Rose Walnut Ice Cream', 'Ingredients: Milk, Walnut, Rose petals, Sugar', 89, 'FRIDAY FUNDAY', 'product_image_6526c98a977cc.png'),
(39, 'Paan Ice Cream', 'Ingredients: Paan, Condensed Milk, Sugar', 89, 'FRIDAY FUNDAY', 'product_image_6526c9d9bf658.png'),
(40, 'Gajar Halwa Dairy Dessert', 'Ingredients: Gajar, Almond, Cashew, Milk, Sugar', 125, 'FRIDAY FUNDAY', 'product_image_6526ca2bc5317.png'),
(41, 'Orange Pista Ice Cream', 'Ingredients: Orange, Pista, Milk, Sugar', 125, 'FRIDAY FUNDAY', 'product_image_6526ca6036e88.png'),
(42, 'Melon Mango Ice Cream', 'Ingredients: Musk melon, Mango, Milk, Chocolate, Sugar', 159, 'FRIDAY FUNDAY', 'product_image_6526ca9d9292b.png'),
(43, 'Ginger Honey Ice Cream', 'Ingredients: Ginger powder, Honey, Sugar, Milk', 120, 'FRIDAY FUNDAY', 'product_image_6526cae1c0e6b.png'),
(44, 'Walnut and Dates Ice Cream', 'Ingredients: Walnut, Dates, Milk, Sugar', 139, 'FRIDAY FUNDAY', 'product_image_6526cb0fe8b1a.png'),
(45, 'Choco Coffebite Ice Cream', 'Ingredients: Chocolate, Coffee, Milk, Sugar', 112, 'FRIDAY FUNDAY', 'product_image_6526cb4326b77.png'),
(46, 'Mango Sorbet', 'Ingredients: Mango, Lemon, Sugar', 87, 'SORBET', 'product_image_6526cb999859f.png'),
(47, 'Orange  Sorbet', 'Ingredients: Orange, Lemon, Sugar', 78, 'SORBET', 'product_image_6526cbc43f221.png'),
(48, 'Strawberry Sorbet', 'Ingredients: Strawberry, Lemon, Sugar', 78, 'SORBET', 'product_image_6526cbed1c017.png'),
(49, 'Cherry Sorbet', 'Ingredients: Cherry  pulp, Sugar', 78, 'SORBET', 'product_image_6526cc1796fd0.png'),
(50, 'Lemon Mojito Sorbet', 'Ingredients: Lemon, Mint leaves, Sugar', 78, 'SORBET', 'product_image_6526cc485a4e2.png'),
(51, 'Kiwi Sorbet', 'Ingredients: Kiwi, Lemon, Sugar', 78, 'SORBET', 'product_image_6526cc6abb824.png'),
(52, 'Watermelon Sorbet', 'Ingredients; Watermelon, Sugar, Lemon', 77, 'SORBET', 'product_image_6526cc9208f36.png'),
(53, 'Mango Ice Cream', 'Ingredients: Mango, Milk, Sugar', 99, 'SEASONAL', 'product_image_6526ccb6f0703.png'),
(54, 'Guvava Ice Cream', 'Ingredients; Guvava, Milk, Sugar', 99, 'SEASONAL', 'product_image_6526cce9e8383.png'),
(55, 'Black Grapes Ice Cream', 'Ingredients: Balck Grapes, Milk, Sugar', 99, 'SEASONAL', 'product_image_6526cd18ef834.png'),
(56, 'Sitaphal Ice Cream', 'Ingredients: Sitaphal, Milk, Sugar', 99, 'SEASONAL', 'product_image_6526cd4d34b3c.png'),
(57, 'Strawberry Ice Cream', 'Ingredients: Strawberry, Milk, Sugar', 99, 'SEASONAL', 'product_image_6526cd743d066.png'),
(58, 'Lychee Ice Cream', 'Ingredients: Lychee, Milk, Sugar', 99, 'SEASONAL', 'product_image_6526cd9b57c34.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'admin', 'admin01@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(2, 'aditya', 'aditya@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(3, 'Soham', 'soham@gmail.com', '8372f6ef00b6fbfad7cfef0eda61d63b7458efdb');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
