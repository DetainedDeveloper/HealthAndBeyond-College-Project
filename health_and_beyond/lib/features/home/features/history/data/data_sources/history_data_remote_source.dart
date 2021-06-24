import 'package:health_and_beyond/core/requests/requests.dart';
import 'package:health_and_beyond/features/home/features/history/data/models/history_data_model.dart';
import 'package:health_and_beyond/features/home/features/history/data/models/history_object_model.dart';

abstract class HistoryDataRemoteSource {
  Future<HistoryDataModel> getHistoryData({required HistoryObjectModel historyObjectModel});
}

class HistoryDataRemoteSourceImpl implements HistoryDataRemoteSource {
  @override
  Future<HistoryDataModel> getHistoryData({required HistoryObjectModel historyObjectModel}) async {
    final data = await AppRequests.getHistoryJSONData(historyObjectModel: historyObjectModel);
    return HistoryDataModel(data: data);
  }
}
