function [City,Sales]=init(map,NumSales,NumPop)
%init(map,NumSales,NumPop)
%NumSales is the number of salesperson
%NumPop is the number of the individuals in a population
%map is the matrix containing the coordinates of the map
City=[];
Sales=[];
NumCity = numel(map)/2;
if NumCity>NumSales
    for i=1:NumPop
        SortC = randperm(NumCity);
        if NumSales>=2
            SortS = sort(randperm(NumCity,NumSales-1));
        else
            SortS=[1];
        end
        while SortS(1,1)==1&&numel(SortS)~=1
            SortS = sort(randperm(NumCity,NumSales-1));
        end
        City=[City;SortC];
        Sales=[Sales;SortS];
    end
else
    disp(['Number of City should be larger than the number of salesman']);
end
end