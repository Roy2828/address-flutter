import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class SqlDataBaseHelper {
  static SqlDataBaseHelper? _instance;

  static SqlDataBaseHelper get instance => _instance ??= SqlDataBaseHelper._();

  SqlDataBaseHelper._() {}

  static const _DATABASE_NAME = "address.sqlite"; //数据库名字
  static const _DATABASE_VERSION = 1; //当前版本
  Database? _database;

  init() async {
    var databasePath = await getDatabasesPath(); //        /data/user/0/com.soudian.roc/databases
    String dbPath = join(databasePath, _DATABASE_NAME);
    if (!await databaseExists(dbPath)) {
      print("正在从 assets 创建数据库副本...");
      //rootBundle 从 assets 加载资源
      ByteData data = await rootBundle.load('assets/db/$_DATABASE_NAME');
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes);
    }

    _database = await openDatabase(
      dbPath,
      version: _DATABASE_VERSION,
      onCreate: (Database db, int version) async {},
    );
  }



  Future<Database> getDataBase() async {
    if (_database == null) {
      await init();
    }
    return _database!;
  }

  //判断表是否创建了
  Future<bool> isExitTable(String tableName) async {
    await getDataBase();
    var res = await _database!.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  //关闭数据库流
  void close() {
    _database?.close();
    _database = null;
  }
}
