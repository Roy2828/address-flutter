

import 'package:city_picker_example/db/base_data_base.dart';
import 'package:city_picker_example/db/test/receipt/area_db.dart';
import 'package:city_picker_example/db/test/receipt/city_db.dart';
import 'package:city_picker_example/db/test/receipt/province_db.dart';
import 'package:city_picker_example/db/test/receipt/street_db.dart';

import 'data_db_method.dart';

class ImBaseDataBase extends BaseDataBase{



  @override
  Future<List<Map<String, dynamic>>?> queryArea(String cityCode) {
     return Future.value([]);
  }

  @override
  Future<List<Map<String, dynamic>>?> queryCity(String provinceCode) {
    return Future.value([]);
  }

  @override
  Future<List<Map<String, dynamic>>?> queryProvince() {
    return Future.value([]);
  }

  @override
  Future<List<Map<String, dynamic>>?> queryStreet(String areaCode) {
    return Future.value([]);
  }

  @override
  String tableName() {
     return "";
  }
}