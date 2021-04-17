include <MCAD/units/metric.scad>

lip_od = 45;

ring_od = 50;
ring_id = 34;

height = 0.7;
lip_height = 1;
thick_height = height + lip_height;

$fa = 1;
$fs = 0.1;

difference() {
  union() {
    cylinder(r = ring_od/2, h = height);
    cylinder(r = lip_od/2, h = thick_height);
  }
  translate(Z * -epsilon) cylinder(r = ring_id/2, h = thick_height + 2 * epsilon);
}
