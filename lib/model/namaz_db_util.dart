import 'package:mutmain/bd/app_db.dart';
import 'package:sqflite/sqflite.dart';

import 'namaz_time.dart';

class NamazBdUtil{



// 插入一条数据
  Future<void> insert(NamazTime namazTime) async {
    var db = await AppDatabase.get().getDb();
    try {
      await db.transaction((Transaction txn) async {
        int id1 =  await txn.rawInsert('INSERT INTO users (time, fajr, dhur, asr, maghrib, name, isha,Duha,tahajjud)'
            ' VALUES(?,?,?,?,?,?,?,?,?)',[namazTime.time,namazTime.fajr,namazTime.dhur,namazTime.asr,namazTime.maghrib,namazTime.name,namazTime.isha,namazTime.duha,namazTime.tahajjud]);
        print('inserted1: $id1');
      });
    } catch (e) {
      print("erorr = " + e.toString());
      throw Exception(e);
    }
  }



// 根据ID查找书籍信息
  Future<NamazTime> getNamazTime(String time) async {

    var db = await AppDatabase.get().getDb();
    List<Map> maps = await db.rawQuery('select id, name, time, fajr, dhur, asr, maghrib, isha ,duha ,tahajjud from  users where time = ?',[time]);
    if (maps.length > 0) {
      return NamazTime.fromJson(maps.first);
    }
    return null;
  }

// 更新信息
  Future<int> update(NamazTime namazTime) async {
    var db = await AppDatabase.get().getDb();
    int id1 = await db.rawUpdate('UPDATE "users" SET "time" = ?, "fajr" = ?, "dhur" = ?, "asr" = ?, "maghrib" = ?, "name" = ?, "isha" = ?,"duha" = ?,"tahajjud" = ? WHERE "id" = ?',[namazTime.time,namazTime.fajr,namazTime.dhur,namazTime.asr,namazTime.maghrib,namazTime.name,namazTime.isha,namazTime.duha,namazTime.tahajjud,namazTime.id
    ]);
    print('rawUpdate: $id1');
    return id1;
  }
// 记得及时关闭数据库，防止内存泄漏
  close() async {
    var db = await AppDatabase.get().getDb();
    await db.close();
  }

}