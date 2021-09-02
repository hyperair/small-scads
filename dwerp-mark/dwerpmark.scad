include <MCAD/units/metric.scad>
use <MCAD/shapes/3Dshapes.scad>

mark = "dw";
face="Bitstream Charter:style=Bold";
height = 30;
depth = 2;

radius = 3;
width = 15.5;
rim_thickness = 1.5 / 2;

inner_width = width - rim_thickness * 2;
inner_radius = radius - rim_thickness;

$fs = 0.4;
$fa = 1;

module mark_sq() {
  #mcad_rounded_cube(
    [width, width, height],
    radius = radius,
    sidesonly = true,
    center = X + Y
  );

  translate([0, 0, height - 0.7]) {
    difference(){
      mcad_rounded_cube(
        [width, width, depth + 0.5],
        radius = radius,
        sidesonly = true,
        center = X + Y
      );
      mcad_rounded_cube(
        [inner_width, inner_width, depth + 0.6],
        radius = inner_radius,
        sidesonly = true,
        center = X + Y
      );
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
  translate([7, -3, height + depth])
    rotate([0, 180, 0])
    linear_extrude(height = 2.5)
    text(mark, font = face, size = 7, $fn=200);
}


mark_sq();
mark();
