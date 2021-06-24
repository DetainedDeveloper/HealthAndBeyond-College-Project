import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/entities/dashboard_object.dart';

class DashboardObjectModel extends DashboardObject {
  final String type, uid, city, state;

  DashboardObjectModel({
    required this.type,
    required this.uid,
    required this.city,
    required this.state,
  }) : super(
          type: type,
          uid: uid,
          city: city,
          state: state,
        );

  factory DashboardObjectModel.toDashboardObjectModel({required DashboardObject dashboardObject}) {
    return DashboardObjectModel(
      type: dashboardObject.type,
      uid: dashboardObject.uid,
      city: dashboardObject.city,
      state: dashboardObject.state,
    );
  }

  static Map<String, String> toMap(DashboardObjectModel dashboardObjectModel) {
    return {
      RequestConstants.type: dashboardObjectModel.type,
      RequestConstants.uid: dashboardObjectModel.uid,
      RequestConstants.city: dashboardObjectModel.city,
      RequestConstants.state: dashboardObjectModel.state,
    };
  }
}
