import 'package:city_picker_example/db/base_data_base.dart';
import 'package:city_picker_example/db/test/ImBaseDataBase.dart';
import 'package:sqflite/sqflite.dart';

class StreetDb extends ImBaseDataBase {


  final String table_name = 'street';

  @override
  String tableName() {
    return table_name;
  }


  Future<List<Map<String, dynamic>>?> queryStreet(String areaCode) async {
    String  sql = " where areaCode = $areaCode";
    return await query(sql);
  }

}