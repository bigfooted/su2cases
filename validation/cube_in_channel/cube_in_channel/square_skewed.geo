//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {1.0, 0, 0, 1.0};
//+
Point(3) = {1.0, 0.1, 0, 1.0};
//+
Point(4) = {0, 0.1, 0, 1.0};
//+
Point(5) = {0, 0.2, 0, 1.0};
//+
Point(6) = {1, 0.2, 0, 1.0};
//+
Line(1) = {1, 2};
//+
Line(2) = {4, 3};
//+
Line(3) = {1, 4};
//+
Line(4) = {2, 3};
//+
Line(5) = {5, 6};
//+
Line(6) = {3, 6};
//+
Line(7) = {4, 5};
//+
Curve Loop(1) = {1, 4, -2, -3};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {7, 5, -6, -2};
//+
Plane Surface(2) = {2};
//+
Point(7) = {1.1, 0.0, 0, 1.0};
//+
Point(8) = {1.1, 0.1, 0, 1.0};
//+
Point(9) = {1.1, 0.2, 0, 1.0};
//+
Point(10) = {2, 0., 0, 1.0};
//+
Point(11) = {2, 0.1, 0, 1.0};
//+
Point(12) = {2, 0.2, 0, 1.0};
//+
//Line(8) = {2, 7};
//+
Line(9) = {3, 8};
//+
Line(10) = {6, 9};
//+
Line(11) = {9, 8};
//+
Line(12) = {8, 7};
//+
Line(13) = {9, 12};
//+
Line(14) = {8, 11};
//+
Line(15) = {7, 10};
//+
Line(16) = {10, 11};
//+
Line(17) = {11, 12};
//+
Curve Loop(3) = {9, -11, -10, -6};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {11, 14, 17, -13};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {12, 15, 16, -14};
//+
Plane Surface(5) = {5};
//+
Transfinite Curve {9, 10} = 15 Using Progression 1;
//+
Transfinite Curve {6, 11} = 15 Using Progression 1;
//+
Transfinite Curve {3, 4} = 15 Using Progression 1;
//+
Transfinite Curve {12, 16} = 15 Using Progression 1;
//+
Transfinite Curve {7, 6} = 15 Using Progression 1;
//+
Transfinite Curve {11, 17} = 15 Using Progression 1;
//+
Transfinite Curve {1, 2} = 80 Using Progression 1;
//+
Transfinite Curve {2, 5} = 80 Using Progression 1;
//+
Transfinite Curve {15, 14} = 90 Using Progression 1;
//+
Transfinite Curve {14, 13} = 90 Using Progression 1;
//+
Transfinite Surface {1};
//+
Transfinite Surface {2};
//+
Transfinite Surface {3};
//+
Transfinite Surface {4};
//+
Transfinite Surface {5};
//+
Recombine Surface {1, 2, 3, 4, 5};
//+
Physical Curve("inlet1", 18) = {3};
//+
Physical Curve("inlet2", 19) = {7};
//+
Physical Curve("wallblock", 20) = {4, 9, 12};
//+
Physical Curve("sym", 21) = {1, 15};
//+
Physical Curve("wall", 22) = {5, 10, 13};
//+
Physical Curve("outlet", 23) = {16, 17};
//+
Physical Surface("interior", 24) = {5, 4, 3, 2, 1};
