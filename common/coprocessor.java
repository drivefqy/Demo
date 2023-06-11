package common;

import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellScanner;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.coprocessor.ObserverContext;
import org.apache.hadoop.hbase.coprocessor.RegionCoprocessor;
import org.apache.hadoop.hbase.coprocessor.RegionCoprocessorEnvironment;
import org.apache.hadoop.hbase.coprocessor.RegionObserver;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.wal.WALEdit;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

/**
 * 实践是检验真理的唯一标准
 */
public class coprocessor implements RegionObserver,RegionCoprocessor {
    @Override
    public Optional<RegionObserver> getRegionObserver() {
        return Optional.of((RegionObserver) this);
    }

    @Override
    public void postPut(ObserverContext<RegionCoprocessorEnvironment> c, Put put, WALEdit edit, Durability durability) throws IOException {
        Table table = c.getEnvironment().getConnection().getTable(TableName.valueOf(constant.namespace + ":" + constant.tablename_coprocessor));
        //    13288326800 19690662894, 20221001094933, 299
//        Cell tel = put.get(byteutils.a(constant.clf), byteutils.a(constant.tel)).get(0);
//        Cell name = put.get(byteutils.a(constant.clf), byteutils.a(constant.name)).get(0);
//        Cell address = put.get(byteutils.a(constant.clf), byteutils.a(constant.address)).get(0);
//        Cell gender = put.get(byteutils.a(constant.clf), byteutils.a(constant.gender)).get(0);
//        Cell age = put.get(byteutils.a(constant.clf), byteutils.a(constant.age)).get(0);
//        Cell  tel1 = put.get(byteutils.a(constant.clf), byteutils.a(constant.tel1)).get(0);
//        Cell  date_time = put.get(byteutils.a(constant.clf), byteutils.a(constant.date_time)).get(0);
//        Cell  duration = put.get(byteutils.a(constant.clf), byteutils.a(constant.duration)).get(0);
//        String rowkeys = hbase_utils.rowkeys(constant.numpartitions, tel1.toString(), date_time.toString());
//        Put put1 = new Put(byteutils.a(rowkeys));
//        put1.add(tel);
//        put1.add(date_time);
//        put1.add(duration);
//        put1.addColumn(byteutils.a(constant.clf), Bytes.toBytes(constant.flag),Bytes.toBytes(0));
//        table.put(put1);
        table.put(put);
        table.close();

    }
}

