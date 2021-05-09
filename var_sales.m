function newSales=var_sales(Sales,VARIATIONRATE,map,number)
%var_sales(Sales,VARIATIONRATE,map,number)
%Sales is the population of salesman chromosome
%VARIATIONRATE ranges in (0,1)
%map is the matrix containing the coordinates of the map
%number is the number of random mutation position
    n=1;
    newSales=[];
    [NumPop,~]=size(Sales);
    numCity=numel(map)/2;
    varValue=unidrnd(numCity);
    while n<=NumPop
        i=1;
        father=Sales(unidrnd(NumPop),:);
        NumSales=numel(father);
        varLocation=sort(randperm(NumSales,number));
        while i <=numel(varLocation)
            if rand<VARIATIONRATE
                while ~isempty(find(varValue==father,1))||varValue==1
                    varValue=unidrnd(numCity);
                end
                father(1,varLocation(1,i))=varValue;
            end
            i=i+1;
        end
        newSales(n,:)=sort(father(1,:));
        n=n+1;
    end
end