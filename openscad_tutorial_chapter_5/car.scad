$fa = 1;
$fs = 0.4;

include <wheel.scad>

overlap = 0.001;

size_rate = 2;

// body parameters
body_length = 30;
body_width = 10;
body_height = 5;

// wheel parameters
wheel_range = 8;
wheel_thickness = 3;
wheel_front_rotate = 15;
wheel_rear_rotate = 0;

// shaft parameters
shaft_range = (((body_height / 2) > 3) ? 3 : (body_height / 4 * 0.85)) * 2;
shaft_width = body_width + wheel_thickness * 2;

module car() {
    // body
    cube([body_length, body_width, (body_height / 2)], center=true);
    translate([(body_length / 2 / 10), 0, ((body_height / 2) - overlap)])
        cube([(body_length / 2), body_width, (body_height / 2)], center=true);

    // front, rear wheel shafts
    translate([-(body_length * 0.55 / 2), 0, 0])
        rotate([90, 0, 0])
        cylinder(h=shaft_width, r=shaft_range / 2, center=true);
    translate([(body_length * 0.8 / 2), 0, 0])
        rotate([90, 0, 0])
        cylinder(h=shaft_width, r=shaft_range / 2, center=true);

    // 4 wheels
    translate([-(body_length * 0.55 / 2), -(shaft_width / 2 - overlap), 0])
        wheel(width=wheel_thickness, diameter=wheel_range, shaft_connection_diameter=shaft_range);
    translate([-(body_length * 0.55 / 2), (shaft_width / 2 - overlap), 0])
        wheel(width=wheel_thickness, diameter=wheel_range, shaft_connection_diameter=shaft_range);
    translate([(body_length * 0.8 / 2), -(shaft_width / 2 - overlap), 0])
        wheel(width=wheel_thickness, diameter=wheel_range, shaft_connection_diameter=shaft_range);
    translate([(body_length * 0.8 / 2), (shaft_width / 2 - overlap), 0])
        wheel(width=wheel_thickness, diameter=wheel_range, shaft_connection_diameter=shaft_range);
}

// car model
scale([size_rate, size_rate, size_rate]) {
    car();
}
