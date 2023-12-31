drop database db20211815;
create database db20211815;

use db20211815;
create table customer(
customer_id varchar(3),
customer_name varchar(100),
customer_street varchar(100),
customer_city varchar(100),
primary key(customer_id));

create table loan(
loan_number varchar(20),
amount int(10),
primary key(loan_number));

create table account(
account_number varchar(20),
balance int(10),
primary key(account_number));

create table employee(
employee_id varchar(3),
employee_name varchar(100),
telephone_number char(11),
employee_length int(10),
start_date date,
primary key(employee_id));

create table employee_dependent(
employee_id varchar(3),
dependent_name varchar(100),
foreign key(employee_id) references employee(employee_id) on delete cascade,
primary key(employee_id, dependent_name));

create table branch(
branch_name varchar(100), 
branch_city varchar(100),
assets int(10),
primary key(branch_name));

create table payment(
loan_number varchar(20),
payment_number int(10),
payment_amount int(10),
payment_date date,
foreign key(loan_number) references loan(loan_number) on delete cascade,
primary key(loan_number, payment_number));

create table borrower(
customer_id varchar(3),
loan_number varchar(20), 
foreign key(customer_id) references customer(customer_id) on delete cascade,
foreign key(loan_number) references loan(loan_number) on delete cascade,
primary key(customer_id, loan_number));

create table depositor(
customer_id varchar(3),
account_number varchar(20),
foreign key(customer_id) references customer(customer_id) on delete cascade,
foreign key(account_number) references account(account_number) on delete cascade,
primary key(customer_id, account_number));

create table manager_worker(
employee_manager varchar(20), 
employee_worker varchar(20), 
foreign key(employee_manager) references employee(employee_id) on delete cascade,
foreign key(employee_worker) references employee(employee_id) on delete cascade,
primary key(employee_manager, employee_worker));

create table loan_branch(
loan_number varchar(20),
branch_name varchar(100),
foreign key(loan_number) references loan(loan_number) on delete cascade,
foreign key(branch_name) references branch(branch_name) on delete cascade,
primary key(loan_number, branch_name));

create table customer_banker(
customer_id varchar(3),
employee_id varchar(3),
foreign key (customer_id) references customer(customer_id) on delete cascade,
foreign key (employee_id) references employee(employee_id) on delete cascade,
primary key(customer_id, employee_id));


insert into customer values('1', '김명하', '양천구 신정동 4번지', '서울');
insert into customer values('2', '김윤서', '광진구 구의동 19번지', '서울');
insert into customer values('3', '김수안', '동작구 상도동 40번지', '서울');
insert into customer values('4', '유솔아', '강남구 삼성동 210번지', '서울');
insert into customer values('5', '김효준', '대덕구 덕암동 64번지', '대전');
insert into customer values('6', '이주은', '유성구 도룡동 110번지', '대전');
insert into customer values('7', '이채미', '영도구 남항동 483번지', '부산');
insert into customer values('8', '이소정', '해운대구 반여동 700번지', '부산');
insert into customer values('9', '최은서', '달서구 성당동 30번지', '대구');
insert into customer values('10', '최지연', '수성구 수성동 506번지', '대구');
insert into customer values('11', '최유림', '수성구 범어동 864번지', '대구');
insert into customer values('12', '박현아', '연수구 송도동 270번지', '인천');
insert into customer values('13', '박한솔', '광산구 하남동 13번지', '광주');
insert into customer values('14', '박태은', '울주군 청량읍 825번지', '울산');
insert into customer values('15', '박수현', '중구 태화동 1680번지', '울산');
insert into customer values('16', '문지우', '완산구 태평동 661번지', '전주');
insert into customer values('17', '백가은', '덕진구 여의동 59번지', '전주');

insert into employee values('1', '전회장', '117-5613', '24', '1999-01-01');
insert into employee values('2', '윤사장', '451-1246', '23', '2000-08-15');
insert into employee values('3', '오부장', '751-0042', '21', '2002-04-07');
insert into employee values('4', '설과장', '3221-6600', '20', '2003-11-29');
insert into employee values('5', '박팀장', '159-1132', '18', '2005-05-05');
insert into employee values('6', '최대리', '108-7843', '16', '2007-12-11');
insert into employee values('7', '홍대리', '1358-8455', '14', '2009-08-09');
insert into employee values('8', '한주임', '948-5971', '10', '2013-03-01');
insert into employee values('9', '이선임', '196-5207', '8', '2015-07-22');
insert into employee values('10', '나경리', '7800-6128', '7', '2016-10-10');
insert into employee values('11', '함사원', '1843-2562', '3', '2020-09-13');
insert into employee values('12', '강사원', '4457-1230', '2', '2021-06-20');
insert into employee values('13', '공인턴', '7150-1389', '0', '2023-02-02');

insert into manager_worker values('1', '2');
insert into manager_worker values('1', '3');
insert into manager_worker values('2', '4');
insert into manager_worker values('2', '5');
insert into manager_worker values('2', '6');
insert into manager_worker values('3', '7');
insert into manager_worker values('3', '8');
insert into manager_worker values('3', '9');
insert into manager_worker values('3', '10');
insert into manager_worker values('3', '11');
insert into manager_worker values('3', '12');
insert into manager_worker values('3', '13');


insert into employee_dependent values('1', '전소민');
insert into employee_dependent values('1', '전소연');
insert into employee_dependent values('1', '유승한');
insert into employee_dependent values('1', '박수민');
insert into employee_dependent values('2', '윤민철');
insert into employee_dependent values('2', '최민준');
insert into employee_dependent values('3', '오해원');
insert into employee_dependent values('3', '하선우');
insert into employee_dependent values('5', '박윤하');
insert into employee_dependent values('5', '황민우');
insert into employee_dependent values('6', '최서연');
insert into employee_dependent values('6', '어다연');
insert into employee_dependent values('7', '백소연');
insert into employee_dependent values('8', '성초하');
insert into employee_dependent values('9', '유한별');
insert into employee_dependent values('10', '김서윤');
insert into employee_dependent values('10', '이재현');

insert into loan values('1', 200);
insert into loan values('2', 220);
insert into loan values('3', 340);
insert into loan values('4', 230);
insert into loan values('5', 100);
insert into loan values('6', 110);
insert into loan values('7', 340);
insert into loan values('8', 150);
insert into loan values('9', 200);
insert into loan values('10', 300);
insert into loan values('11', 500);
insert into loan values('12', 900);
 
insert into payment values('2', '1', 200, '2023-11-04');
insert into payment values('3', '1', 300, '2023-11-04');
insert into payment values('5', '1', 50, '2020-04-20');
insert into payment values('5', '2', 30, '2021-10-15');
insert into payment values('5', '3', 20, '2022-05-30');
insert into payment values('6', '1', 50, '2020-09-04');
insert into payment values('6', '2', 20, '2023-12-16');
insert into payment values('7', '1', 100, '2022-01-31');
insert into payment values('7', '2', 100, '2022-06-24');
insert into payment values('7', '3', 140, '2022-02-28');

insert into account values('1', 30);
insert into account values('2', 10);
insert into account values('3', 90);
insert into account values('4', 40);
insert into account values('5', 110);
insert into account values('6', 180);
insert into account values('7', 160);
insert into account values('8', 100);
insert into account values('9', 260);
insert into account values('10', 210);
insert into account values('11', 570);
insert into account values('12', 790);
insert into account values('13', 1000);
insert into account values('14', 630);


insert into branch values('명동지점', '서울', 4000);
insert into branch values('숭실대지점', '서울', 5000);
insert into branch values('대덕구지점', '대전', 1000);
insert into branch values('동래구지점', '부산', 3000);
insert into branch values('수성구지점', '대구', 100);
insert into branch values('덕진구지점', '전주', 200);
insert into branch values('삼호동지점', '울산', 500);



insert into borrower values('1', '1');
insert into borrower values('1', '2');
insert into borrower values('1', '3');
insert into borrower values('2', '4');
insert into borrower values('2', '5');
insert into borrower values('2', '6');
insert into borrower values('3', '7');
insert into borrower values('3', '8');
insert into borrower values('4', '9');
insert into borrower values('5', '9');
insert into borrower values('6', '10');
insert into borrower values('6', '11');
insert into borrower values('6', '12');


insert into loan_branch values('1', '명동지점');
insert into loan_branch values('2', '숭실대지점');
insert into loan_branch values('3', '대덕구지점');
insert into loan_branch values('4', '수성구지점');
insert into loan_branch values('5', '수성구지점');
insert into loan_branch values('6', '수성구지점');
insert into loan_branch values('7', '덕진구지점');
insert into loan_branch values('8', '덕진구지점');
insert into loan_branch values('9', '덕진구지점');
insert into loan_branch values('10', '동래구지점');
insert into loan_branch values('11', '동래구지점');
insert into loan_branch values('12', '숭실대지점');


insert into customer_banker values('1', '1');
insert into customer_banker values('2', '6');
insert into customer_banker values('3', '6');
insert into customer_banker values('4', '11');
insert into customer_banker values('5', '11');
insert into customer_banker values('6', '11');
insert into customer_banker values('7', '5');
insert into customer_banker values('8', '5');
insert into customer_banker values('9', '10');
insert into customer_banker values('10', '10');
insert into customer_banker values('11', '10');
insert into customer_banker values('12', '10');


insert into depositor values('12', '1');
insert into depositor values('12', '2');
insert into depositor values('13', '3');
insert into depositor values('14', '4');
insert into depositor values('15', '5');
insert into depositor values('16', '6');
insert into depositor values('17', '7');
insert into depositor values('8', '8');

alter table customer
add column customer_type varchar(5);