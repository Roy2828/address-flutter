import 'package:city_picker_example/db/base_data_base.dart';
import 'package:city_picker_example/db/test/bean/address_common_entity.dart';


import 'package:flutter_city_picker/model/address.dart';
import 'package:lpinyin/lpinyin.dart';


class DbManager {
  static DbManager? _instance;

  static DbManager get instance => _instance ??= DbManager._();

  DbManager._() {}

  BaseDataBase db = BaseDataBase();


  Future<List<AddressNode>> query(
      Future<List<Map<String, dynamic>>?> future) async {
    List<Map<String, dynamic>>? addressData = await future;
    if (addressData == null) {
      return [];
    }

    List<AddressNode> result = [];

    for (Map<String, dynamic> item in addressData) {
      AddressCommonEntity data = AddressCommonEntity.fromJson(item);
      if(data.code=="52993" || data.code == "53283" || data.code == "84"){//港澳，海外，钓鱼岛
        continue;
      }
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



  Future<List<AddressNode>> getCityData(String provinceCode) async {
    return await query(db.query(provinceCode));
  }

}
