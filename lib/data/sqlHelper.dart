import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taskmanager/model/task.dart';

class SqlHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'task.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, date NUMERIC,startTime NUMERIC,endTime NUMERIC,description TEXT,category TEXT,createdAt NUMERIC,updatedAT NUMERIC)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertTask(Task task) async {
    Database db = await database();
    await db.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> tasks() async {
    final db = await database();
    final List<Map<String, dynamic>> tasks = await db.query('tasks');
    return List.generate(tasks.length, (index) {
      return Task(
          id: tasks[index]['id'],
          name: tasks[index]['name'],
          date: tasks[index]['date'],
          startTime: tasks[index]['startTime'],
          endTime: tasks[index]['endTime'],
          description: tasks[index]['description'],
          category: tasks[index]['category'],
          createdAt: tasks[index]['createdAt'],
          updatedAt: tasks[index]['updatedAt']);
    });
  }
  Future <void> deleteTask(int id) async{
    final db= await database();
     await db.delete('task',
     where: 'id=?',
     whereArgs: [id],
     );

  }
}
