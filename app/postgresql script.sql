CREATE TABLE asset_tbl
(
  asset_id VARCHAR(3),
  asset_name VARCHAR(10),
  type_of_asset VARCHAR(20),
  type_presence VARCHAR(20),
  resolve_queue VARCHAR(20),
  date_created DATE,
  date_active DATE,
  date_installed DATE,
  maintance_down DATE,
  maintance_up DATE,

  CONSTRAINT asset_pk PRIMARY KEY(asset_id)
);

CREATE TABLE location_tbl
(
    loc_code VARCHAR(4),
    location_type VARCHAR(20),
    CONSTRAINT location_pk PRIMARY KEY(loc_code)
);

CREATE TABLE users_tbl
(
    users_id VARCHAR(4),
    users_username VARCHAR(20),
    users_password VARCHAR(20),
    users_role VARCHAR(20),
    CONSTRAINT users_pk PRIMARY KEY(users_id)
);

CREATE TABLE software_tbl
(
    software_id VARCHAR(4),
    name_of_software VARCHAR(20),
    CONSTRAINT software_pk PRIMARY KEY(software_id)
);

CREATE TABLE status_tbl
(
    status_id VARCHAR(5),
    status_status VARCHAR(20),
    substatus VARCHAR(20),
    CONSTRAINT status_pk PRIMARY KEY(status_id)
);

CREATE TABLE task_tbl
(
  task_id VARCHAR(3),
  task_status VARCHAR(20),
  task_desc VARCHAR(20),
  users_id VARCHAR(4),
  CONSTRAINT task_users_fk FOREIGN KEY (users_id) REFERENCES users_tbl(users_id),
  CONSTRAINT task_tbl PRIMARY KEY (task_id)
);

CREATE TABLE asset_software_lnk
(
  asset_id VARCHAR(3),
  software_id VARCHAR(3),
  CONSTRAINT asset_software_asset_fk FOREIGN KEY (asset_id) REFERENCES asset_tbl (asset_id),
  CONSTRAINT asset_software_software_fk FOREIGN KEY (software_id) REFERENCES software_tbl (software_id),
  CONSTRAINT asset_software_fk PRIMARY KEY(asset_id, software_id)
  );

  
  CREATE TABLE asset_status_lnk 
(
  asset_id VARCHAR(3),
  status_id VARCHAR(5),
  CONSTRAINT asset_status_asset_fk FOREIGN KEY (asset_id) REFERENCES asset_tbl (asset_id),
  CONSTRAINT asset_status_status_fk FOREIGN KEY (status_id) REFERENCES status_tbl (status_id),
  CONSTRAINT asset_status_fk PRIMARY KEY(asset_id, status_id)
  );

  CREATE TABLE asset_location_lnk 
(
  asset_id VARCHAR(3),
  loc_code VARCHAR(3),
  CONSTRAINT asset_location_asset_fk FOREIGN KEY (asset_id) REFERENCES asset_tbl (asset_id),
  CONSTRAINT asset_location_loc_code_fk FOREIGN KEY (loc_code) REFERENCES location_tbl (loc_code),
  CONSTRAINT asset_location_fk PRIMARY KEY(asset_id, loc_code)
  );

 CREATE TABLE user_ab_lnk
  (
      asset_id VARCHAR(3),
      users_id VARCHAR(3),
      assigned_to BOOLEAN(1),
      billed_to BOOLEAN(1),
  CONSTRAINT user_ab_asset_fk FOREIGN KEY (asset_id) REFERENCES asset_tbl (asset_id),
  CONSTRAINT user_ab_user_fk FOREIGN KEY (users_id) REFERENCES users_tbl (users_id),
  CONSTRAINT user_ab_fk PRIMARY KEY(asset_id, users_id)
  );


INSERT INTO asset_tbl (asset_id, asset_name, type_of_asset, type_presence, resolve_queue, date_created, date_active, date_installed, maintance_down, maintance_up) VALUES('A1', 'delta4', 'Laptop', 'Physical','xcerdg','06/JAN/2016 ','24/JAN/2022 ','02/JAN/2017 ',TO_DATE ('10/04/2022 16:00', 'DD-MM-YYYY HH24:MI'),TO_DATE ('10/04/2022 20:00', 'DD-MM-YYYY HH24:MI'));
INSERT INTO asset_tbl (asset_id, asset_name, type_of_asset, type_presence, resolve_queue, date_created, date_active, date_installed, maintance_down, maintance_up) VALUES('A2', 'alpha2', 'Phone', 'Virtual','ohyte','27/JAN/2016 ','08/FEB/2022 ','24/JAN/2017 ',TO_DATE ('13/03/2022 23:00', 'DD-MM-YYYY HH24:MI'),TO_DATE ('14/03/2022 07:00', 'DD-MM-YYYY HH24:MI'));
INSERT INTO asset_tbl (asset_id, asset_name, type_of_asset, type_presence, resolve_queue, date_created, date_active, date_installed, maintance_down, maintance_up) VALUES('A3', 'sigma3', 'Monitor', 'Virtual','yaqwe','09/FEB/2016 ','10/FEB/2022 ','03/MAR/2017 ',TO_DATE ('03/11/2022 22:45', 'DD-MM-YYYY HH24:MI'),TO_DATE ('04/11/2022 06:30', 'DD-MM-YYYY HH24:MI'));
INSERT INTO asset_tbl (asset_id, asset_name, type_of_asset, type_presence, resolve_queue, date_created, date_active, date_installed, maintance_down, maintance_up) VALUES('A4', 'Beta1', 'tablet', 'Physical','bvcxz','12/FEB/2016 ','01/MAR/2022 ','24/MAY/2017 ',TO_DATE ('21/06/2022 21:35', 'DD-MM-YYYY HH24:MI'),TO_DATE ('22/06/2022 05:40', 'DD-MM-YYYY HH24:MI'));
INSERT INTO asset_tbl (asset_id, asset_name, type_of_asset, type_presence, resolve_queue, date_created, date_active, date_installed, maintance_down, maintance_up) VALUES('A5', 'drone6', 'Ipad', 'Physical','vwtvo','01/MAR/2016 ','22/APR/2022 ','29/MAY/2017 ',TO_DATE ('08/05/2022 01:30', 'DD-MM-YYYY HH24:MI'),TO_DATE ('08/05/2022 09:00', 'DD-MM-YYYY HH24:MI'));
INSERT INTO asset_tbl (asset_id, asset_name, type_of_asset, type_presence, resolve_queue, date_created, date_active, date_installed, maintance_down, maintance_up) VALUES('A6', 'zeta7', 'Printer', 'Virtual','lqtcv','29/APR/2016 ','24/APR/2022 ','07/JUL/2017 ',TO_DATE ('17/08/2022 20:00', 'DD-MM-YYYY HH24:MI'),TO_DATE ('18/08/2022 04:45', 'DD-MM-YYYY HH24:MI'));
INSERT INTO asset_tbl (asset_id, asset_name, type_of_asset, type_presence, resolve_queue, date_created, date_active, date_installed, maintance_down, maintance_up) VALUES('A7', 'epsilon9', 'phone', 'Physical','lmnqt','24/MAY/2016 ','07/JUN/2022 ','17/AUG/2017 ',TO_DATE ('12/03/2022 18:30', 'DD-MM-YYYY HH24:MI'),TO_DATE ('13/03/2022 03:00', 'DD-MM-YYYY HH24:MI'));
INSERT INTO asset_tbl (asset_id, asset_name, type_of_asset, type_presence, resolve_queue, date_created, date_active, date_installed, maintance_down, maintance_up) VALUES('A8', 'iota8', 'laptop', 'Virtual','xzaeq','29/JUL/2016 ','09/OCT/2022 ','08/SEP/2017 ',TO_DATE ('25/11/2022 23:50', 'DD-MM-YYYY HH24:MI'),TO_DATE ('26/11/2022 05:00', 'DD-MM-YYYY HH24:MI'));
INSERT INTO asset_tbl (asset_id, asset_name, type_of_asset, type_presence, resolve_queue, date_created, date_active, date_installed, maintance_down, maintance_up) VALUES('A9', 'omega10', 'tablet', 'Physical','pmklo','21/AUG/2016 ','04/OCT/2022 ','21/NOV/2017 ',TO_DATE ('22/05/2022 00:30', 'DD-MM-YYYY HH24:MI'),TO_DATE ('23/05/2022 08:00', 'DD-MM-YYYY HH24:MI'));
INSERT INTO asset_tbl (asset_id, asset_name, type_of_asset, type_presence, resolve_queue, date_created, date_active, date_installed, maintance_down, maintance_up) VALUES('A10', 'pi5', 'Monitor', 'Virtual','aqwed','27/DEC/2016 ','28/NOV/2022 ','06/DEC/2017 ',TO_DATE ('04/04/2022 03:00', 'DD-MM-YYYY HH24:MI'),TO_DATE ('04/04/2022 16:00', 'DD-MM-YYYY HH24:MI'));

Insert into  location_tbl (loc_code, location_type) values ('L11', 'Store'); 
Insert into  location_tbl (loc_code, location_type) values ('L12', 'Warehouse'); 
Insert into  location_tbl (loc_code, location_type) values ('L13', 'Office 1');  
Insert into  location_tbl (loc_code, location_type) values ('L14', 'Office 2'); 

Insert into  users_tbl (users_id, users_username, users_password, users_role)  values ('U21', 'Fernando34', 'Iztapalapa123', 'Manager'); 
Insert into  users_tbl (users_id, users_username, users_password, users_role)  values ('U22', 'P.roka', 'Brunei808', 'Service Desk'); 
Insert into  users_tbl (users_id, users_username, users_password, users_role)  values ('U23', 'Dawid1', 'Miasdo531', 'Service Desk'); 
Insert into  users_tbl (users_id, users_username, users_password, users_role)  values ('U24', 'Matteo0204', 'ACMilan', 'Technician'); 
Insert into  users_tbl (users_id, users_username, users_password, users_role)  values ('U25', 'Eason03', 'TsuenWan1', 'Technician'); 
Insert into  users_tbl (users_id, users_username, users_password, users_role)  values ('U26', 'rai.pritam', 'Ashford21', 'Service Desk'); 
Insert into  users_tbl (users_id, users_username, users_password, users_role)  values ('U27', 'Alan790', 'Jordan63', 'Manager'); 
Insert into  users_tbl (users_id, users_username, users_password, users_role)  values ('U28', 'NathanOmoreg', 'Nutol23', 'Service Desk'); 

insert into software_tbl (software_id, name_of_software) values('S31', 'WORD'); 
insert into software_tbl (software_id, name_of_software) values('S32', 'Powerpoint'); 
insert into software_tbl (software_id, name_of_software) values('S33','Excel') ;
insert into software_tbl (software_id, name_of_software) values('S34','Outlook') ;

Insert into status_tbl (status_id, status_status, substatus) values ('ST41', 'Online', 'Working'); 
Insert into status_tbl (status_id, status_status, substatus) values ('ST42', 'Offline', 'Standby'); 
Insert into status_tbl (status_id, status_status, substatus) values ('ST43', 'Repair', 'Repairing'); 

Insert INTO task_tbl (task_id, task_status, task_desc, users_id) values ('T51', 'COMPLETED', 'PRINTER FAULTY', 'U22');  
Insert INTO task_tbl (task_id, task_status, task_desc, users_id) values('T52', 'UNCOMPLETED', 'WINDOWS CRASHED', 'U27'); 
Insert INTO task_tbl (task_id, task_status, task_desc, users_id) values('T53', 'IN PROGRESS', 'LAPTOP NOT WORKING', 'U23'); 
Insert INTO task_tbl (task_id, task_status, task_desc, users_id) values('T54', 'COMPLETED', 'BATTERY IS FAULTY', 'U25'); 
Insert INTO task_tbl (task_id, task_status, task_desc, users_id) values('T55', 'UCOMPLETED', 'LOGGING IN PROBLEMS', 'U21'); 
Insert INTO task_tbl (task_id, task_status, task_desc, users_id) values('T56', 'IN PROGRESS', 'HACKED SOFTWARE', 'U28'); 

Insert into asset_software_lnk (asset_id, software_id) values('A1', 'S32'); 
Insert into asset_software_lnk (asset_id, software_id) values('A2', 'S34');  
Insert into asset_software_lnk (asset_id, software_id) values('A3', 'S33');  
Insert into asset_software_lnk (asset_id, software_id) values('A4', 'S32');  
Insert into asset_software_lnk (asset_id, software_id) values('A5', 'S31'); 
Insert into asset_software_lnk (asset_id, software_id) values('A6', 'S34'); 
Insert into asset_software_lnk (asset_id, software_id) values('A7', 'S33');  
Insert into asset_software_lnk (asset_id, software_id) values('A8', 'S31');  
Insert into asset_software_lnk (asset_id, software_id) values('A9', 'S32');  
Insert into asset_software_lnk (asset_id, software_id) values('A10', 'S34'); 

Insert into asset_status_lnk (asset_id, status_id) values ('A1', 'ST41'); 
Insert into asset_status_lnk (asset_id, status_id) values ('A2', 'ST41'); 
Insert into asset_status_lnk (asset_id, status_id) values ('A3', 'ST41'); 
Insert into asset_status_lnk (asset_id, status_id) values ('A4', 'ST41'); 
Insert into asset_status_lnk (asset_id, status_id) values ('A5', 'ST41'); 
Insert into asset_status_lnk (asset_id, status_id) values ('A6', 'ST41'); 
Insert into asset_status_lnk (asset_id, status_id) values ('A7', 'ST42'); 
Insert into asset_status_lnk (asset_id, status_id) values ('A8', 'ST42'); 
Insert into asset_status_lnk (asset_id, status_id) values ('A9', 'ST43'); 
Insert into asset_status_lnk (asset_id, status_id) values ('A10', 'ST43'); 

Insert INTO asset_location_lnk (asset_id, loc_code) values('A1', 'L11'); 
Insert INTO asset_location_lnk (asset_id, loc_code) values('A2', 'L12'); 
Insert INTO asset_location_lnk (asset_id, loc_code) values('A3', 'L13'); 
Insert INTO asset_location_lnk (asset_id, loc_code) values('A4', 'L14'); 
Insert INTO asset_location_lnk (asset_id, loc_code) values('A5', 'L11'); 
Insert INTO asset_location_lnk (asset_id, loc_code) values('A6', 'L12'); 
Insert INTO asset_location_lnk (asset_id, loc_code) values('A7', 'L13'); 
Insert INTO asset_location_lnk (asset_id, loc_code) values('A8', 'L14'); 
Insert INTO asset_location_lnk (asset_id, loc_code) values('A9', 'L11'); 
Insert INTO asset_location_lnk (asset_id, loc_code) values('A10', 'L12'); 

INSERT INTO user_ab_lnk (asset_id, users_id, assigned_to, billed_to) VALUES('A1','U27','1','1');
INSERT INTO user_ab_lnk (asset_id, users_id, assigned_to, billed_to) VALUES('A2','U24','0','0');
INSERT INTO user_ab_lnk (asset_id, users_id, assigned_to, billed_to) VALUES('A3','U28','0','1');
INSERT INTO user_ab_lnk (asset_id, users_id, assigned_to, billed_to) VALUES('A4','U27','1','1');
INSERT INTO user_ab_lnk (asset_id, users_id, assigned_to, billed_to) VALUES('A5','U26','1','0');
INSERT INTO user_ab_lnk (asset_id, users_id, assigned_to, billed_to) VALUES('A6','U25','1','1');
INSERT INTO user_ab_lnk (asset_id, users_id, assigned_to, billed_to) VALUES('A7','U24','1','1');
INSERT INTO user_ab_lnk (asset_id, users_id, assigned_to, billed_to) VALUES('A8','U23','0','1');
INSERT INTO user_ab_lnk (asset_id, users_id, assigned_to, billed_to) VALUES('A9','U22','1','1');
INSERT INTO user_ab_lnk (asset_id, users_id, assigned_to, billed_to) VALUES('A10','U21','1','1');

commit;