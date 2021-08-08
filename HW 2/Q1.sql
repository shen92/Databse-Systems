--  Using Oracle Live SQL
--  livesql.oracle.com

--  Create table with given schema:
CREATE TABLE ProjectRoomBookings(
    roomNum INTEGER NOT NULL CHECK (roomNum >= 0 AND roomNum < 10),
    startTime INTEGER NOT NULL CHECK (startTime >= 7 AND startTime < 18),
    endTime INTEGER NOT NULL CHECK (endTime > 7 AND endTime <= 18),
    groupName CHAR(10) NOT NULL,
    PRIMARY KEY (roomNum, startTime, endTime),
    CONSTRAINT validateTime CHECK (startTime < endTime)
);

--  Drop the table:
DROP TABLE ProjectRoomBookings;
    
--  Explnation:

--  Made change to the ProjectRoomBookings schema: add constrains and trigger.
--  1. Validate startTime and endTime:
--      -Using 24h military-style format,
--      -startTime between 7 and 18,
--      -endTime between 7 and 18,
--      -startTime strict less than endTime;
--  2. Validate startTime and endTime time range:
--     -Create a trigger before insert/update event,
--      which checks if start and end time of this record is valid in the table,
--     -i.e. if same room, traverse the table to check if any time slice is overlapping;
--  3. According to requirements, add check roomNum, which is between 0 and 10.