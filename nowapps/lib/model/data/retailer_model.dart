class RetailerModel {
  final int? id;
  final String? name;
  final String? email;
  final String? landmark;
  final String? address;
  final int? phoneNumber;

  RetailerModel({
    this.id,
    required this.name,
    required this.email,
    required this.landmark,
    required this.address,
    required this.phoneNumber,
  });

  factory RetailerModel.fromMap(Map<String, dynamic> map) {
    return RetailerModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      landmark: map['location'],
      address: map['address'],
      phoneNumber: map['number'],
    );
  }
}
