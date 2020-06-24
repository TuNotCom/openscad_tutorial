# Chapter 8 - draw 2d object and extrue them into 3d object

[Back to HOME](../README.md)<br>
[Official document Link](https://en.wikibooks.org/wiki/OpenSCAD_Tutorial/Chapter_8)

## 1. 원 그리기

`circle` 을 이용해 2차원 원을 그릴 수 있다.

```openscad
circle(d=10);
```

## 2. 도넛을 만들기

`rotate_extrude` 를 이용하여 2차원 그림을 회전 시켜 3d 오브젝트로 만들 수 있다.

```openscad
rotate_extrude(angle=360, convexity=1) {
    translate([10, 0, 0])
        circle(r=5);
}
```

## 3. 일직선으로 돌출 시키기

`linear_extrude` 를 이용하여 2차원 그림을 일직선으로 돌출 시켜 3d 오브젝트로 만들 수 있다.

```openscad
linear_extrude(height=50) {
    resize([5, 10, 0])
        circle(r=5);
}
```

`twist` 파라미터를 이용해 오브젝트를 꼬아서 돌출 시킬 수도 있다.

```openscad
linear_extrude(height=50, twist=90) {
    resize([5, 10, 0])
        circle(r=5);
}
```