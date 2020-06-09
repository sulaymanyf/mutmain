import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

final String tableUser = 'users';
final String columnId = 'id';
final String columnTime = 'time';
final String columnName = 'name';
final String columnFajr = 'fajr';
final String columnDhur = 'dhur';
final String columnAsr = 'asr';
final String columnMaghrib = 'maghrib';
final String columnIsha = 'isha';
final String columnDuha = 'duha';
final String columnTahajjud = 'tahajjud';

class AppDatabase {
  static final AppDatabase _appDatabase = new AppDatabase._internal();

  AppDatabase._internal();

  Database _database;

  static AppDatabase get() {
    return _appDatabase;
  }

  final _lock = new Lock();

  Future<Database> getDb() async {
    if (_database == null) {
      await _lock.synchronized(() async {
        // Check again once entering the synchronized block
        if (_database == null) {
          await _init();
        }
      });
    }
    return _database;
  }

  Future _init() async {
    print("AppDatabase: init database");
    // Get a location using path_provider
    String basePath = await getDatabasesPath();
    String path = join(basePath, "time.db");
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await _createUserTable(db);
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      await db.execute("DROP TABLE ${tableUser}");
      await _createUserTable(db);
    });
  }

  Future _createUserTable(Database db) {
    return db.execute(
        ('''CREATE TABLE $tableUser ($columnId INTEGER PRIMARY KEY autoincrement, $columnName TEXT, $columnTime TEXT, $columnFajr INTEGER, $columnDhur INTEGER, $columnAsr INTEGER, $columnMaghrib INTEGER, $columnIsha INTEGER ,$columnDuha INTEGER,$columnTahajjud INTEGER )''')
    );
  }

  Future<void> closeDatabase() async {
    if (_database != null && _database.isOpen) {
      await _database.close();
      _database = null;
      print("database closed");
    }
  }
}
