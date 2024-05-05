/*<TOAD_FILE_CHUNK>*/
--note: if an error massege apear choose ignore all and data will populated 
DECLARE
    start_time TIMESTAMP := TO_TIMESTAMP('00:00:00', 'HH24:MI:SS');
    end_time TIMESTAMP := TO_TIMESTAMP('23:59:59', 'HH24:MI:SS');
    minutes_in_day NUMBER := 24 * 60; -- Total minutes in a day
BEGIN
    FOR i IN 0..(minutes_in_day - 1) LOOP
        INSERT INTO time_dimension (time_key, time_value, hour, minute, hour_of_day)
        VALUES (
            TO_NUMBER(TO_CHAR(start_time + (i / 24 / 60), 'HH24MISS')),
            TO_CHAR(start_time + NUMTODSINTERVAL(i, 'MINUTE'), 'HH24:MI:SS'),
            TO_NUMBER(TO_CHAR(start_time + (i / 24 / 60), 'HH24')),
            TO_NUMBER(TO_CHAR(start_time + (i / 24 / 60), 'MI')),
            TO_NUMBER(TO_CHAR(start_time + (i / 24 / 60), 'HH24'))
        );
    END LOOP;
    COMMIT;
END;
/
/*<TOAD_FILE_CHUNK>*/
--note: if an error massege apear choose ignore all and data will populated 








DECLARE
    start_date DATE := TO_DATE('2024-01-01', 'YYYY-MM-DD');
    end_date DATE := TO_DATE('2024-12-31', 'YYYY-MM-DD');
BEGIN
    FOR dt IN (
        SELECT start_date + LEVEL - 1 AS dt
        FROM DUAL
        CONNECT BY start_date + LEVEL - 1 <= end_date
    ) LOOP
        INSERT INTO date_dimension (date_key, date_value, day, day_of_week, month, quarter, holiday_indicator, season)
        VALUES (
            TO_NUMBER(TO_CHAR(dt.dt, 'YYYYMMDD')), -- Date key
            dt.dt, -- Date value
            TO_NUMBER(TO_CHAR(dt.dt, 'DD')), -- Day
            TO_CHAR(dt.dt, 'DAY'), -- Day of week
            TO_CHAR(dt.dt, 'MONTH'), -- Month
            CASE
                WHEN TO_NUMBER(TO_CHAR(dt.dt, 'Q')) = 1 THEN 'Q1'
                WHEN TO_NUMBER(TO_CHAR(dt.dt, 'Q')) = 2 THEN 'Q2'
                WHEN TO_NUMBER(TO_CHAR(dt.dt, 'Q')) = 3 THEN 'Q3'
                ELSE 'Q4'
            END, -- Quarter
            'N', -- Holiday indicator (assuming no holidays)
            CASE
                WHEN TO_CHAR(dt.dt, 'MM') IN ('12', '01', '02') THEN 'Winter'
                WHEN TO_CHAR(dt.dt, 'MM') IN ('03', '04', '05') THEN 'Spring'
                WHEN TO_CHAR(dt.dt, 'MM') IN ('06', '07', '08') THEN 'Summer'
                ELSE 'Fall'
            END -- Season
        );
    END LOOP;
    COMMIT;
END;
/
/*<TOAD_FILE_CHUNK>*/
--note: if an error massege apear choose ignore all and data will populated 






-- Insert record 1
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (1, 'JFK', 'John F. Kennedy International Airport', 'New York', 'United States', 'America/New_York', 40.6413, -73.7781, 'International');

-- Insert record 2
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (2, 'LHR', 'Heathrow Airport', 'London', 'United Kingdom', 'Europe/London', 51.4700, -0.4543, 'International');

-- Insert record 3
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (3, 'CDG', 'Charles de Gaulle Airport', 'Paris', 'France', 'Europe/Paris', 49.0034, 2.5735, 'International');

-- Insert record 4
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (4, 'SYD', 'Sydney Airport', 'Sydney', 'Australia', 'Australia/Sydney', -33.9399, 151.1753, 'International');

-- Insert record 5
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (5, 'DXB', 'Dubai International Airport', 'Dubai', 'United Arab Emirates', 'Asia/Dubai', 25.2522, 55.3644, 'International');

-- Insert record 6
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (6, 'HND', 'Haneda Airport', 'Tokyo', 'Japan', 'Asia/Tokyo', 35.5494, 139.7798, 'International');

-- Insert record 7
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (7, 'PEK', 'Beijing Capital International Airport', 'Beijing', 'China', 'Asia/Shanghai', 40.0799, 116.6031, 'International');

-- Insert record 8
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (8, 'ATL', 'Hartsfield-Jackson Atlanta International Airport', 'Atlanta', 'United States', 'America/New_York', 33.6407, -84.4277, 'International');

-- Insert record 9
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (9, 'ICN', 'Incheon International Airport', 'Incheon', 'South Korea', 'Asia/Seoul', 37.4692, 126.4505, 'International');

-- Insert record 10
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (10, 'AMS', 'Amsterdam Airport Schiphol', 'Amsterdam', 'Netherlands', 'Europe/Amsterdam', 52.3086, 4.7639, 'International');


-- Insert record 12
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (12, 'ORD', 'O''Hare International Airport', 'Chicago', 'United States', 'America/Chicago', 41.9742, -87.9073, 'International');

-- Insert record 13
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (13, 'FRA', 'Frankfurt Airport', 'Frankfurt', 'Germany', 'Europe/Berlin', 50.0333, 8.5706, 'International');

-- Insert record 14
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (14, 'DFW', 'Dallas/Fort Worth International Airport', 'Dallas', 'United States', 'America/Chicago', 32.8998, -97.0403, 'International');

-- Insert record 15
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (15, 'MUC', 'Munich Airport', 'Munich', 'Germany', 'Europe/Berlin', 48.3537, 11.7751, 'International');

-- Insert record 16
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (16, 'CAN', 'Guangzhou Baiyun International Airport', 'Guangzhou', 'China', 'Asia/Shanghai', 23.3924, 113.2991, 'International');

-- Insert record 17
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (17, 'IST', 'Istanbul Airport', 'Istanbul', 'Turkey', 'Europe/Istanbul', 41.2756, 28.7519, 'International');

-- Insert record 18
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (18, 'DXB', 'Dubai International Airport', 'Dubai', 'United Arab Emirates', 'Asia/Dubai', 25.2522, 55.3644, 'International');

-- Insert record 19
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (19, 'BKK', 'Suvarnabhumi Airport', 'Bangkok', 'Thailand', 'Asia/Bangkok', 13.6902, 100.7501, 'International');

-- Insert record 20
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (20, 'SYD', 'Sydney Airport', 'Sydney', 'Australia', 'Australia/Sydney', -33.9399, 151.1753, 'International');


-- Insert record 21
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (21, 'LAX', 'Los Angeles International Airport', 'Los Angeles', 'United States', 'America/Los_Angeles', 33.9416, -118.4085, 'International');

-- Insert record 22
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (22, 'CGK', 'Soekarno-Hatta International Airport', 'Jakarta', 'Indonesia', 'Asia/Jakarta', -6.1256, 106.6553, 'International');

-- Insert record 23
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (23, 'DEL', 'Indira Gandhi International Airport', 'Delhi', 'India', 'Asia/Kolkata', 28.5562, 77.1000, 'International');

-- Insert record 24
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (24, 'LAS', 'McCarran International Airport', 'Las Vegas', 'United States', 'America/Los_Angeles', 36.0850, -115.1510, 'International');

-- Insert record 25
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (25, 'MAD', 'Adolfo Suárez Madrid–Barajas Airport', 'Madrid', 'Spain', 'Europe/Madrid', 40.4900, -3.5699, 'International');

-- Insert record 26
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (26, 'JNB', 'O.R. Tambo International Airport', 'Johannesburg', 'South Africa', 'Africa/Johannesburg', -26.1392, 28.2460, 'International');

-- Insert record 27
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (27, 'HKG', 'Hong Kong International Airport', 'Hong Kong', 'Hong Kong', 'Asia/Hong_Kong', 22.3080, 113.9185, 'International');

-- Insert record 28
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (28, 'MIA', 'Miami International Airport', 'Miami', 'United States', 'America/New_York', 25.7933, -80.2906, 'International');

-- Insert record 29
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (29, 'YYZ', 'Toronto Pearson International Airport', 'Toronto', 'Canada', 'America/Toronto', 43.6777, -79.6248, 'International');

-- Insert record 30
INSERT INTO airport_dimension (airport_key, airport_code, airport_name, city, country, timezone, latitude, longitude, airport_type)
VALUES (30, 'SFO', 'San Francisco International Airport', 'San Francisco', 'United States', 'America/Los_Angeles', 37.6216, -122.3781, 'International');





-- Insert record 1
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (1, 'A320', 'Narrow-body', 'Airbus', 'A320-200', 1998, 180, 5700, 42.6);

-- Insert record 2
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (2, 'B737', 'Narrow-body', 'Boeing', '737-800', 1997, 189, 5300, 41.4);

-- Insert record 3
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (3, 'A330', 'Wide-body', 'Airbus', 'A330-300', 2003, 277, 11750, 120);

-- Insert record 4
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (4, 'B777', 'Wide-body', 'Boeing', '777-200ER', 1996, 440, 14115, 158.8);

-- Insert record 5
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (5, 'A380', 'Wide-body', 'Airbus', 'A380-800', 2005, 555, 15200, 276.8);

-- Insert record 6
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (6, 'B787', 'Wide-body', 'Boeing', '787-9', 2014, 296, 15700, 127);

-- Insert record 7
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (7, 'MD-11', 'Wide-body', 'McDonnell Douglas', 'MD-11', 1990, 285, 12250, 147);

-- Insert record 8
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (8, 'B747', 'Wide-body', 'Boeing', '747-400', 1988, 416, 13400, 183.3);

-- Insert record 9
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (9, 'E190', 'Regional jet', 'Embraer', 'E190', 2002, 114, 3700, 44.4);

-- Insert record 10
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (10, 'CRJ900', 'Regional jet', 'Bombardier Aerospace', 'CRJ900', 2003, 90, 2843, 22.5);


-- Insert record 11
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (11, 'A319', 'Narrow-body', 'Airbus', 'A319', 1996, 124, 3750, 37.7);

-- Insert record 12
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (12, 'B757', 'Narrow-body', 'Boeing', '757-200', 1983, 239, 7222, 62.3);

-- Insert record 13
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (13, 'A340', 'Wide-body', 'Airbus', 'A340-600', 2001, 475, 13600, 277);

-- Insert record 14
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (14, 'B767', 'Wide-body', 'Boeing', '767-300ER', 1988, 269, 9700, 127);

-- Insert record 15
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (15, 'A350', 'Wide-body', 'Airbus', 'A350-900', 2013, 325, 15700, 115.7);

-- Insert record 16
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (16, 'B737', 'Narrow-body', 'Boeing', '737-700', 1997, 126, 6125, 35.3);

-- Insert record 17
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (17, 'A330', 'Wide-body', 'Airbus', 'A330-200', 1998, 293, 13400, 124.1);

-- Insert record 18
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (18, 'B747', 'Wide-body', 'Boeing', '747-8', 2012, 467, 14200, 222.7);

-- Insert record 19
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (19, 'E195', 'Regional jet', 'Embraer', 'E195', 2006, 124, 3060, 44.5);

-- Insert record 20
INSERT INTO aircraft_dimension (aircraft_key, aircraft_code, aircraft_type, manufacturer, model, year_of_manufacture, seating_capacity, maximum_range, operating_weight)
VALUES (20, 'CRJ700', 'Regional jet', 'Bombardier Aerospace', 'CRJ700', 2001, 78, 2827, 22.5);












-- Insert record 1
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (1, 'P001', 'John', 'Doe', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Male', 'john.doe@example.com', '123 Main St, Anytown, USA');

-- Insert record 2
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (2, 'P002', 'Jane', 'Smith', TO_DATE('1985-08-20', 'YYYY-MM-DD'), 'Female', 'jane.smith@example.com', '456 Oak St, Othertown, USA');

-- Insert record 3
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (3, 'P003', 'Michael', 'Johnson', TO_DATE('1978-03-10', 'YYYY-MM-DD'), 'Male', 'michael.johnson@example.com', '789 Elm St, Anothercity, USA');

-- Insert record 4
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (4, 'P004', 'Emily', 'Williams', TO_DATE('1992-11-25', 'YYYY-MM-DD'), 'Female', 'emily.williams@example.com', '321 Pine St, Somewhere, USA');

-- Insert record 5
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (5, 'P005', 'David', 'Brown', TO_DATE('1980-07-08', 'YYYY-MM-DD'), 'Male', 'david.brown@example.com', '987 Cedar St, Anywhere, USA');

-- Insert record 6
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (6, 'P006', 'Sarah', 'Martinez', TO_DATE('1989-02-18', 'YYYY-MM-DD'), 'Female', 'sarah.martinez@example.com', '654 Maple St, Nowhere, USA');

-- Insert record 7
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (7, 'P007', 'Christopher', 'Jones', TO_DATE('1975-09-30', 'YYYY-MM-DD'), 'Male', 'christopher.jones@example.com', '852 Birch St, Elsewhere, USA');

-- Insert record 8
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (8, 'P008', 'Amanda', 'Garcia', TO_DATE('1987-06-12', 'YYYY-MM-DD'), 'Female', 'amanda.garcia@example.com', '741 Walnut St, Noctown, USA');

-- Insert record 9
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (9, 'P009', 'Matthew', 'Rodriguez', TO_DATE('1983-04-05', 'YYYY-MM-DD'), 'Male', 'matthew.rodriguez@example.com', '369 Spruce St, Everywhere, USA');

-- Insert record 10
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (10, 'P010', 'Jessica', 'Hernandez', TO_DATE('1995-12-28', 'YYYY-MM-DD'), 'Female', 'jessica.hernandez@example.com', '159 Fir St, Anyplace, USA');


-- Insert record 11
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (11, 'P011', 'Ryan', 'Lopez', TO_DATE('1986-10-14', 'YYYY-MM-DD'), 'Male', 'ryan.lopez@example.com', '246 Cedar St, Somewheretown, USA');

-- Insert record 12
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (12, 'P012', 'Megan', 'King', TO_DATE('1993-02-22', 'YYYY-MM-DD'), 'Female', 'megan.king@example.com', '135 Oak St, Otherplace, USA');

-- Insert record 13
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (13, 'P013', 'Daniel', 'Young', TO_DATE('1979-07-29', 'YYYY-MM-DD'), 'Male', 'daniel.young@example.com', '753 Elm St, Nowaytown, USA');

-- Insert record 14
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (14, 'P014', 'Emily', 'Walker', TO_DATE('1988-05-07', 'YYYY-MM-DD'), 'Female', 'emily.walker@example.com', '852 Pine St, Anyplace, USA');

-- Insert record 15
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (15, 'P015', 'Justin', 'Scott', TO_DATE('1984-09-18', 'YYYY-MM-DD'), 'Male', 'justin.scott@example.com', '369 Maple St, Elsewhere, USA');

-- Insert record 16
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (16, 'P016', 'Hannah', 'Green', TO_DATE('1990-03-26', 'YYYY-MM-DD'), 'Female', 'hannah.green@example.com', '741 Birch St, Anotherville, USA');

-- Insert record 17
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (17, 'P017', 'Nathan', 'Hill', TO_DATE('1981-11-09', 'YYYY-MM-DD'), 'Male', 'nathan.hill@example.com', '159 Walnut St, Anyburg, USA');

-- Insert record 18
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (18, 'P018', 'Emma', 'Carter', TO_DATE('1996-04-17', 'YYYY-MM-DD'), 'Female', 'emma.carter@example.com', '654 Fir St, Anytown, USA');

-- Insert record 19
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (19, 'P019', 'Brandon', 'Wright', TO_DATE('1987-08-05', 'YYYY-MM-DD'), 'Male', 'brandon.wright@example.com', '987 Cedar St, Somewhereville, USA');

-- Insert record 20
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (20, 'P020', 'Olivia', 'Mitchell', TO_DATE('1982-12-31', 'YYYY-MM-DD'), 'Female', 'olivia.mitchell@example.com', '852 Pine St, Nowhereville, USA');


-- Insert record 31
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (31, 'P031', 'Ethan', 'Perez', TO_DATE('1989-05-26', 'YYYY-MM-DD'), 'Male', 'ethan.perez@example.com', '369 Oak St, Anotherplace, USA');

-- Insert record 32
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (32, 'P032', 'Ava', 'Roberts', TO_DATE('1992-03-15', 'YYYY-MM-DD'), 'Female', 'ava.roberts@example.com', '753 Cedar St, Nowheretown, USA');

-- Insert record 33
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (33, 'P033', 'Liam', 'Turner', TO_DATE('1984-11-03', 'YYYY-MM-DD'), 'Male', 'liam.turner@example.com', '159 Fir St, Anywhereville, USA');

-- Insert record 34
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (34, 'P034', 'Sophia', 'Hall', TO_DATE('1986-07-22', 'YYYY-MM-DD'), 'Female', 'sophia.hall@example.com', '987 Maple St, Somewhereelse, USA');

-- Insert record 35
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (35, 'P035', 'Mason', 'Young', TO_DATE('1995-09-10', 'YYYY-MM-DD'), 'Male', 'mason.young@example.com', '741 Birch St, Anyvilletown, USA');

-- Insert record 36
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (36, 'P036', 'Amelia', 'Lewis', TO_DATE('1990-12-28', 'YYYY-MM-DD'), 'Female', 'amelia.lewis@example.com', '852 Elm St, Nowheresville, USA');

-- Insert record 37
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (37, 'P037', 'Elijah', 'Allen', TO_DATE('1983-02-17', 'YYYY-MM-DD'), 'Male', 'elijah.allen@example.com', '654 Oak St, Anyvilletown, USA');

-- Insert record 38
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (38, 'P038', 'Charlotte', 'Scott', TO_DATE('1988-06-05', 'YYYY-MM-DD'), 'Female', 'charlotte.scott@example.com', '123 Pine St, Nowheretown, USA');

-- Insert record 39
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (39, 'P039', 'Logan', 'King', TO_DATE('1993-09-23', 'YYYY-MM-DD'), 'Male', 'logan.king@example.com', '369 Cedar St, Anyplaceville, USA');

-- Insert record 40
INSERT INTO passenger_dimension (passenger_key, passenger_id, first_name, last_name, date_of_birth, gender, email_address, address)
VALUES (40, 'P040', 'Isabella', 'Walker', TO_DATE('1987-01-31', 'YYYY-MM-DD'), 'Female', 'isabella.walker@example.com', '852 Oak St, Anytownville, USA');


-- Insert records for all possible combinations
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (1, 'economy', 'economy', 'economy-economy', 'no class change');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (2, 'economy', 'premeconomy', 'economy-premeconomy', 'upgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (3, 'economy', 'business', 'economy-business', 'upgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (4, 'economy', 'first', 'economy-first', 'upgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (5, 'premeconomy', 'economy', 'premeconomy-economy', 'downgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (6, 'premeconomy', 'premeconomy', 'premeconomy-premeconomy', 'no class change');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (7, 'premeconomy', 'business', 'premeconomy-business', 'upgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (8, 'premeconomy', 'first', 'premeconomy-first', 'upgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (9, 'business', 'economy', 'business-economy', 'downgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (10, 'business', 'premeconomy', 'business-premeconomy', 'downgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (11, 'business', 'business', 'business-business', 'no class change');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (12, 'business', 'first', 'business-first', 'upgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (13, 'first', 'economy', 'first-economy', 'downgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (14, 'first', 'premeconomy', 'first-premeconomy', 'downgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (15, 'first', 'business', 'first-business', 'downgrade');
INSERT INTO class_of_service_dimension (class_key, class_purchased, class_flown, purchased_flown_group, class_change_indicator) VALUES (16, 'first', 'first', 'first-first', 'no class change');










-- Insert record 1
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (1, 'YUP21', 'Economy Unrestricted Promo 21-Day Advance Purchase', 'Economy', '21-day advance purchase required, non-refundable, non-changeable', NULL);

-- Insert record 2
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (2, 'BUSFLEX', 'Business Flex Fare', 'Business', 'Fully flexible fare, refundable, changeable without penalty', NULL);

-- Insert record 3
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (3, 'FC100', 'First Class Standard Fare', 'First Class', 'No advance purchase required, fully refundable, changeable with minimal penalty', NULL);

-- Insert record 4
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (4, 'ECO50', 'Economy Discount Fare', 'Economy', '50% off standard fare, non-refundable, changeable with penalty', 50);


-- Insert record 5
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (5, 'YUP14', 'Economy Unrestricted Promo 14-Day Advance Purchase', 'Economy', '14-day advance purchase required, non-refundable, non-changeable', NULL);

-- Insert record 6
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (6, 'BUSSTD', 'Business Standard Fare', 'Business', 'Standard business fare, non-refundable, changeable with penalty', NULL);

-- Insert record 7
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (7, 'FC75', 'First Class 75% Off Fare', 'First Class', '75% off standard fare, non-refundable, changeable with penalty', 75);

-- Insert record 8
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (8, 'ECO21', 'Economy Promo 21-Day Advance Purchase', 'Economy', '21-day advance purchase required, non-refundable, changeable with penalty', NULL);

-- Insert record 9
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (9, 'PREMDISC', 'Premium Economy Discount Fare', 'Premium Economy', '25% off standard fare, non-refundable, changeable with penalty', 25);

-- Insert record 10
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (10, 'BUSFLEXDISC', 'Business Flex Fare with Discount', 'Business', '10% off standard fare, fully flexible, refundable, changeable without penalty', 10);

-- Insert record 11
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (11, 'ECO10', 'Economy 10% Off Fare', 'Economy', '10% off standard fare, non-refundable, changeable with penalty', 10);

-- Insert record 12
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (12, 'FC50', 'First Class 50% Off Fare', 'First Class', '50% off standard fare, non-refundable, changeable with penalty', 50);

-- Insert record 13
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (13, 'ECOSALE', 'Economy Sale Fare', 'Economy', 'Limited time sale fare, non-refundable, non-changeable', NULL);

-- Insert record 14
INSERT INTO fare_basis_dimension (fare_basis_key, fare_basis_code, fare_description, fare_type, restrictions, discount_percentage)
VALUES (14, 'BUS25', 'Business 25% Off Fare', 'Business', '25% off standard fare, non-refundable, changeable with penalty', 25);








-- Insert new records into the Problem Dimension table for an airline company
INSERT INTO problem_dimension (problem_key, problem_id, problem_type, problem_severity)
VALUES (1, 'P001', 'Flight Delay', 'High');

INSERT INTO problem_dimension (problem_key, problem_id, problem_type, problem_severity)
VALUES (2, 'P002', 'Baggage Handling Issue', 'Medium');

INSERT INTO problem_dimension (problem_key, problem_id, problem_type, problem_severity)
VALUES (3, 'P003', 'Cabin Crew Dispute', 'High');

INSERT INTO problem_dimension (problem_key, problem_id, problem_type, problem_severity)
VALUES (4, 'P004', 'Technical Malfunction', 'High');

INSERT INTO problem_dimension (problem_key, problem_id, problem_type, problem_severity)
VALUES (5, 'P005', 'Overbooking Situation', 'Medium');

INSERT INTO problem_dimension (problem_key, problem_id, problem_type, problem_severity)
VALUES (6, 'P006', 'Lost Luggage', 'Medium');

INSERT INTO problem_dimension (problem_key, problem_id, problem_type, problem_severity)
VALUES (7, 'P007', 'Security Check Issue', 'High');

INSERT INTO problem_dimension (problem_key, problem_id, problem_type, problem_severity)
VALUES (8, 'P008', 'In-flight Entertainment Failure', 'Medium');

INSERT INTO problem_dimension (problem_key, problem_id, problem_type, problem_severity)
VALUES (9, 'P009', 'Food Quality Complaint', 'Medium');

INSERT INTO problem_dimension (problem_key, problem_id, problem_type, problem_severity)
VALUES (10, 'P010', 'Gate Change Confusion', 'Low');










-- Insert 10 records into the Customer Service Employee Dimension table
INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (1, 'CS001', 'John Smith', 'Customer Service', 'Customer Service Representative', TO_DATE('2015-05-10', 'YYYY-MM-DD'), 'john.smith@example.com', '123-456-7890', NULL);

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (2, 'CS002', 'Emily Johnson', 'Customer Service', 'Customer Service Representative', TO_DATE('2016-08-22', 'YYYY-MM-DD'), 'emily.johnson@example.com', '987-654-3210', 'CS001');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (3, 'CS003', 'Michael Williams', 'Customer Service', 'Customer Service Representative', TO_DATE('2017-03-17', 'YYYY-MM-DD'), 'michael.williams@example.com', '456-789-0123', 'CS001');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (4, 'CS004', 'Emma Brown', 'Customer Service', 'Customer Service Representative', TO_DATE('2018-11-28', 'YYYY-MM-DD'), 'emma.brown@example.com', '789-012-3456', 'CS002');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (5, 'CS005', 'William Davis', 'Customer Service', 'Customer Service Representative', TO_DATE('2019-06-15', 'YYYY-MM-DD'), 'william.davis@example.com', '012-345-6789', 'CS002');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (6, 'CS006', 'Olivia Wilson', 'Customer Service', 'Customer Service Representative', TO_DATE('2020-02-09', 'YYYY-MM-DD'), 'olivia.wilson@example.com', '321-654-9870', 'CS003');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (7, 'CS007', 'James Martinez', 'Customer Service', 'Customer Service Supervisor', TO_DATE('2014-04-25', 'YYYY-MM-DD'), 'james.martinez@example.com', '654-987-0123', NULL);

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (8, 'CS008', 'Sophia Anderson', 'Customer Service', 'Customer Service Representative', TO_DATE('2015-09-30', 'YYYY-MM-DD'), 'sophia.anderson@example.com', '987-012-3456', 'CS003');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (9, 'CS009', 'Alexander Thomas', 'Customer Service', 'Customer Service Representative', TO_DATE('2016-12-12', 'YYYY-MM-DD'), 'alexander.thomas@example.com', '210-543-8765', 'CS003');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (10, 'CS010', 'Isabella Rodriguez', 'Customer Service', 'Customer Service Representative', TO_DATE('2017-08-04', 'YYYY-MM-DD'), 'isabella.rodriguez@example.com', '543-876-2109', 'CS004');















-- Insert 10 records into the Interaction Dimension table
INSERT INTO interaction_dimension (interaction_key, interaction_id, type)
VALUES (1, 'INT001', 'Phone Call');

INSERT INTO interaction_dimension (interaction_key, interaction_id, type)
VALUES (2, 'INT002', 'Email');

INSERT INTO interaction_dimension (interaction_key, interaction_id, type)
VALUES (3, 'INT003', 'Live Chat');

INSERT INTO interaction_dimension (interaction_key, interaction_id, type)
VALUES (4, 'INT004', 'Social Media Message');

INSERT INTO interaction_dimension (interaction_key, interaction_id, type)
VALUES (5, 'INT005', 'In-person Meeting');

INSERT INTO interaction_dimension (interaction_key, interaction_id, type)
VALUES (6, 'INT006', 'SMS');

INSERT INTO interaction_dimension (interaction_key, interaction_id, type)
VALUES (7, 'INT007', 'Web Form Submission');

INSERT INTO interaction_dimension (interaction_key, interaction_id, type)
VALUES (8, 'INT008', 'Video Call');

INSERT INTO interaction_dimension (interaction_key, interaction_id, type)
VALUES (9, 'INT009', 'Fax');

INSERT INTO interaction_dimension (interaction_key, interaction_id, type)
VALUES (10, 'INT010', 'Letter');









-- Insert records into the Channel Dimension table for trip reservation
INSERT INTO channel_dimension (channel_key, reservation_channel)
VALUES (1, 'Online Booking');

INSERT INTO channel_dimension (channel_key, reservation_channel)
VALUES (2, 'Travel Agency');

INSERT INTO channel_dimension (channel_key, reservation_channel)
VALUES (3, 'Mobile App');

INSERT INTO channel_dimension (channel_key, reservation_channel)
VALUES (4, 'Phone Booking');

INSERT INTO channel_dimension (channel_key, reservation_channel)
VALUES (5, 'Corporate Booking');

INSERT INTO channel_dimension (channel_key, reservation_channel)
VALUES (6, 'In-person Reservation');

INSERT INTO channel_dimension (channel_key, reservation_channel)
VALUES (7, 'Third-party Website');

INSERT INTO channel_dimension (channel_key, reservation_channel)
VALUES (8, 'Chatbot Reservation');

INSERT INTO channel_dimension (channel_key, reservation_channel)
VALUES (9, 'Email Reservation');

INSERT INTO channel_dimension (channel_key, reservation_channel)
VALUES (10, 'Kiosk Reservation');










-- Insert 10 records into the Customer Service Employee Dimension table
INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (1, 'CS001', 'John Smith', 'Customer Service', 'Customer Service Representative', TO_DATE('2015-05-10', 'YYYY-MM-DD'), 'john.smith@example.com', '123-456-7890', NULL);

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (2, 'CS002', 'Emily Johnson', 'Customer Service', 'Customer Service Representative', TO_DATE('2016-08-22', 'YYYY-MM-DD'), 'emily.johnson@example.com', '987-654-3210', 'CS001');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (3, 'CS003', 'Michael Williams', 'Customer Service', 'Customer Service Representative', TO_DATE('2017-03-17', 'YYYY-MM-DD'), 'michael.williams@example.com', '456-789-0123', 'CS001');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (4, 'CS004', 'Emma Brown', 'Customer Service', 'Customer Service Representative', TO_DATE('2018-11-28', 'YYYY-MM-DD'), 'emma.brown@example.com', '789-012-3456', 'CS002');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (5, 'CS005', 'William Davis', 'Customer Service', 'Customer Service Representative', TO_DATE('2019-06-15', 'YYYY-MM-DD'), 'william.davis@example.com', '012-345-6789', 'CS002');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (6, 'CS006', 'Olivia Wilson', 'Customer Service', 'Customer Service Representative', TO_DATE('2020-02-09', 'YYYY-MM-DD'), 'olivia.wilson@example.com', '321-654-9870', 'CS003');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (7, 'CS007', 'James Martinez', 'Customer Service', 'Customer Service Supervisor', TO_DATE('2014-04-25', 'YYYY-MM-DD'), 'james.martinez@example.com', '654-987-0123', NULL);

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (8, 'CS008', 'Sophia Anderson', 'Customer Service', 'Customer Service Representative', TO_DATE('2015-09-30', 'YYYY-MM-DD'), 'sophia.anderson@example.com', '987-012-3456', 'CS003');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (9, 'CS009', 'Alexander Thomas', 'Customer Service', 'Customer Service Representative', TO_DATE('2016-12-12', 'YYYY-MM-DD'), 'alexander.thomas@example.com', '210-543-8765', 'CS003');

INSERT INTO cust_serv_employee_dimension (employee_key, employee_id, employee_name, department, position, hire_date, email, phone_number, supervisor_id)
VALUES (10, 'CS010', 'Isabella Rodriguez', 'Customer Service', 'Customer Service Representative', TO_DATE('2017-08-04', 'YYYY-MM-DD'), 'isabella.rodriguez@example.com', '543-876-2109', 'CS004');
















INSERT INTO Passenger_Profile_Dim (Passenger_Profile_Key, Frequent_Flyer_Tier, Home_Airport, Club_Membership_Status, Lifetime_Mileage_Tier)
SELECT 
    ROW_NUMBER() OVER (ORDER BY Frequent_Flyer_Tier, Home_Airport, Club_Membership_Status, Lifetime_Mileage_Tier) AS Passenger_Profile_Key,
    Frequent_Flyer_Tier,
    Home_Airport,
    Club_Membership_Status,
    Lifetime_Mileage_Tier
FROM
    (SELECT 'None' AS Frequent_Flyer_Tier FROM dual
     UNION ALL SELECT 'Silver' FROM dual
     UNION ALL SELECT 'Gold' FROM dual
     UNION ALL SELECT 'Platinum' FROM dual) t1
CROSS JOIN
    (SELECT 'Airport1' AS Home_Airport FROM dual
     UNION ALL SELECT 'Airport2' FROM dual
     UNION ALL SELECT 'Airport3' FROM dual) t2
CROSS JOIN
    (SELECT 'None' AS Club_Membership_Status FROM dual
     UNION ALL SELECT 'Basic' FROM dual
     UNION ALL SELECT 'Premium' FROM dual) t3
CROSS JOIN
    (SELECT 'None' AS Lifetime_Mileage_Tier FROM dual
     UNION ALL SELECT 'Bronze' FROM dual
     UNION ALL SELECT 'Silver' FROM dual
     UNION ALL SELECT 'Gold' FROM dual) t4;


