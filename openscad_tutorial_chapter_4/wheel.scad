$fa = 1;
$fs = 0.4;

overlap = 0.001;

module wheel(width=3.5, diameter=8, shaft_connection_diameter=3) {
    outer_diameter = diameter;
    inner_diameter = diameter * 0.7;

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
}

translate([0, 8, 0])
    wheel(2, 4, 2);

translate([0, 4.5, 0])
    wheel(3, 6, 3);

wheel(4, 8, 4);

translate([0, -6, 0])
    wheel(5, 10, 5);