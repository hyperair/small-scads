include <MCAD/units/metric.scad>
use <MCAD/shapes/2Dshapes.scad>

across_points = 90;
wall_thick = 2.4;
// test piece
// height = 10;
height = 128;
cutout_dia = 55;

module wall(diameter, wall_thickness, height)
{
  linear_extrude(height + wall_thickness) {
    difference() {
      dodecagon(diameter/2 + wall_thickness);
      dodecagon(diameter/2);
    }
  }
}

module base(diameter, thickness, cutout_diameter)
{
  linear_extrude(thickness) {
    difference() {
      dodecagon(diameter/2 + thickness);
      circle(cutout_diameter/2, $fs = 0.1, $fa = 1);
    }
  }
}

module shield(diameter, wall_thickness, height, cutout_diameter)
{
  union() {
    wall(diameter, wall_thickness, height);
    base(diameter, wall_thickness, cutout_diameter);
  }
}

shield(across_points, wall_thick, height, cutout_dia);
