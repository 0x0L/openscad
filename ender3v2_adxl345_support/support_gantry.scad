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

translate([0, -depth / 2, 0]) {
    difference() {
        cube([width, depth, height], center=true);
        translate([right_clear - (width - diameter) / 2, 0, -top_clear + diameter / 2]) union() {
            rotate([90, 90, 0]) cylinder(1.1 * depth, diameter / 2, diameter / 2, center=true);
            translate([0, 0, -diameter / 4]) cube([diameter, 1.1 * depth, diameter / 2], center=true);
        }
    }
}

translate([0, right_clear / 2 + fix_width]) union() {
translate([(width  - left_clear2) / 2, 0, 0]) cube([left_clear2, right_clear, height], center=true);
translate([-(width - 1.75) / 2, 0, 0]) cube([1.75, right_clear, height], center=true);
translate([0, 0, height / 2 - right_clear]) cube([width, right_clear, 2 * right_clear], center=true);
}

translate([-width / 2, -total_depth + right_clear + fix_width, height / 2]) difference() {
    cube([width, total_depth, top_height]);
    translate([width / 2 - 15.6 / 2, total_depth / 2 + depth / 2, 1]) cylinder(top_height, 1.5, 1.5);
    translate([width / 2 + 15.6 / 2, total_depth / 2 + depth / 2, 1]) cylinder(top_height, 1.5, 1.5);
}
