import 'dart:convert';
import 'package:health_and_beyond/core/requests/requests.dart';
import 'package:health_and_beyond/features/authentication/data/models/auth_object_model.dart';
import 'package:health_and_beyond/features/authentication/data/models/auth_user_model.dart';

abstract class AuthUserRemoteSource {
  Future<AuthUserModel> getUser({required AuthObjectModel authObjectModel});
}

class AuthUserRemoteSourceImpl extends AuthUserRemoteSource {
  @override
  Future<AuthUserModel> getUser({required AuthObjectModel authObjectModel}) async {
    final jsonData = jsonDecode(await AppRequests.getUserJSONData(authObjectModel: authObjectModel));

    if (jsonData == false) {
      return Future.value(null);
    } else {
      return Future.value(AuthUserModel.fromJson(jsonData: jsonData));
    }
  }
}
