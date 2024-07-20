create database HumanResourceManagement;

create table department(
	departmentID int,
    departmentName varchar(10) not null,
    managerID varchar(3),
    dateOfEMployment date not null,
    primary key(departmentID)
);

insert into department
values
('1', 'Quan ly', '888', '1971-06-19'),
('4', 'Dieu Hanh', '777', '1985-01-01'),
('5', 'Nghien cuu', '333', '1978-05-22');


create table employees(
	employeeID varchar(3),
    lastName varchar(20) not null,
    middleName varchar(20) null,
    firstName varchar(20) not null,
    dateOfBirth date not null,
    gender varchar(5) not null,
    salary decimal(15,4) not null,
    address varchar(100) not null,
    managerID varchar(3),
    departmentID int,
    primary key(employeeID)
);

insert into employees
values
('123', 'Dinh', 'Ba', 'Tien', '1995-1-9', 'Nam', '3000', '731 Tran Hung Dao Q1 TPHCM', '333', '5'),
('333', 'Nguyen', 'Thanh', 'Tung', '1945-8-12', 'Nam', '4000', '638 Nguyen Van Cu Q5 TPHCM', '888', '5'),
('453', 'Tran', 'Thanh', 'Tam', '1962-7-31', 'Nam', '2500', '543 Mai Thi Luu Ba Dinh Ha Noi', '333', '5'),
('666', 'Nguyen', 'Manh', 'Hung', '1952-9-15', 'Nam', '3800', '975 Le Lai P3 Vung Tau', '333', '5'),
('777', 'Tran', 'Hong', 'Quang', '1959-3-29', 'Nam', '2500', '980 Le Hong Phong Vung Tau', '987', '4'),
('888', 'Vuong', 'Ngoc', 'Quyen', '1927-10-10', 'Nu', '5500', '450 Trung Vuong My Tho', null, '1'),
('987', 'Le', 'Thi', 'Nhan', '1931-6-20', 'Nu', '4300', '291 Ho Van Hue Q.PN TPHCM', '888', '4'),
('999', 'Bui', 'Thuy', 'Vu', '1958-7-19', 'Nam', '2500', '332 Nguyen Thai Hoc Quy Nhon', '987', '4');

alter table EMPLOYEES
add foreign key (managerID) references employees(employeeID),
add foreign key (departmentID) references department(departmentID);

alter table DEPARTMENT
add foreign key (managerID) references employees(employeeID);

create table departmentAddress(
	departmentID int,
    address varchar(30),
	primary key(address, departmentID),
    foreign key(departmentID) references department(departmentID)
);

insert into departmentaddress
values
('1', 'TP HCM'),
('4', 'HA NOI'),
('5', 'NHA TRANG'),
('5', 'TP HCM'),
('5', 'VUNG TAU');

create table projects(
	projectID int,
    projectName varchar(30) not null,
    projectAddress varchar(100) not null,
    departmentID int,
    primary key(projectID),
    foreign key(departmentID) references department(departmentID)
);

insert into projects
values
('1', 'San pham X', 'VUNG TAU', '5'),
('2', 'San pham Y', 'NHA TRANG', '5'),
('3', 'San pham Z', 'TP HCM', '5'),
('10', 'Tin hoc hoa', 'HA NOI', '4'),
('20', 'Cap Quang', 'TP HCM', '1'),
('30', 'Dao tao', 'HA NOI', '4');


create table assignment(
	employeeID varchar(3),
    projectID int,
    workingHour float not null,
    primary key(employeeID, projectID),
    foreign key(employeeID) references employees(employeeID),
    foreign key(projectID) references projects(projectID)
);
 insert into assignment
 values
 ('123', '1', '22.5'),
 ('123', '2', '7.5'),
 ('123', '3', '10'),
 ('333', '10', '10'),
 ('333', '20', '10'),
 ('453', '1', '20'),
 ('453', '2', '20'),
('666', '3', '40'),
('888', '20' ,'0'),
('987', '20', '15');


create table relatives(
	employeeID varchar(3),
    relativeName varchar(50),
    gender varchar(5) not null,
    dateOfBirth date null,
    relationship varchar(30) not null,
    primary key(employeeID, relativeName),
    foreign key(employeeID) references employees(employeeID)
);
insert into relatives
values
('123', 'Chau' ,'Nu', '1978-12-31', 'Con gai'),
('123', 'Duy' ,'Nam', '1978-1-1', 'Con trai'),
('123', 'Phuong', 'Nu', '1957-5-5', 'Vo chong'),
('333', 'Duong', 'Nu', '1948-5-3' ,'Vo chong'),
('333', 'Quang', 'Nu', '1976-4-5', 'Con gai'),
('333', 'Tung', 'Nam', '1973-10-25', 'Con trai'),
('987', 'Dang', 'Nam', '1932-2-29', 'Vo chong');

