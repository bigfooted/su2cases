//+
Point(1) = {0, 0, -0, 1.0};
//+
Point(2) = {0, 1, 0, 1.0};
//+
Point(3) = {1, 0, -0, 1.0};
//+
Point(4) = {1, 1, 0, 1.0};
//+
Line(1) = {1, 3};
//+
Line(2) = {3, 4};
//+
Line(3) = {4, 2};
//+
Line(4) = {2, 1};

//+
Curve Loop(1) = {1, 2, 3, 4};
//+
Plane Surface(1) = {1};

//+
//+
Extrude {0, 0, 0.1} {
  Surface{1}; Layers {3}; Recombine;
}
//+
Transfinite Curve {4, 2, 9, 7} = 4 Using Progression 1;
//+
Transfinite Curve {6, 1, 8, 3} = 4 Using Progression 1;
//+
Transfinite Surface {26};
//+
Transfinite Surface {1};
//+
Recombine Surface "*";
//+
Physical Surface("outlet", 27) = {17};
//+
Physical Surface("inlet", 28) = {25};
//+
Physical Surface("wall_top", 29) = {21};
//+
Physical Surface("symmetry_bottom", 30) = {13};
//+
Physical Surface("symmetry_sides", 31) = {26, 1};
//+
Physical Volume("internal", 32) = {1};
