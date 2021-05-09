function newCity = inverse_city(City,INVERSERATE)
%inverse_city(City,INVERSERATE)
%City is the population of City chromosome
%INVERSERATE ranges in (0,1)
    newCity=[];
    [NumPop,~]=size(City);
    for i =1 :NumPop
       sampleCity=City(i,:);
       if(rand<INVERSERATE)
            new=fliplr(sampleCity);
            sampleCity=new;
       end
       newCity(i,:)=sampleCity;
    end
end