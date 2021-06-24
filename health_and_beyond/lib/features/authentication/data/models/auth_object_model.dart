import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_object.dart';

class AuthObjectModel extends AuthObject {
  final String type, email, password;

  AuthObjectModel({
    required this.type,
    required this.email,
    required this.password,
  }) : super(
    type: type,
    email: email,
    password: password,
  );

  factory AuthObjectModel.toAuthObjectModel(AuthObject authObject) {
    return AuthObjectModel(
      type: authObject.type,
      email: authObject.email,
      password: authObject.password,
    );
  }

  static Map<String, String> toMap(AuthObjectModel authObjectModel) {
    return {
      RequestConstants.type: authObjectModel.type,
      RequestConstants.email: authObjectModel.email,
      RequestConstants.password: authObjectModel.password,
    };
  }
}
