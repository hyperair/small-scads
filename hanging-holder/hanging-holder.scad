include <MCAD/units/metric.scad>
use <MCAD/shapes/3Dshapes.scad>

 /* look we have instructions now
        measure these:
          _              ________
         | |            |  ____  |
         | |            | |    | |
         | |            | |    | |   
         | |            | |    | |
         | |            | |    |_|
  wall ->| |            | |  ^------- hang_*
         | |            | |
         | |  cup_in_*  | |
         | |            | |
         | |____________| |
         |________________|
        
          wid, dep, hei = x, y, z
        
*/

cup_wall = 3.5;
cup_in_wid = 60;
cup_in_dep = 25;
cup_in_hei = 10;

hang_thick = 3.5;
hang_wid = 16;
hang_dep = 22;
hang_hei = 75;

// twiddle this

print_separate = false;

//leave these alone

cup_out_wid = cup_in_wid + cup_wall * 2;
cup_out_dep = cup_in_dep + cup_wall * 2;
cup_out_hei = cup_in_hei + cup_wall;

module hanger()
{
  hang_out = [hang_wid,
              hang_dep + hang_thick,
              hang_hei + hang_thick];

  hang_in = [hang_wid + 0.1,
             hang_dep,
             hang_hei];

  difference() {
    ccube(hang_out, center = X);
    translate([-epsilon, -epsilon, -epsilon]) ccube(hang_in, center = X);
  }
}

module place_hanger()
{
  if (print_separate) {
    translate([cup_out_wid * 0.75, -hang_dep, hang_wid/2]) rotate(Y * 90) hanger();
  } else {
    translate([0, -epsilon, cup_in_hei - hang_hei]) hanger();
  }
}

module cup()
{

  cup_out = [cup_out_wid,
             cup_out_dep,
             cup_out_hei];
  
  cup_in = [cup_in_wid,
            cup_in_dep,
            cup_in_hei];

  difference() {
    ccube(cup_out, center = X + Y);
    translate([0, 0, cup_wall + epsilon]) ccube(cup_in, center = X + Y);
  }
}

module place_cup()
{
  translate(Y * -(cup_out_dep/2)) cup();
}

place_cup();
place_hanger();
