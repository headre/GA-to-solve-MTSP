function fitness = fit_gen_pop(map,City,Sales,startcity)
%fit_gen_pop(map,City,Sales,startcity)
%map is the matrix containing the coordinates of the map
%City is the population of City chromosome
%Sales is the population of salesman chromosome
%start is the matrix containing the coordinates of the starting city
    fitness=[];
    [popNum,col]=size(Sales);
    for i=1:popNum
        if col==1
           startcity=map(Sales(i,1),:); 
        end
        fitness(1,i)=fit_gen_single(map,City(i,:),Sales(i,:),startcity);
    end
end