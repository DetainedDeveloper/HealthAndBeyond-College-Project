import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/entities/profile_object.dart';

class ProfileObjectModel extends ProfileObject {
  final String uid, type;

  ProfileObjectModel({
    required this.uid,
    required this.type,
  }) : super(
          uid: uid,
          type: type,
        );

  factory ProfileObjectModel.toProfileObjectModel({required ProfileObject profileObject}) {
    return ProfileObjectModel(uid: profileObject.uid, type: profileObject.type);
  }

  static Map<String, String> toMap({required String uid}) {
    return {RequestConstants.uid: uid};
  }
}
