import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  var sql = '''
create table cart (
  id integer primary key,
  productId varchar unique,
  productName text,
  initialPrice integer,
  productPrice integer,
  quantity integer,
  unitTag text,
  image text)
''';

  final DBHelper instance = DBHelper();

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return null;
  }

  initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(
      documentDirectory.path,
      'cart.db',
    );
    return await openDatabase(path, version: 1, onCreate: createDB);
  }

  createDB(Database db, int version) async {
    await db.execute(sql);
  }

  insert(Map<String, dynamic> row) async {
    Database? db = await instance.db;
    return await db!.insert('cart', row);
  }

  Future<List<Map<String, dynamic>>> query() async {
    Database? db = await instance.db;
    return await db!.query('cart');
  }

  Future<int> delete(int id) async {
    Database? db = await instance.db;
    return await db!.delete('cart', where: 'productId = ?', whereArgs: [id]);
  }
}
