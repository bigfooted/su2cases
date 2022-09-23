//+
Point(1) = {0, 0.0, 0, 1.0};
//+
Point(2) = {1, 0.0, 0, 1.0};
//+
Point(3) = {1, 0.05, 0, 1.0};
//+
Point(4) = {0, 0.05, 0, 1.0};
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
Transfinite Curve {1, 2} = 200 Using Progression 1;
//+
Transfinite Curve {3, 4} = 32 Using Progression 1;
//+
Transfinite Surface {1};
//+
Recombine Surface {1};
//+
Physical Curve("inlet") = {3};
//+
Physical Curve("outlet") = {4};
//+
Physical Curve("axis") = {1};
//+
Physical Curve("wall") = {2};
//+
Physical Surface("fluid") = {1};
