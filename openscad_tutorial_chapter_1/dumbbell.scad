$fa = 1;
$fs = 0.4;

// handle
rotate([90, 0, 0])
    cylinder(h=30, r=5, center=true);

// weight
translate([0, 18, 0])
    sphere(r=10);
translate([0, -18, 0])
    sphere(r=10);