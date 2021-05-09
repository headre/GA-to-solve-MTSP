function [newCity,newSales]=choose_selector(id,cityPop,salesPop,f,k,rate,currentITE,ITERATION,map,startcity)
%choose_selector(id,cityPop,salesPop,f,k,rate,currentITE,ITERATION,map,startcity)
%id is the choice of the selector, id=1 or 2
%cityPop is the population of City chromosome
%salesPop is the population of salesman chromosome
%f is the matrix containing the fitnesses of the generation
%k means the number of individual candidate
%rate means SELECTRATE for tounament algorithm, ranges in (0,1)
%currentITE is the current iteration
%ITERATION is the total iteration number
%map is the matrix containing the coordinates of the map
%startcity is the matrix containing the coordinates of the starting city
    if id==1
        [newCity,newSales]=tourna_sel(cityPop,salesPop,f,k,rate);
    end
    if id==2
        [newCity,newSales]=custom_sel(cityPop,salesPop,f,k,currentITE,ITERATION,map,startcity);
    end
end