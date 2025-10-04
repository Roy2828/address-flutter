import 'package:city_picker_example/db/sql_database_helper.dart' show SqlDataBaseHelper;
import 'package:sqflite/sqflite.dart';

/**
 *    desc   :
 *    e-mail : 1391324949@qq.com
 *    date   : 2023/1/28 16:05
 *    author : Roy
 *    version: 1.0
 */
 class BaseDataBase {


  Future<Database> getDataBase() async {
    return await SqlDataBaseHelper.instance.getDataBase();
  }


  //判断表是否存在
  Future<bool> getIsExitTable(name) async {
    return await SqlDataBaseHelper.instance.isExitTable(name);
  }


  Future<List<Map<String, dynamic>>?> query(String code) async {
    //or 表示左右两边只要有一个条件成立
    // and  表示 左右两边条件同时成立
    Database db = await getDataBase();
    String  sql = "SELECT * FROM area_jd where parent_code = $code";
    //sql += " order by desc";
    List<Map<String, dynamic>> maps = await db.rawQuery(sql);
    return maps;
  }

}
