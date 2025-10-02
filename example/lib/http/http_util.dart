import 'package:dio/dio.dart';
import 'package:flutter_city_picker/model/address.dart';
import 'package:lpinyin/lpinyin.dart';

import 'model.dart';

class HttpUtils {
  static Future<List<AddressNode>> getCityData(String keywords) async {
    //https://fts.jd.com/area/get?fid={父级ID}
    /*查询所有国家：fid=-1
    查询中国所有省份：fid=4744(4744是中国的ID)
    查询河南省所有城市：fid=7(7是河南省的ID)
    查询周口市所有区县：fid=527(527是周口市的ID)*/
    var url = 'https://fts.jd.com/area/get';
    var param = {
      "fid": keywords,
    };
    var dio = Dio();
    Response response = await dio.request(url, queryParameters: param);
    List<Map<String, dynamic>>? data  =  response.data.cast<Map<String, dynamic>>();
    List<AddressNode> result = [];
    if (data !=null) {

      for (int i = 0; i < data.length; i++) {
        Map<String, dynamic> item = data[i];
        if(item['areaCode'] == "1"){//海外 id 53283
          continue;
        }
        String letter =
            PinyinHelper.getFirstWordPinyin(item['name'])
                .substring(0, 1)
                .toUpperCase();
        result.add(
          AddressNode(
            name: item['name'],
            code: "${item['id']}",
            letter: letter,
          ),
        );
      }
    }
    return result;
  }
}
