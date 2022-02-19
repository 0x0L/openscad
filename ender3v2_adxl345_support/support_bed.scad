$fn=256;

depth = 6;
diameter = 7.9;
top_clear = 8.1;
right_clear = 2.75;
left_clear = 9.75;
left_clear2 = left_clear - 2;
width = right_clear + diameter + left_clear;
height = diameter + top_clear;

fix_width = 2.65;

total_depth = right_clear + fix_width + depth;
top_height = 10;

difference() {
    cube([width, total_depth, top_height]);
    translate([width / 2 - 15.6 / 2, total_depth / 2 + depth / 2, 1]) cylinder(top_height, 1.5, 1.5);
    translate([width / 2 + 15.6 / 2, total_depth / 2 + depth / 2, 1]) cylinder(top_height, 1.5, 1.5);
}

translate([0, total_depth + 9, 0]) mirror([0, 1, 0])
difference() {
cube([width, 10, top_height]);
translate([-0.5, -0.1, (top_height - 6.6) / 2]) cube([width + 1, 8, 6.60]);
}