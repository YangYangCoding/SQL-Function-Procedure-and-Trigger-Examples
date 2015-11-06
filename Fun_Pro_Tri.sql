-- --  COMP9311 Database Systems
-- --  Assignment 3
-- --  Written By: Yang Yang  
-- --  ID:    3431427
-- --  Date:  15 May 2013


set serveroutput on

-- Q1 create a function that returns the number of times a player has played in
-- his favorite stadiums. Return -2 if the player doesn't exist in our database.
-- Return -1 if the player doesn't have any favorite stadium

create or replace function favS(pname varchar2) return number
as
	-- Write your declarations here
        ptimes integer := 0 ;  -- Record how many times the palyer played in his favstadium.
        pteam varchar(20) ;
        number_name1 integer := 0 ;
        number_name2 integer := 0 ;
begin
	-- Write your statements here
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
	
	
-- Q2 create a procedure that inserts in Q2 table match ID and name of the stadium
-- for each player where he was declared man of the match but his team had lost.
create or replace procedure manofthematch
is
	-- Write your declarations here
        cursor plsearch is
               select name, team from players;
        loser_team varchar2(20) ;
        crruent_team varchar2(20) ; 
        player_is_mofm integer := 0 ;  -- Use it as a boolean bit.
begin
	delete from Q2;  -- DON'T REMOVE THIS LINE (it makes the table empty at start of the procedure)
	-- Write your statements here
        for pl in plsearch loop    --We have to search the guy one by one,and we define that each time the guy we search is pl.name.
            player_is_mofm := 0;
            for man in (select * from matches) loop  --We define a guy to start search,then search all matches one by one to see if pl.name is the manofmatch or not.
                if (man.score_home < man.score_away) then
                    loser_team := man.home;
                end if;
                if (man.score_home > man.score_away) then
                    loser_team := man.away;
                end if;                                     -- Record which team lost the match.
                select team into crruent_team from players
                    where pl.name = name;                  -- Let't find out which team pl.name belongs to.
                if ((man.manOfMatch = pl.name) and (loser_team = crruent_team)) then
                   insert into Q2 values (pl.name,man.stadium,man.ID);
                   player_is_mofm := 1; --If pl.name is the manofmatch and he lost the match,then set player_is_mofm to be 1. 
                end if;
            end loop;
            if (player_is_mofm = 0) then  -- All other situations should be insert as (name,'-',0) except he lost match and is manodmatch.
                insert into Q2 values (pl.name,'-',0); 
            end if;   
        end loop;
end;
/


-- Q3 create a procedure that inserts the league results into a table Q3

create or replace procedure league_results
as
	-- Write you declarations here
        trank integer := 0;
        total_rank integer := 0;
        tname varchar2(20);
        tplayed integer := 0;
        twon integer := 0;
        tdrawn integer := 0;
        tlost integer := 0;
        tgf integer := 0;
        tga integer := 0;
        tgd integer := 0;
        tpoints integer := 0;
begin
	delete from Q3;  -- DON'T REMOVE THIS LINE (it makes the table empty at start of the procedure)
	-- Write your statements here
        for t in (select name from teams) loop  -- Reset all these variable values to be 0 before we use them.I want to compare all the teams in table teams.
            tplayed := 0;       
            twon := 0;
            tdrawn := 0;
            tlost := 0;
            tgf := 0;
            tga := 0;
            tgd := 0;
            tpoints := 0;
            tname := t.name;
            total_rank := total_rank + 1; --We want to know how many teams we have,so we know the lowest rank.
            for m in (select * from matches) loop  --We should check row by row in table matches to see whether the t.team has match in this row. 
                if ((m.home = t.name) or (m.away = t.name)) then
                    tplayed := tplayed + 1;  -- If t.team has match,tplayd plus 1.
                    if ((m.score_home > m.score_away) and (m.home = t.name)) then  -- If t.team won the match,twon plus 1.
                        twon := twon +1;
                        tpoints := tpoints + 3;
                    end if;
                    if ((m.score_home < m.score_away) and (m.away = t.name)) then
                        twon := twon +1;     
                        tpoints := tpoints + 3;
                    end if; 
                    if (m.score_home = m.score_away) then  -- If t.team drawn the match,tdrawn plus 1.
                        tdrawn := tdrawn +1;
                        tpoints := tpoints + 1;
                    end if;
                    if ((m.score_home > m.score_away) and (m.away = t.name)) then  -- If t.team lost the match,tlost plus 1.
                        tlost := tlost +1;
                    end if;
                    if ((m.score_home < m.score_away) and (m.home = t.name)) then
                        tlost := tlost +1;
                    end if;
                    if (m.home = t.name) then
                        tgf := tgf + m.score_home;  -- Count the value of gf and ga.
                        tga := tga + m.score_away;
                    end if;
                    if (m.away = t.name) then
                        tgf := tgf + m.score_away;
                        tga := tga + m.score_home;
                    end if; 
                end if;
           end loop;
           tgd := tgf - tga;  ---- Count the value of gd.
           insert into Q3 values(trank,tname,tplayed,twon,tdrawn,tlost,tgf,tga,tgd,tpoints);
        end loop;
        for r1 in (select * from Q3) loop  --We want to know the right rank and we compare table Q3 with itself so that all the teams can compare with other teams.
            trank := total_rank; --we assume that the first rank is the lowest rank.
            for r2 in (select * from Q3) loop
                if (r1.name <> r2.name) then
                    trank := trank;
                    if (r1.points > r2.points) then --If we find a r1.team has higher points than r2.team,then r1.rank up 1(so - 1).
                        trank := trank - 1;
                    end if;
                    if ((r1.points = r2.points) and (r1.played < r2.played)) then --If other conditions are same and we find a r1.team has lower played times than r2.team,then r1.rank up 1(so - 1).
                        trank := trank - 1;
                    end if;
                    if ((r1.points = r2.points) and (r1.played = r2.played) and (r1.gd > r2.gd)) then --If other conditions are same and we find a r1.team has higher gd than r2.team,then r1.rank up 1(so - 1).
                        trank := trank - 1;
                    end if;
                    if ((r1.points = r2.points) and (r1.played = r2.played) and (r1.gd = r2.gd) and (r1.name < r2.name)) then  --If other conditions are same and we find a r1.team has first alphabetically than r2.team,then r1.rank up 1(so - 1).
                    trank := trank - 1;
                    end if;
                end if;
            end loop;
            update Q3
            set rank = trank
            where name = r1.name; 
        end loop;
end;
/



-- Q4 create your triggers on AUTOGRAPHS table after this line
create or replace trigger changeautographs
after insert or delete or update on autographs
for each row  --after each update in table autogrphs,we want to change relative attribute autographs in table fans. 
begin    
        for f in (select * from fans) loop  --Let's check fans table row by row.               
               if ((f.name = :New.fan) and (f.autographs is null)) then  -- If new.fan is the fan we are checking now and it has never been changed,then we set autographs = 1 in table fans.                
                   update fans
                   set autographs = 1
                   where f.name = fans.name;               
               end if; 
               if ((f.name = :New.fan) and (f.autographs is not null)) then  -- If new.fan is the fan we are checking now and it has  been changed,then we set autographs = autographs + 1 in table fans.                
                   update fans
                   set autographs = autographs + 1
                   where f.name = fans.name;               
               end if;
               if (f.name = :Old.fan) then  -- If old.fan is the fan we are checking now and it has  been deleted or updated to other names,then we set autographs = autographs - 1 in table fans.                
                   update fans
                   set autographs = autographs - 1
                   where f.name = fans.name;               
               end if;                                           
        end loop; 
end;
/

