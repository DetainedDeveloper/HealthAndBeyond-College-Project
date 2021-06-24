class SingleHealthEvent {
  final String id, name, date, time;

  SingleHealthEvent({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
  });

  factory SingleHealthEvent.toSingleNotification({
    required String id,
    required String name,
    required String date,
    required String time,
  }) {
    return SingleHealthEvent(
      id: id,
      name: name,
      date: date,
      time: time,
    );
  }
}
