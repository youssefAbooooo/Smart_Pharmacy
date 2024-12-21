class Prescription {
  final String name;
  final String description;
  final String dose;
  final String age;
  final String quantity;
  final String row;
  final String column;

  Prescription({
    required this.description,
    required this.dose,
    required this.age,
    required this.quantity,
    required this.row,
    required this.column,
    required this.name,
  });

  factory Prescription.fromJson(jsonData) {
    return Prescription(
      name: jsonData['name'],
      description: jsonData['description'],
      dose: jsonData['dose'],
      age: jsonData['age'],
      quantity: jsonData['quantity'],
      row: jsonData['row'],
      column: jsonData['column'],
    );
  }
}
