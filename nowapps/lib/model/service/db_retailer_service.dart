import 'package:flutter/material.dart';
import 'package:nowapps/model/data/retailer_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<RetailerModel>> RetailerlistNotifier = ValueNotifier([]);
late Database _db;

Future<void> initiDatabase() async {
  _db = await openDatabase('retailer.db', version: 1,
      onCreate: (db, version) async {
    await db.execute(
        'CREATE TABLE retailer (id INTEGER PRIMARY KEY, name TEXT, email TEXT, location TEXT, address TEXT, number INTEGER)');
  });
}

Future<void> addRatilers(RetailerModel value) async {
  _db.rawInsert(
      "INSERT INTO retailer (name,email,location,address,number)VALUES (?,?,?,?,?)",
      [
        value.name,
        value.email,
        value.landmark,
        value.address,
        value.phoneNumber
      ]);
}

Future<void> getAllReatailer() async {
  _db.rawQuery("SELECT * FROM retailer");
}
