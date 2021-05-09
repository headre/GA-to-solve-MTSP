function [newCity,newSales] = tourna_sel(City,Sales,fit,k,SELECTRATE)
%tourna_sel(City,Sales,fit,k,SELECTRATE)
%City is the population of City chromosome
%Sales is the population of salesman chromosome
%fit is the matrix containing the fitnesses of the generation
%SELECTRATE ranges in (0,1)
%k means the number of individual candidate
[px,~]=size(City);
for i=1:px
    if rand>SELECTRATE
        tempfit=zeros(1,k);
        rs=unidrnd(px,1,k);
        for j=1:k
            tempfit(1,j)=fit(1,rs(j));
        end
        [~,m]=sort(tempfit);
        newCity(i,:)=City(rs(m(1)),:);
        newSales(i,:)=Sales(rs(m(1)),:);
    else
        newCity(i,:)=City(i,:);
        newSales(i,:)=Sales(i,:);
    end
end
end