package xs;
public class User {
    private String name;
    private String age;
    private String pwd;
    public User(){
        //无参构造方法必须提供，方便反射
    }

    public User(String name, String age, String pwd, String phnum) {
        this.name = name;
        this.age = age;
        this.pwd = pwd;
        this.phnum = phnum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPhnum() {
        return phnum;
    }

    public void setPhnum(String phnum) {
        this.phnum = phnum;
    }

    private String phnum;
    public boolean check(){
        System.out.println(this.name);
        System.out.println(this.pwd);
        if (this.name.equals("lihua")&&this.pwd.equals("123")){
            return true;
        }
        return false;
    }

}
