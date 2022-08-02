CREATE DATABASE IF NOT EXISTS RXDatabase;

CREATE TABLE IF NOT EXISTS PATIENT(
name varchar(255),
dob varchar(255),
healthcarenum varchar(255) PRIMARY KEY);

CREATE TABLE IF NOT EXISTS MEDICAL_COND(
name varchar(255) PRIMARY KEY,
mainsympt varchar(255),
pthealthnum varchar(255),
FOREIGN KEY(pthealthnum) REFERENCES PATIENT(healthcarenum));

CREATE TABLE IF NOT EXISTS PHARMACY(
name varchar(255),
loc varchar(255),
id int PRIMARY KEY);

CREATE TABLE IF NOT EXISTS PRESCRIBER(
servicenum varchar(255) PRIMARY KEY,
name varchar(255),
type varchar(255));

CREATE TABLE IF NOT EXISTS INVENTORY(
sched int PRIMARY KEY,
type varchar(255),
pharmid int,
FOREIGN KEY(pharmid) REFERENCES PHARMACY(id));

CREATE TABLE IF NOT EXISTS MANUFACTURER(
name varchar(255) PRIMARY KEY,
location varchar(255));

CREATE TABLE IF NOT EXISTS DRUG(
DIN varchar(255) PRIMARY KEY,
price double,
name varchar(255),
schednum int,
manufacturer varchar(255),
pharmID int,
FOREIGN KEY(schednum) REFERENCES INVENTORY(sched),
FOREIGN KEY(pharmID) REFERENCES PHARMACY(id),
FOREIGN KEY(manufacturer) REFERENCES MANUFACTURER(name));

CREATE TABLE IF NOT EXISTS PRESCRIPTION(
rxnum varchar(255) PRIMARY KEY,
patientID varchar(255),
prescriberID varchar(255),
pharmID int,
din varchar(255),
FOREIGN KEY(patientID) REFERENCES PATIENT(healthcarenum),
FOREIGN KEY(prescriberID) REFERENCES PRESCRIBER(servicenum),
FOREIGN KEY(pharmID) REFERENCES PHARMACY(id),
FOREIGN KEY(din) REFERENCES DRUG(DIN));

CREATE TABLE IF NOT EXISTS MEDIC(
snum varchar(255),
qualification varchar(255),
FOREIGN KEY(snum) REFERENCES PRESCRIBER(servicenum));

CREATE TABLE IF NOT EXISTS PHYSICIAN(
snum varchar(255),
phystype varchar(255),
FOREIGN KEY(snum) REFERENCES PRESCRIBER(servicenum));

CREATE TABLE IF NOT EXISTS PARMACY_ASSISTANT(
snum varchar(255),
subtype varchar(255),
FOREIGN KEY(snum) REFERENCES PRESCRIBER(servicenum));

CREATE TABLE IF NOT EXISTS PHARMACIST(
snum varchar(255),
certification varchar(255),
pharmid int,
FOREIGN KEY(pharmid) REFERENCES PHARMACY(id),
FOREIGN KEY(snum) REFERENCES PRESCRIBER(servicenum));

CREATE TABLE IF NOT EXISTS DENTIST(
snum varchar(255),
denttype varchar(255),
FOREIGN KEY(snum) REFERENCES PRESCRIBER(servicenum));

CREATE TABLE IF NOT EXISTS MANAGES(
pharmid int,
pthealthnum varchar(255),
FOREIGN KEY(pharmid) REFERENCES PHARMACY(id),
FOREIGN KEY(pthealthnum) REFERENCES PATIENT(healthcarenum));

CREATE TABLE IF NOT EXISTS EMPLOYS(
pharmid int,
pharmacistid varchar(255),
FOREIGN KEY(pharmid) REFERENCES PHARMACY(id),
FOREIGN KEY(pharmacistid) REFERENCES PRESCRIBER(servicenum));

INSERT INTO `RXDatabase`.`PATIENT` (`name`, `dob`, `healthcarenum`) VALUES ('john', '20-11-1984', '68964338');
INSERT INTO `RXDatabase`.`PATIENT` (`name`, `dob`, `healthcarenum`) VALUES ('lyle', '23-11-2000', '00339339');
INSERT INTO `RXDatabase`.`PATIENT` (`name`, `dob`, `healthcarenum`) VALUES ('rebecca', '04-09-2004', '85507164');
INSERT INTO `RXDatabase`.`PATIENT` (`name`, `dob`, `healthcarenum`) VALUES ('joe', '13-05-2001', '24226783');
INSERT INTO `RXDatabase`.`PATIENT` (`name`, `dob`, `healthcarenum`) VALUES ('ash', '19-03-2018', '66124177');
INSERT INTO `RXDatabase`.`PATIENT` (`name`, `dob`, `healthcarenum`) VALUES ('oden', '13-12-1965', '13847871');
INSERT INTO `RXDatabase`.`PATIENT` (`name`, `dob`, `healthcarenum`) VALUES ('shael', '09-01-1995', '73060695');

INSERT INTO `RXDatabase`.`PHARMACY` (`name`, `loc`, `id`) VALUES ('Shoppers', 'Calgary', 10);
INSERT INTO `RXDatabase`.`PHARMACY` (`name`, `loc`, `id`) VALUES ('Loblaws', 'Edmonton', 11);
INSERT INTO `RXDatabase`.`PHARMACY` (`name`, `loc`, `id`) VALUES ('Shoppers', 'Red Deer', 12);
INSERT INTO `RXDatabase`.`PHARMACY` (`name`, `loc`, `id`) VALUES ('Superstore', 'Vancouver', 13);
INSERT INTO `RXDatabase`.`PHARMACY` (`name`, `loc`, `id`) VALUES ('Independent', 'Ottawa', 14);

INSERT INTO `RXDatabase`.`MANUFACTURER` (`name`, `location`) VALUES ('Pfizer', 'California');
INSERT INTO `RXDatabase`.`MANUFACTURER` (`name`, `location`) VALUES ('Novartis', 'Las Vegas');
INSERT INTO `RXDatabase`.`MANUFACTURER` (`name`, `location`) VALUES ('GlaxoSmithKline', 'Houston');
INSERT INTO `RXDatabase`.`MANUFACTURER` (`name`, `location`) VALUES ('Sanofi', 'Calgary');
INSERT INTO `RXDatabase`.`MANUFACTURER` (`name`, `location`) VALUES ('Bayer AG', 'Paris');
INSERT INTO `RXDatabase`.`MANUFACTURER` (`name`, `location`) VALUES ('Abbvie Inc', 'Cairo');

INSERT INTO `RXDatabase`.`INVENTORY` (`sched`, `type`, `pharmID`) VALUES (1, 'OTC', 10);
INSERT INTO `RXDatabase`.`INVENTORY` (`sched`, `type`, `pharmID`) VALUES (2, 'RX', 10);
INSERT INTO `RXDatabase`.`INVENTORY` (`sched`, `type`, `pharmID`) VALUES (3, 'NARCS', 10);

INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('32345425','10.99','Biphentin' , 3 , 'Pfizer', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('63578943','50.99','Vyvanse' , 3 , 'Pfizer', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('09988776','105.99','Botox' , 2 , 'Pfizer', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('65434578','45.99','Humira' , 1 , 'Pfizer', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('76528902','6.99','Amlodipine' , 2 , 'Pfizer', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('34643240','6.99','Rosuvastatin' , 2 , 'Pfizer', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('00986789','20.99','Telmisartan' , 2 , 'Pfizer', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('21324354','30.99','Candesartan' , 2 , 'Pfizer', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('65547687','7.99','Atorvastatin' , 2 , 'Pfizer', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('12345678','10.99','Lantus' , 1 , 'Novartis', 11);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('87654321','50.99','Concerta' , 3 , 'Novartis', 12);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('12312564','105.99','Shingrix' , 2 , 'Novartis', 13);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('54328601','45.99','Adacel' , 2 , 'Novartis', 14);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('65827502','6.99','Dexamethasone' , 2 , 'Novartis', 12);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('32554689','6.99','Pantoprazole' , 2 , 'Novartis', 11);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('31242654','20.99','Metformin' , 2 , 'Novartis', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('09876543','30.99','Synthroid' , 2 , 'GlaxoSmithKline', 12);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('61235752','7.99','Androgel' , 3 , 'GlaxoSmithKline', 12);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('82736912','10.99','Feramax' , 1 , 'GlaxoSmithKline', 14);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('09736128','50.99','Tylenol #3' , 3 , 'GlaxoSmithKline', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('09127413','105.99','Tylenol #2' , 1 , 'GlaxoSmithKline', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('02914618','45.99','Tylenol #4' , 3 , 'GlaxoSmithKline', 10);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('64389236','6.99','Ketorolac' , 2 , 'Sanofi', 11);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('01235211','6.99','Irbesartan' , 2 , 'Sanofi', 11);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('11111111','20.99','Folic-Acid' , 2 , 'Sanofi', 11);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('22222222','30.99','Citalopram' , 2 , 'Sanofi', 14);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('23333333','7.99','Escitalopram' , 2 , 'Bayer AG', 14);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('44444444','10.99','Dexedrine' , 3 , 'Bayer AG', 13);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('55555555','50.99','Foquest' , 2 , 'Bayer AG', 13);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('09867534','105.99','Gravol' , 1 , 'Bayer AG', 13);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('43434343','45.99','Pneumovax' , 2 , 'Bayer AG', 13);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('32323232','6.99','Agriflu' , 1 , 'Abbvie Inc', 11);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('24355236','6.99','Glucose Monitor' , 1 , 'Abbvie Inc', 11);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('09090988','20.99','Dex-6' , 1 , 'Abbvie Inc', 12);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('87878764','30.99','Hylo' , 1 , 'Abbvie Inc', 12);
INSERT INTO `RXDatabase`.`DRUG` (`DIN`, `price`, `name`, `schednum`, `manufacturer`, `pharmID`) VALUES ('43127856','7.99','Palafer' , 1 , 'Abbvie Inc', 11);

INSERT INTO `RXDatabase`.`PRESCRIBER` (`servicenum`, `name`, `type`) VALUES ('066783', 'John Snow', 'PHYS');
INSERT INTO `RXDatabase`.`PRESCRIBER` (`servicenum`, `name`, `type`) VALUES ('012364', 'Steve Hook', 'EMERG');
INSERT INTO `RXDatabase`.`PRESCRIBER` (`servicenum`, `name`, `type`) VALUES ('111111', 'Charles Wang', 'PHYS');
INSERT INTO `RXDatabase`.`PRESCRIBER` (`servicenum`, `name`, `type`) VALUES ('222222', 'Tim Rob', 'PHARM');
INSERT INTO `RXDatabase`.`PRESCRIBER` (`servicenum`, `name`, `type`) VALUES ('333333', 'Jeff Ross', 'PHYS');
INSERT INTO `RXDatabase`.`PRESCRIBER` (`servicenum`, `name`, `type`) VALUES ('444444', 'Youssef Max', 'SURG');
INSERT INTO `RXDatabase`.`PRESCRIBER` (`servicenum`, `name`, `type`) VALUES ('564342', 'Pami Fam', 'DENT');
INSERT INTO `RXDatabase`.`PRESCRIBER` (`servicenum`, `name`, `type`) VALUES ('099465', 'Caroline Skalozub', 'PA');

INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180346','73060695','066783' , 10 , '32345425');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180347','73060695','066783' , 10 , '63578943');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180348','73060695','066783' , 10 , '65434578');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180349','73060695','012364' , 10 , '76528902');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180350','73060695','066783' , 10 , '34643240');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180351','73060695','066783' , 10 , '00986789');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180352','73060695','066783' , 10 , '21324354');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180353','73060695','066783' , 10 , '09988776');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180354','73060695','066783' , 10 , '65547687');

INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180355','00339339','111111' , 11 , '02914618');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180356','00339339','111111' , 11 , '23333333');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180357','00339339','111111' , 11 , '65434578');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180358','00339339','111111' , 11 , '76528902');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180359','00339339','111111' , 11 , '34643240');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180360','00339339','222222' , 10 , '00986789');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180361','00339339','111111' , 11 , '65827502');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180362','00339339','222222' , 12 , '09988776');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180363','00339339','111111' , 11 , '65547687');

INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180364','13847871','333333' , 13 , '32345425');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180365','13847871','333333' , 13 , '32554689');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180366','13847871','333333' , 13 , '65434578');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180367','13847871','333333' , 13 , '76528902');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180368','13847871','333333' , 13 , '34643240');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180369','13847871','333333' , 13 , '02914618');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180370','13847871','333333' , 14 , '09988776');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180371','13847871','333333' , 13 , '09988776');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180372','13847871','333333' , 13 , '65547687');

INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180373','24226783','564342' , 14 , '32345425');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180374','24226783','564342' , 14 , '63578943');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180375','24226783','564342' , 14 , '65434578');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180376','24226783','564342' , 14 , '23333333');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180377','24226783','564342' , 14 , '34643240');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180378','24226783','564342' , 14 , '00986789');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180379','24226783','564342' , 14 , '21324354');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180380','24226783','564342' , 14 , '09988776');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180381','24226783','564342' , 14 , '65547687');

INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180382','66124177','099465' , 12 , '32345425');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180383','66124177','099465' , 11 , '63578943');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180384','66124177','099465' , 12 , '65434578');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180385','66124177','099465' , 11 , '76528902');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180386','66124177','066783' , 10 , '65827502');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180387','66124177','099465' , 12 , '00986789');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180388','66124177','066783' , 10 , '21324354');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180389','66124177','099465' , 11 , '02914618');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180390','66124177','066783' , 10 , '32554689');

INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180391','68964338','066783' , 13 , '32345425');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180392','68964338','099465' , 13 , '23333333');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180393','68964338','066783' , 13 , '65434578');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180394','68964338','012364' , 14 , '09988776');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180395','68964338','066783' , 14 , '34643240');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180396','68964338','099465' , 14 , '00986789');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180397','68964338','099465' , 10 , '21324354');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180398','68964338','099465' , 10 , '09988776');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180399','68964338','066783' , 10 , '65547687');

INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180400','85507164','099465' , 14 , '32345425');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180401','85507164','099465' , 14 , '23333333');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180402','85507164','444444' , 14 , '65827502');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180403','85507164','012364' , 14 , '09988776');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180404','85507164','444444' , 12 , '34643240');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180405','85507164','444444' , 11 , '00986789');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180406','85507164','066783' , 11 , '21324354');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180407','85507164','444444' , 10 , '09988776');
INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ('180408','85507164','099465' , 10 , '65547687');

INSERT INTO `RXDatabase`.`EMPLOYS` (`pharmid`, `pharmacistid`) VALUES ('10','099465');
INSERT INTO `RXDatabase`.`EMPLOYS` (`pharmid`, `pharmacistid`) VALUES ('10','222222');
INSERT INTO `RXDatabase`.`EMPLOYS` (`pharmid`, `pharmacistid`) VALUES ('11','099465');
INSERT INTO `RXDatabase`.`EMPLOYS` (`pharmid`, `pharmacistid`) VALUES ('11','222222');
INSERT INTO `RXDatabase`.`EMPLOYS` (`pharmid`, `pharmacistid`) VALUES ('14','099465');
INSERT INTO `RXDatabase`.`EMPLOYS` (`pharmid`, `pharmacistid`) VALUES ('14','222222');









