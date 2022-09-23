W = 32;
W1 =128;
B = 0.20;
P = 0.70710678;
//+ channel width = 100 mu
H = 0.0001;
//+ length of starting channel
H1 =12;
//+ length of exit channel
H2 =12; 
//+
Point(1) = {0.0, 0.0, 0, 1.0};
//+
Point(2) = {H*(H1), H, 0, 1.0};
//+
Point(3) = {H*(H1+2*P), H, 0, 1.0};
//+
Point(4) = {0.0, H, 0, 1.0};
//+
Point(5) = {(H1+1+4*P)*H, 0.0, 0, 1.0};
//+
Point(6) = {(H1+1+4*P)*H, H, 0, 1.0};
//+
Point(7) = {(H1+1+4*P)*H, -H, 0, 1.0};
//+
Point(8) = {(H1+1+5*P)*H, -(1.0+P)*H, 0, 1.0};
//+
Point(9) = {(H1+1+6*P)*H, -(1.0+2*P)*H, 0, 1.0};
//+
Point(10) = {(H1+1+4*P)*H, -(1.0+2*P)*H, 0, 1.0};
//+
Point(11) = {(H1+1+5*P)*H, -(1.0+3*P)*H, 0, 1.0};
//+
Point(12) = {(H1+1+3*P)*H, -(1.0+3*P)*H, 0, 1.0};
//+
Point(13) = {(H1+1+4*P)*H, -(1.0+4*P)*H, 0, 1.0};
//+
Point(14) = {(H1+2*P)*H, 0.0, 0, 1.0};
//+
Point(15) = {(H1)*H, 0.0, 0, 1.0};
//+
Point(16) = {(H1+1+H2*P+5*P)*H, -(1.0+H2*P+3*P)*H, 0, 1.0};
//+
Point(17) = {(H1+1+H2*P+4*P)*H, -(1.0+H2*P+4*P)*H, 0, 1.0};
//+
Circle(1) = {5, 7, 8};
//+
Circle(2) = {6, 7, 9};
//+
Line(3) = {15, 1};
//+
Line(4) = {1, 4};
//+
Line(5) = {8, 10};
//+
Line(6) = {9, 11};
//+
Line(7) = {16, 11};
//+
Line(8) = {16, 17};
//+
Line(9) = {17, 13};
//+
Line(10) = {13, 11};
//+
Line(11) = {13, 12};
//+
Line(12) = {12, 10};
//+
Line(13) = {10, 11};
//+
Line(14) = {8, 9};
//+
Line(15) = {5, 6};
//+
Line(16) = {15, 12};
//+
Line(17) = {10, 14};
//+
Line(18) = {15, 14};
//+
Line(19) = {14, 5};
//+
Line(20) = {6, 3};
//+
Line(21) = {2, 4};
//+
Line(22) = {2, 3};
//+
Line(23) = {15, 2};
//+
Line(24) = {14, 3};
//+
Curve Loop(1) = {-3, 23, 21, -4};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {18, 24, -22, -23};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {19, 15, 20, -24};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {15, 2, -14, -1};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {5, 13, -6, -14};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {18, -17, -12, -16};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {12, 13, -10, 11};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {10, -7, 8, 9};
//+
Plane Surface(8) = {8};
//+
//+
Transfinite Curve {3, 21} = W1 Using Progression 1.01;
//+
Transfinite Curve {4, 23} = W Using Bump B;
//+
Transfinite Curve {23, 24} = W Using Bump B;
//+
Transfinite Curve {19, 20} = 48 Using Bump 0.5;
//+
Transfinite Curve {24, 15} = W Using Bump B;
//+
Transfinite Curve {15, 14} = W Using Bump B;
//+
Transfinite Curve {14, 13} = W Using Bump B;
//+
Transfinite Curve {18, 12} = W Using Bump B;
//+
Transfinite Curve {12, 10} = W Using Bump B;
//+
Transfinite Curve {13, 11} = W Using Bump B;
//+
Transfinite Curve {10, 8} = W Using Bump B;
//+
Transfinite Curve {1, 2} = 96 Using Bump 1;
//+
Transfinite Curve {5, 6} = 32 Using Progression 0.98;
//+
Transfinite Curve {17, 16} = 64 Using Bump 0.3;
//+ straight pipe
Transfinite Curve {9, 7} = W1 Using Progression 0.98;
//+
Transfinite Curve {18, 22} = W Using Bump B;
//+
Transfinite Surface {1,2,3,4,5,6,7,8};
//+
Recombine Surface {1,2,3,4,5,6,7,8};
//+
//+
Physical Curve("left", 25) = {4};
//+
Physical Curve("right", 26) = {8};
//+
Physical Curve("wall", 27) = {21, 22, 20, 2, 6, 5, 1, 17, 3, 16, 11, 9, 7, 19};
//+
Physical Surface("interior", 28) = {1, 2, 3, 4, 5, 6, 7, 8};
