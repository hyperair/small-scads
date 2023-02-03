use <MCAD/array/mirror.scad>
use <MCAD/shapes/2Dshapes.scad>
use <MCAD/shapes/3Dshapes.scad>

include <MCAD/units/metric.scad>

$fs = 0.4;
$fa = 1;

height = 18.26; // 18.26 original
depth = 59; // 31.74 original
width = 50; // 37 original

radius = 3.74; // 3.74 original

trapezoid_bottom = 37;
trapezoid_top = 27; // 23 original
trapezoid_height = 4.5; // 7 original
trapezoid_offset = 3; // distance from edge of cutout to nearest edge
trapezoid_position = (depth / 2) - trapezoid_height - trapezoid_offset; 

difference () {
    translate ([0, 0, height / 2])
    mcad_rounded_cube ([width, depth, height], sidesonly=true, radius=radius, center=true);

    translate ([0, trapezoid_position, -epsilon])
    linear_extrude (height=height + epsilon * 2)
    offset (r=2)
    offset (r=-2)
    mcad_mirror_duplicate (Y)
      trapezoid (bottom=trapezoid_bottom, top=trapezoid_top, height=trapezoid_height);
}