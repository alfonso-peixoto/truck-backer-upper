function y=TRI(x,v);

y = max(0,min((x-v(1))/(v(2)-v(1)),(v(3)-x)/(v(3)-v(2))));