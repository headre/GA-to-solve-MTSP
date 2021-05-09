function [new_city,new_sales]=custom_sel(City,Sales,fit,k,round,iterations,map,startcity)
%custom_sel(City,Sales,fit,k,round,iterations,map,startcity)
%City is the population of City chromosome
%Sales is the population of salesman chromosome
%fit is the matrix containing the fitnesses of the generation
%k means the number of individual candidate
%round is the current iteration
%iterations is the total iteration number
%startcity is the matrix containing the coordinates of the starting city
%map is the matrix containing the coordinates of the map
[px,~]=size(City);
new_city=[];
new_sales=[];
pass=0;
for i=1:px
    tempfit=zeros(1,k);
    rs=unidrnd(px,1,k);
    for j=1:k
        tempfit(1,j)=fit(1,rs(j));
    end
    [~,m]=sort(tempfit);
     sampleCity=City(rs(m(1)),:);
     sampleSales=Sales(rs(m(1)),:);
     dE=fit_gen_single(map,City(i,:),Sales(i,:),startcity)-fit_gen_single(map,sampleCity(1,:),sampleSales(1,:),startcity);
     if dE>=0||SA_sel(dE,round,iterations)==1
         pass=1;
     end
     if fit(1,i)==min(fit)
         pass=1;
     end
     if pass==1
        new_city(i,:)=sampleCity;
        new_sales(i,:)=sampleSales;
     else
        new_city(i,:)=City(i,:);
        new_sales(i,:)=Sales(i,:);
    end
end