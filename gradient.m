function [para, cv] = gradient(x,y,alpha,iteration)
% outputs
%    para "is the value that multiply with features vectors", i.e., weight 
% cv return cost history
% inputs:
   % x = input's features vectors
   % y = output of features vectors
   % alpha  = learning rate default value = 0.1
   % iteration = number of times loop will run default value is 500;
% getting the value of the features examples(nfe) and number of 
% features(nof)
[nfe,nof] = size(x);
para  = zeros(nof,1);
for i = 1:iteration
    h = (x*para -y);
   for j = 1:nof
        para(j) = para(j)-alpha * (1/nfe) * h' * x(:,j);
    end
    cv(i) = cost(x,y,para);
end
end
