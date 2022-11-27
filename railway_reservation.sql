CREATE TABLE `Customer`(
    `CustomerID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL,
    `Gender` VARCHAR(10) NOT NULL,
    `Age` SMALLINT UNSIGNED DEFAULT 19,
    `CustomerAddress` VARCHAR(255) DEFAULT "Not Filled",
    `CustomerEmail` varchar(255) DEFAULT "Not Filled",
    `CustomerPassword` varchar(255) NOT NULL,
    PRIMARY KEY (`CustomerID`)  
);
Desc `Customer`;
INSERT INTO `Customer`(`FirstName`,`LastName`,`Gender`,`Age`,`CustomerAddress`,`CustomerEmail`,`CustomerPassword`) VALUES 
('Anshuman','Barik','Male',20,'Near Cgu,Bbsr,Odisha','Anshu2365@gmail.com','Anshu@123'),
('Himanshu','Singh','Male',20,'NBH Cgu,Bbsr,Odisha','Himanshu123@gmail.com','Himanshu@562'),
('Ananya','Dhal','Male',20,'Back Gate Cgu,Bbsr,Odisha','Ananya23@gmail.com','Ananya@635'),
('Piyush','Kumar','Male',18,'Back Gate Cgu,Bbsr,Odisha','Piyush36@gmail.com','Piyush@364'),
('Manish','Kumar','Male',21,'NBH Cgu,Bbsr,Odisha','Manish56@gmail.com','Manish@196'),
('Sahil','Sinha','Male',22,'NBH Cgu,Bbsr,Odisha','Sahil1236@gmail.com','Sahil@69'),
('Vishal','Singh','Male',21,'NBH Cgu,Bbsr,Odisha','Vishal6@gmail.com','Vishal@9696'),

('Aashita','Panday','Female',20,'Hostel Cgu,Bbsr,Odisha','Aashita123@gmail.com','Aashita@963'),
('Ankita','Vatsh','Female',19,'Hostel Cgu,Bbsr,Odisha','Ankita36@gmail.com','Ankita@36'),
('Nidhi','Suwansh','Female',20,'Hostel Cgu,Bbsr,Odisha','Nidhi56@gmail.com','Nidhi@654'),
('Sanskruti','Jena','Female',19,'Hostel Cgu,Bbsr,Odisha','Sanskruti63@gmail.com','Sanskruti@14'),
('Alena','Tripathy','Female',19,'Hostel Cgu,Bbsr,Odisha','Aleana13@gmail.com','Alisha@2345');
select * from `Customer`;

CREATE TABLE `Admin`(
    `AdminID` INT UNSIGNED NOT NULL UNIQUE,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL,
    `Gender` VARCHAR(10) NOT NULL,
    `Age` SMALLINT UNSIGNED DEFAULT 25,
    `AdminAddress` VARCHAR(255) DEFAULT "Not Filled",
    `AdminEmail` varchar(255) DEFAULT "Not Filled",
    `AdminPassword` varchar(255) NOT NULL,
    PRIMARY KEY (`AdminID`)  
);
Desc `Admin`;
INSERT INTO `Admin` VALUES 
(01,'Umit','Sahoo','Male',19,'Pipili Puri,Odisha','20010195@cgu-odisha.ac.in','Umit@20010195'),
(02,'Shivam','Verma','Male',20,'BackGate CGU,Odisha','20010194@cgu-odisha.ac.in','Shivam@20010194'),
(03,'Rishav','Ranjan','Male',20,'near CGU,Odisha','20010512@cgu-odisha.ac.in','Rishav@20010512'),
(04,'Pankaj','Gupta','Male',19,'NBH CGU,Odisha','20010186@cgu-odisha.ac.in','Pankaj@20010186'),
(05,'Yuvraj','Kaushal','Male',20,'NBH CGU,Odisha','20010188@cgu-odisha.ac.in','Yuvraj@20010188'),
(06,'Ashirbad','Sahoo','Male',21,'NBH CGU,Odisha','20010193@cgu-odisha.ac.in','Ashirbad@20010193');
select * from `Admin`;
CREATE TABLE `TrainTicket`(
    `TicketID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `TicketNumber` INT UNSIGNED NOT NULL,
    `DateAvail` DATE NOT NULL,
    `DateFlight` DATE NOT NULL,
    `TimeDepart` TIME NOT NULL,
    `TimeLand` TIME NOT NULL,
    `Source` VARCHAR(255) NOT NULL,
    `Destination` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`TicketID`) 
);
Desc `TrainTicket`;
INSERT INTO `TrainTicket` (`TicketNumber`,`DateAvail`,`DateFlight`,`TimeDepart`,`TimeLand`,`Source`,`Destination`) VALUES
(101,'2024/07/24','2024/07/25','07:50:12','12:00:56','Bhubaneswar','Ranchi'),
(102,'2024/07/24','2024/07/26','06:50:12','09:00:36','Bhubaneswar','Patna'),
(103,'2024/07/24','2024/07/30','13:50:12','18:36:12','Bhubaneswar','Jaipur'),
(104,'2024/07/24','2024/07/30','14:50:12','18:23:00','Bhubaneswar','Jamshedpur'),
(105,'2024/08/01','2024/08/03','10:50:12','18:00:56','Bhubneswar','Vizag');
select * from `TrainTicket`;
    
CREATE TABLE `Reservation`(
    `ResID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `CustomerID` INT UNSIGNED NOT NULL,
    `AdminID` INT UNSIGNED NOT NULL,
    `TicketID` INT UNSIGNED NOT NULL,
    `DateReservation` DATE NOT NULL,
    `DateAccommodation` DATE NOT NULL,
    PRIMARY KEY (`ResID`),
    CONSTRAINT `constr_Reservation_Customer_fk`
    FOREIGN KEY  `customer_fk` (`CustomerID`) REFERENCES `Customer` (`CustomerID`),

    CONSTRAINT `constr_Reservation_Admin_fk`
    FOREIGN KEY  `Admin_fk` (`AdminID`) REFERENCES `Admin` (`AdminID`),


    CONSTRAINT `constr_Reservation_Ticket_fk`
    FOREIGN KEY  `Ticket_fk` (`TicketID`) REFERENCES `TrainTicket` (`TicketID`)
    
    ON DELETE CASCADE ON UPDATE CASCADE     
);
Desc `Reservation`;
INSERT INTO `Reservation` (`CustomerID`,`AdminID`,`TicketID`,`DateReservation`,`DateAccommodation`)
 VALUES (1,01,1,'2024/07/06','2024/07/21'),
 (2,03,2,'2024/07/12','2024/07/15'),
 (3,04,5,'2024/07/11','2024/07/15'),
 (4,02,3,'2024/07/12','2024/07/13'),
 (5,01,4,'2024/07/14','2024/07/21'),
 (6,06,2,'2024/07/07','2024/07/19'),
 (7,03,4,'2024/07/14','2024/07/23'),
 (1,02,3,'2024/07/04','2024/07/16');
 select * from `Reservation`;
CREATE TABLE `Transaction`(
    `TransactionID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `TransactionName` VARCHAR(50) NOT NULL,
    `TransactionTypeID` INT UNSIGNED NOT NULL,
    `ResID` INT UNSIGNED NOT NULL,
    `CustomerID` INT UNSIGNED NOT NULL,
  
    `AdminID` INT UNSIGNED NOT NULL,
    `TransationDate` DATE NOT NULL,
    PRIMARY KEY(`TransactionID`),

    CONSTRAINT `constr_Transaction_TransactionType_fk` 
    FOREIGN KEY `Transaction_fk`(`TransactionTypeID`) REFERENCES `TransactionType` (`TransactionTypeID`),

    CONSTRAINT `constr_Transaction_Customer_fk`
    FOREIGN KEY  `customer_fk` (`CustomerID`) REFERENCES `Customer` (`CustomerID`),

    CONSTRAINT `constr_Transaction_Admin_fk`
    FOREIGN KEY  `Admin_fk` (`AdminID`) REFERENCES `Admin` (`AdminID`),

    CONSTRAINT `constr_Transaction_Reservation_fk`
    FOREIGN KEY  `Reservation_fk` (`ResID`) REFERENCES `Reservation` (`ResID`)

    ON DELETE CASCADE ON UPDATE CASCADE 
);
Desc `Transaction`;
INSERT INTO `Transaction` (`TransactionName`,`TransactionTypeID`,`ResID`, `CustomerID`,`AdminID`, `TransationDate`) VALUES
('Anshuman',2,1,1,01,'2024/07/06'),
('Himanshu',1,2,2,03,'2024/07/12'),
('Ananya',2,3,3,04,'2024/07/11');
select * from `Transaction`;
CREATE TABLE `TransactionType`(
    `TransactionTypeID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `TransactionMode` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`TransactionTypeID`)   
);
Desc `TransactionType`;
INSERT INTO `TransactionType` (`TransactionMode`) VALUES ('OFFLINE'),('ONLINE');
select * from `TransactionType`;
CREATE TABLE `Reports`(
  `ReportID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `TransactionID` INT UNSIGNED NOT NULL,
  `ResID` INT UNSIGNED NOT NULL,
  `ReportDate` DATE NOT NULL,
  PRIMARY KEY(`ReportID`),
  
  CONSTRAINT `constr_Reports_Transaction_fk`
  FOREIGN KEY `Transaction_fk`(`TransactionID`) REFERENCES `Transaction` (`TransactionID`),

  CONSTRAINT `constr_Reports_Reseravation_fk`
  FOREIGN KEY `Reservation_Fk`(`ResID`) REFERENCES `Reservation` (`ResID`)

  ON DELETE CASCADE ON UPDATE CASCADE  

);
Desc `Reports`;
INSERT INTO `Reports` (`TransactionID`,`ResID`,`ReportDate`) VALUES
(1,1,'2024/07/06'),
(2,2,'2024/07/12'),
(3,3,'2024/07/11');
select * from `Reports`;

//Join Operations on Railway Reservation
->1.Inner Join

//NAME OF CUSTOMER APPLIED FOR RESERVATION
SELECT `Customer`.`FirstName` , `Customer`.`LastName` 
FROM `Customer`
INNER JOIN `Reservation` ON `Customer`.`CustomerID`=`Reservation`.`CustomerID` ;

//NAME OF CUSTOMER WHOSE TicketID=2
SELECT `Customer`.`FirstName` , `Customer`.`LastName` 
FROM `Customer` 
INNER JOIN `Reservation` ON `Customer`.`CustomerID`=`Reservation`.`CustomerID` 
WHERE `Reservation`.`TicketID`=2;

//
SELECT `Customer`.`FirstName` , `Customer`.`LastName` ,`TrainTicket`.`Destination`
FROM `Customer`,`TrainTicket` 
INNER JOIN `Reservation` ON `Customer`.`CustomerID`=`Reservation`.`CustomerID`
WHERE `Reservation`.`TicketID`=2;
