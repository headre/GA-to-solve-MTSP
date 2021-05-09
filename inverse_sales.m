function newSales = inverse_sales(Sales,INVERSERATE)
%inverse_sales(Sales,INVERSERATE)
%Sales is the population of salesman chromosome
%INVERSERATE ranges in (0,1)
    newSales=[];
    [NumPop,length]=size(Sales);
    for i =1 :NumPop
       sampleSales=Sales(i,:);
       if(rand<INVERSERATE)
            newSale=fliplr(sampleSales);
            sampleSales=newSale;
       end
       newSales(i,:)=sampleSales;
    end
end