class SingleNotification {
  final String id, description, date, time;

  SingleNotification({
    required this.id,
    required this.description,
    required this.date,
    required this.time,
  });

  factory SingleNotification.toSingleNotification({
    required String id,
    required String description,
    required String date,
    required String time,
  }) {
    return SingleNotification(
      id: id,
      description: description,
      date: date,
      time: time,
    );
  }
}
