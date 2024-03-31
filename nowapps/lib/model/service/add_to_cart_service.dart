import 'package:get/get.dart';
import 'package:nowapps/model/data/add_to_cart_model.dart';
import 'package:sqflite/sqflite.dart';

class CartController extends GetxController {
  RxList<AddToCartModel> cartList = RxList<AddToCartModel>();
  late Database _db;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  Future<void> initDatabase() async {
    _db = await openDatabase('cart.db', version: 1,
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE productcart (id INTEGER PRIMARY KEY, name TEXT, price REAL, quantity INTEGER)');
    });
    getAllCartList();
  }

//add product to cart
  Future<void> addcartList(AddToCartModel value) async {
    await _db.rawInsert(
        "INSERT INTO productcart (name,price,quantity)VALUES (?,?,?)",
        [value.name, value.price, value.quantity]);
    getAllCartList();
  }

//getall
  Future<void> getAllCartList() async {
    final List<Map<String, dynamic>> cartListMaps =
        await _db.rawQuery("SELECT * FROM productcart");
    cartList.value =
        cartListMaps.map((e) => AddToCartModel.fromMap(e)).toList();
  }

//delete specific product
  Future<void> deleteCartItem(int index) async {
    int? idToDelete = cartList[index].id;
    await _db.rawDelete('DELETE FROM productcart WHERE id = ?', [idToDelete]);
    cartList.removeAt(index);
    update();
  }

//delete all products from table
  Future<void> deleteCartItemAll() async {
    await _db.rawDelete('DELETE FROM productcart');
    cartList.clear();
    update();
  }

//update quantity in to cartpage
  Future<void> updateCartItemQuantity(int id, int newQuantity) async {
    await _db.rawUpdate(
      'UPDATE productcart SET quantity = ? WHERE id = ?',
      [newQuantity, id],
    );

    final int index = cartList.indexWhere((item) => item.id == id);
    if (index != -1) {
      cartList[index].quantity = newQuantity;
      update();
    }
  }

  @override
  void onClose() async {
    await _db.close();
    super.onClose();
  }
}
