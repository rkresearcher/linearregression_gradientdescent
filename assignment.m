clc; clear all; close all;
load hospital
%data = hospital(:,{'Age', 'Weight', 'Smoker', 'BloodPressure'});
age = double(hospital(:,{'Age'})); % work as the input
cp = [ones(length(age),1)]; % for constant parameters
weight = double(hospital(:,{'Weight'})); % features vectors
smoker = double(hospital(:,{'Smoker'})); % features vectors
bp = double(hospital(:,{'BloodPressure'})); % work as the output
y = bp(:,2);
% normalization
%input features vectors

age = (age-max(age))/(max(age)-min(age));
weight = (weight-max(weight))/(max(weight)-min(weight));
x = [cp, age, weight, smoker];

plot(age, bp(:,1), 'rx', 'MarkerSize', 10);
hold on 
plot(age, bp(:,2), 'bo', 'MarkerSize', 10);
xlabel('age');
ylabel('bloodpressure');
title('BloodPressure of patient');
[p,c] = gradient(x,y,0.01,15000000);
