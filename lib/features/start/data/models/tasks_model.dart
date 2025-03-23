class TasksModel {
  final int id;
  final String name;
  final String date;
  final String time;
  final String state;

  TasksModel({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
    required this.state,
  });

  factory TasksModel.fromMap(Map<String, dynamic> map) {
    return TasksModel(
      id: map["id"] ?? 0,
      name: map["name"] ?? "",
      date: map["date"] ?? "",
      time: map["time"] ?? "",
      state: map["state"] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "date": date,
      "time": time,
      "state": state,
    };
  }
}
