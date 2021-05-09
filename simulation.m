function mini=simulation(citysize,selector,salessize)
%simulation(citysize,selector,salessize)
%citysize is the city number
%selector
%1=tourna_sel
%2=custom_sel
%salessize is the number of salesman
%This script is only use for optimal value distribution and does not draw plot 
ITERATION=5000;
startcity=[5,5];
map=choose_map(citysize);
[cityPop,salesPop]=init(map,salessize,100);

[~,numCol]=size(salesPop);
optim=[];

for i=1:ITERATION-1     
    f=fit_gen_pop(map,cityPop,salesPop,startcity);
    optim(1,i)=min(f);
    [newCity,newSales]=choose_selector(selector,cityPop,salesPop,f,5,0.5,i,ITERATION,map,startcity);
    newCity=swap_city(newCity,0.5);
    newCity=rotate_city(newCity,0.1);
    newCity=inverse_city(newCity,0.1);
    if numCol~=1
    newSales=cross_sales(newSales,0.7);
    newSales=inverse_sales(newSales,0.1);
    newSales=var_sales(newSales,0.1,map,1);
    end
    cityPop=newCity;
    salesPop=newSales;
end
disp(['final:'])
q=fit_gen_pop(map,newCity,newSales,startcity);
minimumv=min(q);
mini=minimumv;
[row,~]=find(q==min(q));
newCity(row(1),:);
newSales(row(1),:);
end