// Gmsh project created on Fri Jan 27 16:20:49 2023
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
Point(2) = {0, 0.05, 0, 1.0};
Point(3) = {0.1, 0.05, 0, 1.0};
Point(4) = {0.34, 0.0, 0, 1.0};
Point(5) = {0.34, 0.071, 0, 1.0};
Point(6) = {0.109, 0.0255, 0, 1.0};
Point(7) = {0.077, 0.025, 0, 1.0};
Point(8) = {0.109, 0.0283633, 0, 1.0};
Point(9) = {0.109, 0.0216367, 0, 1.0};
Point(10) = {0.109, 0, -0, 1.0};
Point(11) = {0.085, 0, 0, 1.0};
Point(12) = {0.085, 0.05, 0, 1.0};
Point(13) = {0, 0.025, 0, 1.0};
Point(14) = {0.34, 0.0255, -0, 1.0};
Point(15) = {0.34, 0.02, -0, 1.0};
Point(16) = {0.34, 0.03, -0, 1.0};
Point(17) = {0.109, 0.0245, -0, 1.0};
Point(18) = {0.34, 0.0245, -0, 1.0};

//+
Line(1) = {10, 4};
Line(2) = {11, 10};
Line(3) = {7, 8};
Line(4) = {7, 9};
Line(5) = {9, 17};
Line(6) = {6, 8};
Line(7) = {2, 12};
Line(8) = {12, 3};
Line(9) = {7, 11};
Line(10) = {12, 7};
Line(11) = {13, 7};
Line(12) = {6, 14};
Line(13) = {9, 15};
Line(14) = {8, 16};
Line(15) = {3, 8};
Line(16) = {3, 5};
Line(17) = {5, 16};
Line(18) = {16, 14};
Line(19) = {18, 15};
Line(20) = {15, 4};
Line(21) = {9, 10};
Line(22) = {13,1};
Line(23) = {2,13};
Line(24) = {1, 11};
Line(25) = {17, 18};
Line(26) = {6, 17};
Line(27) = {18, 14};
//+
Curve Loop(1) = {23, 11,-10,-7};
Plane Surface(1) = {1};
//+
Curve Loop(2) = {10, 3, -15, -8};
Plane Surface(2) = {2};
//+
Curve Loop(3) = {16, 17, -14, -15};
Plane Surface(3) = {3};
//+
Curve Loop(4) = {18, -12, 6, 14};
Plane Surface(4) = {4};
//+
Curve Loop(5) = {5, -25, 19, -13};
Plane Surface(5) = {5};
//+
Curve Loop(6) = {22, 24, -9, -11};
Plane Surface(6) = {6};
//+
Curve Loop(7) = {9, 2, -21, -4};
Plane Surface(7) = {7};
//+
Curve Loop(8) = {21, 1, -20, -13};
Plane Surface(8) = {8};
//+
Curve Loop(9) = {25, 27, -12, 26};
Plane Surface(9) = {9};
//+
//+ top horizontal
Transfinite Curve {23, 10, 15, 17} =200 Using Bump 0.20;
//+ bottom horizontal
Transfinite Curve {22, 9, 21, 20} =200 Using Bump 0.20;
//+ top and bottom above and below fuel strip
Transfinite Curve {6, 5, 18, 19} =80 Using Progression 1;
//+ front
Transfinite Curve {24, 11, 7} =120 Using Progression 0.97;
//+ middle
Transfinite Curve {2, 8} =200 Using Progression 1;
Transfinite Curve {4, 3} =200 Using Bump 0.15;
//+ rear
Transfinite Curve {1, 13, 12, 14, 16,25} = 800 Using Progression 1.004;
// rectangular fuel strip
Transfinite Curve {27, 26} = 25 Using Progression 1;
//+
Transfinite Surface {1};
Transfinite Surface {2};
Transfinite Surface {3};
Transfinite Surface {4};
Transfinite Surface {5};
Transfinite Surface {6};
Transfinite Surface {7};
Transfinite Surface {8};
Transfinite Surface {9};
//+
Recombine Surface {6, 1, 2, 7, 8, 9, 5, 4, 3};
//+
Physical Curve("inlet_bottom", 27) = {22};
Physical Curve("inlet_top", 28) = {23};
Physical Curve("wall_bottom", 29) = {24, 2, 1};
Physical Curve("wall_top", 30) = {7, 8, 16};
Physical Curve("outlet", 31) = {20, 19, 18, 17,27};
Physical Curve("wedge_bottom", 32) = {4};
Physical Curve("wedge_top", 33) = {3};
Physical Curve("wedge_rear", 34) = {6, 5};
Physical Curve("inlet_fuel", 36) = {26};
//+
//+
Physical Surface("interior", 35) = {1, 2, 3, 4, 5, 6, 7, 8, 9};
