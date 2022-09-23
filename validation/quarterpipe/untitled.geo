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
Physical Curve("inlet") = {3};
//+
Physical Curve("outlet") = {4};
//+
Physical Curve("axis") = {1};
//+
Physical Curve("wall") = {2};
//+
Physical Surface("fluid") = {1};
//+
Extrude {{1, 0, 0}, {0, 0, 0}, Pi/2} {
  Surface{1}; 
}
//+
MeshSize {1, 4, 14, 3, 2, 10} = 0.001;
