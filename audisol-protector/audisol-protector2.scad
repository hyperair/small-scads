include <MCAD/units/metric.scad>
use <MCAD/shapes/3Dshapes.scad>

$fs = 0.4;
$fa = 1;

id = 18.4;
od = 21;

h = 13.8;
slot_width = 10;

difference() {
    linear_extrude(h)
        difference() {
        circle(d=od);
        circle(d=id);
    }

    translate([0, 0, -epsilon])
    ccube([slot_width, od, h * 2], center=X);
}
