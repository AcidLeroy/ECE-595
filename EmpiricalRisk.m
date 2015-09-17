function [ risk ] = EmpiricalRisk( X, Y, model )
%GETERROR Summary of this function goes here
%   Detailed explanation goes here


l = size(Y,1); 
risk = 0; 
%Get W
y = diag(Y(model.sv_indices));
x = X(model.sv_indices, :);
alpha = model.sv_coef;
w = alpha'*y*x;
b = -model.rho; 
y_hat = sign(w*x' + b);

% Only certain observations contain non-zero values, hence we only index
% into the vectors calculated from training. 
for i = 1:size(model.sv_indices,1); 
   risk = risk + abs(Y(model.sv_indices(i)) - y_hat(i));
end

risk = 1/(2*l)*risk; 

end

