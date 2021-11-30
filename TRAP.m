function y=TRAP(x,v);

y = max(0,min(1,min((x-v(1))/(v(2)-v(1)),(v(4)-x)/(v(4)-v(3)))));