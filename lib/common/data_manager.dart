
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DBManager {
  DBManager._internal();
  static final DBManager _instance = DBManager._internal();
  //数据库路径
  String dbPath;
  //数据库
  Database _database;
  //数据库版本
  int dbVersion = 1;
  static DBManager getInstance() =>_instance;
  //打开数据库
  Future initDb(String dbName) async{
    if(null==dbPath){
      dbPath =  await getDatabasesPath();
      //如果数据库存在，而且数据库没有关闭，先关闭数据库
      closeBb();
      _database = await openDatabase("$dbPath/$dbName.db",version: dbVersion,onCreate: (Database db,int version) async{
        await db.execute('CREATE TABLE article_table (id Text PRIMARY KEY,desc TEXT,author TEXT,title TEXT,imageUrl TEXT,createdAt TEXT)');
      });
    }
  }
  //插入数据
  Future<void> insertData<T extends DbBaseBean>(T t) async{
    if(_database==null||!_database.isOpen) return;
    await _database.insert(t.getTableName(), t.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //删除数据
  Future deleteData<T extends DbBaseBean>(T t,{String key,String value}) async{
    if (null == _database || !_database.isOpen) return null;
    if(key==null){
      await _database.delete(t.getTableName());

    }else{
      await _database.delete(t.getTableName(),where: (key+"=?"),whereArgs: [value]);
    }

  }
  //更新数据
  Future updateData<T extends DbBaseBean>(T t,{String key,String value}) async{
    if(_database==null||!_database.isOpen) return;
    await _database.update(t.getTableName(), t.toJson(),
        where: (key+"=?"),whereArgs: [value]);
  }

  //查询
  Future<List<T>> queryItems<T extends DbBaseBean>(T t,{String key,String value}) async{

    List<Map<String,dynamic>> maps = [];
    if(key==null){
      maps = await _database.query(t.getTableName());

    }else{
      maps = await _database.query(t.getTableName(),
          where: (key+"=?"),whereArgs: [value]);
    }
    return List.generate(maps.length, (index) =>  t.fromJson(maps[index]));
  }

  closeBb() async{
    // 如果数据库存在，而且数据库没有关闭，先关闭数据库
    if (null != _database && _database.isOpen) {
      await _database.close();
      _database = null;
    }
  }
}

abstract class DbBaseBean{
  ///实体转换Map
  Map<String,dynamic> toJson();

  DbBaseBean fromJson(Map<String,dynamic> map);

  String getTableName();
}