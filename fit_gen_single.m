function fitness=fit_gen_single(map,City,Sales,start)
%fit_gen_single(map,City,Sales,start)
%map is the matrix containing the coordinates of the map
%City is the population of City chromosome
%Sales is the population of salesman chromosome
%start is the matrix containing the coordinates of the starting city
        DistanceSum=0;
        NumCity=numel(City);
        CityCount=1;
        for j=1:numel(Sales)
           NextSales= Sales(1,j);
           startcity=start;
           while CityCount<=NextSales
               endcity = map(City(CityCount),:);
               if CityCount==NextSales
                   endcity=start;
               end
               DistanceSum=DistanceSum+dis_cal(startcity,endcity);
               startcity=endcity;
               CityCount=CityCount+1;
           end
           CityCount=NextSales;
        end
        while CityCount<=NumCity
            endcity = map(City(CityCount),:);
               DistanceSum=DistanceSum+dis_cal(startcity,endcity);
               startcity=endcity;
               CityCount=CityCount+1;
        end
        endcity=start;
        DistanceSum=DistanceSum+dis_cal(startcity,endcity);
        fitness=DistanceSum;
end