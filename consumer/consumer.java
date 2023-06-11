package consumer;

import common.Read;
import common.constant;
import common.hbase_utils;
import org.apache.hadoop.hbase.NamespaceDescriptor;
import org.apache.kafka.clients.KafkaClient;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.serialization.StringDeserializer;
import producer.data_in;

import javax.security.auth.login.Configuration;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;

import static common.hbase_utils.rowkeys;

/**
 * 实践是检验真理的唯一标准
 */
public class consumer {
    public static void main(String[] args) throws IOException {
        Properties properties = new Properties();
//        properties.load(Read.getinput(new data_in("file/conf.properties")));
        properties.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG,"192.168.40.101:9092,192.168.40.102:9092");
        properties.put(ConsumerConfig.GROUP_ID_CONFIG,"1");
        properties.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        properties.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        properties.put(ConsumerConfig.MAX_POLL_RECORDS_CONFIG, 600);
        properties.put(ConsumerConfig.FETCH_MIN_BYTES_CONFIG, 1024);
        properties.put(ConsumerConfig.FETCH_MAX_WAIT_MS_CONFIG, 200);
        properties.put(ConsumerConfig.FETCH_MAX_BYTES_CONFIG,1024*1024);
        KafkaConsumer<String, String> consumer = new KafkaConsumer<String, String>(properties);
        ArrayList<String> topics = new ArrayList<>();
        topics.add("project");
        consumer.subscribe(topics);
        String value = "";

//        hbase_utils.getconnect().getAdmin().createNamespace(NamespaceDescriptor.create(constant.namespace).build());

        // 创建表
        hbase_utils.create_table(constant.namespace,constant.tablename,constant.numpartitions,constant.clf);
        //hbase_utils.create_table(constant.namespace,constant.tablename_coprocessor,constant.numpartitions,constant.clf);

        String startkey = "";
        String endkey = "";
        while (true){
            ConsumerRecords<String, String> datas = consumer.poll(Duration.ofSeconds(10));
            Iterator<ConsumerRecord<String, String>> iterator = datas.iterator();
            while (iterator.hasNext()){
                ConsumerRecord<String, String> data1 = iterator.next();
                String[] data = data1.value().split(", ");
                System.out.println("value: " + data1.value());
//                value:19281287735, 老夫子, 北京市-金华, 男, 86, 15303846901, 20221223023115, 0010
                String col  [] = {constant.tel,constant.name,constant.address,constant.gender,
                        constant.age,constant.tel1,constant.date_time,constant.duration};
                String col_  [] = {constant.tel,constant.name,constant.address,constant.gender,
                        constant.age};
                String clf [] = {constant.clf};
                if (data.length == 5){
//                    13907346955, 仪琳, 青海省-南通, 男, 79
                    hbase_utils.put(constant.namespace + ":" + constant.tablename,
                            rowkeys(constant.numpartitions,data[0],""),clf,col_,data);
                    startkey = hbase_utils.rowkeys(constant.numpartitions, data[0], "");
                    System.out.println("rowkey: "+startkey);
                }else {
                    hbase_utils.put(constant.namespace + ":" + constant.tablename,
                            rowkeys(constant.numpartitions,data[0],data[6]),clf,col,data);
                    endkey =hbase_utils.rowkeys(constant.numpartitions, data[0], data[6]);
                    System.out.println("rowkey: "+endkey);
                }
                System.out.println("==============================");
            }
            System.out.println("===================== scan =============================");
            hbase_utils.scan(constant.namespace + ":" + constant.tablename,startkey,endkey);
            System.out.println("================  协处理器的数据 ===================");
            hbase_utils.scan(constant.namespace + ":" + constant.tablename_coprocessor,"","");
        }
    }
}

