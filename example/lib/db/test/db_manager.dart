import 'package:city_picker_example/db/test/bean/address_common_entity.dart';
import 'package:city_picker_example/db/test/receipt/area_db.dart';
import 'package:city_picker_example/db/test/receipt/city_db.dart';
import 'package:city_picker_example/db/test/receipt/province_db.dart';
import 'package:city_picker_example/db/test/receipt/street_db.dart';
import 'package:flutter_city_picker/model/address.dart';
import 'package:lpinyin/lpinyin.dart';
import 'ImBaseDataBase.dart';
import 'data_db_method.dart';


class DbManager {
  static DbManager? _instance;

  static DbManager get instance => _instance ??= DbManager._();

  DbManager._() {}

  DataDBMethod provinceDb = ProvinceDb();
  DataDBMethod cityDb = CityDb();
  DataDBMethod areaDb = AreaDb();
  DataDBMethod streetDb = StreetDb();

  Future<List<AddressNode>> query(
      Future<List<Map<String, dynamic>>?> future) async {
    List<Map<String, dynamic>>? addressData = await future;
    if (addressData == null) {
      return [];
    }

    List<AddressNode> result = [];

    for (Map<String, dynamic> item in addressData) {
      AddressCommonEntity data = AddressCommonEntity.fromJson(item);
      String letter = PinyinHelper.getFirstWordPinyin(data.name ?? "")
          .substring(0, 1)
          .toUpperCase();
      result.add(
        AddressNode(
          name: data.name,
          code: '${data.code}',
          letter: letter,
        ),
      );
    }

    return result;
  }

  Future<List<AddressNode>> getProvinceData() async {
    return await query(provinceDb.queryProvince());
  }

  Future<List<AddressNode>> getCityData(String provinceCode) async {
    return await query(cityDb.queryCity(provinceCode));
  }

  Future<List<AddressNode>> getAreaData(String cityCode) async {
    return await query(areaDb.queryArea(cityCode));
  }

  Future<List<AddressNode>> getStreetData(String areaCode) async {
    return await query(streetDb.queryStreet(areaCode));
  }
}
