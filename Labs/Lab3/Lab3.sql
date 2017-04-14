-- Change the delimiter since you cant use ; inside of a query or it will end the query
DELIMITER $
-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS check_date$

-- Creates a trigger to check that the checkin dat is less than the checkout date.
CREATE TRIGGER check_date BEFORE INSERT ON booking
FOR EACH ROW 
BEGIN
    DECLARE MESSAGE varchar(128);
    IF(NEW.checkinDate>NEW.checkoutDate) then
        SET MESSAGE = "You cant checkout before checking in.";
        signal sqlstate '42069' set message_text = MESSAGE;
    END IF;
END$
DELIMITER ;

Insert into booking values (null, 1, 1,  '2016-01-05', '2016-01-01', '001');

DELIMITER $
-- Creates a procedure that books a room for a guest
DROP PROCEDURE IF EXISTS bookroom;
CREATE PROCEDURE bookroom( IN name varchar(30), phone char(13), address varchar(30), given_checkinDate Date, given_checkoutDate Date, given_type ENUM('S', 'D', 'Q'))
BEGIN
    declare avalible char(3);
    set avalible =
    BEGIN
    select roomNo
    from room
    where type = given_type and hotelNo=5 and
    roomNo not in (select roomNo from booking b
    where checkOutDate > given_checkindate and checkinDate <
    given_checkoutdate and hotelNo = 5) limit 1;
    END
    
    Insert into guest values (null, name, address ,phone);
    Insert into booking values (null, 1, 1,  given_checkinDate, given_checkoutDate, '001');
END$
DELIMITER ;
