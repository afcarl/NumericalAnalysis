function [module_u, module_v, scalar, angle] = VECTORS (u, v)
%% Problem 3
% a) compute the module of a vector
% just an example
module_u = sqrt(sum(u .^ 2));
module_v = sqrt(sum(v .^ 2));

% b) compute the scalar product of two vectors
scalar = sum(u .* v)

% c) compute the angle between two vectors
cos_angle = scalar / (module_u * module_v);
angle = acosd(cos_angle);

end