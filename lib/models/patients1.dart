class Patients1 {
  final String name;
  final List<dynamic> prescriptions;

  Patients1({required this.name, required this.prescriptions});

  factory Patients1.fromJson(jsonData) {
    return Patients1(
      name: jsonData['name'],
      prescriptions: jsonData['prescriptions'],
    );
  }
}
