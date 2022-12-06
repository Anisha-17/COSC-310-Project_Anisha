DROP TABLE data

CREATE TABLE data (
	RoleName VARCHAR(10),
	DoorToAccess INT,
	AccessStatus VARCHAR (7),
	Date VARCHAR(20)
)

CREATE TABLE account (
	username VARCHAR (15) NOT NULL PRIMARY KEY,
	password VARCHAR (15)
)

CREATE TABLE ip (
	username VARCHAR (15) FOREIGN KEY REFERENCES account(username),
	IP VARCHAR (15)
)

BULK INSERT data
FROM '\mycsvdata\database.csv'
WITH (FORMAT = 'CSV'
    , FIELDQUOTE = '\'
    , FIRSTROW=2
    , FIELDTERMINATOR = ','
    , ROWTERMINATOR = '0x0a');

INSERT INTO account VALUES ('username','password');
INSERT INTO account VALUES ('security','testing');
INSERT INTO account VALUES ('jimmy','jones');