import 'package:projectapp/model.dart';
import 'package:sqflite/sqflite.dart';

class CartDb {
  static late Database database;
  final String tableName = "cart";

  Future<void> initialDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = '$databasepath/cart.db';
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE $tableName(id INTEGER PRIMARY KEY, name TEXT, price REAL)",
        );
      },
    );
  }

  Future<void> addProuduct(Product product) async {
    await database.insert(tableName, product.toMap());
    print("created table");
  }
}
