import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restaurant_alan/data/schema/user_schema.dart';
import 'package:restaurant_alan/model/User.dart';
import 'package:sqflite/sqflite.dart';

const dbName = "restaurant_db";

class DatabaseProvider {
  DatabaseProvider._privateConstructor();
  static final DatabaseProvider instance =
      DatabaseProvider._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(userCreateTableSql);
  }

  Future _onUpgrade(Database database, int oldVersion, int newVersion) async {
    print('oldVersion: $oldVersion, newVersion: $newVersion');
  }

  //Helper method
  Future<int> insertUser(Map<String, dynamic> data) async {
    Database db = await instance.database;
    return await db.insert(tableUser, data);
  }

  Future<User> getUser(String uname, String pass) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> data = await db.rawQuery(
        "SELECT * FROM $tableUser WHERE $username=? AND $password=?",
        [uname, pass]);
    if (data.length > 0) {
      return User.fromJsonMap(data[0]);
    } else {
      return null;
    }
  }
}
