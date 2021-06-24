import 'package:health_and_beyond/core/preferences/preferences.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/models/dashboard_data_model.dart';

abstract class DashboardDataLocalSource {
  Future<DashboardDataModel> getDashboardData();
  Future<void> setDashboardData({required DashboardDataModel dashboardDataModel});
}

class DashboardDataLocalSourceImpl implements DashboardDataLocalSource {
  @override
  Future<DashboardDataModel> getDashboardData() async {
    final data = await AppPreferences.getDashboardData();
    return DashboardDataModel(data: data);
  }

  @override
  Future<void> setDashboardData({required DashboardDataModel dashboardDataModel}) async {
    return AppPreferences.setDashboardData(dashboardDataModel.data);
  }
}
