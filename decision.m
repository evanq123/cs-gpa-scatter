clear; clc; close all;
%Course level (i.e., 1000, 2000, 3000, 4000) vs average GPA

%User inputs the course level range
MinLevel = input('Enter the lowest level course that you want to take: ');
MaxLevel = input('Enter the highest level course that you want to take: ');

%User inputs minimum predicted GPA desired
MinGPA = input('Enter the minimum GPA you are looking to consider: ');

xlRange = 'B6:B66'; %Set the excel data range to grab
Course = grabData(xlRange); %Gets course level.s
xlRange = 'H6:H66'; %Set the excel data range to grab
GPA = grabData(xlRange); %Gets GPA.

Total = numel(Course); %Sets the total to the total number of courses.

%Initialize loop
Index = 1; %Sets the index to 1
GoodCourses = []; %Sets an empty array to be filled

%Iterates through course list
while Index <= Total 
    if Course(Index) >= MinLevel && Course(Index) <= MaxLevel
        if GPA(Index) >= MinGPA
            %If conditions are met, adds course to recommendations
            GoodCourses(end + 1) = Course(Index);%Adds to end of array
        end
    end
    Index = Index + 1;
end

GoodCourses = unique(GoodCourses); %Removes duplicate course numbers
NumOfCoursesFound = numel(GoodCourses); %Gets the number of courses found

if NumOfCoursesFound == 0
    %If none were found, do not return any suggestions
    disp('Sorry, no courses were found with your conditions.')
else
    %Outputs the list of courses to consider
    disp('These are the courses that matches your filters: ')
    disp(GoodCourses);
end

%Grabs the data from the .xlsx file given a range.
function [Data] = grabData(xlRange)
    Filename = 'CS.xlsx';
    %Create a data array
    Data = xlsread(Filename,xlRange);
end