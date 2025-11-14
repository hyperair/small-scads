/*
	Project: Headphone Holder
	Part: Desk clip

	Revision:
	2018-09-12: creation
	2018-09-17: fix points for rounding

	dwu <dyanawu@gmail.com>
	
*/

include <headphone_config.scad>

points = [[(clip_depth_bottom*0.75)-clip_thick+(rounding/2)+headphone_cup_space,0+(rounding/2)],
          [clip_depth_bottom+clip_thick-(rounding/2)+headphone_cup_space,0+(rounding/2)],
          [clip_depth_bottom+clip_thick-(rounding/2)+headphone_cup_space,desk_under+(clip_thick*2)-(rounding/2)],
          [clip_thick-(rounding/2),desk_under+(clip_thick*2)-(rounding/2)],
          [clip_thick-(rounding/2),desk_under+desk_height+(clip_thick*2)+(rounding/2)],
          [clip_depth_top+clip_thick-(rounding/2),desk_under+desk_height+(clip_thick*2)+(rounding/2)],
          [clip_depth_top+clip_thick-(rounding/2),desk_under+desk_height+(clip_thick*3)-(rounding/2)],
          [0+(rounding/2),desk_under+desk_height+(clip_thick*3)-(rounding/2)],
          [0+(rounding/2),desk_under+clip_thick+(rounding/2)],
          [clip_depth_bottom+(rounding/2)+headphone_cup_space,desk_under+clip_thick+(rounding/2)],
          [clip_depth_bottom+(rounding/2)+headphone_cup_space,clip_thick-(rounding/2)],
          [(clip_depth_bottom*0.75)-clip_thick+(rounding/2)+headphone_cup_space,clip_thick-(rounding/2)]
	];

module clip_extrude() {
difference() {
	linear_extrude(height = clip_width){
		offset (r = -(rounding/2)) {
			offset (r = rounding) {
				polygon(points);
			}
		}
	}
	translate([clip_depth_bottom+headphone_cup_space-rounding,clip_thick,-0.5]) {
		cube([rounding,rounding,clip_width+1]);
	}
}
}

module dovetail_clip() {
translate([clip_depth_bottom+headphone_cup_space,clip_thick,clip_width/2]) {
rotate([0,90,90]) {
male_dovetail(depth = dovetail_depth, height = dovetail_height);
}
}
}

module clip() {
	union() {
		clip_extrude();
		dovetail_clip();
	}
}
