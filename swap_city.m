function kidsCity = swap_city(parentsCity,SWAPRATE)
%swap_city(parentCity,SWAPRATE)
%parenetCity is the father population
%SWAPRATE ranges in (0,1)
    n=1;
    kidsCity=[];
    [NumPop,length]=size(parentsCity);
    while n<=NumPop
        father=parentsCity(unidrnd(NumPop),:);
        NumCity=numel(father);
        swapLocation=sort(randperm(NumCity,2));
        kidsCity(n,:)=father;
        if rand<SWAPRATE
           temp=father(1,swapLocation(1,1));
           father(1,swapLocation(1,1))=father(1,swapLocation(1,2));
           father(1,swapLocation(1,2))=temp;
           kidsCity(n,:)=father;
        end
        n=n+1;
    end
end