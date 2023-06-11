package common;

import producer.data_out;

import java.io.*;

/**
 * 实践是检验真理的唯一标准
 */
public class Write {
    public static BufferedWriter getoutput(data_out path) throws FileNotFoundException {
        return new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path.getPath())));
    }
}

