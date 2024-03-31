import 'package:get/get.dart';
import 'package:nowapps/model/data/check_in_model.dart';
import 'package:sqflite/sqflite.dart';

class LocationControllerChekIn extends GetxController {
  RxList<CheckInModel> retailerlist = RxList<CheckInModel>();
  late Database _db;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  Future<void> initDatabase() async {
    _db = await openDatabase('location.db', version: 1,
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE retailer (id INTEGER PRIMARY KEY, date TEXT, currentlocation TEXT)');
    });
    getLocation();
  }

  Future<void> addLocation(CheckInModel value) async {
    await _db.rawInsert(
        "INSERT INTO retailer (date,currentlocation,)VALUES (?,?)",
        [value.date, value.currentlocation]);
    getLocation();
  }

  Future<void> getLocation() async {
    final List<Map<String, dynamic>> retailerMaps =
        await _db.rawQuery("SELECT * FROM retailer");
    retailerlist.value =
        retailerMaps.map((e) => CheckInModel.fromMap(e)).toList();
    print(retailerMaps);
  }
}
