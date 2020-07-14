include <MCAD/units/metric.scad>
use <MCAD/shapes/3Dshapes.scad>

mark = "dw";
face="Bitstream Charter:style=Bold";
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
  #cylinder(r = 8, h = height);
  translate([0, 0, height - 0.5]) {
    difference(){
      cylinder(r = 8, h = depth + 0.5);
      cylinder(r = 7, h = depth + 0.6);
    }
  }
}

module mark () {
  translate([7.8, -3, height + depth])
    rotate([0, 180, 0])
    linear_extrude(height = 2.5)
    text(mark, font = face, size = 8, $fn=200);
}


mark_sq();
mark();
