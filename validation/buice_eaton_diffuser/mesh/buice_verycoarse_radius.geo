// Gmsh project created on Tue Nov 24 08:58:51 2020
h = 0.0705;
//+
//Point(1) = {0, 0+h, 0, 1.0};
//+
Point(2) = {-1.50, 0+h, 0, 1.0};
//+
Point(3) = {-1.50, -0.015+h, 0, 1.0};
//+
//Point(4) = {0, -0.015+h, 0, 1.0};
//+
Point(5) = {0.315, 0+h, 0, 1.0};
//+
Point(6) = {0.315,-0.0705+h, 0, 1.0};
//+
Point(7) = {1.2, 0+h, 0, 1.0};
//+
Point(8) = {1.2, -0.0705+h, 0, 1.0};
//+
Point(9) = {0.01198, 0.05338, -0, 1.0};
//+
Point(10) = {-0.01275, 0.0555, 0, 1.0};
//+
Point(11) = {-0.01275, -0.09, 0, 1.0};
//+
Point(12) = {0.01198, h, -0, 1.0};
//+
Point(13) = {-0.01275, h, -0, 1.0};

//+
Line(1) = {2, 3};
//+
Line(2) = {2, 13};
//+
Line(3) = {13, 10};
//+
Line(4) = {10, 3};
//+
Line(5) = {13, 12};
//+
Line(6) = {12, 9};
//+
//Line(7) = {10,9};
Circle(7) = {10,11,9};
//+
Line(8) = {12, 5};
//+
Line(9) = {5, 6};
//+
Line(10) = {6, 9};
//+
Line(11) = {5,7};
//+
Line(12) = {7,8};
//+
Line(13) = {8,6};

//+
Curve Loop(1) = {8, 9, 10, -6};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {5, 6, -7, -3};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {2, 3, 4,-1};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {11,12,13,-9};
//+
Plane Surface(4) = {4};
//+
Transfinite Curve {2, -4} = 1000 Using Progression 0.9985;
Transfinite Curve {5, 7} = 40 Using Progression 1;
Transfinite Curve {8, 10} = 400 Using Progression 1.0;
Transfinite Curve {11, -13} = 300 Using Progression 1.007;
//+
Transfinite Curve {1, 3} = 20 Using Bump 0.45;
Transfinite Curve {3, 6} = 20 Using Bump 0.45;
Transfinite Curve {6, 9} = 20 Using Bump 0.45;
Transfinite Curve {12} = 20 Using Bump 0.45;
//+
Transfinite Surface {3};
//+
Transfinite Surface {2};
//+
Transfinite Surface {1};
//+
Transfinite Surface {4};
//+
Recombine Surface {3, 2, 1, 4};
//+
Physical Curve("inlet") = {1};
//+
Physical Curve("outlet") = {12};
//+
Physical Curve("wall_top") = {2, 5, 8, 11};
//+
Physical Curve("wall_bottom") = {4, 7, 10, 13};
//+

//+
Physical Surface("diffuser") = {4, 1, 2, 3};
