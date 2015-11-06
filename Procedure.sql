create or replace procedure  manofthematch
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

exec manofthematch()
select * from Q2;
