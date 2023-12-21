use <MCAD/shapes/3Dshapes.scad>
include <MCAD/units/metric.scad>

$fa = 1;
$fs = 0.1;

base_x = 90;
base_y = 60;
base_z = 2;

rad = 3;

label_x = 20;
label_y = 10 + rad;
label_z = base_z;

mcad_rounded_cube([base_x, base_y, base_z], rad, true);

translate(Y * (base_y - rad * 2))
  mcad_rounded_cube([label_x, label_y, label_z], rad, true);

translate(X * 1 + Y * base_y)
  #linear_extrude(base_z + 1) text("text", font="Comic Mono", size=6, halign="left");
s
