class AddToCartModel {
  final int? id;
  final String? name;
  final int? quantity;
  final double? price;

  AddToCartModel({
    this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory AddToCartModel.fromMap(Map<String, dynamic> map) {
    return AddToCartModel(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      price: map['price']?.toDouble(),
    );
  }
}
