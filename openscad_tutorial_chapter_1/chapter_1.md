# Chapter 1 - make a cube

[Back to HOME](../README.md)<br>
[Official document Link](https://en.wikibooks.org/wiki/OpenSCAD_Tutorial/Chapter_1)

## 1. 큐브 만들기

`size` parameter를 통해 크기를 설정하여 `x`, `y`, `z` 모두 `size` 길이로 큐브를 생성할 수 있다.

```openscad
cube(size=10);
```

## 2. 측면의 길이가 다른 큐브 만들기

`size` parameter 를 사용하지 않고, 숫자 세 개의 배열을 사용하면 `[x, y, z]` 각 측면의 길이를 설정할 수 있다.

```openscad
cube([20, 30, 50]);
```

## 3. 가운데에 큐브를 만들기

`center` parameter 를 이용해 초기 생성되는 위치를 3축의 가운데로 설정 할 수 있다.

```openscad
cube([20, 30, 50], center=true);
```

### 사이즈가 다른 큐브를 만들기

```openscad
cube([60, 20, 10], center=true);
```

## 4. 크기가 다른 두 개의 큐브 만들기

작은 큐브는 큰 큐브에 완전히 덮히는 크기로 큰 큐브에 가려져 보이지 않는다.

```openscad
cube([60, 20, 10], center=true);
cube([30, 20, 10], center=true);
```

## 5. 두 개의 겹치는 큐브를 만들기

`translate` 는 오브젝트의 위치를 변경하는 `transformations` 메소드 중 하나 이다.
`translate` 를 이용해 큐브의 위치를 변경 할 수 있다.

```openscad
cube([60, 20, 10], center=true);
translate([0, 0, 5])
    cube([30, 20, 10], center=true);
```

## 6. 면이 맞닿는 두 개의 큐브를 만들기

큐브 두 개를 만들어 서로의 면을 닿도록 만들어보자, 이 경우는 합쳐진 하나의 오브젝트인지
두 개의 서로 다른 오브젝트인지 `openSCAD`가 명확히 하지 못 할 수도 있다.

```openscad
cube([60, 20, 10], center=true);
translate([0, 0, 10])
    cube([30, 20 ,10], center=true);
```

## 7. Overlap을 이용하여 하나의 오브젝트로 만들기

`translate([0, 0, 10])` 에서 `10`을 `0.001 ~ 0.002` 정도 `overlap` 시키면 명확하지 못 한 상황을 회피할 수 있다.

```openscad
cube([60, 20, 10], center=true);
translate([0, 0, 9.999])
    cube([30, 20, 10], center=true);
```

### 혹은 `size` 에 `overlap`을 빼주는 방법

`10` 에서 `0.001`을 빼는 것도 확실한 방법이다.

```openscad
cube([60, 20, 10], center=true);
tanslate([0, 0, 10 - 0.001])
    cube([30, 20, 10], center=true);
```

## 8. 원통 만들기

`h`와 `r`을 설정하여 원통을 만들 수 있다.

```openscad
translate([0, -20, 0])
    cylinder(h=3, r=8);
```

## 9. 원통을 회전하기

`rotate` 메소드를 사용하여 오브젝트를 회전 시킬 수 있다. 회전 축은 `x`, `y`, `z` 축을 기준으로 한다.

```openscad
rotate([90, 0, 0,])
    translate([0, -20, 0])
    cyliner(h=3, r=8);
```

### 원통이 `z` 축으로 움직였다?

`rotate`와 `translate`의 명령문 순서가 `translate` 이후 `rotate` 이기 때문이다.
`y`축을 기준으로 `-20` 만큼 `translate` 한 뒤 `x`를 기준으로 `90` 만큼 `rotate` 된 것.
이 순서를 바꾸면 원통은 예상했던 것 처럼 `y`축으로 움직이게 된다.

```openscad
translate([0, -20, 0])
    rotate([90, 0, 0])
    cylinder(h=3, r=8, center=true);
```

## 자동차 모형 만들기 (Tutorial)

```openscad
$ fa = 1;
$ fs = 0.4;

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
```

## 추가 창작해보기

### 책상

```openscad
$fa = 1;
$fs = 0.4;

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
```

### 아령

```openscad
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
```

### 미사일

```openscad
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
```

### 체스 폰

```openscad
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
```
