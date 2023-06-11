package producer;
import common.*;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

/**
 * 实践是检验真理的唯一标准
 */
public class producer  {
    String tel = "";
    String name = "";
    String address = "";
    String gender = "";
    String age = "";
    public producer(){

    }

    public void producer_data(data_in in,data_out out) throws IOException {
        ArrayList<ArrayList<String>> list = new ArrayList<>();
        ArrayList<String> list_sub = new ArrayList<>();
        String line = "";
        String datas [] ;
        BufferedReader input = Read.getinput(in);
        BufferedWriter output = Write.getoutput(out);
        while ((line = input.readLine())!= null){
            datas = line.split("\\s+");
            list_sub.add(datas[0]);
            list_sub.add(datas[1]);
            list_sub.add(datas[2]);
            list_sub.add(datas[3]);
            list_sub.add(datas[4]);
            list.add(new ArrayList<>(list_sub));
            list_sub.clear();
        }
        input.close();
        for (int j = 0 ; j < list.size();j++){
            ArrayList<String> i = list.get(j);
            String  months [] = {"01","02","03","04","05","06","07","08","09","10","11","12"};
            String date = "2022";  // 时间
            while (true){
                date = date + months[(int)(Math.random() * 12)] + String.format("%02d",((int)(Math.random() * 31 ) + 1)) +
                        String.format("%02d",(int)(Math.random()*24)) +
                        String.format("%02d",(int)(Math.random()*60)) +
                        String.format("%02d",(int)(Math.random()*60)) + "";
                if (!(date_format.date_legal(date).equals("legal"))){
                    break;
                }
            }
            String durations = String.format("%04d",((int)(Math.random() * 3600) + 1));  // 时长
            while (true){
                int index =  (int)(Math.random() * list.size());
                String tel = list.get(index).get(0);
                if (!(i.get(0).equals(tel))){
                    i.add(tel);
                    i.add(date);
                    i.add(durations);
                    break;
                }
            }
            String result = i.toString().replace("[","").replace("]","") + "\n";
            output.write(result);
            System.out.println(i.toString().replace("[","").replace("]",""));
        }
        Collections.shuffle(list);
        int count = 0;
        for (int j = 0 ; j <500;j++){
            ArrayList<String> i = list.get(j);
            int length = i.size();
            i.remove(length-1);
            i.remove(length-2);
            i.remove(length-3);
            String  months [] = {"01","02","03","04","05","06","07","08","09","10","11","12"};
            String date = "2022";  // 时间
            while (true){
                date = date + months[(int)(Math.random() * 12)] + String.format("%02d",((int)(Math.random() * 31 ) + 1)) +
                        String.format("%02d",(int)(Math.random()*24)) +
                        String.format("%02d",(int)(Math.random()*60)) +
                        String.format("%02d",(int)(Math.random()*60)) + "";
                if (!(date_format.date_legal(date).equals("legal"))){
                    break;
                }
            }
            String durations = String.format("%04d",((int)(Math.random() * 3600) + 1));  // 时长
            while (true){
                int index =  (int)(Math.random() * list.size());
                String tel = list.get(index).get(0);
                if (!(i.get(0).equals(tel))){
                    i.add(tel);
                    i.add(date);
                    i.add(durations);
                    break;
                }
            }
            String result = i.toString().replace("[","").replace("]","") + "\n";
            output.write(result);
            System.out.println(i.toString().replace("[","").replace("]",""));
            if (j % 10 == 0){
                Collections.shuffle(list);
            }
            if(j == list.size()-1){
                j = 0;
            }
            count++;
            if (count == 500){
                break;
            }
        }
        output.close();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
}

