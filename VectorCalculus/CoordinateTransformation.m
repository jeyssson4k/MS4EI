%% Coordinate Transformation
%% @author Jeysson4K
%% Script to transform coordinate systems
%% rectangular, cylindrical, spherical

% u is vector coordinate
% (x,y,z), (rho, phi, z), (rho, phi, tetha)
u = [1 3 5];

% i is the origin coordinate system
% "r", "c", "s"
i = "r";

if i == "r"
    c = [norm([u(1), u(2)]) atan(u(2)/u(1)) u(3)];
    s = [norm(u) atan(u(2)/u(1)) acos(u(3)/norm(u))];
    fprintf("Transform r -> c\n(rho: %.6e, phi: %.6e, z: %.6e)\n", c(1), c(2), c(3))
    fprintf("Transform r -> s\n(rho: %.6e, phi: %.6e, tetha: %.6e)\n", s(1), s(2), s(3))
elseif i == "c"
    r = [u(1)*cos(u(2)) u(1)*sin(u(2)) u(3)];
    s = [norm([u(1) u(3)]) u(2) u(3)*cos(u(3))];
    fprintf("Transform c -> r\n(x: %.6e, y: %.6e, z: %.6e)\n", r(1), r(2), r(3))
    fprintf("Transform c -> s\n(rho: %.6e, phi: %.6e, tetha: %.6e)\n", s(1), s(2), s(3))
elseif i == "s"
    r = [u(1)*cos(u(2))*sin(u(3)) u(1)*sin(u(2))*sin(u(3)) u(1)*cos(u(3))];
    c = [u(1)*sin(u(3)) u(2) u(1)*cos(u(3))];
    fprintf("Transform s -> r\n(x: %.6e, y: %.6e, z: %.6e)\n", r(1), r(2), r(3))
    fprintf("Transform s -> c\n(rho: %.6e, phi: %.6e, z: %.6e)\n", c(1), c(2), c(3))
else
    fprintf("There is no coordinate system asociated with the input provided...")
end


fprintf("**angles are in rad\n")