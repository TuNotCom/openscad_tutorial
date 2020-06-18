# Chapter 4 - define your module

[Back to HOME](../README.md)<br>
[Official document Link](https://en.wikibooks.org/wiki/OpenSCAD_Tutorial/Chapter_4)

## 1. 모듈로 만들기

`module` 을 이용해 원하는 이름의 모듈을 만들 수 있고, `{}` 안에 오브젝트를 만들 수 있다. 매개 변수 설정 시 모듈 안에서 설정도 가능하다.

```openscad
module wheel() {
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
}

translate([0, 8, 0])
    wheel();

translate([0, -8, 0])
    wheel();
```

## 2. 모듈의 인자 변수를 추가하고 기본값을 설정하기

`module` 에는 매개 변수가 아닌 인자 변수를 추가할 수 있다. 이를 통해 모듈을 다양한 변화를 주어 불러올 수 있습니다.

참고로, 각 인자 변수는 기본값을 설정할 수 있습니다.

```openscad
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
    wheel();

translate([0, -8, 0])
    wheel(5, 10, 3);
```
