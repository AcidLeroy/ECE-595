function [ risk ] = StructuralRisk( C, N, nu )
%STRUCTURUALRISK Summary of this function goes here
%   Detailed explanation goes here

risk = sqrt((C*(log((2*N)/C) + 1) - log(nu/4))/N); 
end

