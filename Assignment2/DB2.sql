use db20211815;

# 1번
select customer_name
from customer
where customer_city = "서울";

# 2번
select customer_name
from customer natural join borrower natural join loan_branch natural join branch
where customer.customer_city = branch.branch_city;

# 3번
select employee_name, employee_length
from employee
where employee_id not in (select E1.employee_id
			  from employee as E1, employee as E2
			  where E1.employee_length > E2.employee_length);
              
# 4번
select employee_name, count(customer_id)
from customer_banker natural join employee
group by employee_id
having count(customer_id) <> 0;

# 5번
select sum(amount)
from loan natural join borrower natural join customer
where customer_name like "김%";

# 6번
select branch_name
from branch
where assets > (select avg(assets)
		from branch);

# 7번
select customer_id, customer_name
from customer natural join depositor
where customer_id not in (select customer_id
			  from customer natural join borrower);

# 8번
select customer_id, truncate(avg(balance),0)
from customer as C1 natural join depositor natural join account 
where 3 <= (select count(account_number)
	    from customer as C2 natural join depositor 
	    where C1.customer_id = C2.customer_id) 
	and C1.customer_city = '서울'
group by customer_id;

# 9번
select branch_name
from branch
where assets > (select min(assets)
		from branch
		where branch_city = '부산');
        
# 10번
with temp(customer_id,branch_name) as (select customer_id,branch_name
                                       from loan_branch natural join borrower natural join branch)
select C.customer_id, C.customer_name
from customer as C
where not exists (select branch_name
                  from branch
                  where branch_city = '서울' and branch_name not in (select temp.branch_name
                                                      		     from temp
                                                     		     where temp.customer_id = C.customer_id));

# 11번
with recursive recursive_manager as (
select employee_manager, employee_worker
from manager_worker
where employee_manager = (select employee_id
                          from employee
                          where employee_name = '홍길동')
union all
select MW.employee_manager, MW.employee_worker
from manager_worker as MW inner join recursive_manager as RM on MW.employee_manager = RM.employee_worker)

select employee_name
from recursive_manager, employee
where employee_worker = employee_id;

# 12번
update account
set balance = case
    when balance >= 10 then floor(balance * 1.05)
    else floor(balance * 1.03)
    end;
    
# 13번
update customer
set customer_type = 'VIP'
where customer_id in (select customer_id
		      from depositor natural join account
		      group by customer_id
		      having 100 <= sum(balance));

# 14번
delete from employee 
where employee_id not in (select distinct employee_id
			  from customer_banker
			    where employee_id is not null);
                
# 15번
delete from loan as L
where loan_number in (select loan_number
		      from payment
		      group by loan_number
		      having L.amount <= sum(payment_amount));
              
# 16번
create view all_customer as
select loan_branch.branch_name, customer.customer_name
from loan_branch natural join borrower natural join customer;

# 17번
select customer_name
from all_customer
where branch_name = '숭실대지점';

# 18번
create view only_account_customer as
select customer.customer_name, customer.customer_city
from customer
where customer_id in (select customer_id from depositor) and
customer_id not in (select customer_id from borrower);

# 19번
select customer_name 
from only_account_customer
where customer_city = '서울';

# 20번
create view customer_avg_balance as
select customer_name, avg(balance) as avg_balance
from customer natural join depositor natural join account
group by customer_id;

# 21번
select avg_balance
from customer_avg_balance
where customer_name = '홍길동';