clear; clc; close all;
%Course level (i.e., 1000, 2000, 3000, 4000) vs average GPA

xlRange = 'B6:B66'; %Set the excel data range to grab
Course = grabData(xlRange); %Gets course level.
Course = Course./1000; %Divides course number by 1000.
xlRange = 'H6:H66'; %Set the excel data range to grab
GPA = grabData(xlRange); %Gets GPA.

%Gets the linear regression
LinearReg = polyfit(Course,GPA,1);
m = LinearReg(1);
k = LinearReg(2);
LinearEq = k + m*Course;
disp("The slope of Linear regression is: ");
disp(m);
disp("The y-int of Linear regression is: ");
disp(k);

%plots the data
figure;
scatter(Course,GPA,'*');
hold on;
plot(Course,LinearEq);
hold off;

%Axis labels and title
title('Computer Science Course Level vs Average GPA');
xlabel('Computer Science Course Level (in Thousands)');
ylabel('Grade Point Average (in 4.0 scale)');
grid on;

%Finds the correlational value of the graph
Value = corr(Course,GPA);
disp("The correlational value (R-squared) is: ");
disp(Value);

%Grabs the data from the .xlsx file given a range.
function [Data] = grabData(xlRange)
    Filename = 'CS.xlsx';
    %Create a data array
    Data = xlsread(Filename,xlRange);
end