$fn = 256;

width = 20.5;
depth = 24;
height = 10;

slit_depth = 9;
slit_height = 6.8;

screw_r = 1.5;
screw_height = 6.7;
screw_spacing = 15.6;

module holes(r, h, spacing) {
    translate([-spacing / 2, 0, 0]) cylinder(h, r, r, center=true);
    translate([+spacing / 2, 0, 0]) cylinder(h, r, r, center=true);
}

difference() {
    cube([width, depth, height]);
    translate([-0.5, depth - slit_depth, (height - slit_height) / 2]) cube([width + 1, slit_depth + 1, slit_height]);
    translate([width / 2, depth / 2, height - screw_height / 2]) holes(screw_r, screw_height + 1, screw_spacing);
}
