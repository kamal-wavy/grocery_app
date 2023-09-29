import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:testapp/localDataBase/dbHelperModel.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'MYCART.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE MYCART (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        weight TEXT,
        image TEXT,
        rate REAL,
        fixRate REAL,
        noPieces INTEGER
      )
    ''');
    await db.execute('''
      CREATE TABLE ORDERHISTORY (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        weight TEXT,
        image TEXT,
        rate REAL,
        fixRate REAL,
        noPieces INTEGER
      )
    ''');
  }

  Future<int> insertMyCart(DbModel person) async {
    final db = await database;
    return await db.insert('MYCART', person.toMap());
  }
  Future<List<DbModel>> getDataMyCart() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('MYCART');
    return List.generate(maps.length, (i) {
      return DbModel.fromMap(maps[i]);
    });
  }
  Future<int> updateDataMyCart(DbModel person) async {
    final db = await database;
    return await db.update(
      'MYCART',
      person.toMap(),
      where: 'id = ?',
      whereArgs: [person.id],
    );
  }
  Future<int> deleteDataMyCart(DbModel person) async {
    final db = await database;
    return await db.delete(
      'MYCART',
      where: 'id = ?',
      whereArgs: [person.id],
    );
  }
 Future<int> insertOrderHistory(DbModel person) async {
    final db = await database;
    return await db.insert('ORDERHISTORY', person.toMap());
  }
  Future<List<DbModel>> getDataOrderHistory() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('ORDERHISTORY');
    return List.generate(maps.length, (i) {
      return DbModel.fromMap(maps[i]);
    });
  }
  Future<int> updateDataOrderHistory(DbModel person) async {
    final db = await database;
    return await db.update(
      'ORDERHISTORY',
      person.toMap(),
      where: 'id = ?',
      whereArgs: [person.id],
    );
  }
  Future<int> deleteDataOrderHistory(DbModel person) async {
    final db = await database;
    return await db.delete(
      'ORDERHISTORY',
      where: 'id = ?',
      whereArgs: [person.id],
    );
  }


}
