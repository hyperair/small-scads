bottom_id = 24.8;
height = 38.2;
slit_width = 6;
slit_height = 36;
wall_thickness = 1;

$fs = 0.4;
$fa = 1;

difference() {
    cylinder (d = bottom_id, h = height);

    hull() {
        cylinder (d = slit_width, height = 
    }
}
