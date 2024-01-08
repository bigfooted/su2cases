dx=0.1;
//+
Point(1) = {0, -0, 0, dx};
//+
Point(2) = {0.5, -0, 0, dx};
//+
Point(3) = {0.5, 0.5, 0, dx};
//+
Point(4) = {0, 0.5, 0, dx};
//+
Line(1) = {1, 2};
//+
Line(2) = {4, 3};
//+
Line(3) = {1, 4};
//+
Line(4) = {2, 3};
//+
Curve Loop(1) = {1, 4, -2, -3};
//+
Plane Surface(1) = {1};
//+
Transfinite Curve {1, 2} = 11 Using Bump 0.2;
//+
Transfinite Curve {3, 4} = 21 Using Bump 0.8;
//+
Transfinite Surface {1};
//+
Recombine Surface {1};
//+
Point(5) = {1.0, 0, 0, dx};
//+
Point(6) = {1.0, 0.55, 0, dx};
//+
Line(5) = {2, 5};
//+
Line(6) = {5, 6};
//+
Line(7) = {6, 3};
//+
Curve Loop(2) = {5, 6, 7, -4};
//+
Plane Surface(2) = {2};
//+
Physical Curve("inlet") = {3};
//+
Physical Curve("outlet") = {6};
//+
Physical Curve("wall_up") = {2, 7};
//+
Physical Curve("wall_down") = {1,5};
//Physical Curve("wall_down_2") = {5};
//+
Physical Surface("interior") = {1, 2};
