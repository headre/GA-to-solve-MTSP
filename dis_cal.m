function distance = dis_cal(City1,City2)
%dis_cal(City1,City2)
%City1 and City2 are two coordinates of cities
    X1=City1(1,1);
    Y1=City1(1,2);
    X2=City2(1,1);
    Y2=City2(1,2);
    distance = sqrt((Y2-Y1)^2+(X2-X1)^2);
end