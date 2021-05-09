function display=plot_sol(map,City,Sales,start)
%plot_sol(map,City,Sales,start)
%map is the matrix containing the coordinates of the map
%City is the population of City chromosome
%Sales is the population of salesman chromosome
%startcity is the matrix containing the coordinates of the starting city
    NumCity=numel(City);
    BreakPoints=Sales;
    startcity=start;
    Pos=1;
    hold on
    for i=1:numel(BreakPoints) 
       if numel(BreakPoints)==1
           break
       end 
       startcity=start;
       lines=[];
       count=1;
       lines(count,:)=startcity;
       while Pos<=BreakPoints(1,i)
           endcity=map(City(1,Pos),:);
           if(Pos==BreakPoints(1,i))
               endcity=start;
               startcity=endcity;
               lines(count+1,:)=startcity;
               break
           end
           startcity=endcity;
           Pos=Pos+1;
           count=count+1;
           lines(count,:)=startcity;
       end
       plot(lines(:,1).',lines(:,2).');
    end
    if Pos<=NumCity
       lines=[];
       count=1;
       lines(count,:)=startcity;
       for i=Pos:NumCity
           endcity=map(City(1,Pos),:);
           startcity=endcity;
           Pos=Pos+1;
           count=count+1;
           lines(count,:)=startcity;
       end
       lines(count+1,:)=start;
    end
    plot(lines(:,1).',lines(:,2).');
    display=path;
    hold off
end