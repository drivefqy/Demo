import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import java.time.LocalDate;
import java.util.Date;

public class Main {
    public static void main(String[] args) {
//        String s1 = LocalDate.now().toString().replaceAll("[-,\\s+]", "");
//        String id = s1+1+1;
//        System.out.println(id);
//        LocalDate now = LocalDate.now();
//        System.out.println(now);
//        System.out.println("Hello world!");
//        try {
//            Socket s = new Socket("127.0.0.1",9999);
//            InputStream is = s.getInputStream();
//            OutputStream os = s.getOutputStream();
//            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os));
//            bw.write("hello world!!!!!!");
//            bw.flush();
//            BufferedReader br = new BufferedReader(new InputStreamReader(is));
//            String mess = br.readLine();
//            System.out.println("服务器：======================="+mess);
//
//        } catch (UnknownHostException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        String s1 = LocalDate.now().toString().replaceAll("[-,\\s+]", "");
        String format =  s1 + String.format("%02d", 1);
        System.out.println(format);
        String format1 = "admin" + String.format("%05d", 5);
        System.out.println(format1);
    }
}
