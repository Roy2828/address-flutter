



import 'package:city_picker_example/db/base_data_base.dart';
import 'package:city_picker_example/db/test/ImBaseDataBase.dart';
import 'package:sqflite/sqflite.dart';

class CityDb extends ImBaseDataBase {


  final String table_name = 'city';

  @override
  String tableName() {
    return table_name;
  }


  Future<List<Map<String, dynamic>>?> queryCity(String provinceCode) async {
    String  sql = " where provinceCode = $provinceCode";
    return await query(sql);
  }
}