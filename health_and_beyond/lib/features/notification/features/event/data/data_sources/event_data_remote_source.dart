import 'package:health_and_beyond/core/requests/requests.dart';
import 'package:health_and_beyond/features/notification/features/event/data/models/event_data_model.dart';
import 'package:health_and_beyond/features/notification/features/event/data/models/event_object_model.dart';

abstract class EventDataRemoteSource {
  Future<EventDataModel> getEventData({required EventObjectModel eventObjectModel});
}

class EventDataRemoteSourceImpl implements EventDataRemoteSource {
  @override
  Future<EventDataModel> getEventData({required EventObjectModel eventObjectModel}) async {
    String data = await AppRequests.getEventJSONData(eventObjectModel: eventObjectModel);
    data = data.replaceAll('\<br \\/>', ' ');
    data = data.replaceAll('\\r\\n', ' ');
    data = data.replaceAll('\\r', ' ');
    return EventDataModel(data: data);
  }
}
