include <MCAD/units/metric.scad>
use <MCAD/shapes/2Dshapes.scad>

$fa = 1;
$fs = 0.1;

module stopper(inner_dia, height, wall_thickness)
{
  linear_extrude(height)
    donutSlice(inner_dia/2, inner_dia/2 + wall_thickness/2, 0, 270);
}

// stopper(17, 17, 4);

// translate([40, 0, 0]) stopper(23, 21, 4.8);
stopper(10.8, 18, 3);
