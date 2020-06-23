# Chapter 6 - variable and flow control

[Back to HOME](../README.md)<br>
[Official document Link](https://en.wikibooks.org/wiki/OpenSCAD_Tutorial/Chapter_6)

## 1. 변수 값의 종류

변수는 세 가지 종류의 값을 가질 수 있다.

 - 숫자 `1`, `3.14`
 - 문자 `"character"`, `"string"`
 - 부울 `true`, `false`

```openscad
integer = 1;
float = 3.14;
character = "c";
string = "string";
boolean = true;
```

## 2. 조건부 할당

`(condition) ? true : false` 는 조건부 할당의 기본 구조이다. `condition` 에 비교 연산을 하고 참이면 `true` 에 해당하는 값, 거짓이면 `false` 에 해당하는 값을 할당 할 수 있다.

```openscad
i_am_long = true;
my_tall = (i_am_long) ? 185 : 170;
my_weight = 80;
i_am_fat = (my_weight > 80) true : false;
```

## 3. 조건문 만들기

`if (condition) {...}` 는 조건문의 기본 구조이다. `condition` 에 비교 연산을 하고 참이면 `{...}` 에 해당하는 동작을 할 수 있다.

```openscad
has_body = false;
has_hat = true;

translate([0, 0, 2.5])
    cube(size=5, center=true);

if (has_body) {
    translate([0, 0, -5])
        cube(size=10, center=true);
}

if (has_hat) {
    translate([0, 0, 6])
        union() {
            cube([6.5, 6.5, 2], center=true);
            translate([0, 0, 2])
                cube([3, 3, 3], center=true);
        }
}
```

