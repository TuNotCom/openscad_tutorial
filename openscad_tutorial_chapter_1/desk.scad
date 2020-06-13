$fa = 1;
$fs = 0.4;

overlap=0.001;

// top plate
translate([0, 0, 30])
    cube([30, 50, 2], center=true);

// 4 feet
translate([11, 21, 15.5])
    cylinder(h=31, r=1.5, center=true);
translate([-11, 21, 15.5])
    cylinder(h=31, r=1.5, center=true);
translate([11, -21, 15.5])
    cylinder(h=31, r=1.5, center=true);
translate([-11, -21, 15.5])
    cylinder(h=31, r=1.5, center=true);

// feet bridges
translate([11, 0, 12])
    rotate([90, 0, 0])
    cylinder(h=40, r=1, center=true);
translate([0, 21, 12])
    rotate([0, 90, 0])
    cylinder(h=20, r=1, center=true);
translate([0, -21, 12])
    rotate([0, 90, 0])
    cylinder(h=20, r=1, center=true);