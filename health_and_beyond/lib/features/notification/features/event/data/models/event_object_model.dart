import 'package:health_and_beyond/features/notification/features/event/domain/entities/event_object.dart';

class EventObjectModel extends EventObject {
  final String type, id;

  EventObjectModel({
    required this.type,
    required this.id,
  }) : super(
          type: type,
          id: id,
        );

  factory EventObjectModel.toEventObjectModel({required EventObject eventObject}) {
    return EventObjectModel(
      type: eventObject.type,
      id: eventObject.id,
    );
  }
}
