include <MCAD/units/metric.scad>
use <MCAD/array/polar.scad>
use <MCAD/array/rectangular.scad>
use <MCAD/shapes/3Dshapes.scad>

$fa = 1;
$fs = 0.1;

height = 27;

id = 15;
wall = 1.5;
od = id + (wall * 2);

spiral_t = id/6;
base_hole_d = 7;

array = [1,1];

module bit ()
{
	polygon ([[0, 0],
			  [wall, 0],
			  [wall, spiral_t],
			  [0, spiral_t]]);
}

module bits ()
{
	mcad_array_polar (number = 12)
		 translate ([id/2, 0]) bit ();
}

module pillars ()
{
	linear_extrude (height = height,
					center = false,
					twist = height * 3,
					slices = height * 3) {
		bits ();
	}
}	

module base ()
{
	tube2 (wall, base_hole_d, od + 0.5, center = true);
}

module top ()
{
	tube2 (wall, id, od + 0.5, center = true);
}

module place_caps ()
{
	translate ([0, 0, wall/2]) {
		translate ([0, 0, height - wall]) top ();
		base();
	}
}

module assembled_one ()
{
difference() {
	
	union () {
		place_caps ();
		pillars ();
	}
		tube2 (height = height,
				ID = od,
				OD = od+2);
	}
}

module assembled_many ()
{
	mcad_array_rectangular (array, od - wall) {
		assembled_one ();
	}
}

assembled_many ();
