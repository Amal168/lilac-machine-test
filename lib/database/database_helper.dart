
import 'package:lilac_machine_test/model/expese.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get databace async {
    if (_database != null) return _database!;

    _database = await _initDB('expenses.db');

    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE expenses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            amount REAL NOT NULL,
            category TEXT NOT NULL,
            date TEXT NOT NULL,
            description TEXT
          )
        ''');
      },
    );
  }

  // ADD expense
  Future<int> insertExpense(Expese expense) async {
    final db = await databace;

    return await db.insert(
      'expenses',
      expense.toMap(),
    );
  }

  // DISPLAY expenses
  Future<List<Expese>> getExpenses() async {
    final db = await databace;

    final result = await db.query(
      'expenses',
      orderBy: 'date DESC, id DESC',
    );

    return result.map((map) => Expese.fromMap(map)).toList();
  }

  // UPDATE expense
  Future<int> updateExpense(Expese expense) async {
    final db = await databace;

    return await db.update(
      'expenses',
      expense.toMap(),
      where: 'id = ?',
      whereArgs: [expense.id],
    );
  }

  // DELETE expense
  Future<int> deleteExpense(int id) async {
    final db = await databace;

    return await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
