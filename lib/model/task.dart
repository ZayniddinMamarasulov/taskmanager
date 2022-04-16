class Task {
  int id;
  String name;
  DateTime date;
  DateTime startTime;
  DateTime endTime;
  String description;
  List<String> category;
  DateTime createdAt;
  DateTime updatedAt;

  Task(
      {required this.id,
      required this.name,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.description,
      required this.category,
      required this.createdAt,
      required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
      'category': category,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
