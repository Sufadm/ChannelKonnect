import 'package:get/get.dart';
import 'package:nowapps/model/data/retailer_model.dart';
import 'package:sqflite/sqflite.dart';

class RetailerController extends GetxController {
  RxList<RetailerModel> retailerlist = RxList<RetailerModel>();
  late Database _db;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  Future<void> initDatabase() async {
    _db = await openDatabase('retailer.db', version: 1,
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE retailer (id INTEGER PRIMARY KEY, name TEXT, email TEXT, location TEXT, address TEXT, number INTEGER)');
    });
    getAllRetailers();
  }

  Future<void> addRetailers(RetailerModel value) async {
    await _db.rawInsert(
        "INSERT INTO retailer (name,email,location,address,number)VALUES (?,?,?,?,?)",
        [
          value.name,
          value.email,
          value.landmark,
          value.address,
          value.phoneNumber,
        ]);
    getAllRetailers();
  }

  Future<void> getAllRetailers() async {
    final List<Map<String, dynamic>> retailerMaps =
        await _db.rawQuery("SELECT * FROM retailer");
    retailerlist.value =
        retailerMaps.map((e) => RetailerModel.fromMap(e)).toList();
    print(retailerMaps);
  }
}
