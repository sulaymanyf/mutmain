import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
//time,
//name,
//fajr,
//dhur,
//asr,
//maghrib
//isha);


class ReadSQL{
  static const String tableShelf = "users";
  static const String tableCatalog = "timeCatalog";

  final String dropTableShelf = "DROP TABLE IF EXISTS $tableShelf";
  final String createTableShelf = "CREATE TABLE $tableShelf (id INTEGER PRIMARY KEY AUTOINCREMENT, time TEXT,name TEXT,fajr INTEGER,dhur TEXT,asr INTEGER,maghrib INTEGER,isha INTEGER)";

//
//  final String dropTableCatalog = "DROP TABLE IF EXISTS $tableCatalog";
//  final String createTableCatalog = "CREATE TABLE $tableCatalog (id INTEGER PRIMARY KEY AUTOINCREMENT, mixCode TEXT"
//      ",bookId TEXT,chapterTitle TEXT,chapterId INTEGER,status INTEGER)";

  Database _db;

  Future<Database> get db async{
    if(_db == null){
      _db = await _initDb();
    }
    return _db;
  }

  _initDb() async{
    String basePath = await getDatabasesPath();
    String path = join(basePath,"time.db");
    Database db = await openDatabase(path,version: 2,onCreate: _onCreate,onUpgrade: _onUpgrade);
    return db;

  }

  Future close() async {
    var result = _db.close();
    _db = null;
    return result;
  }

  void _onCreate(Database db, int newVersion) async{
    print("_onCreate newVersion:$newVersion");
    var batch = db.batch();
    batch.execute(dropTableShelf);
    batch.execute(createTableShelf);
    await batch.commit();
  }

  void _onUpgrade(Database db, int oldVersion,int newVersion)async{
    print("_onUpgrade oldVersion:$oldVersion");
    print("_onUpgrade newVersion:$newVersion");

    var batch = db.batch();
    await batch.commit();

  }
}