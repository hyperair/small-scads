include <MCAD/units/metric.scad>
use <MCAD/shapes/3Dshapes.scad>

$fs = 0.1;
$fa = 1;

grip_h = 13;
wave_h = 6;

plug_h = grip_h + wave_h;
plug_r = 3.45;
plug_t = 1.0;

spacing = plug_r * 2 - plug_t;

module grip() {
  translate([-plug_r - plug_t, -plug_r - plug_t, -epsilon])
  cube([(plug_r + plug_t) * 2, (plug_r + plug_t) * 2, grip_h + epsilon * 2]);
}

module semitube_up() {
  difference() {
    tube(plug_h, plug_r, plug_t, center = false);
    translate([-plug_r, -plug_r, -epsilon]) {
      cube([(plug_r + epsilon) * 2, plug_r + epsilon, plug_h + epsilon * 2]);
    }
  }
  grip();
}

module semitube_down() {
  difference() {
    tube(plug_h, plug_r, plug_t, center = false);
    translate([-plug_r, 0, -epsilon]) {
      cube([(plug_r + epsilon) * 2, plug_r + epsilon, plug_h + epsilon * 2]);
    }
  }
  grip();
}


semitube_up();
translate([spacing, epsilon, 0]) semitube_down();
translate([spacing * 2, 0, 0]) semitube_up();
