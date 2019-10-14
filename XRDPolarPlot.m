% Author: Michelle King
% MATLAB version: 2019b

% This script converts a txt file of XRD data 
% to a 3D Polar Plot

%% Close All Figures/Clear All Variables
close all;
clear all;
clc;

%% Read Data from XRD data data.txt
data = readmatrix('data.txt');

%% Empty Arrays
phi(1:size(data,1)-1) = 0;
chi(1:size(data,2)-1) = 0;
intensity(1:size(data,1)-1,1:size(data,2)-1) = 0;

%% Populate Arrays
phi = data(2:size(data,1), 1);
chi = data(1, 2:size(data,2));
intensity = data(2:size(data,1), 2:size(data,2));

%% Plot Raw Data (Contour Plot)
% Contour Plot
figure(1)
contourf(chi, phi, intensity, 'LineColor','none');
xlabel('\chi')
ylabel('\phi (°)')
zlabel('Intensity (unit)')

%% Plot Data (3D Surface Plot and Contour Plot)
% Convert Data
x = chi.*cos(phi);
y = chi.*sin(phi);
z = intensity;

% 3D Surface Plot
figure(2)
polarplot = surf(x, y, z)
polarplot.EdgeColor = 'none';
xlabel('\chi cos(\phi) (unit)')
ylabel('\chi sin(\phi) (unit)')
zlabel('Intensity (unit)')

% Contour Plot
figure(3)
contourf(x, y, z, 'LineColor','none');
xlabel('\chi cos(\phi) (unit)')
ylabel('\chi sin(\phi) (unit)')
zlabel('Intensity (unit)')
