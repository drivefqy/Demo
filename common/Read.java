package common;

import producer.data_in;

import java.io.*;

/**
 * 实践是检验真理的唯一标准
 */
public class Read {
    public static BufferedReader getinput(data_in path) throws FileNotFoundException {
        return new BufferedReader(new InputStreamReader(new FileInputStream(path.getPath())));
    }
}

