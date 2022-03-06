$fn=256;

width = 20.4;
depth = 12;
height = 26;

slit_depth = 2.65;
slit_height = 16;
slit_y = 3;

screw_r = 1.5;
screw_height = 6.7;
screw_spacing = 15.6;

front_radius = 4.75;
back_radius = 3.75;

module holes(r, h, spacing) {
    translate([-spacing / 2, 0, 0]) cylinder(h, r, r, center=true);
    translate([+spacing / 2, 0, 0]) cylinder(h, r, r, center=true);
}

module cut(r, depth, h) {
    translate([r, 0, h - r]) rotate([-90, 90, 0]) cylinder(depth, r, r);
    cube([2 * r, depth, h - r]);
}

difference() {
    cube([width, depth, height]);
    translate([-0.5, slit_y, -1]) cube([width + 1, slit_depth, slit_height + 1]);
    translate([width / 2, slit_y, height - screw_height / 2]) holes(screw_r, screw_height + 1, screw_spacing);
    translate([width - 1.75 - 2 * front_radius, -0.5, -1]) cut(front_radius, slit_y + 1, 2 * front_radius + 1);
    translate([width - 2.75 - 2 * back_radius, -0.5 + slit_y + slit_depth, -1]) cut(back_radius, depth, 2 * back_radius + 1);
}
