create or replace function favS(pname varchar2) return number
as
	-- Write your declarations here
        ptimes integer := 0 ;  -- Record how many times the palyer played in his favstadium.
        pteam varchar(20) ;
        number_name1 integer := 0 ;
        number_name2 integer := 0 ;
begin
        --Write your statements here
        -- If the player doesn't exist in the players table, the function returns -2. 
        select count(*) into number_name1 from players p 
               where p.name = pname;
        if number_name1 = 0 then 
                            return -2;
        end if;
        --If the player exists but he doesn't have any favorite stadium, favS returns -1.
        select count(*) into number_name2 from favStadiums fs 
               where fs.player = pname;
        if number_name2 = 0 then 
                            return -1;
        end if; 
        -- Record what team the player belongs to.           
        select team into pteam from players 
               where pname = name;  
        -- We want to find the stadium that the player matched,either home or away.      
        for t in (select stadium from matches where pteam = home or pteam = away) loop
            for v in (select player from favStadiums where stadium = t.stadium) loop  -- We want to find out all palyers who like this stadium.
                if (v.player = pname) then -- If this player is the player we typed in,then let ptimes plus 1.
                    ptimes := ptimes + 1;                
                else
                    ptimes := ptimes;   -- Else ptimes doesn't change.
                end if;
            end loop;
        end loop;
	return ptimes;  -- CHANGE THIS LINE TO RETURN APPROPRIATE VALUE
end;
/



select favS('ABC') from dual;
select favS('Robert') from dual;
select favS('Coelho') from dual;
select favS('Bryan') from dual;
select favS('Jimmy') from dual;
