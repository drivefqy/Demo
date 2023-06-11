package common;

import org.apache.hadoop.hbase.*;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.kafka.common.protocol.types.Field;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * 实践是检验真理的唯一标准
 */
public class hbase_utils {
    public static Connection getconnect() throws IOException {
        HBaseConfiguration conf = new HBaseConfiguration();
        conf.set("hbase.rootdir", "hdfs://192.168.40.101:9000/hbase");
        conf.set("hbase.zookeeper.quorum", "hadoopMaster");
        Connection connection = ConnectionFactory.createConnection(conf);
        return connection;
    }
    public static void create_table(String namespace,String tablename,int numpartitions,String...cfs) throws IOException {
        Admin admin = getconnect().getAdmin();
        String tablename_ = namespace + ":" + tablename;
        try {
            if (admin.tableExists(TableName.valueOf(tablename_))) {

            }else {
                TableDescriptorBuilder builder = TableDescriptorBuilder.newBuilder(TableName.valueOf(tablename_));
                ColumnFamilyDescriptorBuilder cfsbuilder = null;
                for (String i : cfs){
                    cfsbuilder = ColumnFamilyDescriptorBuilder.newBuilder(Bytes.toBytes(i));
                    cfsbuilder.setMaxVersions(3);
                    builder.setColumnFamily(cfsbuilder.build());
                    // 增加了协处理器
                    builder.setCoprocessor(common.coprocessor.class.getName());
                }
                try {
                    admin.createTable(builder.build(),getPartionsKey(numpartitions));
                }catch (Exception e){
                    admin.createNamespace(NamespaceDescriptor.create(namespace).build());
                    admin.createTable(builder.build(),getPartionsKey(numpartitions));
                }finally {
                    System.out.println("表创建成功......");
                    admin.close();
                }
            }
        }catch (Exception e){
            System.out.println("表已存在......");
            return;
        }


    }
    public static byte[][] getPartionsKey(int numpartitions){
        byte arr [][] = new byte[numpartitions-1][];
        for (int i = 0; i < numpartitions -1;i++){
            arr[i] = (i + "|").getBytes();
        }
        return arr;
    }
    public static String rowkeys(int numpartitions,String tel,String date){
        String rowkey = "";
        if (date == null ||date.length() < 10 ){
            rowkey = tel.substring(2) + (int)((Math.random()*100) + 11);
            date = "null";
        }else {
            rowkey = tel.substring(6) + date.substring(9);
        }
        int hashcode = rowkey.hashCode();
        if (hashcode < 0){
            hashcode = hashcode & Integer.MAX_VALUE;
        }
        if ((numpartitions & (numpartitions - 1 )) == 0 ){
            return (hashcode & (numpartitions - 1))+ "_" + tel + "_"+date;
        }else {
            return hashcode % numpartitions + "_" + tel + "_"+date;
        }
    }
    public static void put(String tablename,String rowkey, String [] clf, String [] col, String [] value) throws IOException {
        Table table = getconnect().getTable(TableName.valueOf(tablename));
        ArrayList<Put> list = new ArrayList<>();
        Put put = new Put(Bytes.toBytes(rowkey));
        if (col.length != value.length){
            throw  new length_equal("列长度和值长度不相等...");
        }else {
            for (String i : clf){
                byte[] clf_ = Bytes.toBytes(i);
                for (int j = 0 ; j < col.length;j++){
                    put.addColumn(clf_,Bytes.toBytes(col[j]),Bytes.toBytes(value[j]));
                    list.add(put);
                }
            }
            table.put(list);
            table.close();
        }
        }
    public static  void scan(String tablename,String startkeys,String endkeys) throws IOException {
        Table table = getconnect().getTable(TableName.valueOf(tablename));
        Scan scan = new Scan();
        scan.withStartRow(Bytes.toBytes(startkeys));
        scan.withStopRow(Bytes.toBytes(endkeys));
        ResultScanner reslults = table.getScanner(scan);
        Iterator<Result>  RowDatas = reslults.iterator();
        while (RowDatas.hasNext()){
            Cell[] rowdata = RowDatas.next().rawCells();
            for (Cell i : rowdata){
                System.out.println("rowkey:" + new String(CellUtil.cloneRow(i))+ "    name:" + new String(CellUtil.cloneQualifier(i)) + "    value:"+new String(CellUtil.cloneValue(i)));
            }
        }
        table.close();
    }

}
class length_equal extends RuntimeException{
    public length_equal(String message) {
        super(message);
    }
}

