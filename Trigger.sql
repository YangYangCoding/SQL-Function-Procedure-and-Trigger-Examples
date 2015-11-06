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


