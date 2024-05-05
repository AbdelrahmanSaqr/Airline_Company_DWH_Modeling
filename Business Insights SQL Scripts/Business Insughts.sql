--1.Find the total number of reservations made per day:
SELECT 
    dd.DATE_VALUE AS Reservation_Date,
    COUNT(*) AS Total_Reservations
FROM 
    RESERVATION_FACT rf
JOIN 
    DATE_DIMENSION dd ON rf.DATE_KEY = dd.DATE_KEY
GROUP BY 
    dd.DATE_VALUE
ORDER BY 
    dd.DATE_VALUE;

--2.Identify the top 5 airports with the highest number of departures:
SELECT 
    ad.AIRPORT_NAME,
    COUNT(*) AS Departure_Count
FROM 
    RESERVATION_FACT rf
JOIN 
    AIRPORT_DIMENSION ad ON rf.TRIP_ORIGIN_AIRPORT_KEY = ad.AIRPORT_KEY
GROUP BY 
    ad.AIRPORT_NAME
ORDER BY 
    Departure_Count DESC;

--3.Find the total revenue generated from reservations for each month in the year:
SELECT 
    TO_CHAR(dd.DATE_VALUE, 'YYYY-MM') AS Reservation_Month,
   ROUND( SUM(rf.REVENUE)) AS Total_Revenue
FROM 
    RESERVATION_FACT rf
JOIN 
    DATE_DIMENSION dd ON rf.DATE_KEY = dd.DATE_KEY
GROUP BY 
    TO_CHAR(dd.DATE_VALUE, 'YYYY-MM')
ORDER BY 
    Reservation_Month;

--4.Calculate the average feedback rate for interactions of each type:
SELECT 
    id.TYPE AS Interaction_Type,
    ROUND(AVG(ccf.FEEDBACK_RATE)) AS Avg_Feedback_Rate
FROM 
    CUSTOMER_CARE_FACT ccf
JOIN 
    INTERACTION_DIMENSION id ON ccf.INTERACTION_KEY = id.INTERACTION_KEY
GROUP BY 
    id.TYPE;

--5.Calculate the average flight duration and revenue per flight segment:
SELECT 
    sfa.FLIGHT_NUMBER,
   ROUND( AVG(sfa.FLIGHT_DURATION)) AS Avg_Flight_Duration,
  ROUND(  AVG(sfa.FLIGHT_REVENUE)) AS Avg_Flight_Revenue
FROM 
    SEGMENT_FLIGHT_ACTIVITY_FACT sfa
GROUP BY 
    sfa.FLIGHT_NUMBER
ORDER BY 
    sfa.FLIGHT_NUMBER;

--6.Find the total revenue generated from reservations for each day of the week:
SELECT 
    dd.DAY_OF_WEEK,
   ROUND( SUM(rf.REVENUE)) AS Total_Revenue
FROM 
    RESERVATION_FACT rf
JOIN 
    DATE_DIMENSION dd ON rf.DATE_KEY = dd.DATE_KEY
GROUP BY 
    dd.DAY_OF_WEEK
ORDER BY 
    Total_Revenue DESC;

--7. the total revenue generated from reservations for each airline:
SELECT 
    ad.MANUFACTURER AS Airline_Name,
    ROUND(SUM(rf.REVENUE), 2) AS Total_Revenue
FROM 
    RESERVATION_FACT rf
JOIN 
    AIRCRAFT_DIMENSION ad ON rf.AIRCRAFT_KEY = ad.AIRCRAFT_KEY
GROUP BY 
    ad.MANUFACTURER
ORDER BY 
    Total_Revenue DESC;
    
--8. the average flight duration for each destination airport
SELECT 
    AIRPORT_DEST.AIRPORT_NAME AS DESTINATION_AIRPORT,
    AVG(SFA.FLIGHT_DURATION) AS AVERAGE_FLIGHT_DURATION
FROM 
    SEGMENT_FLIGHT_ACTIVITY_FACT SFA
JOIN 
    AIRPORT_DIMENSION AIRPORT_ORIGIN ON SFA.SEG_ORIGIN_AIRPORT_KEY = AIRPORT_ORIGIN.AIRPORT_KEY
JOIN 
    AIRPORT_DIMENSION AIRPORT_DEST ON SFA.SEG_DESTINATION_AIRPORT_KEY = AIRPORT_DEST.AIRPORT_KEY
GROUP BY 
    AIRPORT_DEST.AIRPORT_NAME;

-- 9:Find the total revenue generated from reservations for each class of service purchased:
SELECT 
    fbd.FARE_DESCRIPTION AS Offer_Type_Purchased,
    ROUND(SUM(rf.REVENUE), 2) AS Total_Revenue
FROM 
    RESERVATION_FACT rf
JOIN 
    FARE_BASIS_DIMENSION fbd ON rf.FARE_BASIS_KEY = fbd.FARE_BASIS_KEY
GROUP BY 
    fbd.FARE_DESCRIPTION
ORDER BY 
    Total_Revenue DESC;
       
--10: Find the total number of reservations made per passenger gender:
SELECT 
    pd.GENDER AS Passenger_Gender,
    COUNT(*) AS Total_Reservations
FROM 
    RESERVATION_FACT rf
JOIN 
    PASSENGER_DIMENSION pd ON rf.PASSENGER_KEY = pd.PASSENGER_KEY
GROUP BY 
    pd.GENDER;





-- the average revenue generated from reservations per month for each airline:
SELECT 
    ad.MANUFACTURER AS Airline_Name,
    TO_CHAR(dd.DATE_VALUE, 'YYYY-MM') AS Reservation_Month,
    ROUND(AVG(rf.REVENUE), 2) AS Avg_Revenue_Per_Month
FROM 
    RESERVATION_FACT rf
JOIN 
    AIRCRAFT_DIMENSION ad ON rf.AIRCRAFT_KEY = ad.AIRCRAFT_KEY
JOIN 
    DATE_DIMENSION dd ON rf.DATE_KEY = dd.DATE_KEY
GROUP BY 
    ad.MANUFACTURER, TO_CHAR(dd.DATE_VALUE, 'YYYY-MM')
ORDER BY 
    Airline_Name, Reservation_Month;



-- This query calculates the total revenue generated from reservations for each airline
SELECT 
    ad.MANUFACTURER AS Airline_Name,
    ROUND(SUM(rf.REVENUE), 2) AS Total_Revenue
FROM 
    RESERVATION_FACT rf
JOIN 
    AIRCRAFT_DIMENSION ad ON rf.AIRCRAFT_KEY = ad.AIRCRAFT_KEY
GROUP BY 
    ad.MANUFACTURER
ORDER BY 
    Total_Revenue DESC;
    
    
    
  -- This query calculates the total revenue generated from reservations for each airline
SELECT 
    AD.MANUFACTURER AS Airline_Name,
    ROUND(SUM(RF.REVENUE), 2) AS Total_Revenue
FROM 
    RESERVATION_FACT RF
JOIN 
    AIRCRAFT_DIMENSION AD ON RF.AIRCRAFT_KEY = AD.AIRCRAFT_KEY
GROUP BY 
    AD.MANUFACTURER
ORDER BY 
    Total_Revenue DESC;
    
    
    
-- Find the total revenue generated from reservations for each cabin class:
SELECT 
    cb.CABIN_CLASS_NAME AS Cabin_Class,
    ROUND(SUM(rf.REVENUE), 2) AS Total_Revenue
FROM 
    RESERVATION_FACT rf
JOIN 
    CABIN_CLASS_DIMENSION cb ON rf.CABIN_CLASS_KEY = cb.CABIN_CLASS_KEY
GROUP BY 
    cb.CABIN_CLASS_NAME
ORDER BY 
    Total_Revenue DESC;
    
    




--  Identify destinations with the highest average flight revenue:
SELECT 
    ad.AIRPORT_NAME AS Destination,
    ROUND(AVG(sfa.FLIGHT_REVENUE), 2) AS Avg_Flight_Revenue
FROM 
    SEGMENT_FLIGHT_ACTIVITY_FACT sfa
JOIN 
    AIRPORT_DIMENSION ad ON sfa.SEG_DESTINATION_AIRPORT_KEY = ad.AIRPORT_KEY
GROUP BY 
    ad.AIRPORT_NAME
ORDER BY 
    Avg_Flight_Revenue DESC
 ; 

--  Calculate the total revenue generated from reservations for each booking channel:
SELECT 
    cd.RESERVATION_CHANNEL AS Booking_Channel,
    ROUND(SUM(rf.REVENUE), 2) AS Total_Revenue
FROM 
    RESERVATION_FACT rf
JOIN 
    CHANNEL_DIMENSION cd ON rf.BOOKING_CHANNEL_KEY = cd.CHANNEL_KEY
GROUP BY 
    cd.RESERVATION_CHANNEL
ORDER BY 
    Total_Revenue DESC;