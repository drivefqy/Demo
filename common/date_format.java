package common;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 实践是检验真理的唯一标准
 */
public class date_format {
    public static String  date_legal(String str){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        try {
            LocalDateTime date = LocalDateTime.parse(str, dtf);
        }catch (Exception e){
            return "legal";
        }
        return str;
    }
}

