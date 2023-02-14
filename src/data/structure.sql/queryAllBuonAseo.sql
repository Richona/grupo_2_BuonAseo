/* ESTRUCTURA */

CREATE TABLE `Brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Genders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Interests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Payment_methods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `bottom_letter_title` varchar(255) NOT NULL,
  `bottom_letter_full` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `href` varchar(255) DEFAULT NULL,
  `a` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Responses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `id_question` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_question` (`id_question`),
  CONSTRAINT `responses_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `Questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Shipping_prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `province` varchar(255) DEFAULT NULL,
  `price` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Type_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int DEFAULT NULL,
  `dni` int DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `is_admin` int DEFAULT NULL,
  `id_type_user` int DEFAULT NULL,
  `id_gender` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_user` (`id_type_user`),
  KEY `id_gender` (`id_gender`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_type_user`) REFERENCES `Type_users` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_gender`) REFERENCES `Genders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `User_interests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_interest` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_interest` (`id_interest`),
  CONSTRAINT `user_interests_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id`),
  CONSTRAINT `user_interests_ibfk_2` FOREIGN KEY (`id_interest`) REFERENCES `Interests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Cart_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `total` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `cart_orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Files_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  `id_payment` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_payment` (`id_payment`),
  CONSTRAINT `files_payments_ibfk_1` FOREIGN KEY (`id_payment`) REFERENCES `Payment_methods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Letterimage_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `letter` varchar(255) DEFAULT NULL,
  `id_payment` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_payment` (`id_payment`),
  CONSTRAINT `letterimage_payments_ibfk_1` FOREIGN KEY (`id_payment`) REFERENCES `Payment_methods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `id_user` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `idCode` int NOT NULL,
  `price` int NOT NULL,
  `discount` int NOT NULL,
  `volume` int NOT NULL,
  `stock` int NOT NULL,
  `smell` varchar(255) DEFAULT NULL,
  `dimensions` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `Categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `cartOrderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cartOrderId` (`cartOrderId`),
  KEY `productId` (`productId`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`cartOrderId`) REFERENCES `Cart_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `Products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Detail_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `discount` int NOT NULL,
  `price` int NOT NULL,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_order` (`id_order`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `detail_orders_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `Orders` (`id`),
  CONSTRAINT `detail_orders_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `Products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Product_featureds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `product_featureds_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `Products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/* DATA */

INSERT INTO `Brands` VALUES (1,'Servidor','','2022-12-15 21:26:40',NULL,NULL),(2,'Fast','','2022-12-15 21:26:40',NULL,NULL),(3,'Nuk','','2022-12-15 21:26:40',NULL,NULL),(4,'Lagarto','','2022-12-15 21:26:40',NULL,NULL),(5,'Ecovita','','2022-12-15 21:26:40',NULL,NULL),(6,'Master Clean','','2022-12-15 21:26:40',NULL,NULL),(7,'Esencial','','2022-12-15 21:26:40',NULL,NULL),(8,'Palmolive','','2022-12-15 21:26:40',NULL,NULL),(9,'Nahuel','','2022-12-15 21:26:40',NULL,NULL),(10,'Aldex','','2022-12-15 21:26:40',NULL,NULL),(11,'Flash','','2022-12-15 21:26:40',NULL,NULL),(12,'Gigante','','2022-12-15 21:26:40',NULL,NULL),(13,'Woolite','','2022-12-15 21:26:40',NULL,NULL),(14,'Heroe','','2022-12-15 21:26:40',NULL,NULL),(15,'Amita','','2022-12-15 21:26:40',NULL,NULL);

INSERT INTO `Categories` VALUES (1,'Jabon',1,'2022-12-15 21:26:40',NULL,NULL),(2,'Suavisante',1,'2022-12-15 21:26:40',NULL,NULL),(3,'Detergente',1,'2022-12-15 21:26:40',NULL,NULL),(4,'Lavandina',1,'2022-12-15 21:26:40',NULL,NULL),(5,'Liquido para pisos',1,'2022-12-15 21:26:40',NULL,NULL),(6,'Pastilla para Baño',1,'2022-12-15 21:26:40',NULL,NULL),(7,'Papel Higienico',1,'2022-12-15 21:26:40',NULL,NULL),(8,'Jabon Tocador',1,'2022-12-15 21:26:40',NULL,NULL),(9,'Desinfectante',1,'2022-12-15 21:26:40',NULL,NULL),(10,'Desengrasante',1,'2022-12-15 21:26:40',NULL,NULL);

INSERT INTO `Genders` VALUES (1,'m','2022-12-15 21:26:40',NULL,NULL),(2,'f','2022-12-15 21:26:40',NULL,NULL),(3,'o','2022-12-15 21:26:40',NULL,NULL);

INSERT INTO `Interests` VALUES (1,'jabones','2022-12-15 21:26:40',NULL,NULL),(2,'suavisantes','2022-12-15 21:26:40',NULL,NULL),(3,'lavandinas','2022-12-15 21:26:40',NULL,NULL);

INSERT INTO `Payment_methods` VALUES (1,'fa-solid fa-credit-card','Tarjetas de crédito en hasta 24 cuotas*','Acreditación instantánea.','*La cantidad de cuotas puede variar según la tarjeta.','2022-12-15 21:26:41',NULL,NULL),(2,'fa-solid fa-credit-card','Tarjetas de débito','Acreditación instantánea.','','2022-12-15 21:26:41',NULL,NULL),(3,'fa-solid fa-money-bill-1-wave','Efectivo','Es muy simple: cuando termines tu compra, te daremos las instrucciones para que sepas cómo y dónde pagarla','','2022-12-15 21:26:41',NULL,NULL);

INSERT INTO `Products` VALUES (1,'Lavandina Servidor',4902,500,50,1,2,'---',22,1,'sda','Agua Lavandina Servidor Básica 25 g CL/litro Limpia y desinfecta Elimina el 99,9 % de las bacterias','/img/fotos-productos/lavandinas/lavandina-imagen-1.png',1,4,'2022-12-15 21:26:40',NULL,NULL),(2,'Detergente Fast',7109,530,18,5,0,'Limon',44,1,'','Fast Detergente es excelente para el lavado manual de ollas,sartenes, loza, cristalería, plata, equipo de preparación de alimentos y toda clase de utensilios.','/img/fotos-productos/detergentes/detergente-imagen-1.png',1,3,'2022-12-15 21:26:40',NULL,NULL),(3,'Jabon Nuk',2229,1000,9,750,1,'Bebe',11,3,'','Desarrollado para una limpieza suave pero exhaustiva de la ropa de tu bebé','/img/fotos-productos/jabones/jabon-imagen-1.png',1,1,'2022-12-15 21:26:40',NULL,NULL),(4,'Suavisante Lagarto',6669,1200,0,13,1,'Floral',55,1,'','Recomendado para quienes buscan la suavidad y el aroma de siempre','/img/fotos-productos/suavisantes/suavisante-imagen-1.png',1,2,'2022-12-15 21:26:40',NULL,NULL),(5,'Liquido de piso Ecovita',5554,700,36,5,1,'Lavanda',11,2,'','Limpiador líquido de pisos. Limpia y desodoriza.','/img/fotos-productos/liquido-para-pisos/liquidoP-imagen-1.png',1,5,'2022-12-15 21:26:40',NULL,NULL),(6,'Jabon Master Clean',1144,2000,41,5,1,'Don',33,1,'','Jabón líquido baja espuma Master Clean. Aprobado por ANMAT','/img/fotos-productos/jabones/jabon-imagen-2.png',1,1,'2022-12-15 21:26:40',NULL,NULL),(7,'Lavandina Esencial',9887,550,5,1,1,'---',55,1,'','Agua Lavandina Servidor Básica 25 g CL/litro Limpia y desinfecta Elimina el 99,9 % de las bacterias','/img/fotos-productos/lavandinas/lavandina-imagen-2.png',1,4,'2022-12-15 21:26:40',NULL,NULL),(8,'Detergente Palmolive',1294,1200,22,3,1,'Original',33,1,'','Nueva fórmula elimina restos de alimentos','/img/fotos-productos/detergentes/detergente-imagen-6.png',1,3,'2022-12-15 21:26:40',NULL,NULL),(9,'Liquido de piso Nahuel',3333,700,7,5,1,'Algodon',22,5,'','Nueva fragancia con mayor duracion.','/img/fotos-productos/liquido-para-pisos/liquidoP-imagen-4.png',1,5,'2022-12-15 21:26:40',NULL,NULL),(10,'Lavandina Aldex',5677,600,2,5,0,'---',33,1,'','Agua lavandina','/img/fotos-productos/lavandinas/lavandina-imagen-10.png',1,4,'2022-12-15 21:26:40',NULL,NULL),(11,'Liquido de piso Flash',4762,3000,4,5,0,'Lavanda',22,5,'','Limpieza rápida y profunda, prolongado aromatizado de ambientes con frescas y persistentes fragancias.','/img/fotos-productos/liquido-para-pisos/liquidoP-imagen-8.png',1,5,'2022-12-15 21:26:40',NULL,NULL),(12,'Suavisante Gigante y',7645,5000,5,5,1,'---',50,2,'','Formula economica para tus prendas','/img/fotos-productos/suavisantes/suavisante-imagen-7.png',1,5,'2022-12-15 21:26:40',NULL,NULL),(13,'Jabon Woolite',2452,500,16,1,1,'Rosas',20,4,'','Jabon para cuidar de tu ropa de seda.','/img/fotos-productos/jabones/jabon-imagen-3.png',1,1,'2022-12-15 21:26:40',NULL,NULL),(14,'Jabon Heroe',2399,200,2,800,1,'---',30,3,'','No daña tus prendas, cuida tus colores.Elimina hasta las manchas mas difíciles.','/img/fotos-productos/jabones/jabon-imagen-4.png',1,1,'2022-12-15 21:26:40',NULL,NULL),(15,'Liquido de piso Amita',2904,1500,5,5,1,'Original',20,5,'','Desodorante de piso','/img/fotos-productos/liquido-para-pisos/liquidoP-imagen-3.png',1,5,'2022-12-15 21:26:40',NULL,NULL),(16,'sadsadholchausad',123,123,12,213321,12,'12323',12231,1212,'asdsa','wqasdda','/img/fotos-productos/productsAdd/product-1671481761804.png',0,8,'2022-12-15 21:26:40','2022-12-20 21:12:31',NULL);

INSERT INTO `Questions` VALUES (1,'¿Cómo comprar en Buon Aseo?','/footer/comprar','Cómo comprar','2022-12-15 21:26:41',NULL,NULL),(2,'¿Cómo accedo a los precios?','','','2022-12-15 21:26:41',NULL,NULL),(3,'¿Hacen envios?¿Cúales son los dias de entrega?','/footer/puntos','acá.','2022-12-15 21:26:41',NULL,NULL),(4,'¿Cúal es el monto mínimo de compra?','','','2022-12-15 21:26:41',NULL,NULL),(5,'¿Cúales son los medios de pagos?','','','2022-12-15 21:26:41',NULL,NULL),(6,'¿Dónde puedo visitarlos?','https://maps.app.goo.gl/JZfumo4UQM1vkVWb7','Coronel Mendez 1908 Wilde - Buenos Aires','2022-12-15 21:26:41',NULL,NULL),(7,'¿Se puede fraccionar la mercadería?','','','2022-12-15 21:26:41',NULL,NULL),(8,'¿Cúanto demora la entrega una vez efectuada la compra?','','','2022-12-15 21:26:41',NULL,NULL),(9,'hola','','','2022-12-15 21:26:41',NULL,NULL),(10,'fecha','','','2022-12-15 21:26:41',NULL,NULL),(11,'asdad','','','2022-12-15 21:26:41',NULL,NULL),(12,'123443','','','2022-12-15 21:26:41',NULL,NULL),(13,'213213','','','2022-12-15 21:26:41',NULL,NULL),(14,'213321','','','2022-12-15 21:26:41',NULL,NULL),(15,'sdfsdfhola','','','2022-12-15 21:26:41',NULL,NULL);

INSERT INTO `Responses` VALUES (1,'Es simple y rápido, solo tenés que ingresar al siguiente link y segui los pasos!',1,'2022-12-15 21:26:41',NULL,NULL),(2,'Para ver los precios es fundamental registrarte como cliente, si ya lo hiciste y aun no los podes ver, aguarda la llamada de un representante BuonAseo, o comunicate con nosotros.',2,'2022-12-15 21:26:41',NULL,NULL),(3,'Si! Hacemos envíos a todos el país, ingresa y entérate de todo',3,'2022-12-15 21:26:41',NULL,NULL),(4,'El monto mínimo para retiro en tienda es de $10000, y el monto mínimo de compra para envíos es de $40000.',4,'2022-12-15 21:26:41',NULL,NULL),(5,'Envíos al interior del país: Pago anticipado por depósito en efectivo o transferencia bancaria previo al envío de la mercadería',5,'2022-12-15 21:26:41',NULL,NULL),(6,'Entregas directas: Contado contra entrega de la mercadería o anticipado vía deposito | transferencia bancaria.',5,'2022-12-15 21:26:41',NULL,NULL),(7,'Compra o retiro en mostrador: Contado en efectivo por caja. Tarjeta debito: Cabal, Visa y Mastercard. Anticipado vía deposito | transferencia bancaria.',5,'2022-12-15 21:26:41',NULL,NULL),(8,'Vení a conocer nuestro showroom! Encontrarás todos los productos que comercializamos en exhibición! Los pedidos deben realizarse por la página web donde encontrarás publicados todos nuestros productos; Una vez que hayas completado tu compra nos comunicaremos con vos para coordinar día y horario de retiro en tienda ubicada en ',6,'2022-12-15 21:26:41',NULL,NULL),(9,'Si, dependiendo del artículo que quieras comprar. En la web, debajo de la foto del artículo podes encontrar predeterminada la cantidad que viene en el pack o bulto cerrado. Hay ciertos productos, como por ejemplo: esponjas de cocina, trapos de piso y papel higiénico entre otros; que obligatoriamente se deben comprar por un mínimo determinado de unidades.',7,'2022-12-15 21:26:41',NULL,NULL),(10,'Envios: Una vez realizado el pedido, deberás tener en cuenta que será preparado y controlado por orden de llegada; Luego nos comunicaremos contigo para informarte los detalles del mismo y avanzar sobre la facturación y te enviaremos nuestros datos bancarios para que puedas realizar el pago. Al momento de recibir el comprobante de pago y su acreditación bancaria el pedido será despachado.',8,'2022-12-15 21:26:41',NULL,NULL),(11,'Retiro en tienda: Para venir a retirar tu compra a BuonAseo el procedimiento es similar a los envíos. Cuando tu pedido este preparado y controlado nos pondremos en contacto contigo para comunicarte detalles del mismo, así como también coordinar día y horario de retiro en tienda. Luego se realizará la facturación y posteriormente el pago y retiro de mercadería.',8,'2022-12-15 21:26:41',NULL,NULL),(12,'hola pa.',9,'2022-12-15 21:26:41',NULL,NULL),(13,'fadsddf',10,'2022-12-15 21:26:41',NULL,NULL),(14,'dsadds  ',11,'2022-12-15 21:26:41',NULL,NULL);

INSERT INTO `Shipping_prices` VALUES (1,'Neuquen',50,'2022-12-15 21:26:41',NULL,NULL),(2,'Jujuy',200,'2022-12-15 21:26:41',NULL,NULL),(3,'Tucumán',400,'2022-12-15 21:26:41',NULL,NULL),(4,'Tierra del Fuego',1500,'2022-12-15 21:26:41',NULL,NULL),(5,'Santiago del Estero',400,'2022-12-15 21:26:41',NULL,NULL),(6,'Santa Fe',200,'2022-12-15 21:26:41',NULL,NULL),(7,'Santa Cruz',200,'2022-12-15 21:26:41',NULL,NULL),(8,'San Luis',400,'2022-12-15 21:26:41',NULL,NULL),(9,'San Juan',300,'2022-12-15 21:26:41',NULL,NULL),(10,'Salta',300,'2022-12-15 21:26:41',NULL,NULL),(11,'Río Negro',100,'2022-12-15 21:26:41',NULL,NULL),(12,'Misiones',300,'2022-12-15 21:26:41',NULL,NULL),(13,'Mendoza',200,'2022-12-15 21:26:41',NULL,NULL),(14,'La Rioja',400,'2022-12-15 21:26:41',NULL,NULL),(15,'La Pampa',300,'2022-12-15 21:26:41',NULL,NULL),(16,'Formosa',300,'2022-12-15 21:26:41',NULL,NULL),(17,'Catamarca',400,'2022-12-15 21:26:41',NULL,NULL),(18,'Chaco',300,'2022-12-15 21:26:41',NULL,NULL),(19,'Chubut',300,'2022-12-15 21:26:41',NULL,NULL),(20,'Córdoba',300,'2022-12-15 21:26:41',NULL,NULL),(21,'Corrientes',200,'2022-12-15 21:26:41',NULL,NULL),(22,'Entre Ríos',400,'2022-12-15 21:26:41',NULL,NULL);

INSERT INTO `Type_users` VALUES (1,'vendedor','2022-12-15 21:26:40',NULL,NULL),(2,'comprador','2022-12-15 21:26:40',NULL,NULL);

INSERT INTO `Users` VALUES (1,'Richard','richard@gmail.com','$2a$10$64EoZmrUKJS94rLHjEN5.uYxWyWWh0xob4ZH5hXfE3n4wKxL2Aicy',123231,123213,NULL,'Argentina pa','calle213','la calle','la calle','avatar-1670245055143.png',1,1,3,'2022-12-15 21:26:41',NULL,NULL),(2,'Sirley','sirley@gmail.com','$2a$10$uoKKFsMcXlf8kK3iMNDLO..Shva2q.Bp9zJpywdIJpi59tAB31UJS',213213,123321231,NULL,'','','','','avatar-1670245055156.png',1,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(3,'MatiasAdmin','matias@gmail.com','$2a$10$cBjZYK3AeRx/EuPIwmvfXuwuF0ZdG8cJpfQRRcoqo6vAHVMVruDcO',213321312,12312132,NULL,'','','','','avatar-1664055187271.png',1,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(4,'Daniel','daniel@gmail.com','$2a$10$NkGn9bnAWChNW1PyCMDove4WbMFLp5U/.DaY1U8O4JMQMonrYp0r2',123123123,12321321,NULL,'arentina','8322','brentana 7','cutral co','avatar-1662861993706.jpg',1,1,1,'2022-12-15 21:26:41',NULL,NULL),(5,'Julian','julian@gmail.com','$2a$10$LqPFWS0kwXPga7wvqEKM3etxhWZYLkJB6cC.3k1JFb.63XikykcqW',NULL,NULL,NULL,'Argentina',NULL,NULL,NULL,'avatar-1670245055151.png',1,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(6,'Eric','eric@gmail.com','$2a$10$NBnHJCBKr29IGiPw2LTqHeGaV7gUIg74SSJbJxpggzKquQKJaG2k.',NULL,NULL,NULL,'Argentina',NULL,NULL,NULL,'avatar-1670245055150.png',1,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(7,'sabbadini','matiassabbadini24@gmail.com','123456',123123213,123123123,NULL,'sadsad','asdsaddsa','sadsad','324324','avatar-1662830469810.png',0,1,1,'2022-12-15 21:26:41',NULL,NULL),(8,'dani','daniel89@gmail.com','$2a$10$TGszO7/8InzzeoOry47Z4e9XLwwchyZo6YzStyM3Oj0.9YI36xwRC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(9,'richarduno','richarduno@gmail.com','$2a$10$zYXcfXI.T/qrwHONUHjy4Ow..H.qXUU0eYXMqXHyFP13lm1/K8Epe',12312,123123123,NULL,'324','2133','657','sasda','avatar-1664116045248.PNG',0,1,2,'2022-12-15 21:26:41',NULL,NULL),(10,'Matias','matias14@gmail.com','$2a$10$Wq/e9MBe8tdtMu3plGMX0.5s26D8S9pKpEcJN1P9XryKju40vsBqa',123132213,123123123,NULL,'','','','',NULL,0,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(11,'richarddos','richarddos@gmail.com','$2a$10$XIdZLNPRSdLZVp9ug7EqFO27yDT9Q3OFxch5w7S5fIYqwb71L1FG2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(12,'Messi','messiCrack@gmail.com','$2a$10$XIdZLNPRSdLZVp9ug7EqFO27yDT9Q3OFxch5w7S5fIYqwb71L1FG2',NULL,NULL,NULL,'Argentina',NULL,NULL,NULL,'avatar-1670245055145.jpg',0,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(13,'Van Gaal','vangaal@gmail.com','$2a$10$XIdZLNPRSdLZVp9ug7EqFO27yDT9Q3OFxch5w7S5fIYqwb71L1FG2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'avatar-1670245055146.webp',0,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(14,'Scaloneta','scaloni@gmail.com','$2a$10$XIdZLNPRSdLZVp9ug7EqFO27yDT9Q3OFxch5w7S5fIYqwb71L1FG2',NULL,NULL,NULL,'Argentina',NULL,NULL,NULL,'avatar-1670245055147.jpg',0,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(15,'Vicky','vicky@gmail.com','$2a$10$XIdZLNPRSdLZVp9ug7EqFO27yDT9Q3OFxch5w7S5fIYqwb71L1FG2',NULL,NULL,NULL,'Argentina',NULL,NULL,NULL,'avatar-1670245055149.png',0,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(16,'Juan','JuanElNegro@gmail.com','$2a$10$XIdZLNPRSdLZVp9ug7EqFO27yDT9Q3OFxch5w7S5fIYqwb71L1FG2',NULL,NULL,NULL,'Argentina',NULL,NULL,NULL,'avatar-1670245055152.png',0,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(17,'Bug','tuDolorDeCabeza@gmail.com','$2a$10$XIdZLNPRSdLZVp9ug7EqFO27yDT9Q3OFxch5w7S5fIYqwb71L1FG2',NULL,NULL,NULL,'Tu pesadilla',NULL,NULL,NULL,'avatar-1670245055148.webp',0,1,NULL,'2022-12-15 21:26:41',NULL,NULL),(18,'Kun','kun@gmail.com','$2a$10$XIdZLNPRSdLZVp9ug7EqFO27yDT9Q3OFxch5w7S5fIYqwb71L1FG2',NULL,NULL,NULL,'Argentina',NULL,NULL,NULL,'avatar-1670245055155.webp',0,1,NULL,'2022-12-15 21:26:41',NULL,NULL);

INSERT INTO `Files_payments` VALUES (1,'https://http2.mlstatic.com/storage/logos-api-admin/a5f047d0-9be0-11ec-aad4-c3381f368aaf-m.svg',1,'2022-12-15 21:26:41',NULL,NULL),(2,'https://http2.mlstatic.com/storage/logos-api-admin/b2c93a40-f3be-11eb-9984-b7076edb0bb7-m.svg',1,'2022-12-15 21:26:41',NULL,NULL),(3,'https://http2.mlstatic.com/storage/logos-api-admin/0fada860-571c-11e8-8364-bff51f08d440-m.svg',1,'2022-12-15 21:26:41',NULL,NULL),(4,'https://http2.mlstatic.com/storage/logos-api-admin/c9f71470-6f07-11ec-9b23-071a218bbe35-m.svg',1,'2022-12-15 21:26:41',NULL,NULL),(5,'https://http2.mlstatic.com/storage/logos-api-admin/33ea00e0-571a-11e8-8364-bff51f08d440-m.svg',1,'2022-12-15 21:26:41',NULL,NULL),(6,'https://http2.mlstatic.com/storage/logos-api-admin/5cc05a00-d012-11ea-be41-3936b95cb468-m.svg',1,'2022-12-15 21:26:41',NULL,NULL),(7,'https://http2.mlstatic.com/storage/logos-api-admin/992bc350-f3be-11eb-826e-6db365b9e0dd-m.svg',1,'2022-12-15 21:26:41',NULL,NULL),(8,'https://http2.mlstatic.com/storage/logos-api-admin/aa2b8f70-5c85-11ec-ae75-df2bef173be2-m.svg',1,'2022-12-15 21:26:41',NULL,NULL),(9,'https://http2.mlstatic.com/storage/logos-api-admin/ce454480-445f-11eb-bf78-3b1ee7bf744c-m.svg',2,'2022-12-15 21:26:41',NULL,NULL),(10,'https://http2.mlstatic.com/storage/logos-api-admin/157dce60-571b-11e8-95d8-631c1a9a92a9-m.svg',2,'2022-12-15 21:26:41',NULL,NULL),(11,'https://http2.mlstatic.com/storage/logos-api-admin/cb0af1c0-f3be-11eb-8e0d-6f4af49bf82e-m.svg',2,'2022-12-15 21:26:41',NULL,NULL),(12,'https://http2.mlstatic.com/storage/logos-api-admin/312238e0-571b-11e8-823a-758d95db88db-m.svg',2,'2022-12-15 21:26:41',NULL,NULL),(13,'https://http2.mlstatic.com/storage/logos-api-admin/b4534650-571b-11e8-95d8-631c1a9a92a9-m.svg',2,'2022-12-15 21:26:41',NULL,NULL),(14,'https://http2.mlstatic.com/storage/logos-api-admin/fec5f230-06ee-11ea-8e1e-273366cc763d-m.svg',3,'2022-12-15 21:26:41',NULL,NULL),(15,'https://http2.mlstatic.com/storage/logos-api-admin/443c34d0-571b-11e8-823a-758d95db88db-m.svg',3,'2022-12-15 21:26:41',NULL,NULL);

INSERT INTO `Letterimage_payments` VALUES (1,'',1,'2022-12-15 21:26:41',NULL,NULL),(2,'',2,'2022-12-15 21:26:41',NULL,NULL),(3,'Acreditación en 1 día hábil.',3,'2022-12-15 21:26:41',NULL,NULL),(4,'Acreditación instantánea.',3,'2022-12-15 21:26:41',NULL,NULL);

INSERT INTO `Cart_orders` VALUES (1,'2022-12-15 21:29:10',0,2,'inicial','2022-12-15 00:00:00','2022-12-15 21:29:10',NULL),(2,'2022-12-15 21:41:24',0,2,'inicial','2022-12-15 00:00:00','2022-12-15 21:41:24',NULL);

INSERT INTO `Cart_orders` VALUES (1,'2022-12-15 21:29:10',0,2,'inicial','2022-12-15 00:00:00','2022-12-15 21:29:10',NULL),(2,'2022-12-15 21:41:24',0,2,'inicial','2022-12-15 00:00:00','2022-12-15 21:41:24',NULL);
