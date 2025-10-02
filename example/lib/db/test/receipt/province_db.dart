


import 'package:city_picker_example/db/base_data_base.dart';
import 'package:city_picker_example/db/test/ImBaseDataBase.dart';
import 'package:sqflite/sqflite.dart';

class ProvinceDb extends ImBaseDataBase{


  final String table_name = 'province';

  @override
  String tableName() {
     return table_name;
  }


  Future<List<Map<String, dynamic>>?> queryProvince() async {
    return await query("");
  }

}