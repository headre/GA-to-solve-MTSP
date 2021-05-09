clear;clc;close all;
%this script can run directly
ITERATION=7000;
CityNumber=10;
startcity=[5,5];

SELECTRATE=0.5;
k=5;
CROSSRATE=0.7;
ROTATERATE=0.1;
INVERSERATE_CITY=0.1;
INVERSERATE_SALES=0.1;
SWAPRATE=0.5;
RANDOMMUATIONRATE=0.1;
RANDOMMUATIONNUM=1;

map=choose_map(CityNumber);
%for reality data set, longitude and latitude need to be converted to rectangular coordinates
if numel(map)/2==34
    for i=1:numel(map)/2
        map(i,1)=map(i,1)*100;
        map(i,2)=map(i,2)*111.32;
    end
end

[cityPop,salesPop]=init(map,1,100);
[popNum,numCol]=size(salesPop);
numsales=1;
f=fit_gen_pop(map,cityPop,salesPop,startcity);
optim=[];%this record the optimal value it generated, can be used to draw convergence curve
selector=2;%1=tournament algorithm 2=optimized algorithm
for i=1:ITERATION-1     
    f=fit_gen_pop(map,cityPop,salesPop,startcity);
    optim(1,i)=min(f);
    [newCity,newSales]=choose_selector(selector,cityPop,salesPop,f,k,SELECTRATE,i,ITERATION,map,startcity);
    newCity=swap_city(newCity,SWAPRATE);
    newCity=rotate_city(newCity,ROTATERATE);
    newCity=inverse_city(newCity,INVERSERATE_CITY);
    if numsales~=1
    newSales=cross_sales(newSales,CROSSRATE);
    newSales=inverse_sales(newSales,INVERSERATE_SALES);
    newSales=var_sales(newSales,RANDOMMUATIONRATE,map,RANDOMMUATIONNUM);
    end
    cityPop=newCity;
    salesPop=newSales;
end
disp(['final:'])
q=fit_gen_pop(map,newCity,newSales,startcity);
diff=max(q)-min(q);
minimumv=min(q)
matrix=find(minimumv==q);
[row,col]=find(q==min(q));
figure
plot_map(map);
if numel(newSales(row(1),:))==1
   startcity=map(newSales(row(1),1),:); 
end
plot_sol(mapreality,newCity(row(1),:),newSales(row(1),:),startcity);