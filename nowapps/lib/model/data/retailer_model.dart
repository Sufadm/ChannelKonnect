class RetailerModel {
  int? id;
  final String name;
  final String email;
  final String landmark;
  final String address;
  final int phoneNumber;

  RetailerModel(
      {required this.name,
      required this.email,
      required this.landmark,
      required this.address,
      this.id,
      required this.phoneNumber});
}
