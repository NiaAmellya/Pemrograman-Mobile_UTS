import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/models/item_custome.dart';
import 'package:uts/models/item_referensi.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    //create, read databases
    var itemDatabase = openDatabase(path, version: 4, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    Batch batch = db.batch();
    //tabel Rekomendasi
    batch.execute('''
    CREATE TABLE item (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    kode INTEGER,
    jenis TEXT,
    merk TEXT,
    stok INTEGER,
    harga INTEGER
    )
    ''');
    // tabel Custom
    batch.execute('''CREATE TABLE custom (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pemesan TEXT,
    bahan1 TEXT,
    ukuran1 INTEGER,
    bahan2 TEXT,
    ukuran2 INTEGER
          )''');
    List<dynamic> res = await batch.commit();
  }

  //select databases tabel Rekomendasi
  Future<List<Map<String, dynamic>>> selectItem() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'id');
    return mapList;
  }

  //select databases tabel Custom
  Future<List<Map<String, dynamic>>> selectCustom() async {
    Database db = await this.initDb();
    var mapList = await db.query('custom', orderBy: 'id');
    return mapList;
  }

  // insert data tabel Rekomendasi
  Future<int> insertItem(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('Item', object.toMap());
    return count;
  }

  // insert data tabel Custom
  Future<int> insertCustom(Custom object) async {
    Database db = await this.initDb();
    int count = await db.insert('custom', object.toMap());
    return count;
  }

//update databases tabel rekomendasi
  Future<int> updateItem(Item object) async {
    Database db = await this.initDb();
    int count = await db
        .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //update databases tabel Custom
  Future<int> updateCustom(Custom object) async {
    Database db = await this.initDb();
    int count = await db.update('custom', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete databases tabel Rekomendasi
  Future<int> deleteItem(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);
    return count;
  }

//delete databases tabel Custom
  Future<int> deleteCustom(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('custom', where: 'id=?', whereArgs: [id]);
    return count;
  }

// membuat list item pada tabel rekomendasi
  Future<List<Item>> getItemListItem() async {
    var itemMapList = await selectItem();
    int count = itemMapList.length;
    List<Item> itemList = List<Item>();
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }
    return itemList;
  }

//membuat list item pada tabel custome
  Future<List<Custom>> getItemListCustom() async {
    var itemMapList = await selectCustom();
    int count = itemMapList.length;
    List<Custom> itemList = List<Custom>();
    for (int i = 0; i < count; i++) {
      itemList.add(Custom.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
