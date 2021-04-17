include <MCAD/units/metric.scad>
use <MCAD/shapes/3Dshapes.scad>

rotate(X * 180) {
difference() {
  import("dwerpmark_sq.stl");
  translate(Z * -epsilon) ccube([14, 14, 28], center=X+Y);
  rotate(X * -90) cylinder(r = 3, h = 10, $fa = 1, $fs = 0.1);
}
}
