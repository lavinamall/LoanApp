CREATE DATABASE LoanShark;

CREATE TABLE Users(
    UserId SERIAL PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Mobile VARCHAR(10) NOT NULL,
    Address VARCHAR(255),
    Notes VARCHAR(1000)
);

SELECT * FROM Users;
SELECT * FROM Users ORDER BY UserName ASC;

INSERT INTO Users (UserName, Mobile, Address, Notes) VALUES ('Gannu', '9769883785', 'Phase 4, Boronada', 'no notes available');
INSERT INTO Users (UserName, Mobile, Address, Notes) VALUES ('Lavina', '9769883785', 'Poata C Road', 'no notes available');
INSERT INTO Users (UserName, Mobile, Address, Notes) VALUES ('Sunil', '', 'Boranada', 'no notes available');

UPDATE USERS SET MOBILE='9314711168' WHERE USERID=1;

-- http://localhost:3500/UserList

CREATE TABLE UserTransactions(
    TransactionId SERIAL PRIMARY KEY,
    UserId INT,
    StartDate DATE NOT NULL DEFAULT CURRENT_DATE,
    Duration_in_months NUMERIC(5,0),
    EndDate DATE,
    Principal NUMERIC(18,0),
    Interest NUMERIC(18,0),
    Rate NUMERIC(3,0),
    CONSTRAINT fk_user FOREIGN KEY(UserId) REFERENCES Users(UserId)
);

INSERT INTO UserTransactions (UserId,StartDate,Duration_in_months,EndDate,Principal,Interest,Rate) VALUES (1,'01-October-2022',1,'31-October-2022',100000,NULL,5);
INSERT INTO UserTransactions (UserId,StartDate,Duration_in_months,EndDate,Principal,Interest,Rate) VALUES (2,'01-October-2022',2,'31-October-2022',200000,NULL,5);
INSERT INTO UserTransactions (UserId,StartDate,Duration_in_months,EndDate,Principal,Interest,Rate) VALUES (3,'01-October-2022',3,'31-October-2022',300000,NULL,5);