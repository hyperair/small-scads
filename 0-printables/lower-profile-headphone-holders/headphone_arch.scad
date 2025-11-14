/*
  Project: Headphone Holder
  Part: Headphone rest (arch bit)

  Revision:
  2018-09-12: creation
  2018-09-13: fix rotation of dovetail, change Y of lip to be just lip_depth, rotate arch out of the way
  2018-09-13: 

  dwu <dyanawu@gmail.com>
  
*/

include <headphone_config.scad>




module cross_sect() {
	offset (r = -(rounding/2)) {
		offset (r = rounding) {
			union() {
				square([rest_thick,rest_depth]);
				square([rest_thick+lip_thick, lip_depth]);
				translate([0,rest_depth-lip_depth]) {
					square([rest_thick+lip_thick, lip_depth]);
				}
			}
		}
	}
}

module rest_extrude(){
	rotate([0,0,-(trans_angle/2)]) {
		rotate_extrude(angle=trans_angle) {
			translate([rad+rounding, rounding/2]) {
				cross_sect();
			}
		}
	}
}


module dovetail_arch() {
	union() {
		translate([-(clip_width+0.5)/2,0,0.5]) {
			cube([clip_width+0.5,(clip_depth_bottom*0.25)+(rounding*1.5),clip_thick*0.8]);
		}
		translate([0,0,clip_thick*0.75]) {
			female_dovetail_negative(depth = dovetail_depth, height = dovetail_height*1.5);
    }
  }
}

module arch() {
	rotate([0,0,0]) {
		difference() {
			rest_extrude();
			translate([rad+0.5,0,rest_depth+lip_depth+(rounding*0.2)]) {
				rotate([-90,0,-90]) {
					#dovetail_arch();
				}
			}
    }
	}
}
