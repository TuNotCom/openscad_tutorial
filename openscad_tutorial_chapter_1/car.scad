$fa = 1;
$fs = 0.4;

overlap=0.001;

// body
cube([60, 20, 10], center=true);
translate([3, 0, 10 - overlap])
    cube([30, 20, 10], center=true);

// 4 wheels
translate([-15, -15, 0])
    rotate([90, 0, 0])
    cylinder(h=3, r=8, center=true);
translate([-15, 15, 0])
    rotate([90, 0, 0])
    cylinder(h=3, r=8, center=true);
translate([15, -15, 0])
    rotate([90, 0, 0])
    cylinder(h=3, r=8, center=true);
translate([15, 15, 0])
    rotate([90, 0, 0])
    cylinder(h=3, r=8, center=true);

// front, rear wheel shafts
translate([-15, 0, 0])
    rotate([90, 0, 0])
    cylinder(h=28, r=3, center=true);
translate([15, 0, 0])
    rotate([90, 0, 0])
    cylinder(h=28, r=3, center=true);