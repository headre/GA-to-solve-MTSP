function kidsSales = swap_sales(parentsSales,SWAPRATE)
%好像没啥用
    n=1;
    kidsSales=[];
    [NumPop,length]=size(parentsSales);
    while n<=NumPop
        father=parentsSales(unidrnd(NumPop),:);
        NumSales=numel(father);
        swapLocation=sort(randperm(NumSales,2));
        kidsSales(n,:)=father;
        if rand<SWAPRATE
           temp=father(1,swapLocation(1,1));
           father(1,swapLocation(1,1))=father(1,swapLocation(1,2));
           father(1,swapLocation(1,2))=temp;
           kidsSales(n,:)=sort(father(1,:));
        end
        n=n+1;
    end
end