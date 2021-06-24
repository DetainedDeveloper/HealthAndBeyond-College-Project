import 'package:health_and_beyond/core/requests/requests.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/models/dashboard_data_model.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/models/dashboard_object_model.dart';

abstract class DashboardDataRemoteSource {
  Future<DashboardDataModel> getDashboardData({required DashboardObjectModel dashboardObjectModel});
}

class DashboardDataRemoteSourceImpl implements DashboardDataRemoteSource {
  @override
  Future<DashboardDataModel> getDashboardData({required DashboardObjectModel dashboardObjectModel}) async {
    final data = await AppRequests.getDashboardJSONData(dashboardObjectModel: dashboardObjectModel);
    return DashboardDataModel(data: data);
  }
}
