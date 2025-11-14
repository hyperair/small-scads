/*
  Project: Headphone Holder
  Part: config file

  Revision:
  2018-09-12: creation
  2018-09-13: add headphone_band_space and headphone_cup_space; 

  dwu <dyanawu@gmail.com>
  
*/

use <dovetail.scad>

/* to get this to fit your headphones,
   all you really need to do is adjust:
   headphone_band_space - the amount of space for the band to rest on
   headphone_cup_space - half the width of your headphone cups should work */

//(width of your headphone band + 5) should work
headphone_band_space = 20;

//how thick your headphone band is top to bottom
headphone_band_thick = 10;

/* half the width of your cans or thereabouts. adjust for funky offset ones like:
    _
   | |
   | |
   | |__
  /     \
 ( bo.se )
  \_____/      
     |---|
       ^--- use the width that usually faces you so it's tucked under your desk.
       Or just tuck your headphones with the big side facing in.
 */
headphone_cup_space = 20;

// how thick your desk is 
desk_height = 25;

// extra space between headphone band and desk
desk_clearance = 20;

//how wide you want the clip to be
clip_width = 20;

// how thick you want the clip
clip_thick = 5;

/* little fiddlies that don't really need to be fiddled */

// the lips on either side of the headphone arch
lip_thick = 1;
lip_depth = 4;

// geometry of the arch
rest_thick = clip_thick*0.6;

// bigger rest_height = more curved arch
rest_height = 16;

// bigger rest_width = longer arch
rest_width = 80;

$fn = 256;

/* everything below is calculated variables */

// resting arch calculations for the rotate_extrude (headphone_arch.scad)
rad = (rest_height/2) + ((rest_width*rest_width)/(8*rest_height));
trans_angle = 2*acos(1-(rest_height/rad));

rest_depth = headphone_band_space+lip_depth*2;

rounding = clip_thick*0.9;
clip_depth_bottom = rest_depth+headphone_cup_space;
clip_depth_top = clip_depth_bottom*0.5;

//desk clearance under the clip
desk_under = clip_thick+rest_thick+lip_thick+headphone_band_thick+desk_clearance;

// vaguely proportionate dovetail
dovetail_depth = clip_depth_bottom*0.125;
dovetail_height = clip_thick*1.2;
