use <MCAD/shapes/3Dshapes.scad>
use <MCAD/array/rectangular.scad>
include <MCAD/units/metric.scad>

bcp_len = 85;
bcp_wid = 55;
bcp_hei = 5.5;

wall_thi = 2;

cutout_rad = bcp_wid / 7.5;

print_resin = 1;

module case_blank(x, y, z)
{
  ccube([x, y, z], center = X + Y + Z);
}

module cutout(rad, hei)
{
  cylinder(r = rad,
           h = hei,
           center = true,
           $fs = 0.1,
           $fa = 1
  );
}

module drain_hole(rad, hei)
{
  cylinder(r = rad,
           h = hei,
           center = true,
           $fn = 6
  );
}

module place_drain_holes(distance, separation)
{
  translate(X * distance)
    mcad_linear_multiply(
      no = 2,
      separation = separation,
      axis = Y,
      center = true
    )
    children();
}

module assemble_case(x, y, z, wall, cut_rad)
{
  out_len = x + wall;
  out_wid = y + wall * 2;
  out_hei = z + wall * 2;

  difference() {
    case_blank(out_len, out_wid, out_hei);
    translate(X * wall)
      case_blank(x, y, z);
    translate(X * out_len/2)
      cutout(cut_rad, out_hei + epsilon * 2);

    if (print_resin)
    {
      place_drain_holes((-x / 2 + wall * 3), y + wall)
        rotate(X * 90)
        drain_hole(out_hei / 6, wall * 3);
    }
  }
}

assemble_case(bcp_len, bcp_wid, bcp_hei, wall_thi, cutout_rad);
