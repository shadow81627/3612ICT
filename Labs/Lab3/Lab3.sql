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