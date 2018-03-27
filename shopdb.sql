/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : shopdb

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-19 20:32:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminstration
-- ----------------------------
DROP TABLE IF EXISTS `adminstration`;
CREATE TABLE `adminstration` (
  `Id` int(11) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`,`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminstration
-- ----------------------------
INSERT INTO `adminstration` VALUES ('1', 'user1', '1');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', 'Adachi');
INSERT INTO `brand` VALUES ('2', 'Mabư');
INSERT INTO `brand` VALUES ('3', 'KIRIMARU');
INSERT INTO `brand` VALUES ('4', 'Yara');
INSERT INTO `brand` VALUES ('5', 'Kid');
INSERT INTO `brand` VALUES ('6', 'Mori');
INSERT INTO `brand` VALUES ('7', 'NINE WEST');
INSERT INTO `brand` VALUES ('8', 'H&M');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `Id` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ORDER` (`OrderId`),
  CONSTRAINT `FK_ORDER` FOREIGN KEY (`OrderId`) REFERENCES `orderproduct` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('5', '13');
INSERT INTO `cart` VALUES ('6', '15');
INSERT INTO `cart` VALUES ('7', '16');
INSERT INTO `cart` VALUES ('8', '17');
INSERT INTO `cart` VALUES ('9', '19');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `Id` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` longtext,
  `ParentMenuId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PARENT_MENU` (`ParentMenuId`),
  CONSTRAINT `FK_PARENT_MENU` FOREIGN KEY (`ParentMenuId`) REFERENCES `parentmenu` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Áo thun', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '1');
INSERT INTO `category` VALUES ('2', 'Áo sơ mi', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '1');
INSERT INTO `category` VALUES ('3', 'Quần kaki', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '1');
INSERT INTO `category` VALUES ('4', 'Quần jean', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '1');
INSERT INTO `category` VALUES ('5', 'Áo kiểu', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '2');
INSERT INTO `category` VALUES ('6', 'Áo thun', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '2');
INSERT INTO `category` VALUES ('7', 'Quần Short', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '2');
INSERT INTO `category` VALUES ('8', 'Quần jean', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '2');
INSERT INTO `category` VALUES ('9', 'Áo khoác nam', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '3');
INSERT INTO `category` VALUES ('10', 'Áo khóa nữ', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '3');
INSERT INTO `category` VALUES ('11', 'Áo khoác đôi', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '3');
INSERT INTO `category` VALUES ('12', 'Giày lười', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '4');
INSERT INTO `category` VALUES ('13', 'Giày tây', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '4');
INSERT INTO `category` VALUES ('14', 'Giày boots', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '4');
INSERT INTO `category` VALUES ('15', 'Pump', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '5');
INSERT INTO `category` VALUES ('16', 'Slip-on', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '5');
INSERT INTO `category` VALUES ('17', 'Sneaker', 'Gồm các mẫu có chất lượn cải tốt, mẫu thiết kế đẹp.', '5');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `Province` varchar(255) DEFAULT NULL,
  `Point` int(11) DEFAULT NULL,
  `GroupId` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`Email`),
  KEY `Id` (`Id`),
  KEY `FK_GROUP` (`GroupId`),
  CONSTRAINT `FK_GROUP` FOREIGN KEY (`GroupId`) REFERENCES `groupofclient` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', 'Minh Tuấn', '0968101695', 'minhtuan@gmail.com', 'Quốc lộ 1A', 'Bình Định', '200', '1');
INSERT INTO `client` VALUES ('2', 'client2', '12345', 'client2@gmail.com', 'HCM', 'HCM', '500', '2');
INSERT INTO `client` VALUES ('3', 'client3', '12345', 'client3@gmail.com', 'HCM', 'HCM', '1000', '3');
INSERT INTO `client` VALUES ('4', 'client4', '12345', 'client4@gmail.com', 'HCM', 'HCM', '100', '1');
INSERT INTO `client` VALUES ('5', 'Tuấn Đặng', '0968101695', 'divine2014@gmail.com', 'Quốc lộ 1A', 'Bình Định', '0', '1');
INSERT INTO `client` VALUES ('6', 'client1', '0968101695', 'test1@gmail.com', 'Hồ Chí Minh', 'Bình Định', '0', '1');
INSERT INTO `client` VALUES ('7', '', '', 'thangtran@gmail.com', '', '', '0', '1');
INSERT INTO `client` VALUES ('8', '', '', 'tientruong@gmail.com', '', '', '0', '1');
INSERT INTO `client` VALUES ('9', 'Tuấn Đặng', '0968101695', 'tuandang@gmail.com', 'Kha Vạn Cân', 'Hồ Chí Minh', '0', '1');

-- ----------------------------
-- Table structure for groupofclient
-- ----------------------------
DROP TABLE IF EXISTS `groupofclient`;
CREATE TABLE `groupofclient` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Discount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groupofclient
-- ----------------------------
INSERT INTO `groupofclient` VALUES ('1', 'normal', '0');
INSERT INTO `groupofclient` VALUES ('2', 'medium', '5');
INSERT INTO `groupofclient` VALUES ('3', 'vip', '10');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `Id` int(11) NOT NULL,
  `Quanity` int(11) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PRODUCT` (`ProductId`),
  KEY `FK_ORDER_ORDER_DETAIL` (`OrderId`),
  CONSTRAINT `FK_ORDER_ORDER_DETAIL` FOREIGN KEY (`OrderId`) REFERENCES `orderproduct` (`Id`),
  CONSTRAINT `FK_PRODUCT` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('1', '2', '724000', '1', '83');
INSERT INTO `orderdetail` VALUES ('2', '2', '724000', '0', '83');
INSERT INTO `orderdetail` VALUES ('3', '2', '724000', '2', '83');
INSERT INTO `orderdetail` VALUES ('4', '2', '690000', '2', '82');
INSERT INTO `orderdetail` VALUES ('5', '2', '246000', '5', '87');
INSERT INTO `orderdetail` VALUES ('6', '2', '304000', '5', '23');
INSERT INTO `orderdetail` VALUES ('7', '1', '142000', '4', '14');
INSERT INTO `orderdetail` VALUES ('8', '1', '156000', '6', '86');
INSERT INTO `orderdetail` VALUES ('9', '2', '400000', '6', '42');
INSERT INTO `orderdetail` VALUES ('10', '2', '820000', '7', '68');
INSERT INTO `orderdetail` VALUES ('11', '2', '724000', '9', '83');
INSERT INTO `orderdetail` VALUES ('12', '1', '345000', '10', '82');
INSERT INTO `orderdetail` VALUES ('13', '1', '162000', '11', '20');
INSERT INTO `orderdetail` VALUES ('14', '2', '246000', '12', '87');
INSERT INTO `orderdetail` VALUES ('15', '2', '312000', '8', '86');
INSERT INTO `orderdetail` VALUES ('16', '1', '345000', '14', '84');
INSERT INTO `orderdetail` VALUES ('17', '2', '690000', '14', '82');
INSERT INTO `orderdetail` VALUES ('18', '2', '724000', '18', '83');

-- ----------------------------
-- Table structure for orderproduct
-- ----------------------------
DROP TABLE IF EXISTS `orderproduct`;
CREATE TABLE `orderproduct` (
  `Id` int(11) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `DateCreate` date DEFAULT NULL,
  `Address` varchar(255) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `PaymentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PAYMENT` (`PaymentId`),
  KEY `FK_USER` (`UserId`),
  CONSTRAINT `FK_PAYMENT` FOREIGN KEY (`PaymentId`) REFERENCES `payment` (`Id`),
  CONSTRAINT `FK_USER` FOREIGN KEY (`UserId`) REFERENCES `usercustomer` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderproduct
-- ----------------------------
INSERT INTO `orderproduct` VALUES ('0', '0', '2017-05-18', 'HCM, HCM', '2', '0');
INSERT INTO `orderproduct` VALUES ('1', '1', '2017-05-18', 'Quốc lộ 1A, Bình Định', '3', '1');
INSERT INTO `orderproduct` VALUES ('2', '2', '2017-05-18', 'Quốc lộ 1A, Bình Định', '3', '2');
INSERT INTO `orderproduct` VALUES ('4', '4', '2017-05-18', 'Quốc lộ 1A, Bình Định', '3', '4');
INSERT INTO `orderproduct` VALUES ('5', '5', '2017-05-18', 'HCM, HCM', '2', '5');
INSERT INTO `orderproduct` VALUES ('6', '6', '2017-05-18', 'HCM, HCM', '2', '6');
INSERT INTO `orderproduct` VALUES ('7', '7', '2017-05-18', 'Quốc lộ 1A, Bình Định', '3', '7');
INSERT INTO `orderproduct` VALUES ('8', '8', '2017-05-18', 'HCM, HCM', '2', '8');
INSERT INTO `orderproduct` VALUES ('9', '9', '2017-05-18', 'Quốc lộ 1A, Bình Định', '3', '9');
INSERT INTO `orderproduct` VALUES ('10', '10', '2017-05-18', 'Quốc lộ 1A, Bình Định', '3', '10');
INSERT INTO `orderproduct` VALUES ('11', '11', '2017-05-18', 'Quốc lộ 1A, Bình Định', '3', '11');
INSERT INTO `orderproduct` VALUES ('12', '12', '2017-05-18', 'Quốc lộ 1A, Bình Định', '3', '12');
INSERT INTO `orderproduct` VALUES ('13', '13', '2017-05-18', 'none', '3', '13');
INSERT INTO `orderproduct` VALUES ('14', '14', '2017-05-18', 'HCM, HCM', '2', '14');
INSERT INTO `orderproduct` VALUES ('15', '15', '2017-05-18', 'none', '2', '15');
INSERT INTO `orderproduct` VALUES ('16', '16', '2017-05-19', 'none', '5', '16');
INSERT INTO `orderproduct` VALUES ('17', '17', '2017-05-19', 'none', '6', '17');
INSERT INTO `orderproduct` VALUES ('18', '18', '2017-05-19', 'Kha Vạn Cân, Hồ Chí Minh', '7', '18');
INSERT INTO `orderproduct` VALUES ('19', '19', '2017-05-19', 'none', '7', '19');

-- ----------------------------
-- Table structure for parentmenu
-- ----------------------------
DROP TABLE IF EXISTS `parentmenu`;
CREATE TABLE `parentmenu` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parentmenu
-- ----------------------------
INSERT INTO `parentmenu` VALUES ('1', 'Đồ nam');
INSERT INTO `parentmenu` VALUES ('2', 'Đồ nữ');
INSERT INTO `parentmenu` VALUES ('3', 'Áo khoác');
INSERT INTO `parentmenu` VALUES ('4', 'Giày nam');
INSERT INTO `parentmenu` VALUES ('5', 'Giày nữ');

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `Id` int(11) NOT NULL,
  `TotalPrice` decimal(11,0) NOT NULL,
  `Type` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('0', '687800', 'Đã thanh toán');
INSERT INTO `payment` VALUES ('1', '724000', 'Đã thanh toán');
INSERT INTO `payment` VALUES ('2', '1414000', 'Đã thanh toán');
INSERT INTO `payment` VALUES ('4', '142000', 'Đã thanh toán');
INSERT INTO `payment` VALUES ('5', '522500', 'Đã thanh toán');
INSERT INTO `payment` VALUES ('6', '528200', 'Đã thanh toán');
INSERT INTO `payment` VALUES ('7', '820000', 'Đã thanh toán');
INSERT INTO `payment` VALUES ('8', '296400', 'Đang giao dịch');
INSERT INTO `payment` VALUES ('9', '724000', 'Đã thanh toán');
INSERT INTO `payment` VALUES ('10', '345000', 'Đã thanh toán');
INSERT INTO `payment` VALUES ('11', '162000', 'Đã thanh toán');
INSERT INTO `payment` VALUES ('12', '246000', 'Đã thanh toán');
INSERT INTO `payment` VALUES ('13', '0', 'Đang giao dịch');
INSERT INTO `payment` VALUES ('14', '983250', 'Đang giao dịch');
INSERT INTO `payment` VALUES ('15', '0', 'Đang giao dịch');
INSERT INTO `payment` VALUES ('16', '0', 'Đang giao dịch');
INSERT INTO `payment` VALUES ('17', '0', 'Đang giao dịch');
INSERT INTO `payment` VALUES ('18', '724000', 'Đang giao dịch');
INSERT INTO `payment` VALUES ('19', '0', 'Đang giao dịch');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `Id` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `Picture` varchar(255) DEFAULT NULL,
  `Description` longtext,
  `Remain` int(11) DEFAULT NULL,
  `ViewId` int(11) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `BrandId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_CATEGORY` (`CategoryId`),
  KEY `FK_BRAND` (`BrandId`),
  CONSTRAINT `FK_BRAND` FOREIGN KEY (`BrandId`) REFERENCES `brand` (`Id`),
  CONSTRAINT `FK_CATEGORY_PRODUCT` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '0001', 'Áo thun nam LSMAUD', '247000', 'images/home/product2.jpg', '- Chất liệu thun co dãn cực tốt nhưng không làm biến dạng vải.\r\n- Sự đầu tư nghiên cứu về phom dáng tạo nên sản phẩm phù hợp với đa số vóc dáng người dùng.\r\n- Ngoài ra, màu sắc cổ điển và tinh tế, dễ dàng phối hợp với nhiều màu sắc khác.\r\n- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '23', '13', '1', '1');
INSERT INTO `product` VALUES ('4', '0004', 'Áo thun nam IONDHA', '190000', 'images/home/product2.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '1', '1', '1');
INSERT INTO `product` VALUES ('5', '0005', 'Áo thun nam QUDNAM', '150000', 'images/home/product2.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '25', '0', '1', '1');
INSERT INTO `product` VALUES ('6', '0006', 'Áo sơ mi nam SAKMCU', '200000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '32', '0', '2', '2');
INSERT INTO `product` VALUES ('7', '0007', 'Áo sơ mi nam TUYBSN', '220000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '14', '1', '2', '2');
INSERT INTO `product` VALUES ('9', '0009', 'Áo sơ mi LFMVNCS', '210000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '25', '0', '2', '2');
INSERT INTO `product` VALUES ('10', '0010', 'Áo sơ mi nam MANCHS', '200000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '10', '0', '2', '2');
INSERT INTO `product` VALUES ('13', '0013', 'Quần kaki nam OQMDNC', '160000', 'images/home/product2.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '13', '0', '3', '3');
INSERT INTO `product` VALUES ('14', '0014', 'Quần kaki nam OPNFHD', '142000', 'images/home/product2.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '16', '1', '3', '3');
INSERT INTO `product` VALUES ('15', '0015', 'Quần kaki nam PQMCND', '210000', 'images/home/product2.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '16', '0', '3', '2');
INSERT INTO `product` VALUES ('17', '0017', 'Quần jean nam OQNDHS', '230000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '13', '0', '4', '3');
INSERT INTO `product` VALUES ('18', '0018', 'Quần jean nam ONDBCJ', '196000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '15', '0', '4', '4');
INSERT INTO `product` VALUES ('19', '0019', 'Quần jean nam LSMCNA', '210000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '20', '0', '4', '4');
INSERT INTO `product` VALUES ('20', '0020', 'Quần jean nam KSMANC', '162000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '16', '1', '4', '4');
INSERT INTO `product` VALUES ('22', '0022', 'Áo thun nữ KANCHS', '160000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '17', '0', '5', '1');
INSERT INTO `product` VALUES ('23', '0023', 'Áo thun nữ QSUNDB', '152000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '1', '5', '1');
INSERT INTO `product` VALUES ('25', '0025', 'Áo thun nữ QUPMJC', '170000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '20', '0', '5', '2');
INSERT INTO `product` VALUES ('26', '0026', 'Áo sơ mi nữ QTYYMS', '200000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '24', '0', '6', '2');
INSERT INTO `product` VALUES ('27', '0027', 'Áo sơ mi nữ KMVNCS', '230000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '16', '0', '6', '2');
INSERT INTO `product` VALUES ('29', '0029', 'Áo sơ mi nữ AKNCBS', '150000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '13', '0', '6', '2');
INSERT INTO `product` VALUES ('30', '0030', 'Áo sơ mi nữ', '232000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '23', '0', '6', '2');
INSERT INTO `product` VALUES ('31', '0031', 'Quần jean nữ', '190000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '25', '0', '8', '3');
INSERT INTO `product` VALUES ('32', '0032', 'Quần jean nữ PLQMXS', '200000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '10', '0', '8', '3');
INSERT INTO `product` VALUES ('33', '0033', 'Quần jean nữ PLKMNC', '230000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '24', '0', '8', '3');
INSERT INTO `product` VALUES ('34', '0034', 'Quần jean nữ PLCNVD', '322000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '16', '0', '8', '3');
INSERT INTO `product` VALUES ('35', '0035', 'Quần jean nữ MVNCBSD', '260000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '8', '0', '8', '3');
INSERT INTO `product` VALUES ('36', '0036', 'Quần short nữ MVNPKJ', '150000', 'images/home/product2.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '13', '0', '7', '1');
INSERT INTO `product` VALUES ('37', '0037', 'Quần short nữ QUANHD', '165000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '0', '7', '2');
INSERT INTO `product` VALUES ('38', '0038', 'Quần short nữ MAKXNCS', '170000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '32', '0', '7', '4');
INSERT INTO `product` VALUES ('39', '0039', 'Quần short nữ MANCHSX', '162000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '20', '1', '7', '4');
INSERT INTO `product` VALUES ('40', '0040', 'Quần short nữ POMNDH', '165000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '25', '0', '7', '4');
INSERT INTO `product` VALUES ('41', '0041', 'Áo khóa nam OQNCMS', '167000', 'images/home/product2.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '16', '0', '9', '2');
INSERT INTO `product` VALUES ('42', '0042', 'Áo khoác nam PMSNCA', '200000', 'images/home/product2.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '19', '1', '9', '2');
INSERT INTO `product` VALUES ('44', '0044', 'Áo khoác nam UOINCS', '190000', 'images/home/product2.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '16', '0', '9', '1');
INSERT INTO `product` VALUES ('45', '0045', 'Áo khoác nam', '230000', 'images/home/product2.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '13', '0', '9', '2');
INSERT INTO `product` VALUES ('46', '0046', 'Áo khoác nữ UONCVS', '160000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '25', '0', '10', '4');
INSERT INTO `product` VALUES ('47', '0046', 'Áo khoác nữ PLMNCS', '170000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '21', '0', '10', '4');
INSERT INTO `product` VALUES ('48', '0048', 'Aó khoác nữ PMCNSV', '180000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '20', '0', '10', '4');
INSERT INTO `product` VALUES ('49', '0049', 'Áo khoác nữ UONVBSJ', '162000', 'images/home/product6.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '23', '0', '10', '4');
INSERT INTO `product` VALUES ('52', '0052', 'Áo khoác cặp PMSJVNS', '375000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '26', '0', '11', '4');
INSERT INTO `product` VALUES ('53', '0053', 'Áo khoác cặp MWPCNS', '400000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '24', '0', '11', '3');
INSERT INTO `product` VALUES ('54', '0054', 'Áo khoác cặp LQMCNSK', '392000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '10', '0', '11', '4');
INSERT INTO `product` VALUES ('55', '0055', 'Áo khoác cặp MVNSHC', '320000', 'images/home/product5.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '15', '0', '11', '4');
INSERT INTO `product` VALUES ('57', '0057', 'Giày lười NCBSXMS', '409000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '11', '1', '12', '5');
INSERT INTO `product` VALUES ('58', '0058', 'Giày lười MXNSCS', '360000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '0', '12', '5');
INSERT INTO `product` VALUES ('59', '0059', 'Giày luời PNCBSX', '320000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '32', '0', '12', '5');
INSERT INTO `product` VALUES ('60', '0060', 'Giày lười PQMCNS', '360000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '32', '0', '12', '5');
INSERT INTO `product` VALUES ('61', '0061', 'Giày tây QNCBSDA', '500000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '0', '13', '6');
INSERT INTO `product` VALUES ('63', '0063', 'Giày tây MVNSHCB', '420000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '15', '0', '13', '5');
INSERT INTO `product` VALUES ('64', '0064', 'Giày tây QNCBSV', '400000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '16', '1', '13', '6');
INSERT INTO `product` VALUES ('65', '0065', 'Giày tây NVBACS', '360000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '14', '1', '13', '6');
INSERT INTO `product` VALUES ('66', '0066', 'Giày boots MCNSJV', '430000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '13', '0', '14', '6');
INSERT INTO `product` VALUES ('67', '0067', 'Giày boots VNSCAX', '420000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '0', '14', '6');
INSERT INTO `product` VALUES ('68', '0068', 'Giày boots', '410000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '10', '1', '14', '6');
INSERT INTO `product` VALUES ('70', '0070', 'Giày boots NCBSXB', '342000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '0', '14', '6');
INSERT INTO `product` VALUES ('71', '0071', 'Giày Pump CNSKXA', '356000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '14', '0', '15', '7');
INSERT INTO `product` VALUES ('72', '0072', 'Giày Pump LVMSJC', '389000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '0', '15', '7');
INSERT INTO `product` VALUES ('73', '0073', 'Giày Pump', '420000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '15', '0', '15', '7');
INSERT INTO `product` VALUES ('74', '0074', 'Giày Pump KCKSIV', '462000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '0', '15', '7');
INSERT INTO `product` VALUES ('75', '0075', 'Giày Pump MCNSBX', '380000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '0', '15', '7');
INSERT INTO `product` VALUES ('76', '0076', 'Giày Slip-on MVJSNC', '362000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '14', '0', '16', '8');
INSERT INTO `product` VALUES ('77', '0077', 'Giày Slip-on NCBSXA', '353000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '15', '0', '16', '7');
INSERT INTO `product` VALUES ('78', '0078', 'Giày Slip-on NCBSXA', '362000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '10', '1', '16', '7');
INSERT INTO `product` VALUES ('79', '0079', 'Giày Slip-on ƯOVNSX', '423000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '0', '16', '8');
INSERT INTO `product` VALUES ('80', '0080', 'Giày Slip-on QKCNSX', '357000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '16', '0', '16', '8');
INSERT INTO `product` VALUES ('81', '0081', 'Giày sneaker QUNSCA', '362000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '13', '5', '17', '8');
INSERT INTO `product` VALUES ('82', '0082', 'Giày sneaker QPCMSN', '345000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '8', '17', '8');
INSERT INTO `product` VALUES ('83', '0083', 'Giày sneaker QPCMSN', '362000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '14', '17', '17', '8');
INSERT INTO `product` VALUES ('84', '0084', 'Giày sneaker', '345000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '9', '4', '17', '8');
INSERT INTO `product` VALUES ('85', '0085', 'Giày sneaker PQQANX', '332000', 'images/shop/product12.jpg', '- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '12', '23', '17', '8');
INSERT INTO `product` VALUES ('86', '0086', 'Áo thun nam AMCNSD', '156000', 'images/home/product2.jpg', '- Chất liệu thun co dãn cực tốt nhưng không làm biến dạng vải.\r\n- Sự đầu tư nghiên cứu về phom dáng tạo nên sản phẩm phù hợp với đa số vóc dáng người dùng.\r\n- Ngoài ra, màu sắc cổ điển và tinh tế, dễ dàng phối hợp với nhiều màu sắc khác.\r\n- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt.', '17', '24', '4', '2');
INSERT INTO `product` VALUES ('87', '0087', 'Áo thun nữ PAMCNS', '123000', 'images/home/product6.jpg', '- Chất liệu thun co dãn cực tốt nhưng không làm biến dạng vải.\r\n- Sự đầu tư nghiên cứu về phom dáng tạo nên sản phẩm phù hợp với đa số vóc dáng người dùng.\r\n- Ngoài ra, màu sắc cổ điển và tinh tế, dễ dàng phối hợp với nhiều màu sắc khác.\r\n- Thiết kế cổ tròn đơn giản và tinh tế, thích hợp phối với nhiều loại trang phục khác nhau. Họa tiết sọc luôn là xu hướng và chưa có dấu hiệu hạ nhiệt', '17', '24', '6', '3');

-- ----------------------------
-- Table structure for rencentlyviewed
-- ----------------------------
DROP TABLE IF EXISTS `rencentlyviewed`;
CREATE TABLE `rencentlyviewed` (
  `Id` int(11) NOT NULL,
  `ClientId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_CLIENT_RECENTLY_VIEWED` (`ClientId`),
  KEY `FK_PRODUCT_RECENTLY_VIEWED` (`ProductId`),
  CONSTRAINT `FK_CLIENT_RECENTLY_VIEWED` FOREIGN KEY (`ClientId`) REFERENCES `client` (`Id`),
  CONSTRAINT `FK_PRODUCT_RECENTLY_VIEWED` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rencentlyviewed
-- ----------------------------

-- ----------------------------
-- Table structure for usercustomer
-- ----------------------------
DROP TABLE IF EXISTS `usercustomer`;
CREATE TABLE `usercustomer` (
  `Id` int(11) NOT NULL,
  `UserName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ClientId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_CLIENT` (`ClientId`),
  CONSTRAINT `FK_CLIENT` FOREIGN KEY (`ClientId`) REFERENCES `client` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of usercustomer
-- ----------------------------
INSERT INTO `usercustomer` VALUES ('1', 'user1', 'divine2014', '1');
INSERT INTO `usercustomer` VALUES ('2', 'user2', 'user2', '2');
INSERT INTO `usercustomer` VALUES ('3', 'tuandang', 'divine2014', '5');
INSERT INTO `usercustomer` VALUES ('4', 'test1', '123', '6');
INSERT INTO `usercustomer` VALUES ('5', 'thangtran', '123', '7');
INSERT INTO `usercustomer` VALUES ('6', 'tientruong', '123', '8');
INSERT INTO `usercustomer` VALUES ('7', 'minhtuan', '123', '9');
