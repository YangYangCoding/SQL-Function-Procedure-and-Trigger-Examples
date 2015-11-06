-- Functions that check the questions are implemented here
set serveroutput on size 1000000
create or replace function
	ass3_table_exists(relname varchar) return boolean
as 
	chck integer := 0;
begin
	select count(*) into chck from tab
	where tname=relname and TABTYPE='TABLE';
	return (chck=1);
end;
/


create or replace function
	ass3_view_exists(relname varchar) return boolean
as 
	chck integer := 0;
begin
	select count(*) into chck from tab
	where relname=tname and tabtype='VIEW';
	return (chck = 1);
end;
/

create or replace function
	ass3_function_exists(funcname varchar) return boolean
as 
	chck integer := 0;
begin
	select count(*) into chck from user_objects
	where object_name=funcname and object_type='FUNCTION';
	return (chck > 0);
end;
/



create or replace function
	ass3_check_result(qid varchar, nexcess integer, nmissing integer) return varchar
as 
begin
	if (nexcess = 0 and nmissing = 0) then
		return qid||':	correct';
	elsif (nexcess > 0 and nmissing > 0) then
		return qid||':	extraneous and missing tuples';
	elsif (nexcess > 0 and nmissing = 0) then
		return qid||':	extraneous tuples';
	elsif (nexcess = 0 and nmissing > 0) then
		return qid||':	missing tuples';
	elsif (nmissing < 0 ) then
		return qid||':  incorrect! Row count doesn''t match';
	end if;
end;
/


create or replace procedure check_q1
as
	num number(2);
	corr number(2) := 1;
begin
	num := favS('Bryan');
	if num <> 1 then 
		corr := 0;
	end if;

	num := favS('Coelho');
	if num <> 5 then 
		corr := 0;
	end if;

	num := favS('ABC');
	if num <> -2 then 
		corr := 0;
	end if;

	num := favS('Jimmy');
	if num <> 0 then 
		corr := 0;
	end if;

	num := favS('Robert');
	if num <> -1 then 
		corr := 0;
	end if;

	if corr = 1 then
		DBMS_OUTPUT.PUT_LINE('Q1:	correct');
	else
		DBMS_OUTPUT.PUT_LINE('Q1:	incorrect');
	end if;


end;
/


create or replace procedure check_q2
as 
	nexcess integer;
	nmissing integer;
	count1 integer;
	count2 integer;
	marked number;
begin
	manofthematch();

	
	if (not ass3_table_exists('Q2')) then
		marked:=1;
		DBMS_OUTPUT.PUT_LINE('Q2:	NoTable');
	elsif (not ass3_table_exists('Q2_EXPECTED')) then
		DBMS_OUTPUT.PUT_LINE('Q2:	 NoExpected');
		marked:=1;
	else
		
		select count(*) into count1 from Q2;
		select count(*) into count2 from Q2_Expected;
		select count(*) into nmissing from ((select * from Q2_EXPECTED)MINUS(select * from Q2));
		select count(*) into nexcess from ((select * from Q2)MINUS(select * from Q2_EXPECTED));

		if(count1<>count2) then
				nmissing := 1;
		end if;
		
		DBMS_OUTPUT.PUT_LINE('Q'|| ass3_check_result(2,nexcess,nmissing));
		marked:=1;
	end if;
	if(marked=0) then
		DBMS_OUTPUT.PUT_LINE('???');
	end if;
exception
	when others then
		DBMS_OUTPUT.PUT_LINE('Q2:	Something went wrong!!!');
end;
/


create or replace procedure check_q3
as 
	nexcess integer;
	nmissing integer;
	count1 integer;
	count2 integer;
	marked number;
begin
	league_results();

	
	if (not ass3_table_exists('Q3')) then
		marked:=1;
		DBMS_OUTPUT.PUT_LINE('Q3:	NoTable');
	elsif (not ass3_table_exists('Q3_EXPECTED')) then
		DBMS_OUTPUT.PUT_LINE('Q3:	 NoExpected');
		marked:=1;
	else
		
		select count(*) into count1 from Q3;
		select count(*) into count2 from Q3_Expected;
		select count(*) into nmissing from ((select * from Q3_EXPECTED)MINUS(select * from Q3));
		select count(*) into nexcess from ((select * from Q3)MINUS(select * from Q3_EXPECTED));

		if(count1<>count2) then
				nmissing := 1;
		end if;
		
		DBMS_OUTPUT.PUT_LINE('Q'|| ass3_check_result(3,nexcess,nmissing));
		marked:=1;
	end if;
	if(marked=0) then
		DBMS_OUTPUT.PUT_LINE('???');
	end if;
exception
	when others then
		DBMS_OUTPUT.PUT_LINE('Q3:	Something went wrong!!!');
end;
/

create or replace procedure check_q4
as 
	nexcess integer;
	nmissing integer;
	count1 integer;
	count2 integer;
	marked number;
begin
		
	if (not ass3_table_exists('FANS')) then
		marked:=1;
		DBMS_OUTPUT.PUT_LINE('Q4:	NoTable');
	elsif (not ass3_table_exists('Q4_EXPECTED')) then
		DBMS_OUTPUT.PUT_LINE('Q4:	 NoExpected');
		marked:=1;
	else
		
		select count(*) into count1 from fans;
		select count(*) into count2 from Q4_Expected;
		select count(*) into nmissing from ((select * from Q4_EXPECTED)MINUS(select * from fans));
		select count(*) into nexcess from ((select * from fans)MINUS(select * from Q4_EXPECTED));

		if(count1<>count2) then
				nmissing := 1;
		end if;
		
		DBMS_OUTPUT.PUT_LINE('Q'|| ass3_check_result(4,nexcess,nmissing));
		marked:=1;
	end if;
	if(marked=0) then
		DBMS_OUTPUT.PUT_LINE('???');
	end if;
exception
	when others then
		DBMS_OUTPUT.PUT_LINE('Q4:	Something went wrong!!!');
end;
/




create or replace procedure check_all
as
begin
		check_q1;
		check_q2;
		check_q3;
		check_q4;
end;
/




exec check_all();






