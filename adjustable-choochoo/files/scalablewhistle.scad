include <MCAD/units/metric.scad>

size = 46;
//default chootube length is 69, giggle etc

module place_tip() {
	import("chootip.stl");
}

module place_top() {
	translate([(15-epsilon) + size,0,0])
		import("chootop.stl");
}

module place_tube() {
	translate([15-epsilon,0,0])
		resize([size,0,0])
		import("chootube.stl");
}

place_tip();
#place_tube();
place_top();
