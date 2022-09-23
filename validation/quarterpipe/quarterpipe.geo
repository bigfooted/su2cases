// Gmsh project created on Wed Jun 30 11:05:53 2021
//+
Point(1) = {0, 0, 0, 0.001};
//+
Point(2) = {0, 0, 0.02, 0.0005};
//+
Point(3) = {0, 0.02, 0, 0.0005};
//+
Circle(1) = {2, 1, 3};
//+
Line(2) = {1, 2};
//+
Line(3) = {1, 3};
//+
Curve Loop(1) = {3, -1, -2};
//+
Plane Surface(1) = {1};

//+
Extrude {1, 0, 0} {
  Curve{1}; Curve{3}; Curve{2}; Layers{10}; Recombine;
}
//+
Physical Surface("inlet") = {1};
//+
Curve Loop(2) = {4, -8, 12};
//+
Plane Surface(16) = {2};
//+
Physical Surface("outlet") = {16};
//+
Physical Surface("symmetry1") = {11};
//+
Physical Surface("symmetry2") = {15};
//+
Physical Surface("wall") = {7};
//+
Surface Loop(1) = {1, 11, 7, 16, 15};
//+
Volume(1) = {1};
//+
Physical Volume("fluid") = {1};
