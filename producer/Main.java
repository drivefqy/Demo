package producer;

import java.io.IOException;

/**
 * 实践是检验真理的唯一标准
 */
public class Main {
    public static void main(String[] args) throws IOException {
        producer producer = new producer();
        producer.producer_data(new data_in("file/input/result.txt"), new data_out("call.log"));
    }
}

