package com;

public class javabean1 {
    private double radius;

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public javabean1() {

    }
    public double area(){
        return 3.14*radius*radius;
    }
    public double circ(){
        return 3.14*2*radius;
    }
}
