import 'package:sqflite/sqflite.dart';
import 'db_provider.dart';

class BaseModel {

  String tableName;

  BaseModel(this.tableName);

  Future<Map> get(id) async {
    Database db = await DBProvider.db.database;
    List<Map> data = await db.query(this.tableName,
        where: 'id = ?',
        whereArgs: [id],
        limit: 1);
    return data[0];
  }

  Future<List> getBy(key, value) async {
    Database db = await DBProvider.db.database;
    List<Map> data = await db.query(this.tableName,
        where: key + ' = ?',
        whereArgs: [value]
    );
    return data;
  }

  Future<List> getAll() async {
    Database db = await DBProvider.db.database;
    List<Map> data = await db.query(this.tableName,
        orderBy: 'create_time desc'
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

  Future<bool> deleteAll() async {
    Database db = await DBProvider.db.database;
    int count = await db.delete(this.tableName,
      where: 'id > 0',
    );
    return count>0 ? true : false;
  }

  Future<bool> deleteBy(key, value) async {
    Database db = await DBProvider.db.database;
    int count = await db.delete(this.tableName,
      where: key+' = ?',
      whereArgs: [value],
    );

    return count>0 ? true : false;
  }
}