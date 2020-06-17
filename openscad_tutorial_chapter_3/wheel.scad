$fa = 1;
$fs = 0.4;

overlap = 0.001;

width = 3.5;
outer_diameter = 8;
inner_diameter = outer_diameter * 0.7;
shaft_connection_diameter = 3;

difference() {
    intersection() {
        sphere(r=(outer_diameter / 2));
        cube([outer_diameter, width, outer_diameter], center=true);
    }
    rotate([90, 0, 0]) {
        cylinder(r=(inner_diameter / 2), h=(width + 0.1), center=true);
    }
}
rotate([90, 0, 0]) {
    difference() {
        cylinder(r=(inner_diameter / 2), h=(width * 1.1), center=true);
        cylinder(r=(shaft_connection_diameter / 2), h=10, center=true);
    }
}