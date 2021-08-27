include <MCAD/units/metric.scad>
use <MCAD/shapes/3Dshapes.scad>

height = 30;
depth = 2;

module mark_sq() {
  #ccube([15.5, 15.5, height], center = X + Y);
  translate([0, 0, height - 0.5]) {
    difference(){
      ccube([15.5, 15.5, depth + 0.5], center = X + Y);
      ccube([14, 14, depth + 0.6], center = X + Y);
    }
  }
}

module mark_rd() {
  $fa = 1;
  $fs = 0.1;
  rad = 8;
  border = 1;
  #cylinder(r = rad, h = height);
  translate([0, 0, height - 0.5]) {
    difference(){
      cylinder(r = rad, h = depth + 0.5);
      cylinder(r = rad - border, h = depth + 0.6);
    }
  }
}

module mark () {
  f = 0.3;
  translate([-0.25, -1.5, height + depth])
    rotate([0, 180, 0])
    scale([f, f, 1]) import("./dw-script.stl");
}


mark_rd();
mark();
