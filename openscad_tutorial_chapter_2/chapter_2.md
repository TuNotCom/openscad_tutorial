# Chapter 2 - scaling a model

[Back to HOME](../README.md)<br>
[Official document Link](https://en.wikibooks.org/wiki/OpenSCAD_Tutorial/Chapter_2)

## 1. 큐브의 크기를 변경해 보기

`scale` 을 이용하여 오브젝트의 크기를 비율로 늘리거나 줄일 수 있다.

```openscad
scale([1.2, 1, 1])
    cube([60, 20, 10], center=true);
```

### 두 개의 큐브 크기를 변경해 보기

`{}` 를 이용해서 한 개 이상의 오브젝트를 제어할 수 있다.

```openscad
scale([1.2, 1, 1]) {
    cube([60, 20, 10], center=true);
    translate([3, 0, 10 - overlap])
        cube([30, 20, 10], center=true);
}
```

## 2. 매개 변수를 사용 해보기

매개 변수를 활용하여 간단하게 여러 개의 오브젝트를 제어하거나, 수치를 제어할 수 있다.

```openscad
wheel_range = 8;
wheel_thickness = 3;
wheel_front_rotate = 15;
wheel_rear_rotate = 0;

translate([-15, -15, 0])
    rotate([90, 0, wheel_front_rotate])
    cylinder(h=wheel_thickness, r=wheel_range, center=true);
translate([-15, 15, 0])
    rotate([90, 0, wheel_front_rotate])
    cylinder(h=wheel_thickness, r=wheel_range, center=true);
translate([15, -15, 0])
    rotate([90, 0, wheel_rear_rotate])
    cylinder(h=wheel_thickness, r=wheel_range, center=true);
translate([15, 15, 0])
    rotate([90, 0, wheel_rear_rotate])
    cylinder(h=wheel_thickness, r=wheel_range, center=true);
```

## 3. `Chapter 1`에서 만든 `car.scad`를 매개 변수화 해보기

위치, 크기 등의 수치를 모두 변수로 만들어 제어할 수 있다.

```openscad
$fa = 1;
$fs = 0.4;

overlap = 0.001;

size_rate = 2;

// body parameters
body_length = 60;
body_width = 15;
body_height = 5;

// shaft parameters
shaft_range = ((body_height / 2) > 3) ? 3 : (body_height / 4 * 0.85);
shaft_width = body_width + 8;

// wheel parameters
wheel_range = 8;
wheel_thickness = 3;
wheel_front_rotate = 15;
wheel_rear_rotate = 0;

// car model
scale([size_rate, size_rate, size_rate]) {
    // body
    cube([body_length, body_width, (body_height / 2)], center=true);
    translate([(body_length / 2 / 10), 0, ((body_height / 2) - overlap)])
        cube([(body_length / 2), body_width, (body_height / 2)], center=true);

    // front, rear wheel shafts
    translate([-(body_length * 0.55 / 2), 0, 0])
        rotate([90, 0, 0])
        cylinder(h=shaft_width, r=1, center=true);
    translate([(body_length * 0.8 / 2), 0, 0])
        rotate([90, 0, 0])
        cylinder(h=shaft_width, r=shaft_range, center=true);

    // 4 wheels
    translate([-(body_length * 0.55 / 2), -(shaft_width / 2 + wheel_thickness / 2 - overlap), 0])
        rotate([90, 0, wheel_front_rotate])
        cylinder(h=wheel_thickness, r=wheel_range, center=true);
    translate([-(body_length * 0.55 / 2), (shaft_width / 2 + wheel_thickness / 2 - overlap), 0])
        rotate([90, 0, wheel_front_rotate])
        cylinder(h=wheel_thickness, r=wheel_range, center=true);
    translate([(body_length * 0.8 / 2), -(shaft_width / 2 + wheel_thickness / 2 - overlap), 0])
        rotate([90, 0, wheel_rear_rotate])
        cylinder(h=wheel_thickness, r=wheel_range, center=true);
    translate([(body_length * 0.8 / 2), (shaft_width / 2 + wheel_thickness / 2 - overlap), 0])
        rotate([90, 0, wheel_rear_rotate])
        cylinder(h=wheel_thickness, r=wheel_range, center=true);
}
```