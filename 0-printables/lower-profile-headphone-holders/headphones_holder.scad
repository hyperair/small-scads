/*
  Project: Headphone Rest
  Part: Combined parts

  Revision:
  2018-09-12: creation

  dwu <dyanawu@gmail.com>
  
*/

include <headphone_arch.scad>
include <headphone_clip.scad>

translate([-(clip_depth_bottom),0,0]) {
  clip();
}

arch();
