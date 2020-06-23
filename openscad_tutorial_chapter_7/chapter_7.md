# Chapter 7 - repeating patterns of parts

[Back to HOME](../README.md)<br>
[Official document Link](https://en.wikibooks.org/wiki/OpenSCAD_Tutorial/Chapter_7)

## 1. 반복문 만들기

`for (x = [start:step:end]) {...}` 는 반복문의 기본 구조이다. `x` 는 매 회 변경되는 변수이고 `start`, `step`, `end` 는 `start` 부터 시작해서 매 회 `step` 을 더하고 그 수가 `end` 를 넘어가지 않는 숫자 배열이라고 볼 수 있다.

```openscad
for (x = [1:1:10]) {
    translate([0, 0, x - 1])
        cube([x, x, 1], center=true);
}
for (x = [10:-1:1]) {
    translate([0, 0, -x])
        cube([x, x, 1], center=true);
}
```

## 2. 원형으로 반복하기

삼각함수 `sin(x)`, `cos(x)` 와 반복문을 이용해서 원형으로 배치된 모델을 만들 수 있다.

```openscad
for (angle = [0:24:359]) {
    dy = sin(angle);
    dx = cos(angle);
    translate([dx * 10, dy * 10, 0])
        rotate([0, 0, angle])
        cube([10, 1, 1], center=true);
}
```
