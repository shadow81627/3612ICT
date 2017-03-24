-- Oracle Schema file for the hotel booking databse

Drop table if exists booking;
drop table if exists room;
drop table if exists hotel;
drop table if exists guest;

 Create table hotel(
       hotelNo tinyint unsigned,
       hotelName varchar(20) not null,
       city char(10) not null,
       constraint PK_hotel primary key (hotelNo));



Create table room (
        roomNo char(3),
        hotelNo tinyint unsigned,
        type ENUM('S', 'D', 'Q') not null,
        price numeric(5,2) not null,
       Constraint PK_room primary key (roomNo, hotelNo),
       Constraint FK1_room foreign key (hotelNo) references hotel (hotelNo));


create table guest (
       guestNo smallint(8) unsigned auto_increment,
       guestName varchar(30) not null,
       guestAddress varchar(30),
       tel char(13) not null, 
       Constraint PK_guest primary key (guestNo),
       Constraint AK_guest unique(guestName,tel));


Create table Booking (
       bookingID INT unsigned auto_increment primary key,
       hotelNo tinyint unsigned,
       guestNo smallint unsigned,
       checkinDate Date not null,
       checkoutDate Date Not Null,
       roomNo char(3) not null,
       constraint AK_booking unique(guestNo,  HotelNo, checkinDate),
       constraint FK1_booking foreign key (guestNo) references guest (guestNo),
       constraint FK2_booking foreign Key (roomNo, hotelNo) references room (roomNo, hotelNo));
       

-- inserting data

 Insert into hotel values (1, 'Grosvenor Hotel',  'Sydney');
 Insert into hotel values (2, 'ANA Hotel',  'Sydney');
 Insert into hotel values (3, 'Great Mansion Hotel',  'Brisbane');
 Insert into hotel values (4, 'Grand Hotel',  'Brisbane');
 Insert into hotel values (5, 'Central Hotel',  'Sydney');
 Insert into hotel values (6, 'Airport Hotel',  'Sydney');


 Insert into guest values (null, 'David Goodman',  '21 mains rd,Sydney', '+61282293564');
 Insert into guest values (null, 'Lisa Bourke', Null, '+61382293564');
 Insert into guest values (null, 'Lawrence Dooley',  '12 Sydney street, Brisbane','+61287261234');
 Insert into guest values (null, 'Ray Maher',  '10 Churchill Court, Brisbane','+61733241231');
 Insert into guest values (null, 'David Smith',  '101 San_Lurry St, Brisbane','+61712345678');
 Insert into guest values (null, 'John Wang',  '1 newfound Rd, Gold Coast','+61752257645');


 Insert into room values ('001',  1,  'S', 120);
 Insert into room values ('002',  1,  'S', 120);
 Insert into room values ('003',  1,  'S', 120);
 Insert into room values ('004',  1,  'D', 150);
 Insert into room values ('005',  1,  'D', 150);
 Insert into room values ('006',  1,  'D', 150);
 Insert into room values ('007',  1,  'Q', 180);
 Insert into room values ('008',  1,  'Q', 180);
 Insert into room values ('009',  1,  'Q', 180);
 Insert into room values ('001',  2,  'D', 100);
 Insert into room values ('002',  2,  'S', 80);
 Insert into room values ('001',  3,  'S', 80);
 Insert into room values ('002',  3,  'D', 100);
 Insert into room values ('001',  4,  'Q', 78);
 Insert into room values ('002',  4,  'S', 78);
 Insert into room values ('003',  4,  'S', 75);
 Insert into room values ('004', 4,  'Q', 100);
 Insert into room values ('005', 4,  'Q', 500); 


 Insert into booking values (null, 1, 1,  '2016-01-01', '2016-01-05', '001');
 Insert into booking values (null, 1, 3,  date_add(curdate(), interval -1 day), date_add(curdate(), interval 3 day), '002');           
 Insert into booking values (null, 2, 1, '2016-02-29', '2016-03-05', '001');
 Insert into booking values (null, 4, 3,  date_add(curdate(), interval 2 day), date_add(curdate(), interval 8 day), '005');
 Insert into booking values (null, 3, 4,  '2016-01-03', '2016-01-09', '001');
 Insert into booking values (null, 1, 2,  '2016-01-03', '2016-01-06', '003');
 Insert into booking values (null, 4, 5,  '2016-01-23', '2016-02-01', '001');














