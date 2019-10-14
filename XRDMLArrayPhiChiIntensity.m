% Author: Michelle King
% MATLAB version: 2019b

% This script converts an .XRDML file from XRD data 
% given as a table of intensities to
% a .CSV file as an array of Chi, Phi, and Intensity

% Close All Figures/Clear All Variables
close all;
clear all;
clc;

% Read Data
data = readmatrix('data.txt');

% Empty Arrays
phi(1:size(data,1)-1) = 0;
chi(1:size(data,2)-1) = 0;
intensity(1:size(data,1)-1,1:size(data,2)-1) = 0;

% Populate Arrays
phi = data(2:size(data,1), 1);
chi = data(1, 2:size(data,2));
intensity = data(2:size(data,1), 2:size(data,2));

% Format Data
% Array of phi, chi, intensity
format_data(1:size(data,1)*size(data,2), 1:3) = 0;

kk = 0;
for ii = 1:size(phi)
    for jj = 1:size(chi)
        kk = kk+1;
        format_data(kk, 1)=phi(ii);
        format_data(kk, 2)=chi(jj);
        format_data(kk, 3)=intensity(ii,jj);
    end
end

csvwrite('XRDML_formatted.csv', format_data)
