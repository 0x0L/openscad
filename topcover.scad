
$fn = 256;

//The horizontal radius of the outer ellipse of the sign.
radius = 51.0;

//Total height of the sign
height = 8;

difference() {
    cylinder(h=height, r=radius + 1);
    translate([0, 0, 0.5]) {
        cylinder(h=height, r=radius);
    }
}

translate([0, 0, 6]) {
    difference() {
        cylinder(h=1, r=radius);
        translate([0, 0, -0.25]) {
            cylinder(h=1.5, r=radius - 0.5);
        }
    }
}

echo(version=version());