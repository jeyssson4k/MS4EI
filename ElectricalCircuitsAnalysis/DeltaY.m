% Delta-Y Transform

delta_to_y = 0;
R  = [50,50,50];
Ro = [0,0,0];
U  = [R(1)*R(2) R(1)*R(3) R(2)*R(3)];
m  = sum(R);
n  = sum(U);
if delta_to_y == 1
    Ro(1) = U(3)/m;
    Ro(2) = U(2)/m;
    Ro(3) = U(1)/m;
    disp("Transformacion aplicada: Delta -> Y")
elseif delta_to_y == 0
    Ro(1) = n/R(1);
    Ro(2) = n/R(2);
    Ro(3) = n/R(3);
    disp("Transformacion aplicada: Y -> Delta")
end

disp("********RESULT*************")
fprintf('R1: %.6e ; %.6e\n', R(1),Ro(1));
fprintf('R2: %.6e ; %.6e\n', R(2),Ro(2));
fprintf('R3: %.6e ; %.6e\n', R(3),Ro(3));
disp("***************************")