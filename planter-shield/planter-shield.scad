include <MCAD/units/metric.scad>
use <MCAD/shapes/2Dshapes.scad>

across_points = 90;
wall_thick = 1.6;

lid_height = 50;
lid_cutout_dia = 46;

// test piece
// bottom_height = 10;

bottom_height = 128;
bottom_cutout_dia = 60;

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

shield(across_points, wall_thick, bottom_height, bottom_cutout_dia);
translate (X * across_points * 1.5)
  shield(across_points + wall_thick * 3, wall_thick, lid_height, lid_cutout_dia);
