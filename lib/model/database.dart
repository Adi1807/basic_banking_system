import 'package:basic_banking_system/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  static Future<Database> _database;

  Future initialize() async {
    _database = openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE user(user_id INTEGER PRIMARY KEY, user_name TEXT, user_email TEXT, user_current_balance DOUBLE)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertUserData(List list) async {
    final Database db = await _database;
    int len = list.length;
    int index = 0;

    while (len != 0) {
      await db.insert(
        'user',
        list[index].toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      len = len - 1;
      index = index + 1;
    }
  }

  Future<void> updateUserData(User userdata) async {
    // Get a reference to the database.
    final db = await _database;

    // Update the given Dog.
    await db.update(
      'user',
      userdata.toMap(),
      // Ensure that the Dog has a matching id.
      where: "user_id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [userdata.user_id],
    );
  }

  Future<List<User>> getDataFromDatabase() async {
    // Get a reference to the database.
    final Database db = await _database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('user');

    // Convert the List<Map<String, dynamic> into a List<Dog>.

    return List.generate(maps.length, (i) {
      return User(
          user_id: maps[i]['user_id'],
          user_name: maps[i]['user_name'],
          user_email: maps[i]['user_email'],
          user_current_balance: maps[i]['user_current_balance']);
    });
  }
}
