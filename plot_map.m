function p=plot_map(map)
%plot_map(map)
%map is the matrix containing the coordinates of the map=
    p=map;
    hold on
    for i=1:(numel(map))/2
        plot(map(i,1),map(i,2),'b--o');
    end
    hold off
end