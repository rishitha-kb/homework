CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY,
  owner VARCHAR(45),
  species VARCHAR(45),
  gender VARCHAR(1),
  birth DATE,
  death DATE
);

CREATE TABLE petEvent (
  petname VARCHAR(20),
  eventdate DATE,
  eventtype VARCHAR(255),
  remark VARCHAR(255), 
  FOREIGN KEY (petname) REFERENCES petPet(petname),
  PRIMARY KEY (petname, eventdate, eventtype)
);