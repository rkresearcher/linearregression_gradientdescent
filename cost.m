function [cost] = cost(x,y,parameters)
% calculating the cost function
cost  = (x*parameters-y)'*(x*parameters-y)/(2*length(y));
end