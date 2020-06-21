# Chapter 3 - make a sphere

[Back to HOME](../README.md)<br>
[Official document Link](https://en.wikibooks.org/wiki/OpenSCAD_Tutorial/Chapter_3)

## 1. 구체 만들기

`sphere` 로 구체를 만들 수 있다.

```openscad
sphere(r=10);
```

## 2. 만들어진 구체의 크기 재조정 하기

`resize` 를 통해 크기를 재조정 할 수 있고, 동작하는 기능이 `scale` 과 많이 비슷하지만 `크기`를 조정하는 점과 `비율`을 조정하는 점에서 차이가 있다.

```openscad
translate([0, 10, 0])
    scale([1, 0.5, 1])
    sphere(r=10);

resize([20, 10, 20])
    sphere(r=10);
```

## 3. 두 구체를 결합하기

기본적으로 두 개의 오브젝트를 겹쳐 놓으면 결합된 것으로 간주한다. `union` 을 사용하여 명확하게 표현 할 수도 있다. `A ∪ B` 와 같다.

```openscad
sphere(r=10);
translate([0, 10, 0])
    sphere(r=10);

translate([30, 0, 0])
    union() {
        sphere(r=10);
        translate([0, 10, 0])
            sphere(r=10);
    }
```

## 4. 구체에 구멍을 만들기

`difference` 를 이용해서 오브젝트에 구멍을 내거나 원하는 모양으로 깍을 수 있다. 첫 번째 오브젝트에서 그 뒤로 생성되는 두 번째, 세 번째 오브젝트를 깍아 낸다. `A - B` 와 같다.

```openscad
difference() {
    sphere(r=10);
    cylinder(h=21, r=5, center=true);
}
```

## 5. 두 구체의 겹치는 부분만 남기기

`intersection` 을 이용하면 모든 오브젝트의 겹치는 부분만 남길 수 있다. `A ∩ B` 와 같다.

```openscad
translate([30, 0, 0])
    intersection() {
        sphere(r=10);
        translate([0, 10, 0])
            sphere(r=10);
    }

intersection() {
    sphere(r=10);
    translate([0, 5, 0])
        sphere(r=10);
    translate([5, 0, 0])
        sphere(r=10);
}
```

## 6. `Chapter 3` 에서 수정한 `car.scad`의 바퀴를 만들어 보자

```openscad
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
```
