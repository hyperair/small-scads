include <MCAD/units/metric.scad>
use <MCAD/shapes/3Dshapes.scad>

height = 45;
depth = 2;

radius = 3;
width = 20;
rim_thickness = 1.5 / 2;

inner_width = width - rim_thickness * 2;
inner_radius = radius - rim_thickness;

$fs = 0.1;
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
  rad = width/2;
  #cylinder(r = rad, h = height);
  translate([0, 0, height - 0.5]) {
    difference(){
      cylinder(r = rad, h = depth + 0.3);
      cylinder(r = rad - rim_thickness, h = depth + 0.6);
    }
  }
}

module mark () {
  f = 0.44;
  translate([-0.45, -3.2, height + depth])
    rotate([0, 180, -4])
    scale([f, f, 1]) import("./dw-script.stl");
}


mark_sq();
mark();

translate([25, 0, 0]) {
  mark_rd();
  translate([-0.2, 1, 0]) mark();
}
