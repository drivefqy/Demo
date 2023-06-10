package xs;

public class test {
    private String id;
    private String name;
    private int num;
    private double price;

    public test(String id, String name, int num, double price, String type) {
        this.id = id;
        this.name = name;
        this.num = num;
        this.price = price;
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNum() {
        return num;
    }

    public int setNum(int num) {
        this.num = num;
        return this.num;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    private String type;


}
