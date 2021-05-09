function result=SA_sel(dE,round,iterations)
%SA_sel(dE,round,iterations)
%dE is the fitness difference
%round is the current iteration
%iterations is the total iteration number
    P=exp(dE/iterations-round);
    if P > rand
        result=1;
    else
        result=0;
    end
end