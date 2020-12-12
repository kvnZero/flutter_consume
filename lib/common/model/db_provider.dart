import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider{
  DBProvider._();
  static final DBProvider db = DBProvider._();
  Database _database;
  Future<Database> get database async {
    if (_database != null)
      return _database;

    // 如果数据库不存在
    _database = await initDB();
    return _database;
  }
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "consume.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Bill ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "source TEXT,"
          "type INTEGER,"
          "pay_time TEXT,"
          "pay_money INTEGER,"
          "number INTEGER,"
          "create_time timestamp default (datetime('now','localtime'))"
          ")");
      await db.execute("CREATE TABLE Record ("
          "id INTEGER PRIMARY KEY,"
          "bill_id INTEGER,"
          "create_time timestamp default (datetime('now','localtime'))"
          ")");
      await db.execute("CREATE TABLE BillMeta ("
          "id INTEGER PRIMARY KEY,"
          "bill_id INTEGER,"
          "name TEXT,"
          "value TEXT"
          ")");
      await db.execute("CREATE TABLE Config ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "value TEXT"
          ")");
    });
  }
}

