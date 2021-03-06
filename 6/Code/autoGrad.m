function [f,g] = autoGrad(x,funObj,varargin)
% Numerically compute gradient of objective function from function values

p = length(x);

% Use Central-Differencing Formula
mu = 2*sqrt(1e-12)*(1+norm(x));
diff1 = zeros(p,1);
diff2 = zeros(p,1);
for j = 1:p
    e_j = zeros(p,1);
    e_j(j) = 1;
    diff1(j,1) = funObj(x + mu*e_j,varargin{:});
    diff2(j,1) = funObj(x - mu*e_j,varargin{:});
end
f = mean([diff1;diff2]);
g = (diff1 - diff2)/(2*mu);