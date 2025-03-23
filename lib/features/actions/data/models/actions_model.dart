class ActionsModel {
  final String id;
  final String name;
  final String date;
  final String time;
  final String state;

  ActionsModel({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
    required this.state,
  });

  factory ActionsModel.fromMap(Map<String, dynamic> map) {
    return ActionsModel(
      id: map["id"],
      name: map["name"],
      date: map["date"],
      time: map["time"],
      state: map["state"],
    );
  }
}
