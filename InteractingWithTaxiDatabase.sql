select * 
from journey
join driver using(driverNumber);
--show all journeys completed by each driver

select *
from journey
join taxi using(taxiReg);
--show all journeys completed by each taxi

select *
from journey
join driver on journey.drivernumber = driver.drivernumber 
where driver.drivernumber  = 1;
--show all journeys serviced by driver 1

select customerName from customer;
--show all customer names

select customerName from customer as all_Names
union
select drivername from driver;
--show all unique names from driver and customer

select taxiReg from taxi
intersect 
select taxiReg from journey;
--show all taxiReg's that are in taxi and also within journey

select taxiReg from taxi
except
select taxiReg from journey;
--show all taxiReg's that are in taxi but not within journey

SELECT journey , customer.customername 
FROM journey
INNER JOIN customer
ON journey.customerNumber  = customer.customerNumber;
--show all journeys with their corresponding customer names

select *
from journey
where journeyendtime - journeystarttime > interval '30' minute;
--show all journeys where the total time for the journey is greater than 30 mins WRONG ATM

select customernumber, count(*) as num_journeys
from journey
group by customerNumber;
--show the number of journeys completed by each customer

insert into journey(driverNumber, customernumber, taxiReg, journeystarttime, journeyendtime, journeyorigin, journeydestination)
values
(1, 1, '221D11113','2023-03-21 20:50:35', '2023-03-21 21:50:11','OConnel Bridge', 'Dun Laoghaire');
--insert new journey 

