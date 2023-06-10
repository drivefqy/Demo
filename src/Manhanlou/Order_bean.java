package Manhanlou;

/**
 * 实践是检验真理的唯一标准
 */
public class Order_bean {
    private double price;   // 价格
    private int num;        // 数量
    private double sum;   // 合计
    private String name;   //菜名称
    private String classify;   //分类
    private int id;   //id

    public Order_bean(int id,String name,double price,String classify) {
        this.name = name;
        this.classify = classify;
        this.id = id;
        this.price = price;
    }

    public Order_bean(int id,String name,double price,String classify,int num) {
        this.price = price;
        this.num = num;
        this.sum = num*price;
        this.name = name;
        this.classify = classify;
        this.id = id;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "名称:"+name+"\t"+"数量:"+num;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public double getSum() {
        return sum;
    }

    public void setSum(double sum) {
        this.sum = sum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

