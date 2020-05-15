clc; 
clear ; 
close all;
load hospital
%data = hospital(:,{'Age', 'Weight', 'Smoker', 'BloodPressure'});
age = double(hospital(:,{'Age'})); % work as the input
cp = ones(length(age),1); % for constant parameters
weight = double(hospital(:,{'Weight'})); % features vectors
smoker = double(hospital(:,{'Smoker'})); % features vectors
bp = double(hospital(:,{'BloodPressure'})); % work as the output
y1 = bp(:,1);
y2 = bp(:,2);
% normalization
%input features vectors
x1 = [cp,age,weight,smoker];
age1 = (age-max(age))/(max(age)-min(age));
weight1 = (weight-max(weight))/(max(weight)-min(weight));
x = [cp, age1, weight1, smoker];
%y1 = (y1-max(y1))/(max(y1)-min(y1));
%y2 = (y2-max(y2))/(max(y2)-min(y2));
figure(1);
%%
subplot(2,2,1)
plot(age, bp(:,1), 'rx', 'MarkerSize', 10);
hold on
plot(age, bp(:,2), 'bo', 'MarkerSize', 10);
xlabel('age');
ylabel('bloodpressure low and high');
title('BloodPressure of patient v/s age');
subplot(2,2,2);
plot(weight, bp(:,1), 'rx', 'MarkerSize', 10);
hold on
plot(weight, bp(:,2), 'bo', 'MarkerSize', 10);
xlabel('weight');
ylabel('bloodpressure low and high');
title('BloodPressure of patient v/s weight');
%%
[p1,c1] = gradient(x,y1,0.01,1500);
[p2,c2] = gradient(x,y2,0.01,1500);
subplot(2,2,3)
plot(c1)
xlabel('number of repetition');
ylabel('costHistory');
title('Cost function for low blood pressure');
subplot(2,2,4);
plot(c2);
xlabel('number of repetition');
ylabel('costHistory');
title('Cost function for High blood pressure');
%%
age_in = input('enter age: ');
weight_in = input('enter your weight: ');
smoker_in = input('are you smoker? 0 for no and 1 for yes: ');
age_in = norma(age_in,age);
weight_in = norma(weight_in,weight);
disp('High Pressure')
h = p1(1) + p1(2)*age_in + p1(3)*weight_in + p1(3)*smoker_in;
figure(10)
plot(h)
disp(h)
disp('Low Pressure')
h = p2(1) + p2(2)*age_in + p2(3)*weight_in + p2(3)*smoker_in;
disp(h)


