include <MCAD/units/metric.scad>

$fa = 1;
$fs = 0.1;

charm_l = 40;
charm_w = 26;
charm_cut = 6;
charm_h = 6;

hole_d = 1.8;
hole_in = hole_d * (10/3);

text_depth = 1.5;

module hole() {
	cylinder(d = hole_d, h = charm_h + epsilon * 2);
}

module place_hole() {
	translate([charm_w / 2, charm_l - hole_in, -epsilon]) hole();
}
module blank() {
	linear_extrude(height = charm_h) {
		polygon(points = [[0, 0],
				[charm_w, 0],
				[charm_w, charm_l - charm_cut],
				[charm_w - charm_cut, charm_l],
				[charm_cut, charm_l],
				[0, charm_l - charm_cut]]);
	}
}

module blank_charm() {
	difference() {
		blank();
		place_hole();				
	}
}

module couplet1() {
text(text = "你印好好",
    size = 6,
    font = "DengXian", 
    direction= "ttb");
}

module couplet2() {
text(text = "不然卖掉",
    size = 6,
    font = "DengXian", 
    direction= "ttb");
}

module place_couplets(){
  linear_extrude(height = charm_h + text_depth) {
    translate([charm_cut, charm_l - charm_cut, 0]) couplet1();
    translate([charm_w - charm_cut, charm_l - charm_cut, 0]) couplet2();
  }
}
    
blank_charm();
#place_couplets();