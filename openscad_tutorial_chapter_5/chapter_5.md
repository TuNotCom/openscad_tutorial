# Chapter 5 - import your module

[Back to HOME](../README.md)<br>
[Official document Link](https://en.wikibooks.org/wiki/OpenSCAD_Tutorial/Chapter_5)

## 1. `wheel.scad` 와 `car.scad` 각각 만들기

`wheel` 이 정의된 `wheel.scad` 와 `car` 가 정의된 `car.scad` 를 각각의 파일로 나눈다.

```openscad
./wheel.scad
module wheel() {...}
wheel();

./car.scad
module car() {...}
```

## 2. `wheel.scad` 를 `car.scad` 에 포함시키기

`include` 를 이용하여 스크립트를 포함 시킬 수 있다. 다음과 같이 코드를 구성할 경우 `car` 가운데에 아직 만들지 않은 `wheel`이 생긴 것을 확인할 수 있다. 이는 `wheel.scad` 에서 생성한 오브젝트가 그대로 포함되기 때문이다.

```openscad
./wheel.scad
module wheel() {...}
wheel();

./car.scad
include <wheel.scad>
module car() {...}
```

오브젝트를 생성하지 않으면 해결이 된다.

```openscad
./wheel.scad
module wheel() {...}

./car.scad
include <wheel.scad>
module car() {...}
```
