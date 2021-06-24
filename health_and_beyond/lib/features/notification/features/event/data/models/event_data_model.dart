import 'package:health_and_beyond/features/notification/features/event/domain/entities/event_data.dart';

class EventDataModel extends EventData {
  final String data;

  EventDataModel({required this.data}) : super(data: data);
}
