function kidsSales = cross_sales(Sales,CROSSRATE)
%cross_sales(Sales,CROSSRATE)
%Sales is the population of salesman chromosome
%CROSSRATE ranges in (0,1)
    [NumPop,~]=size(Sales);
    parentSales=Sales;
    kidsSales=[];
    n=1;
    while n<=NumPop
       pass=1;
       father=parentSales(unidrnd(NumPop),:);
       mother=parentSales(unidrnd(NumPop),:);
       breakPoints=father(1,:);
       crossLocation=unidrnd(numel(breakPoints));
       for i=1:numel(breakPoints)
           if mother(1,crossLocation)==breakPoints(1,i)
               pass=0;
           end
       end
       if CROSSRATE>rand&&pass==1
           father(1,crossLocation)=mother(1,crossLocation);
           father(1,:)=sort(father(1,:));
       end  
       kidsSales(n,:)=father;  
       n=n+1;
    end
    
end