base = 15.2;
height = 20;
length = 70;
wall = 2;


module triangle(x, y) {
    polygon([[0, y], [0, 0], [x,0]]);
}

module main_prism() {
    linear_extrude(length)
    triangle(base, height);
}

module diff_block() {
    translate([wall, wall, wall]) 
        cube([base, height, length - wall * 2]);
}

difference() {
    main_prism();
    diff_block();
}