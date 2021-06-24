import 'package:health_and_beyond/features/home/features/dashboard/domain/entities/dashboard_data.dart';

class DashboardDataModel extends DashboardData {
  final String data;

  DashboardDataModel({required this.data}) : super(data: data);

  factory DashboardDataModel.fromData({required String data}) {
    return DashboardDataModel(data: data);
  }
}
