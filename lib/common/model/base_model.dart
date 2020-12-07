import 'package:sqflite/sqflite.dart';
import 'db_provider.dart';

class BaseModel {

  String tableName;

  BaseModel(this.tableName);

  Future<List> get(id) async {
    Database db = await DBProvider.db.database;
    List<Map> data = await db.query(this.tableName,
        where: 'id = ?',
        whereArgs: [id],
        limit: 1);
    return data;
  }

  Future<List> getBy(key, value) async {
    Database db = await DBProvider.db.database;
    List<Map> data = await db.query(this.tableName,
        where: '? = ?',
        whereArgs: [key, value]
    );
    return data;
  }

  Future<List> getAll() async {
    Database db = await DBProvider.db.database;
    List<Map> data = await db.query(this.tableName,
        orderBy: 'date desc'
    );
    return data;
  }

  Future<int> insert(data) async {
    Database db = await DBProvider.db.database;
    int id = await db.insert(this.tableName,
        data
    );
    return id;
  }

  Future<bool> update(id, data) async {
    Database db = await DBProvider.db.database;
    int count = await db.update(this.tableName,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
    return count>0 ? true : false;
  }

  Future<bool> delete(id) async {
    Database db = await DBProvider.db.database;
    int count = await db.delete(this.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return count>0 ? true : false;
  }
}