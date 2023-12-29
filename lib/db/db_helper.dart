
import 'package:flutter_currency_exchange/models/currency.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._internal();

  static Database? _database;

  DbHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, _) async {
    return await db.execute(
        'CREATE TABLE Currency (id INTEGER PRIMARY KEY, key TEXT, name TEXT, exchange REAL)');
  }

  Future<int> insert(Currency currency) async {
    final db = await instance.database;
    return await db.insert("Currency", currency.toMap());
  }

  Future<List<Currency>> getCurrencyHistory(Currency currency) async {
    final db = await instance.database;
    var res =
        await db.query("Currency", where: "key = ?", whereArgs: [currency.key]);
    return res.isNotEmpty
        ? res.map((e) => Currency.fromMap(e)).toList()
        : List<Currency>.empty();
  }
}
