use <MCAD/shapes/3Dshapes.scad>
include <MCAD/units/metric.scad>

x = 120;
y = 95;
z = 55;

rd = 20;
wt = 2.8;

$fa = 1;
$fs = 0.1;

module outer() {
   mcad_rounded_cube([x, y, z], rd, true, X + Y);
}

module inner() {
    translate(Z * wt)
   mcad_rounded_cube([x-wt, y-wt, z-wt+epsilon], rd, true, X + Y);
}

module box() {
    difference() {
        outer();
        inner();
    }
}

box();
