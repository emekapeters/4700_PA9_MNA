G1 = 1;
G2 = 0.5;
G3 = 0.1;
G4 = 10;
G0 = 1/1000;
alf = 100;
C = 0.25;
L = 0.2;
vinmat = zeros(1, 20);
vomat = zeros(1, 20);
v3mat = zeros(1, 20);

G = [1, 0, 0, 0, 0, 0, 0;...
    -G1, G1+G2, -1, 0, 0, 0, 0;...
    0, 1, 0, -1, 0, 0, 0;...
    0, 0, -1, G3, 0, 0, 0;...
    0, 0, 0, 0, alf, 1, 0;...
    0, 0, 0, G3, -1, 0, 0;...
    0, 0, 0, 0, 0, -G4, G4+G0];

Cm = zeros(7, 7);
Cm(2, 1) = -C;
Cm(2, 2) = C;
Cm(3, 3) = -L;

%Vm = [V1, V2, IL, V3, I3, V4, V0];

F = zeros(1, 7);


Vm = G\F';

vin = -10;

for i = 1:20
    vinmat(i) = vin;
    F(1) = vinmat(i);
    
    Vm = G\F';
    
    vomat(i) = Vm(7);
    v3mat(i) = Vm(4);
    vin = vin + 1;
end

plot(vinmat, vomat);
title('vin vs vo DC Sweep');
    
    
    
    
    