base = 15.2;
height = 20;
length = 70;
wall = 2;

factor = (height - wall)/height;

module triangle(x, y) {
    polygon([[0, y], [0, 0], [x,0]]);
}

module main_prism() {
    linear_extrude(length)
    triangle(base, height);
}

module diff_prism() {
    translate([wall + 0.1, wall + 0.1, wall]) 
        linear_extrude(length - wall * 2)
            scale([factor, factor]) triangle(base, height);
}

difference() {
    main_prism();
    diff_prism();
}