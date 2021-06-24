import 'package:health_and_beyond/core/requests/urls.dart';
import 'package:health_and_beyond/features/add_record/data/models/add_record_object_model.dart';
import 'package:health_and_beyond/features/add_record/data/models/patient_object_model.dart';
import 'package:health_and_beyond/features/authentication/data/models/auth_object_model.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/models/dashboard_object_model.dart';
import 'package:health_and_beyond/features/home/features/history/data/models/history_object_model.dart';
import 'package:health_and_beyond/features/home/features/profile/data/models/profile_object_model.dart';
import 'package:health_and_beyond/features/notification/data/models/notification_object_model.dart';
import 'package:health_and_beyond/features/notification/features/event/data/models/event_object_model.dart';
import 'package:http/http.dart' as http;

class AppRequests {
  static const int _responseOK = 200;
  static http.Client _client = http.Client();

  static Future<String> getUserJSONData({required AuthObjectModel authObjectModel}) async {
    final response = await _client.post(
      Uri.parse(AppUrls.login),
      body: AuthObjectModel.toMap(authObjectModel),
    );
    return Future.value(response.body);
  }

  static Future<String> getDashboardJSONData({required DashboardObjectModel dashboardObjectModel}) async {
    final response = await _client.post(
      Uri.parse(AppUrls.dashboard(type: dashboardObjectModel.type)),
      body: DashboardObjectModel.toMap(dashboardObjectModel),
    );
    return Future.value(response.body);
  }

  static Future<String> getNotificationJSONData({required NotificationObjectModel notificationObjectModel}) async {
    final response = await _client.post(
      Uri.parse(AppUrls.notification(type: notificationObjectModel.type)),
      body: NotificationObjectModel.toMap(notificationObjectModel),
    );
    return Future.value(response.body);
  }

  static Future<String> getEventJSONData({required EventObjectModel eventObjectModel}) async {
    final response = await _client.get(
      Uri.parse(AppUrls.event(type: eventObjectModel.type, id: eventObjectModel.id)),
    );
    return Future.value(response.body);
  }

  static Future<String> getProfileJSONData({required ProfileObjectModel profileObjectModel}) async {
    final response = await _client.post(
      Uri.parse(AppUrls.profile(type: profileObjectModel.type)),
      body: ProfileObjectModel.toMap(uid: profileObjectModel.uid),
    );
    return Future.value(response.body);
  }

  static Future<String> getHistoryJSONData({required HistoryObjectModel historyObjectModel}) async {
    final response = await _client.post(
      Uri.parse(AppUrls.history(type: historyObjectModel.type)),
      body: HistoryObjectModel.toMap(uid: historyObjectModel.uid),
    );
    return Future.value(response.body);
  }

  static Future<String> getPatientDetails({required PatientObjectModel patientObjectModel}) async {
    final response = await _client.post(
      Uri.parse(
        AppUrls.add(
          type: patientObjectModel.type,
          uid: patientObjectModel.uid,
        ),
      ),
      body: PatientObjectModel.toMap(uid: patientObjectModel.uid),
    );
    return Future.value(response.body);
  }

  static Future<void> addPatientRecord({required AddRecordObjectModel addRecordObjectModel}) async {
    final response = await _client.post(
      Uri.parse(
        AppUrls.add(
          type: addRecordObjectModel.type,
          uid: addRecordObjectModel.uid,
        ),
      ),
      body: AddRecordObjectModel.toMap(addRecordObjectModel: addRecordObjectModel),
    );
    return Future.value(response.body);
  }
}
