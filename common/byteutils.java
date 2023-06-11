package common;

import org.apache.hadoop.hbase.util.Bytes;

/**
 * 实践是检验真理的唯一标准
 */
public class byteutils {
    public static byte[] a(String str){
        return Bytes.toBytes(str);
    }
}

