function newCity=rotate_city(City,ROTATERATE)
%rotate_city(City,ROTATERATE)
%City is the population of City chromosome
%ROTATERATE ranges in (0,1)
    newCity=[];
    [NumPop,length]=size(City);
    NumCity=City(1,length-1);
    n=1;
    for i =1 :NumPop
       sampleCity=City(i,:);
       if(rand<ROTATERATE)
            new=[sampleCity(n+1:NumCity) sampleCity(1:n)];
            sampleCity(1:NumCity)=new;
       end
       newCity(i,:)=sampleCity;
    end
end