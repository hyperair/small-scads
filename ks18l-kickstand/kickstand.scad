include <MCAD/units/metric.scad>
include <MCAD/array/rectangular.scad>
include <MCAD/fasteners/nuts_and_bolts.scad>

$fa = 1;
$fs = 0.1;

stand_dia = 25;
stand_len = 120;

cap_len = 25;
cap_thi = 3;

case_thi = 5;
screw = 3;
hole_btw = 21;

cap_rad = (stand_dia / 2) + cap_thi;
body_rad = stand_dia / 2;
body_len = stand_len - (cap_len * 2);

module screwhole (align = "above_head")
{
	screw_len = stand_dia;
	hole_dist = hole_btw + screw;

	mcad_linear_multiply (no = 2,
						  separation = hole_dist,
						  axis = X,
						  center = true) {
		mcad_bolt_hole_with_nut (size = screw,
								  length = screw_len,
								  align_with = align,
								  screw_extra_length = 5,
								  head_extra_length = 0,
								  nut_projection_length = 0);
	}
}

module cap ()
{
	translate(Z * cap_rad)
		rotate (Y * 90)
		cylinder (r = cap_rad, h = cap_len, center = true);
}

module body ()
{
	translate(Z * body_rad)
		rotate (Y * 90)
		cylinder (r = body_rad, h = stand_len, center = true);
}

module arrange_stand ()
{
	difference () {
		union () {
			body ();
			translate ([-(body_len + cap_len) / 2, 0, -cap_thi])
				mcad_linear_multiply (no = 2,
									  separation = body_len + cap_len,
									  axis = X) {
				#cap ();
			}
		}
		#screwhole ();
	}
}

arrange_stand ();
