import 'package:flutter/foundation.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    _db ??= await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'items.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE items (
        id TEXT PRIMARY KEY,
        purchaseGroupId TEXT,
        purchaseCategoryId TEXT,
        purchaseSubCategoryId TEXT,
        unitId TEXT,
        fullName TEXT,
        name TEXT,
        arabicName TEXT,
        description TEXT,
        costPrice TEXT,
        price TEXT,
        offerPrice TEXT,
        startDate TEXT,
        endDate TEXT,
        code TEXT,
        barcode TEXT,
        brandId TEXT,
        qtyIn TEXT,
        qtyOut TEXT,
        qtyCurrent TEXT,
        stock TEXT,
        sizeId TEXT,
        colorId TEXT,
        image TEXT,
        createdAt TEXT,
        updatedAt TEXT,
        imageUrl TEXT,
        finalPrice TEXT,
        qty TEXT DEFAULT '1'
      )
    ''');

    /// Favorite list added ------------------------
    await db.execute('''
      CREATE TABLE favoriteList (
        id TEXT PRIMARY KEY,
        purchaseGroupId TEXT,
        purchaseCategoryId TEXT,
        purchaseSubCategoryId TEXT,
        unitId TEXT,
        fullName TEXT,
        name TEXT,
        arabicName TEXT,
        description TEXT,
        costPrice TEXT,
        price TEXT,
        offerPrice TEXT,
        startDate TEXT,
        endDate TEXT,
        code TEXT,
        barcode TEXT,
        brandId TEXT,
        qtyIn TEXT,
        qtyOut TEXT,
        qtyCurrent TEXT,
        stock TEXT,
        sizeId TEXT,
        colorId TEXT,
        image TEXT,
        createdAt TEXT,
        updatedAt TEXT,
        imageUrl TEXT,
        finalPrice TEXT,
        qty TEXT DEFAULT '1'
      )
    ''');



  }
  /// for Cart Item ------------------------------------------------
  // Insert new item
  Future<int> insertItem(popularProductModel item) async {
    final db = await database;
    if (kDebugMode) {
      print("Inserting item ====> ${item.id}");
    }
    return await db.insert(
      'items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all items
  Future<List<popularProductModel>> getAllItems() async {
    final db = await database;
    final result = await db.query('items');
    return result.map((e) => popularProductModel.fromMap(e)).toList();
  }

  // Delete all items
  Future<void> deleteAllItems() async {
    final db = await database;
    await db.delete('items');
  }

  // Delete item by ID
  Future<int> deleteItemById(String id) async {
    final db = await database;
    return await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }

  // ✅ Update quantity for item by ID
  Future<int> updateQty(String id, String columnName, String replaceValue) async {
    final db = await database;
    return await db.update(
      'items',
      {'$columnName': replaceValue},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// for favorite Item ------------------------------------------------
  // Insert new Favorite item
  Future<int> insertFavoriteItem(popularProductModel item) async {
    final db = await database;
    if (kDebugMode) {
      print("Inserting item ====> ${item.id}");
    }
    return await db.insert(
      'favoriteList',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all Favorite Item
  Future<List<popularProductModel>> getAllFavoriteItems() async {
    final db = await database;
    final result = await db.query('favoriteList');
    return result.map((e) => popularProductModel.fromMap(e)).toList();
  }

  // Delete item by ID
  Future<int> deleteFavoriteItemById(String id) async {
    final db = await database;
    return await db.delete('favoriteList', where: 'id = ?', whereArgs: [id]);
  }

  // Delete all Favorite items
  Future<void> deleteAllFavoriteItems() async {
    final db = await database;
    await db.delete('favoriteList');
  }

  // ✅ Update quantity for Favorite item by ID
  Future<int> updateFavoriteQty(String id, String columnName, String replaceValue) async {
    final db = await database;
    return await db.update(
      'favoriteList',
      {'$columnName': replaceValue},
      where: 'id = ?',
      whereArgs: [id],
    );
  }


}
