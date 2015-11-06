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

exec league_results()
select * from q3;
