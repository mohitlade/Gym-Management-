create table admin(
	admin_id varchar(20) primary key,
	admin_pwd varchar(20) not null,
	admin_name varchar(50)
);

insert into admin values('admin1','12345','Rohit Naidu');

create table equipment(
	eq_id int auto_increment primary key,
	eq_name varchar(40),
	eq_qty int,
	eq_company varchar(40),
	eq_price float
);

insert into equipment(eq_name,eq_qty,eq_company,eq_price) values
('Blen Tredmill', 4, 'Quantico', 41899),
('20Kg Combo 3Ft Plain Rod',4,'Bodyfit',850),
('Preacher Curl Bench',2,'Push2Fit',5799),
('Cable Crossover',1,'Viva Fitness',247000),
('Cardio Fitness Elliptical Cross Trainer',2,'Xterra',66600),
('2Kg Pair Steel Dumbbell',2,'Gb',590),
('5Kg Pair Steel Dumbbell',2,'Bodyfit',999),
('7.5Kg Pair Steel Dumbbell',2,'Bodyfit',1595),
('10Kg Adjustable Dumbbell',2,'Neulife',830),
('12.5Kg Fixed Dumbbell',2,'Neulife',2649),
('15Kg Steel Dumbbell',2,'Protoner',2277),
('20Kg Dumbbell Set',2,'WOLPHY',999);

create table trainer(
	t_id int auto_increment primary key,
	t_name varchar(30),
	t_gender varchar(10) check (t_gender in('Male','Female')),
	t_type varchar(10) check (t_type in ('Bronze','Silver','Gold','Platinuim')),
	t_address varchar(50),
	t_phone varchar(15),
	t_email varchar(30),
	t_birthdate date,
	t_joindate date
);

insert into trainer(t_name,t_gender,t_type,t_address,t_phone,t_email,t_birthdate,t_joindate)
values('Ashish Devkar','Male','Gold','Chinchwad Pune 33','9823374979','ad1999@gmail.com','1999-02-14','2017-01-01'),
('Anant Thorat','Male','Silver','Chinchwad Pune 33','9823374477','anant.t@gmail.com','1999-03-24','2017-06-01'),
('Prem Gaikwad','Male','Gold','Akurdi Pune 35','8823374979','ad1999@gmail.com','1999-02-14','2017-01-01'),
('Sannidi Poojari','Female','Bronze','Nigdi Pune 44','8823364979','san1999@gmail.com','1999-03-17','2018-01-25');


create table membership_plans(
	plan_id int auto_increment primary key,
	plan_name varchar(50),
	plan_type varchar(50),
	plan_price float,
	plan_disc int
);

insert into membership_plans(plan_name, plan_type, plan_price, plan_disc) values
('Physiotherapy - 1D - 1S','1-Day',472,10),
('Dual Personal Training Level 1 - 1D - 1S','1-Day',502,10),
('Dual Personal Training Level 2 - 1D - 1S','1-Day',564,10),
('Personal Training Level 1 - 1D - 1S','1-Day',628,10),
('Dual Personal Training Level 3 - 1D - 1S','1-Day',672,10),
('Personal Training Level 2 - 1D - 1S','1-Day',697,10),
('Dual Personal Training Level 4 - 1D - 1S','1-Day',841,10),
('Personal Training Level 3 - 1D - 1S','1-Day',841,10),
('Personal Training Level 4 - 1D - 1S','1-Day',1053,10),
('Nutrition Counselling - 7D - 1S','7-Days',625,15),
('Physiotherapy - 7D - 5S','7-Days',2585,15),
('Personal Training 1M - 12S','Monthly',4822,15),
('Personal Training 1M - 13S','Monthly',8209,15),
('Personal Training - Level 2 - 1M','Monthly',10466,15),
('Physiotherapy - 30D - 10S','Monthly',10517,15),
('Personal Training - 6M - 78S','Half Yearly',13338,20),
('Nutrition Counselling - 365D - 150S','Annually',14118,25),
('Dual Personal Training Level 1 - 365D - 150S','Annually',54382,25),
('Dual Personal Training Level 2 - 365D - 150S','Annually',60230,25),
('Dual Personal Training Level 3 - 365D - 150S','Annually',67773,25),
('Personal Training Level 1 - 365D - 150S','Annually',73200,25),
('Dual Personal Training Level 4 - 365D - 150S','Annually',94821,25),
('Gym Membership - 12Months','Annually',14878,25),
('Personal Training Level 2 - 365D - 150S','Annually',81101,25);

create table enquiry(
	enq_id int auto_increment primary key,
	name text not null,
	phone text not null,
	email text not null,
	enq_date date,
	plan_id int references membership_plans(plan_id)
);

create table diet_plans(
	diet_plan_id int auto_increment primary key,
	diet_plan_name varchar(50)
);

insert into diet_plans(diet_plan_name) values('Weight Gain - Veg'),('Weight Gain - NonVeg'),('Weight Loss - Veg'),('Weight Loss - NonVeg');

create table members(
	m_id int auto_increment primary key,
	m_pwd text not null,
	m_name text not null,
	m_gender text,
	m_phone text not null,
	m_email text not null,
	m_bdate text,
	m_jdate text,
	diet_plan_id int references diet_plans(diet_plan_id) on delete cascade,
	plan_id int references membership_plans(plan_id) on delete cascade
);		












