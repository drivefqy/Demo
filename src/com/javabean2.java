package com;

public class javabean2 {
    private double num1;

    public double getNum1() {
        return num1;
    }

    public void setNum1(double num1) {
        this.num1 = num1;
    }

    public double getNum2() {
        return num2;
    }

    public void setNum2(double num2) {
        this.num2 = num2;
    }

    public String getOper_type() {
        return oper_type;
    }

    public void setOper_type(String oper_type) {
        this.oper_type = oper_type;
    }

    private double num2;
    private String oper_type;

    public javabean2() {
    }
    public double calu(){
        if (oper_type.equals("*")){
            return num1*num2;
        } else if (oper_type.equals("-")) {
            return num1-num2;
        }
        else if (oper_type.equals("+")) {
            return num1+num2;
        }
        else {
            return num1/num2;
        }
    }
}
