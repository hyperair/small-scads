use <MCAD/shapes/3Dshapes.scad>
include <MCAD/units/metric.scad>

x = 55;
y = 47;
z = 27;

rd = 3;
wt = 2;

mult = 0.55;
hx = x * mult;
hy = y * mult;
hz = wt + (epsilon * 2);
hrd = rd * mult;

$fa = 1;
$fs = 0.1;

module outer() {
   mcad_rounded_cube([x, y, z], rd, true, X + Y);
}

module inner() {
    translate(Z * wt)
        mcad_rounded_cube([x-wt, y-wt, z-wt+epsilon], rd, true, X + Y);
}

module hole() {
    translate(Z*-epsilon)
        mcad_rounded_cube([hx, hy, hz], hrd, true, X + Y);
}

module box() {
    difference() {
        outer();
        inner();
        hole();
    }
}

box();
