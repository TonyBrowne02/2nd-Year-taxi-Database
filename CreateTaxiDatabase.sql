drop table if exists journey cascade;
drop table if exists taxi;
drop table if exists driver;
drop table if exists customer;
drop table if exists company;

create table company
(
	companyID serial primary key,
	companyName varchar(50) not null,
	companyEmail varchar(50) not null
);


create table taxi
(
	taxiReg varchar(10) primary key,
	taxiColour varchar(20),
	taxiCarType varchar(20)
);

create table driver
(
	driverNumber SERIAL primary key,
	driverName varchar(50) not null
);

create table customer
(
	customerNumber serial primary key,
	customerName varchar(50),
	companyID integer,
	constraint company_fk
		foreign key(companyID)
		references company(companyID)
		on delete set null
);

create table journey
(
	journeyNumber serial primary key,
	driverNumber integer,
	customerNumber integer,
	taxiReg varchar(9),
	journeyStartTime timestamp,
	journeyEndTime timestamp,
	journeyOrigin varchar(200),
	journeyDestination varchar(200),
	constraint customer_fk
		foreign key(customerNumber)
			references customer(customerNumber)
			on delete set null ,
	constraint driver_fk
		foreign key(driverNumber)
			references driver(driverNumber)
			on delete set null,
	constraint taxi_fk
		foreign key(taxiReg)
			references taxi(taxiReg)
			on delete set null
);			

--Insert data
insert into taxi
values
('221D11111', 'black', 'sudan'),
('221D11112', 'white', 'sudan'),
('221D11113', 'red', 'subaru'),
('221D11114', 'yellow', 'miata'),
('221D11115', 'silver', 'ford focus'),
('221D11116', 'orange', 'fiat 500');

insert into driver(driverName)
values
('JohnSmith'),
('JessSmith'),
('JeffSmith'),
('JerrySmith'),
('JoanSmith');

insert into company(companyName, companyEmail)
values
('Apple','Apple.com'),
('Bapple','Bapple.com'),
('Capple','Capple.com'),
('Dapple','Dapple.com'),
('Snapple','Snapple.com');

insert into customer(companyID, customerName)
values
(1, 'JohnRider'), 
(2, 'JakeRider'), 
(3, 'LakeRider'), 
(4, 'CakeRider'), 
(5, 'BakeRider');

--Driver 1
insert into journey(driverNumber, customernumber, taxiReg, journeystarttime, journeyendtime, journeyorigin, journeydestination)
values
(1, 1,'221D11111','2023-03-21 20:50:35', '2023-03-21 20:55:11','OConnel Bridge', 'Tara Dart'), 
(1, 2, '221D11113', '2023-03-23 10:00:00', '2023-03-23 11:00:00', 'Grafton Street', 'Dublin Zoo'), 
(1, 3, '221D11115', '2023-03-23 14:00:00', '2023-03-23 14:45:00', 'Merrion Square', 'Phoenix Park'),
(1, 5, '221D11112', '2023-03-24 16:30:00', '2023-03-24 17:00:00', 'OConnell Street', 'Temple Bar'),
(1, 2, '221D11114', '2023-03-23 10:00:00', '2023-03-23 11:00:00', 'Dublin City Centre', 'Howth Head'),
(1, 3, '221D11112', '2023-03-24 13:00:00', '2023-03-24 13:30:00', 'St. Patricks Cathedral', 'Guinness Storehouse'),
(1, 5, '221D11113', '2023-03-25 15:00:00', '2023-03-25 15:45:00', 'Phoenix Park', 'Dublin Zoo'),
(1, 4, '221D11111', '2023-03-26 20:00:00', '2023-03-26 21:00:00', 'OConnell Street', 'Hapenny Bridge');

--Driver 2
INSERT INTO journey(driverNumber, customerNumber, taxiReg, journeyStartTime, journeyEndTime, journeyOrigin, journeyDestination) 
values
(2, 3, '221D11113', '2023-03-23 09:30:00', '2023-03-23 10:15:00', 'Merrion Square', 'National Museum of Ireland'),
(2, 2, '221D11111', '2023-03-23 11:30:00', '2023-03-23 12:00:00', 'Grafton Street', 'St. Stephens Green'),
(2, 5, '221D11114', '2023-03-24 15:30:00', '2023-03-24 16:00:00', 'Dublin Castle', 'Christ Church Cathedral'),
(2, 1, '221D11115', '2023-03-25 12:00:00', '2023-03-25 12:30:00', 'Dublin Airport', 'Trinity College Dublin'),
(2, 1, '221D11111', '2023-03-21 21:10:00', '2023-03-21 21:30:00', 'Temple Bar', 'Phoenix Park');


--Driver 3
INSERT INTO journey(driverNumber, customerNumber, taxiReg, journeyStartTime, journeyEndTime, journeyOrigin, journeyDestination) 
values
(3, 1, '221D11111', '2023-03-21 22:00:00', '2023-03-21 22:15:00', 'St. Stephens Green', 'Merrion Square'),
(3, 2, '221D11111', '2023-03-22 08:30:00', '2023-03-22 08:45:00', 'Grafton Street', 'OConnell Street'),
(3, 3, '221D11112', '2023-03-22 12:15:00', '2023-03-22 12:45:00', 'Dublin Airport', 'Temple Bar'),
(3, 4, '221D11114', '2023-03-22 16:00:00', '2023-03-22 16:20:00', 'Phoenix Park', 'Guinness Storehouse'),
(3, 1, '221D11111', '2023-03-22 18:30:00', '2023-03-22 18:50:00', 'St. Patricks Cathedral', 'Trinity College Dublin'),
(3, 2, '221D11113', '2023-03-22 21:00:00', '2023-03-22 21:30:00', 'Malahide', 'Howth'),
(3, 3, '221D11115', '2023-03-23 09:00:00', '2023-03-23 09:20:00', 'Grand Canal Dock', 'Smithfield'),
(3, 5, '221D11114', '2023-03-23 13:45:00', '2023-03-23 14:00:00', 'Merrion Square', 'St. Stephens Green');



--Driver 4
INSERT INTO journey(driverNumber, customerNumber, taxiReg, journeyStartTime, journeyEndTime, journeyOrigin, journeyDestination) 
values
(4, 1, '221D11111', '2023-03-22 09:00:00', '2023-03-22 09:30:00', 'Dublin Airport', 'Trinity College'),
(4, 1, '221D11111', '2023-03-22 10:00:00', '2023-03-22 10:15:00', 'OConnell Street', 'Croke Park'),
(4, 3, '221D11112', '2023-03-22 10:30:00', '2023-03-22 10:45:00', 'Sandyford', 'Dundrum Town Centre'),
(4, 2, '221D11114', '2023-03-22 14:00:00', '2023-03-22 14:30:00', 'Dublin Zoo', 'Croke Park'),
(4, 1, '221D11111', '2023-03-22 17:15:00', '2023-03-22 17:30:00', 'St. Annes Park', 'Howth Head'),
(4, 2, '221D11113', '2023-03-22 20:00:00', '2023-03-22 20:15:00', 'The Convention Centre Dublin', 'Aviva Stadium'),
(4, 3, '221D11115', '2023-03-23 08:45:00', '2023-03-23 09:00:00', 'Hapenny Bridge', 'Dublin Castle'),
(4, 4, '221D11112', '2023-03-23 12:30:00', '2023-03-23 12:45:00', 'Christ Church Cathedral', 'St. Patricks Cathedral');

--Driver 5
INSERT INTO journey(driverNumber, customerNumber, taxiReg, journeyStartTime, journeyEndTime, journeyOrigin, journeyDestination) 
values
(5, 5, '221D11111', '2023-03-22 18:00:00', '2023-03-22 18:30:00', 'The Spire', 'Grafton Street'),
(5, 5, '221D11111', '2023-03-22 10:00:00', '2023-03-22 10:15:00', 'Temple Bar', 'Dublin Castle'),
(5, 2, '221D11112', '2023-03-22 11:30:00', '2023-03-22 11:45:00', 'Grand Canal Dock', 'The Convention Centre Dublin'),
(5, 2, '221D11113', '2023-03-22 14:00:00', '2023-03-22 14:30:00', 'Merrion Square', 'St. Patricks Cathedral'),
(5, 5, '221D11114', '2023-03-22 17:00:00', '2023-03-22 17:20:00', 'Dublin Airport', 'Trinity College Dublin'),
(5, 3, '221D11115', '2023-03-22 19:30:00', '2023-03-22 19:50:00', 'St. Stephens Green', 'Guinness Storehouse'),
(5, 1, '221D11111', '2023-03-22 21:00:00', '2023-03-22 21:30:00', 'Howth', 'Malahide'),
(5, 4, '221D11113', '2023-03-23 09:00:00', '2023-03-23 09:20:00', 'Phoenix Park', 'Smithfield');
