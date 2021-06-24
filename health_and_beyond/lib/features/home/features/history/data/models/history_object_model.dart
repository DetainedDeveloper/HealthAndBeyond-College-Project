import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/features/home/features/history/domain/entities/history_object.dart';

class HistoryObjectModel extends HistoryObject {
  final String uid, type;

  HistoryObjectModel({
    required this.uid,
    required this.type,
  }) : super(
          uid: uid,
          type: type,
        );

  factory HistoryObjectModel.toHistoryObjectModel({required HistoryObject historyObject}) {
    return HistoryObjectModel(uid: historyObject.uid, type: historyObject.type);
  }

  static Map<String, String> toMap({required String uid}) {
    return {RequestConstants.uid: uid};
  }
}
