import 'package:health_and_beyond/core/requests/request_constants.dart';

class HistoryRecord {
  final name, description, prescription, drName, date;

  HistoryRecord({
    required this.name,
    required this.description,
    required this.prescription,
    required this.drName,
    required this.date,
  });

  factory HistoryRecord.toHistoryRecord({required jsonData}) {
    return HistoryRecord(
      name: jsonData[RequestConstants.historyDisease],
      description: jsonData[RequestConstants.historyDescription],
      prescription: jsonData[RequestConstants.historyPrescription],
      drName: jsonData[RequestConstants.historyDrName],
      date: jsonData[RequestConstants.historyUploadDate],
    );
  }
}
