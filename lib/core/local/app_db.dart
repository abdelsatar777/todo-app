import 'package:sqflite/sqflite.dart';

class AppDB {
  Database? database;

  Future<void> createDB() async {
    database = await openDatabase(
      "app.db",
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("""
        CREATE TABLE tasks (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          date TEXT,
          time TEXT,
          state TEXT
        )
        """);
      },
    );
  }

  Future<int> insertInDB({
    required String name,
    required String date,
    required String time,
  }) async {
    if (database == null) {
      await createDB();
    }
    return await database!.rawInsert("""
      INSERT INTO tasks(name, date, time, state)
      VALUES(?, ?, ?, ?)
    """, [name, date, time, "new"]);
  }

  Future<List<Map<String, dynamic>>> getDataInDB() async {
    if (database == null) {
      await createDB();
    }
    return await database!.rawQuery('SELECT * FROM tasks');
  }

  Future<int> updateTask({
    required int id,
    required String name,
    required String date,
    required String time,
  }) async {
    if (database == null) {
      await createDB();
    }
    return await database!.update(
      "tasks",
      {"name": name, "date": date, "time": time},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // ✅ **جديد: حذف المهمة**
  Future<int> deleteTask({required int id}) async {
    if (database == null) {
      await createDB();
    }
    return await database!.delete(
      "tasks",
      where: "id = ?",
      whereArgs: [id],
    );
  }
  Future<int> markTaskAsDone({required int id}) async {
    if (database == null) {
      await createDB();
    }
    return await database!.update(
      "tasks",
      {"state": "done"},
      where: "id = ?",
      whereArgs: [id],
    );
  }

// ✅ جلب المهام المكتملة فقط
  Future<List<Map<String, Object?>>> getCompletedTasks() async {
    if (database == null) {
      await createDB();
    }
    return await database!.query(
      "tasks",
      where: "state = ?",
      whereArgs: ["done"],
    );
  }

}
