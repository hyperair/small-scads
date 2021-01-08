use <MCAD/shapes/3Dshapes.scad>
include <MCAD/units/metric.scad>

bcp_len = 85;
bcp_wid = 55;
bcp_hei = 5.5;

wall_thi = 2;

cutout_rad = bcp_wid / 5;

module case_blank(x, y, z)
{
  ccube([x, y, z], center = X + Y + Z);
}

module cutout(rad, hei)
{
  cylinder(r = rad, h = hei);
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
    translate(X * out_len / 2)
      cutout(cut_rad, z + wall);
  }
}

assemble_case(bcp_len, bcp_wid, bcp_hei, wall_thi, cutout_rad);
