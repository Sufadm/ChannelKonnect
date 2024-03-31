class CheckInModel {
  int? id;
  final String date;
  final String currentlocation;

  CheckInModel({required this.date, required this.currentlocation, this.id});
  factory CheckInModel.fromMap(Map<String, dynamic> map) {
    return CheckInModel(
      id: map['id'],
      date: map['name'],
      currentlocation: map['currentlocation'],
    );
  }
}
