$fa = 1;
$fs = 0.4;

overlap=0.001;

// body
rotate([90, 0, 0])
    cylinder(h=30, r1=10, r2=3, center=true);

// head
translate([0, 20 - overlap, 0]) 
    rotate([90, 0, 0])
    cylinder(h=10, r1=5, r2=10, center=true);
translate([0, 25, 0])
    sphere(r=5);

// tail
translate([0, -15 + overlap, 0])
    rotate([90, 0, 0])
    cylinder(h=5, r1=3, r2=7, center=true);