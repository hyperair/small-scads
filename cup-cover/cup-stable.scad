include <MCAD/units/metric.scad>
use <MCAD/shapes/3Dshapes.scad>

cup_top = 82 / 2;
cup_bot = 57 / 2;
cup_hei = 177.5;

hold_thick = cup_top - cup_bot;
hold_rad = cup_bot + hold_thick;
hold_hei = 25;

$fs = 0.1;
$fa = 1;

module cup_blank() {
  cylinder(r1 = cup_bot,
           r2 = cup_top,
           h = cup_hei);
}

module hold_blank() {
  cylinder(r = hold_rad,
           h = hold_hei);
}

module holder() {
  difference() {
    hold_blank();
    translate(Z * -epsilon) cup_blank();
  }
}

holder();
