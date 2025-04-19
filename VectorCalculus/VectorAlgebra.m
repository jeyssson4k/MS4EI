%% Vector Algebra
%% @author Jeysson4K
%% Script that computes common vector operations
clc;
clear;


u = [5,-4,-2];
v = [1,0,3];

% 1. distance between two vectors
disp("1. Distance between vectors")
p = v-u;
fprintf("Distance between u and v: (%.2f, %.2f, %.2f)\n\n", p(1), p(2), p(3))

% 2. Norm and Unit vector
unorm = norm(u);
vnorm = norm(v);

uu = u/unorm;
uv = v/vnorm;
disp("2. Norm and unit vector")
fprintf("Norm of u: %.2f\nUnit vector of u: (%.2f, %.2f, %.2f)\n",   unorm, uu(1), uu(2), uu(3))
fprintf("Norm of v: %.2f\nUnit vector of v: (%.2f, %.2f, %.2f)\n\n", vnorm, uv(1), uv(2), uv(3))

% 3. Sum of vectors
s = u+v;
disp("3. Sum of vectors")
fprintf("Sum of u and v: (%.2f, %.2f, %.2f)\n\n", s(1), s(2), s(3))

% 4. Dot product
duv = dot(u,v);
dvu = dot(v,u);
duu = dot(u,u);
dvv = dot(v,v);
disp("4. Dot product of vectors")
fprintf("u . v: %.2f\n",   duv)
fprintf("v . u: %.2f\n",   dvu)
fprintf("u . u: %.2f\n",   duu)
fprintf("v . v: %.2f\n\n", dvv)

% 5. Cross product
cruv = cross(u,v);
crvu = cross(v,u);
cruu = cross(u,u);
crvv = cross(v,v);

disp("5. Dot product of vectors")
fprintf("u x v: (%.2f, %.2f, %.2f)\n",   cruv(1), cruv(2), cruv(3))
fprintf("v x u: (%.2f, %.2f, %.2f)\n",   crvu(1), crvu(2), crvu(3))
fprintf("u x u: (%.2f, %.2f, %.2f)\n",   cruu(1), cruu(2), cruu(3))
fprintf("v x v: (%.2f, %.2f, %.2f)\n\n", crvv(1), crvv(2), crvv(3))

% 6. Angle between vectors
npr = (vnorm*unorm);
dn = duv/npr;
rad0 = acos(dn);
deg0 = rad2deg(rad0);
cn = norm(cruv)/npr;
rad1 = asin(cn);
deg1 = rad2deg(rad1);

disp("6. Angle between u and v")
fprintf("Angle with dot product  : %.2f rad or %.2f deg\n", rad0, deg0)
fprintf("Angle with cross product: %.2f rad or %.2f deg\n\n", rad1, deg1)


% 7. Normal vector
normal_uv = cruv/norm(cruv);
disp("7. Normal vector between u and v")
fprintf("n = (%.2f, %.2f, %.2f)\n\n", normal_uv(1), normal_uv(2), normal_uv(3))