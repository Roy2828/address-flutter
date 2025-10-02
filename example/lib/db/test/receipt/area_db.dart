import 'package:city_picker_example/db/base_data_base.dart';
import 'package:city_picker_example/db/test/ImBaseDataBase.dart';
import 'package:sqflite/sqflite.dart';

class AreaDb extends ImBaseDataBase {


  final String table_name = 'area';

  @override
  String tableName() {
    return table_name;
  }

  Future<List<Map<String, dynamic>>?> queryArea(String cityCode) async {
     String  sql = " where cityCode = $cityCode";
     return await query(sql);
  }



}