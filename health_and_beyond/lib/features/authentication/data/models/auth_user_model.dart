import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_user.dart';

class AuthUserModel extends AuthUser {
  final String type, uid, email, name, city, state;

  AuthUserModel({
    required this.type,
    required this.uid,
    required this.email,
    required this.name,
    required this.city,
    required this.state,
  }) : super(
          type: type,
          uid: uid,
          email: email,
          name: name,
          city: city,
          state: state,
        );

  factory AuthUserModel.fromJson({required Map<String, dynamic> jsonData}) {
    return AuthUserModel(
      type: jsonData[RequestConstants.type] as String,
      uid: jsonData[RequestConstants.uid] as String,
      email: jsonData[RequestConstants.email] as String,
      name: jsonData[RequestConstants.name] as String,
      city: jsonData[RequestConstants.city] as String,
      state: jsonData[RequestConstants.state] as String,
    );
  }

  Map<String, String> toJson() {
    return {
      RequestConstants.type: type,
      RequestConstants.uid: uid,
      RequestConstants.email: email,
      RequestConstants.name: name,
      RequestConstants.city: city,
      RequestConstants.state: state,
    };
  }
}
