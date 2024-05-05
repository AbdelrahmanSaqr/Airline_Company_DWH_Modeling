-- note: if an error massege appear choose ignore all and  table will be created
ALTER TABLE AIRCRAFT_DIMENSION
 DROP PRIMARY KEY CASCADE;

DROP TABLE AIRCRAFT_DIMENSION CASCADE CONSTRAINTS;

CREATE TABLE AIRCRAFT_DIMENSION
(
  AIRCRAFT_KEY         NUMBER,
  AIRCRAFT_CODE        VARCHAR2(10 BYTE),
  AIRCRAFT_TYPE        VARCHAR2(100 BYTE),
  MANUFACTURER         VARCHAR2(100 BYTE),
  MODEL                VARCHAR2(100 BYTE),
  YEAR_OF_MANUFACTURE  NUMBER(4),
  SEATING_CAPACITY     NUMBER,
  MAXIMUM_RANGE        NUMBER,
  OPERATING_WEIGHT     NUMBER
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE AIRPORT_DIMENSION
 DROP PRIMARY KEY CASCADE;

DROP TABLE AIRPORT_DIMENSION CASCADE CONSTRAINTS;

CREATE TABLE AIRPORT_DIMENSION
(
  AIRPORT_KEY   NUMBER,
  AIRPORT_CODE  VARCHAR2(3 BYTE),
  AIRPORT_NAME  VARCHAR2(100 BYTE),
  CITY          VARCHAR2(100 BYTE),
  COUNTRY       VARCHAR2(100 BYTE),
  TIMEZONE      VARCHAR2(50 BYTE),
  LATITUDE      NUMBER(9,6),
  LONGITUDE     NUMBER(9,6),
  AIRPORT_TYPE  VARCHAR2(50 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CHANNEL_DIMENSION
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHANNEL_DIMENSION CASCADE CONSTRAINTS;

CREATE TABLE CHANNEL_DIMENSION
(
  CHANNEL_KEY          NUMBER,
  RESERVATION_CHANNEL  VARCHAR2(100 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CLASS_OF_SERVICE_DIMENSION
 DROP PRIMARY KEY CASCADE;

DROP TABLE CLASS_OF_SERVICE_DIMENSION CASCADE CONSTRAINTS;

CREATE TABLE CLASS_OF_SERVICE_DIMENSION
(
  CLASS_KEY               NUMBER,
  CLASS_PURCHASED         VARCHAR2(20 BYTE),
  CLASS_FLOWN             VARCHAR2(20 BYTE),
  PURCHASED_FLOWN_GROUP   VARCHAR2(40 BYTE),
  CLASS_CHANGE_INDICATOR  VARCHAR2(20 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CUST_SERV_EMPLOYEE_DIMENSION
 DROP PRIMARY KEY CASCADE;

DROP TABLE CUST_SERV_EMPLOYEE_DIMENSION CASCADE CONSTRAINTS;

CREATE TABLE CUST_SERV_EMPLOYEE_DIMENSION
(
  EMPLOYEE_KEY   NUMBER,
  EMPLOYEE_ID    VARCHAR2(50 BYTE),
  EMPLOYEE_NAME  VARCHAR2(100 BYTE),
  DEPARTMENT     VARCHAR2(100 BYTE),
  POSITION       VARCHAR2(100 BYTE),
  HIRE_DATE      DATE,
  EMAIL          VARCHAR2(100 BYTE),
  PHONE_NUMBER   VARCHAR2(20 BYTE),
  SUPERVISOR_ID  VARCHAR2(50 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE DATE_DIMENSION
 DROP PRIMARY KEY CASCADE;

DROP TABLE DATE_DIMENSION CASCADE CONSTRAINTS;

CREATE TABLE DATE_DIMENSION
(
  DATE_KEY           NUMBER,
  DATE_VALUE         DATE,
  DAY                NUMBER,
  DAY_OF_WEEK        VARCHAR2(20 BYTE),
  MONTH              VARCHAR2(20 BYTE),
  QUARTER            VARCHAR2(10 BYTE),
  HOLIDAY_INDICATOR  VARCHAR2(1 BYTE),
  SEASON             VARCHAR2(20 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE FARE_BASIS_DIMENSION
 DROP PRIMARY KEY CASCADE;

DROP TABLE FARE_BASIS_DIMENSION CASCADE CONSTRAINTS;

CREATE TABLE FARE_BASIS_DIMENSION
(
  FARE_BASIS_KEY       NUMBER,
  FARE_BASIS_CODE      VARCHAR2(50 BYTE),
  FARE_DESCRIPTION     VARCHAR2(200 BYTE),
  FARE_TYPE            VARCHAR2(50 BYTE),
  RESTRICTIONS         VARCHAR2(200 BYTE),
  DISCOUNT_PERCENTAGE  NUMBER
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE INTERACTION_DIMENSION
 DROP PRIMARY KEY CASCADE;

DROP TABLE INTERACTION_DIMENSION CASCADE CONSTRAINTS;

CREATE TABLE INTERACTION_DIMENSION
(
  INTERACTION_KEY  NUMBER,
  INTERACTION_ID   VARCHAR2(50 BYTE),
  TYPE             VARCHAR2(100 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE PASSENGER_DIMENSION
 DROP PRIMARY KEY CASCADE;

DROP TABLE PASSENGER_DIMENSION CASCADE CONSTRAINTS;

CREATE TABLE PASSENGER_DIMENSION
(
  PASSENGER_KEY  NUMBER,
  PASSENGER_ID   VARCHAR2(20 BYTE),
  FIRST_NAME     VARCHAR2(50 BYTE),
  LAST_NAME      VARCHAR2(50 BYTE),
  DATE_OF_BIRTH  DATE,
  GENDER         VARCHAR2(10 BYTE),
  EMAIL_ADDRESS  VARCHAR2(100 BYTE),
  ADDRESS        VARCHAR2(200 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE PASSENGER_PROFILE_DIM
 DROP PRIMARY KEY CASCADE;

DROP TABLE PASSENGER_PROFILE_DIM CASCADE CONSTRAINTS;

CREATE TABLE PASSENGER_PROFILE_DIM
(
  PASSENGER_PROFILE_KEY   NUMBER,
  FREQUENT_FLYER_TIER     VARCHAR2(50 BYTE),
  HOME_AIRPORT            VARCHAR2(100 BYTE),
  CLUB_MEMBERSHIP_STATUS  VARCHAR2(50 BYTE),
  LIFETIME_MILEAGE_TIER   VARCHAR2(50 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE PROBLEM_DIMENSION
 DROP PRIMARY KEY CASCADE;

DROP TABLE PROBLEM_DIMENSION CASCADE CONSTRAINTS;

CREATE TABLE PROBLEM_DIMENSION
(
  PROBLEM_KEY       NUMBER,
  PROBLEM_ID        VARCHAR2(50 BYTE),
  PROBLEM_TYPE      VARCHAR2(100 BYTE),
  PROBLEM_SEVERITY  VARCHAR2(50 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE TIME_DIMENSION
 DROP PRIMARY KEY CASCADE;

DROP TABLE TIME_DIMENSION CASCADE CONSTRAINTS;

CREATE TABLE TIME_DIMENSION
(
  TIME_KEY     NUMBER,
  HOUR         NUMBER,
  MINUTE       NUMBER,
  HOUR_OF_DAY  NUMBER,
  TIME_VALUE   VARCHAR2(8 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


DROP TABLE CUSTOMER_CARE_FACT CASCADE CONSTRAINTS;

CREATE TABLE CUSTOMER_CARE_FACT
(
  DATE_KEY         NUMBER,
  PASSENGER_KEY    NUMBER,
  INTERACTION_KEY  NUMBER,
  EMPLOYEE_KEY     NUMBER,
  PROBLEM_KEY      NUMBER,
  FEEDBACK_RATE    NUMBER
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


DROP TABLE RESERVATION_FACT CASCADE CONSTRAINTS;

CREATE TABLE RESERVATION_FACT
(
  DATE_KEY                      NUMBER,
  SCHEDULED_DEPARTURE_DATE_KEY  NUMBER,
  SCHEDULED_DEPARTURE_TIME_KEY  NUMBER,
  PASSENGER_KEY                 NUMBER,
  TRIP_ORIGIN_AIRPORT_KEY       NUMBER,
  TRIP_DESTINATION_AIRPORT_KEY  NUMBER,
  AIRCRAFT_KEY                  NUMBER,
  FARE_BASIS_KEY                NUMBER,
  BOOKING_CHANNEL_KEY           NUMBER,
  CONFIRMATION_NUMBER           VARCHAR2(50 BYTE),
  TICKET_NUMBER                 VARCHAR2(50 BYTE),
  CANCELED                      CHAR(1 BYTE),
  USED_POINTS                   NUMBER,
  POINTS_EARNED                 NUMBER,
  DISCOUNT                      NUMBER,
  REVENUE                       NUMBER
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


DROP TABLE SEGMENT_FLIGHT_ACTIVITY_FACT CASCADE CONSTRAINTS;

CREATE TABLE SEGMENT_FLIGHT_ACTIVITY_FACT
(
  SCHEDULED_DEPARTURE_DATE_KEY  NUMBER,
  SCHEDULED_DEPARTURE_TIME_KEY  NUMBER,
  ACTUAL_DEPARTURE_DATE_KEY     NUMBER,
  ACTUAL_DEPARTURE_TIME_KEY     NUMBER,
  PASSENGER_KEY                 NUMBER,
  PASSENGER_PROFILE_KEY         NUMBER,
  SEG_ORIGIN_AIRPORT_KEY        NUMBER,
  SEG_DESTINATION_AIRPORT_KEY   NUMBER,
  AIRCRAFT_KEY                  NUMBER,
  CLASS_OF_SERVICE_FLOWN_KEY    NUMBER,
  FARE_BASIS_KEY                NUMBER,
  FLIGHT_NUMBER                 NUMBER,
  TICKET_NUMBER                 NUMBER,
  SEGMENT_NUMBER                NUMBER,
  FLIGHT_DURATION               NUMBER,
  FLIGHT_COST                   NUMBER,
  FLIGHT_REVENUE                NUMBER,
  FLIGHT_MILES                  NUMBER,
  FLIGHT_PROFIT                 NUMBER,
  FLIGHT_POINTS_EARNED          NUMBER
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE AIRCRAFT_DIMENSION ADD (
  PRIMARY KEY
 (AIRCRAFT_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE AIRPORT_DIMENSION ADD (
  PRIMARY KEY
 (AIRPORT_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE CHANNEL_DIMENSION ADD (
  PRIMARY KEY
 (CHANNEL_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE CLASS_OF_SERVICE_DIMENSION ADD (
  PRIMARY KEY
 (CLASS_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE CUST_SERV_EMPLOYEE_DIMENSION ADD (
  PRIMARY KEY
 (EMPLOYEE_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE DATE_DIMENSION ADD (
  PRIMARY KEY
 (DATE_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE FARE_BASIS_DIMENSION ADD (
  PRIMARY KEY
 (FARE_BASIS_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE INTERACTION_DIMENSION ADD (
  PRIMARY KEY
 (INTERACTION_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE PASSENGER_DIMENSION ADD (
  PRIMARY KEY
 (PASSENGER_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE PASSENGER_PROFILE_DIM ADD (
  PRIMARY KEY
 (PASSENGER_PROFILE_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE PROBLEM_DIMENSION ADD (
  PRIMARY KEY
 (PROBLEM_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE TIME_DIMENSION ADD (
  PRIMARY KEY
 (TIME_KEY)
    USING INDEX 
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE CUSTOMER_CARE_FACT ADD (
  FOREIGN KEY (DATE_KEY) 
 REFERENCES DATE_DIMENSION (DATE_KEY),
  FOREIGN KEY (PASSENGER_KEY) 
 REFERENCES PASSENGER_DIMENSION (PASSENGER_KEY),
  FOREIGN KEY (INTERACTION_KEY) 
 REFERENCES INTERACTION_DIMENSION (INTERACTION_KEY),
  FOREIGN KEY (EMPLOYEE_KEY) 
 REFERENCES CUST_SERV_EMPLOYEE_DIMENSION (EMPLOYEE_KEY),
  FOREIGN KEY (PROBLEM_KEY) 
 REFERENCES PROBLEM_DIMENSION (PROBLEM_KEY));

ALTER TABLE RESERVATION_FACT ADD (
  FOREIGN KEY (DATE_KEY) 
 REFERENCES DATE_DIMENSION (DATE_KEY),
  FOREIGN KEY (SCHEDULED_DEPARTURE_DATE_KEY) 
 REFERENCES DATE_DIMENSION (DATE_KEY),
  FOREIGN KEY (SCHEDULED_DEPARTURE_TIME_KEY) 
 REFERENCES TIME_DIMENSION (TIME_KEY),
  FOREIGN KEY (PASSENGER_KEY) 
 REFERENCES PASSENGER_DIMENSION (PASSENGER_KEY),
  FOREIGN KEY (TRIP_ORIGIN_AIRPORT_KEY) 
 REFERENCES AIRPORT_DIMENSION (AIRPORT_KEY),
  FOREIGN KEY (TRIP_DESTINATION_AIRPORT_KEY) 
 REFERENCES AIRPORT_DIMENSION (AIRPORT_KEY),
  FOREIGN KEY (AIRCRAFT_KEY) 
 REFERENCES AIRCRAFT_DIMENSION (AIRCRAFT_KEY),
  FOREIGN KEY (FARE_BASIS_KEY) 
 REFERENCES FARE_BASIS_DIMENSION (FARE_BASIS_KEY),
  FOREIGN KEY (BOOKING_CHANNEL_KEY) 
 REFERENCES CHANNEL_DIMENSION (CHANNEL_KEY));

ALTER TABLE SEGMENT_FLIGHT_ACTIVITY_FACT ADD (
  FOREIGN KEY (SCHEDULED_DEPARTURE_DATE_KEY) 
 REFERENCES DATE_DIMENSION (DATE_KEY),
  FOREIGN KEY (SCHEDULED_DEPARTURE_TIME_KEY) 
 REFERENCES TIME_DIMENSION (TIME_KEY),
  FOREIGN KEY (ACTUAL_DEPARTURE_DATE_KEY) 
 REFERENCES DATE_DIMENSION (DATE_KEY),
  FOREIGN KEY (ACTUAL_DEPARTURE_TIME_KEY) 
 REFERENCES TIME_DIMENSION (TIME_KEY),
  FOREIGN KEY (PASSENGER_KEY) 
 REFERENCES PASSENGER_DIMENSION (PASSENGER_KEY),
  FOREIGN KEY (SEG_ORIGIN_AIRPORT_KEY) 
 REFERENCES AIRPORT_DIMENSION (AIRPORT_KEY),
  FOREIGN KEY (SEG_DESTINATION_AIRPORT_KEY) 
 REFERENCES AIRPORT_DIMENSION (AIRPORT_KEY),
  FOREIGN KEY (AIRCRAFT_KEY) 
 REFERENCES AIRCRAFT_DIMENSION (AIRCRAFT_KEY),
  FOREIGN KEY (CLASS_OF_SERVICE_FLOWN_KEY) 
 REFERENCES CLASS_OF_SERVICE_DIMENSION (CLASS_KEY),
  FOREIGN KEY (FARE_BASIS_KEY) 
 REFERENCES FARE_BASIS_DIMENSION (FARE_BASIS_KEY));
 
ALTER TABLE SEGMENT_FLIGHT_ACTIVITY_FACT 
ADD CONSTRAINT fk_passenger_profile 
FOREIGN KEY (PASSENGER_PROFILE_KEY) 
REFERENCES PASSENGER_PROFILE_DIM (PASSENGER_PROFILE_KEY);