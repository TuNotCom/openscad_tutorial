$fa = 1;
$fs = 0.4;

overlap=0.001;

// head
translate([0, 0, 40])
    sphere(r=9);
translate([0, 0, 30])
    cylinder(h=3, r=10, center=true);

// body
translate([0, 0, 17.5 - (overlap * 3)])
    cylinder(h=35, r1=8, r2=5, center=true);
translate([0, 0, 6 - (overlap * 2)])
    cylinder(h=12, r1=10, r2=9, center=true);
translate([0, 0, 3 - overlap])
    cylinder(h=6, r1=15, r2=12, center=true);
translate([0, 0, -0.5 + overlap])
    cylinder(h=1, r=14, center=true);